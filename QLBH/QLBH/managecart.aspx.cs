using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class managecart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login.aspx?retUrl=managecart.aspx");
            }
            if (IsPostBack == false)
            {
                lvwCart.DataSource = CurrentContext.GetCart().Items;
                lvwCart.DataBind();
            }

        }

        decimal _total = 0;

        protected void lvwCart_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                CartItem item = (CartItem)e.Item.DataItem;

                ((ImageButton)e.Item.FindControl("btnUpdate")).ValidationGroup = "grp_" + item.ProID;
                ((CompareValidator)e.Item.FindControl("valQuantity")).ValidationGroup = "grp_" + item.ProID;
                ((CompareValidator)e.Item.FindControl("valQuantity2")).ValidationGroup = "grp_" + item.ProID;
                
                using (QLBHEntities ctx = new QLBHEntities())
                {
                    Product pro = ctx.Products.Where(p => p.ProID == item.ProID).FirstOrDefault();

                    ((CompareValidator)e.Item.FindControl("valQuantity2")).ValueToCompare = pro.Quantity.ToString(); 
                    ((Label)e.Item.FindControl("lbProName")).Text = pro.ProName;
                    ((Label)e.Item.FindControl("lbPrice")).Text = string.Format("{0:N0}đ", pro.Price);
                    decimal amount = pro.Price * item.Quantity;
                    ((Label)e.Item.FindControl("lbAMount")).Text = string.Format("{0:N0}đ", amount);
                    _total += amount;
                }
            }
        }

        protected void lvwCart_DataBound(object sender, EventArgs e)
        {
            lbTotal.Text = string.Format("Total: {0:N0}đ", _total);
        }

        protected void lvwCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteItem")
            {
                int proId = Convert.ToInt32(e.CommandArgument);
                CurrentContext.GetCart().RemoveItem(proId);
                ((QLBH)this.Master).UpdateCartLink();

                lvwCart.DataSource = CurrentContext.GetCart().Items;
                lvwCart.DataBind();
            }

            if (e.CommandName == "updateItem")
            {
                int proId = Convert.ToInt32(e.CommandArgument);
                int quantity = Convert.ToInt32(((TextBox)e.Item.FindControl("txtQuantity")).Text);
                CurrentContext.GetCart().UpdateItem(proId, quantity);
                ((QLBH)this.Master).UpdateCartLink();

                lvwCart.DataSource = CurrentContext.GetCart().Items;
                lvwCart.DataBind();
            }
        }

        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {
            if (CurrentContext.GetCart().Items.Count == 0)
            {
                if (ClientScript.IsStartupScriptRegistered("swal") == false)
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "swal",
                        "swal({   title: 'Lỗi',   text: 'Giỏ hàng rỗng !',   type: 'error',   confirmButtonText: 'Trở về' });",
                        true
                        );
                }

                return;
            }

            Order ord = new Order
            {
                OrderDate = DateTime.Now,
                UserID = CurrentContext.GetCurUser().f_ID,
                Total = Convert.ToDecimal(lbTotal.Text.Substring(7, lbTotal.Text.Length - 8)),
                Status = 0
            };
            using (QLBHEntities ctx = new QLBHEntities())
            {
                foreach (CartItem item in CurrentContext.GetCart().Items)
                {
                    Product pro = ctx.Products.Where(p => p.ProID == item.ProID).FirstOrDefault();
                    if (pro != null)
                    {
                        OrderDetail d = new OrderDetail
                        {
                            ProID = item.ProID,
                            Quantity = item.Quantity,
                            Price = pro.Price,
                            Amount = item.Quantity * pro.Price
                        };
                        ord.OrderDetails.Add(d);

                        if(pro.Quantity < item.Quantity)
                        {
                            if (ClientScript.IsStartupScriptRegistered("swal") == false)
                            {
                                ClientScript.RegisterStartupScript(
                                    this.GetType(),
                                    "swal",
                                    "swal({   title: 'Lỗi',   text: 'Tồn kho không đủ !',   type: 'error',   confirmButtonText: 'Trở về' });",
                                    true
                                    );
                            }

                            return;
                        }

                        pro.Quantity = pro.Quantity - item.Quantity; //Giảm số lượng tồn

                        if (pro.SaleQuantity != null) // Thay đổi số lượng bán
                            pro.SaleQuantity += item.Quantity;
                        else pro.SaleQuantity = item.Quantity;
                    }
                }
                ctx.Orders.Add(ord);
                ctx.SaveChanges();
            }

            CurrentContext.GetCart().Items.Clear();
            ((QLBH)this.Master).UpdateCartLink();
            lvwCart.DataSource = CurrentContext.GetCart().Items;
            lvwCart.DataBind();
        }
    }
}