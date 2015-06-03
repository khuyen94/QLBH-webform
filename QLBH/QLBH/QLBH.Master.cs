using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QLBH
{
    public partial class QLBH : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                pnLogged.Visible = true;
                pnNotLogged.Visible = false;
                UpdateName();

                UpdateCartLink();
            }
            else
            {
                pnLogged.Visible = false;
                pnNotLogged.Visible = true;
            }


            Session["gia"] = cboTimKiem.SelectedValue;
            cboTimKiem.SelectedIndex = cboTimKiem.Items.IndexOf(cboTimKiem.Items.FindByValue(Convert.ToString(Session["gia"])));
            if (IsPostBack == false)
            {
                using (QLBHEntities ctx = new QLBHEntities())
                {
                    List<Category> list = ctx.Categories.ToList();
                    lvwCategories.DataSource = list;
                    lvwCategories.DataBind();
                }

                using (QLBHEntities ctx = new QLBHEntities())
                {
                    List<TypeProduct> list = ctx.TypeProducts.ToList();
                    lvwTypePro.DataSource = list;
                    lvwTypePro.DataBind();
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            CurrentContext.Destroy();
            Response.Redirect(Request.Url.AbsoluteUri);
        }


        public void UpdateCartLink()
        {
            lnkCart.Text = string.Format("<i class='fa fa-shopping-cart'></i> <span class='badge'>{0}</span>", CurrentContext.GetCart().GetNumberOfItem());
        }

        public void UpdateName()
        {
            lnkUsername.Text = string.Format("<b>Hi,{0}!</b>", CurrentContext.GetCurUser().f_Name);
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text != "")
            {
                Response.Redirect("findProduct.aspx?key=" + txtTimKiem.Text);
            }

            return;
        }

        protected void btnTimKiemGia_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("findProduct.aspx?key=" + cboTimKiem.SelectedValue);
            return;
        }
    }
}