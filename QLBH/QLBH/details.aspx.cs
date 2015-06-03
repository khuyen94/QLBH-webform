using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                pnCart.Visible = true;
            }
            else pnCart.Visible = false;


            if (IsPostBack == false)
            {
                string proId = Request.QueryString["proId"];

                if (string.IsNullOrEmpty("proId"))
                {
                    Response.Redirect("~/default.aspx");
                }
                else
                {
                    int i_proId = Convert.ToInt32(proId);
                    using (QLBHEntities ctx = new QLBHEntities())
                    {
                        Product pro = ctx.Products.Where(p => p.ProID == i_proId).FirstOrDefault();

                        if (pro != null)
                        {
                            if (pro.SaleQuantity == null)
                                pro.SaleQuantity = 0;

                            if (pro.PageView == null)
                                pro.PageView = 1;
                            else pro.PageView += 1;
                            ctx.SaveChanges();
                        }
                    }

                    int catId = -1;
                    int typeId = -1;
                    using (QLBHEntities ctx = new QLBHEntities())
                    {
                        Product pro = ctx.Products.Where(p => p.ProID == i_proId).FirstOrDefault();

                        if (pro != null)
                        {
                            catId = pro.CatID;
                            typeId = Convert.ToInt32(pro.TypeID);
                            CompareValidator2.ValueToCompare = pro.Quantity.ToString();
                            img.ToolTip = pro.ProName;
                            img.ImageUrl = string.Format("Imgs/sp/{0}/main.jpg", pro.ProID);
                            lbProName.Text = pro.ProName;
                            lbPrice.Text = string.Format("{0:N0}", pro.Price);
                            lbQuantity.Text = pro.Quantity.ToString();
                            lbOrigin.Text = pro.Origin;
                            lbFullDes.Text = HttpUtility.HtmlDecode(pro.FullDes);
                            lbPageView.Text = pro.PageView.ToString() ;
                            lbSaleQuantity.Text = pro.SaleQuantity.ToString();
                            lbTypePro.Text = pro.TypeProduct.TypeName;
                            lbCatPro.Text = pro.Category.CatName;
                        }
                    }

                    using (QLBHEntities ctx = new QLBHEntities())
                    {
                        int pId = Convert.ToInt32(proId);
                        List<Product> list = ctx.Products.Where(p => p.CatID == catId && p.ProID != pId).Take(5).ToList();

                        if (list != null)
                        {
                            lvwProducts.DataSource = list;
                            lvwProducts.DataBind();
                        }
                    }

                    using (QLBHEntities ctx = new QLBHEntities())
                    {
                        int pId = Convert.ToInt32(proId);
                        List<Product> list = ctx.Products.Where(p => p.TypeID == typeId && p.ProID != pId).Take(5).ToList();

                        if (list != null)
                        {
                            lvwProductType.DataSource = list;
                            lvwProductType.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string proId = Request.QueryString["proId"];
             int i_proId = Convert.ToInt32(proId);
            CartItem item = new CartItem
            {
                ProID = i_proId,
                Quantity = Convert.ToInt32(txtQuantity.Text)
            };

            CurrentContext.GetCart().Add(item);
            ((QLBH)this.Master).UpdateCartLink();
        }

    }
}