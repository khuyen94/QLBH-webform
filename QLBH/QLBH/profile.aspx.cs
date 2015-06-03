using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false) {
                Response.Redirect("~/login.aspx?retUrl=profile.aspx");
            }

            if (IsPostBack == false)
            {
                User curU = CurrentContext.GetCurUser();
                lbUsername.Text = curU.f_Username;

                txtName.Text = curU.f_Name;
                txtEmail.Text = curU.f_Email;
                txtDOB.Text = curU.f_DOB.ToString("d/M/yyyy");

                if(curU.f_Permission > 0)
                {
                    lnkDashboard.Visible = true;
                }
            }
        }

        protected void btnChangePWD_Click(object sender, EventArgs e)
        {
            string pwd = txtOldPWD.Text;
            string enc_pwd = StringUtils.MD5(pwd);

            using (QLBHEntities ctx = new QLBHEntities())
            {
               int n = ctx.Users
                    .Where(u => u.f_Username == lbUsername.Text && u.f_Password == enc_pwd).Count();

               if (n == 0)
               {
                   if (ClientScript.IsStartupScriptRegistered("swal") == false)
                   {
                       ClientScript.RegisterStartupScript(
                           this.GetType(),
                           "swal",
                           //"alert('Không đổi được mật khẩu.');",
                           "swal({   title: 'Lỗi',   text: 'Không đổi được mật khẩu',   type: 'error',   confirmButtonText: 'Trở về' });",
                           true
                           );
                   }
               }

               else
               {
                   string newpwd = txtNewPWD.Text;
                   string enc_newpwd = StringUtils.MD5(newpwd);

                   User curU = CurrentContext.GetCurUser();
                   curU.f_Password = enc_newpwd;

                   ctx.Entry(curU).State = System.Data.EntityState.Modified;
                   ctx.SaveChanges();
               }
            }
        }

        protected void btnChangeProfile_Click(object sender, EventArgs e)
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                User curU = CurrentContext.GetCurUser();
                curU.f_Name = txtName.Text;
                curU.f_Email = txtEmail.Text;
                curU.f_DOB = DateTime.Parse(txtDOB.Text);

                ctx.Entry(curU).State = System.Data.EntityState.Modified;
                ctx.SaveChanges();

            }
            ((QLBH)this.Master).UpdateName();
        }

    }
}