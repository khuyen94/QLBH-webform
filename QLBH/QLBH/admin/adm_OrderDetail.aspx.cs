using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class adm_OrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login.aspx?retUrl=admin/adm_OrderDetail.aspx");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board.aspx?msg=2");
            }

            if (IsPostBack == false)
            {
                loadOrders();
            }
        }

        private void loadOrders()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                int orderId = Convert.ToInt32( Request.QueryString["orderId"]);
                var list = ctx.OrderDetails.Include("Product").ToList();
                var listResult = list.Where(o => o.OrderID == orderId);
                lvwOrders.DataSource = listResult;
                lvwOrders.DataBind();
            }
        }
    }
}