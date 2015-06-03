using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login?retUrl=admin/adm_dashboard");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
            }

            if (IsPostBack == false)
            {
                using (QLBHEntities ctx = new QLBHEntities())
                {
                   lbCountCat.Text = ctx.Categories.Count().ToString();
                    lbCountPro.Text = ctx.Products.Count().ToString();
                    lbCountOrder.Text = ctx.Orders.Count().ToString();
                }
            }
        }
    }
}