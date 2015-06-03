using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                LoadTopProductsNew();
                LoadTopProductsSale();
                LoadTopProductsView();
            }
        }

        private void LoadTopProductsNew()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                List<Product> lst = ctx.Products.OrderByDescending(p => p.ProID).Take(6).ToList();

                lvwProducts.DataSource = lst;
                lvwProducts.DataBind();
            }
        }

        private void LoadTopProductsSale()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                List<Product> lst = ctx.Products.OrderByDescending(p => p.SaleQuantity).Take(6).ToList();

                lvwSalePro.DataSource = lst;
                lvwSalePro.DataBind();
            }
        }

        private void LoadTopProductsView()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                List<Product> lst = ctx.Products.OrderByDescending(p => p.PageView).Take(6).ToList();

                lvwViewPro.DataSource = lst;
                lvwViewPro.DataBind();
            }
        }

        // xử lí item trên list view SP MỚI NHẤT
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
            lvwPro_ItemCommand(e);

        }

        // xử lí item trên list view SP MUA nhiều
        protected void lvwSalePro_ItemDataBound1(object sender, ListViewItemEventArgs e)
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

        protected void lvwSalePro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lvwPro_ItemCommand(e);

        }

        // xử lí item trên list view SP XEM nhiều
        protected void lvwViewPro_ItemDataBound1(object sender, ListViewItemEventArgs e)
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

        protected void lvwViewPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lvwPro_ItemCommand(e);

        }

        // method xử lí nút Đặt hàng của Item trên listview
        private void lvwPro_ItemCommand(ListViewCommandEventArgs e)
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
