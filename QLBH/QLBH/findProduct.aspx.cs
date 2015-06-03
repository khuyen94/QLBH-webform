using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class findProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            using (QLBHEntities ctx = new QLBHEntities())
            {                
                string key = Request.QueryString["key"];
                List<Product> list = ctx.Products.Include("TypeProduct").Include("Category").ToList();

                List<Product> lstResult = list.FindAll
                   (
                   delegate(Product p)
                   {
                       if (p.ProName.ToLower().Contains(key) || p.TypeProduct.TypeName.ToLower().Contains(key)
                           || p.Category.CatName.ToLower().Contains(key))
                           return true;
                       else return false;
                   }
                   );
                
                if (key == "1")
                    lstResult = list.Where(p => p.Price > 0 && p.Price <= 10000000).ToList();
                if (key == "2")
                    lstResult = list.Where(p => p.Price > 10000000 && p.Price <= 20000000).ToList();
                if (key == "3")
                    lstResult = list.Where(p => p.Price > 20000000 && p.Price <= 30000000).ToList();
                if (key == "4")
                    lstResult = list.Where(p => p.Price > 30000000).ToList();

                lvwProducts.DataSource = lstResult;
                lvwProducts.DataBind();
            }
        }

        protected void lvwProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
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