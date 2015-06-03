using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

namespace QLBH
{
    public partial class viewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
                LoadData();
        }

        private void LoadData()
        {
            string catId = Request.QueryString["catId"];


            if (string.IsNullOrEmpty("catId"))
            {
                Response.Redirect("~/default.aspx");
            }
            else
            {
                int i_catId = Convert.ToInt32(catId);

                using (QLBHEntities ctx = new QLBHEntities())
                {
                    List<Product> list =
                        ctx.Products.Where(p => p.CatID == i_catId).ToList();

                    lvwProducts.DataSource = list;
                    lvwProducts.DataBind();
                }
            }
        }

        protected void lvwProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadData();
        }

        protected void lvwProducts_ItemDataBound1(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                // you would use your actual data item type here, not "object"
                Product pro = (Product)dataItem.DataItem;

                Label lbHetHang = (Label)e.Item.FindControl("lbHetHang");
                LinkButton lbtn = (LinkButton)e.Item.FindControl("btnAddToCart");

                if (CurrentContext.IsLogged())
                    lbtn.Visible = true;
                else lbtn.Visible = false;

                if (pro.Quantity == 0)
                {
                    lbHetHang.Visible = true;
                    lbtn.Visible = false;
                }
            }
        }

        protected void lvwProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "addToCart")
            {

                int proId = Convert.ToInt32(e.CommandArgument);
                
                using (QLBHEntities ctx = new QLBHEntities())
                {
                    Product pro = ctx.Products.Where(p => p.ProID == proId).FirstOrDefault();
                    if (pro.Quantity > 0)
                    {
                        CartItem item = new CartItem
                        {
                            ProID = Convert.ToInt32(e.CommandArgument),
                            Quantity = 1

                        };
                        pro.Quantity -= 1;

                        CurrentContext.GetCart().Add(item);

                        ((QLBH)this.Master).UpdateCartLink();
                    }
                    else if (ClientScript.IsStartupScriptRegistered("swal") == false)
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "swal",
                        "swal({   title: 'Lỗi',   text: 'Sản phẩm đã hết hàng !',   type: 'error',   confirmButtonText: 'Trở về' });",
                        true
                        );
                }

                return;
                }

            }

        }
    }
}