using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class profileUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login?retUrl=admin/adm_profileUser.aspx");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
            }

            if (IsPostBack == false)
            {
                int f_Id = Convert.ToInt32( Request.QueryString["f_Id"]);
                using (QLBHEntities ctx = new QLBHEntities())
                {
                    User us = ctx.Users.Where(u => u.f_ID == f_Id).FirstOrDefault();
                    if (us != null)
                    {
                        lbName.Text = us.f_Name;
                        lbEmail.Text = us.f_Email;
                        lbDOB.Text = us.f_DOB.ToString("d/M/yyyy");
                    }
                }
            }
        }
    }
}