using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class adm_Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login?retUrl=admin/adm_Orders");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
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
                var list = ctx.Orders.Include("User").OrderByDescending(o=>o.OrderDate).ToList();
                lvwOrders.DataSource = list;
                lvwOrders.DataBind();
            }
        }

        protected void lvwOrders_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int orderId = Convert.ToInt32(e.Keys["OrderID"]);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.OrderDetails.Where(o => o.OrderID == orderId).ToList();
                foreach (OrderDetail o in list)
                {
                    ctx.OrderDetails.Remove(o);
                }
                Order ord = ctx.Orders.Where(o => o.OrderID == orderId).FirstOrDefault();
                if (ord != null)
                {
                    ctx.Orders.Remove(ord);
                    ctx.SaveChanges();
                    loadOrders();
                }
            }
        }

        protected void lvwOrders_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EditOrder")
            {
                int o_Id = Convert.ToInt32(e.CommandArgument);

                using (QLBHEntities ctx = new QLBHEntities())
                {
                    Order order = ctx.Orders.Include("User").Where(o => o.OrderID == o_Id).FirstOrDefault();

                    txtOrderId.Text = order.OrderID.ToString();
                    txtUserName.Text = order.User.f_Name;
                    txtNgayDatHang.Text = order.OrderDate.ToString();
                    txtTotal.Text = string.Format("{0:N0}", order.Total);
                    cboStatus.SelectedValue = order.Status.ToString();
                }

                string script = "$('#editOrderModal').modal('show')";

                if (ClientScript.IsStartupScriptRegistered("editOrderModal") == false)
                {
                    ClientScript.RegisterStartupScript(
               this.GetType(),
               "editOrderModal",
               script,
               true
                   );
                }
            }
        }

        protected void btnEditOrder_Click(object sender, EventArgs e)
        {
            int o_Id = Convert.ToInt32(txtOrderId.Text);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                Order order = ctx.Orders.Where(o => o.OrderID == o_Id).FirstOrDefault();

                order.Status = Convert.ToInt32(cboStatus.SelectedValue);
                ctx.SaveChanges();
            }
            loadOrders();
        }

        protected void lvwOrders_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                // you would use your actual data item type here, not "object"
                Order o = (Order)dataItem.DataItem;

                Label lbChuaGiao = (Label)e.Item.FindControl("lbChuaGiao");
                Label lbDaGiao = (Label)e.Item.FindControl("lbDaGiao");

                if (o.Status == 1)
                    lbDaGiao.Visible = true;
                else lbChuaGiao.Visible = true;
            }
        }
    }

}
