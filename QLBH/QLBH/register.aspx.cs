using QLBH.Helpers;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                Response.Redirect("~/default.aspx");
            }
        }

        protected void cvUserName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string username = args.Value;

            using (QLBHEntities ctx = new QLBHEntities())
            {
                int n = ctx.Users.Where(u => u.f_Username == username).Count();
                if (n > 0)
                    args.IsValid = false;
                else args.IsValid = true;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User u = new User
                {
                    f_Username = txtUserName.Text,
                    f_Password = StringUtils.MD5(txtPWD.Text),
                    f_Name = txtName.Text,
                    f_Email = txtEmail.Text,

                    f_DOB = DateTime.ParseExact(txtDOB.Text, "d/M/yyyy", null),
                    f_Permission = 0
                };

                using (QLBHEntities ctx = new QLBHEntities())
                {
                    ctx.Users.Add(u);
                    ctx.SaveChanges();
                }
                Response.Redirect("~/board.aspx?msg=1");
            }
        }
    }
}