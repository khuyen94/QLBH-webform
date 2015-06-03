using QLBH.Helpers;
using System;
using System.Linq;

namespace QLBH
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged()) {

                Response.Redirect("~/default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string enc_pwd = StringUtils.MD5(txtPWD.Text);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                User us = ctx.Users
                     .Where(u => u.f_Username == username && u.f_Password == enc_pwd).FirstOrDefault();
                if (us != null)
                {
                    Session["IsLogin"] = 1;
                    Session["CurUser"] = us;

                    if (chkRemember.Checked) 
                    {
                        Response.Cookies["Username"].Value = username;
                        Response.Cookies["Username"].Expires = DateTime.Now.AddDays(7);
                    }


                    if (us.f_Permission > 0)
                    {
                        string retUrl = Request.QueryString["retUrl"];

                        if (string.IsNullOrEmpty(retUrl))
                        {

                            retUrl = "./admin/adm_dashboard.aspx";
                        }

                        Response.Redirect(retUrl);
                    }
                    else
                    {
                        string retUrl = Request.QueryString["retUrl"];

                        if (string.IsNullOrEmpty(retUrl))
                        {

                            retUrl = "./default.aspx";
                        }

                        Response.Redirect(retUrl);
                    }
                }
                else
                {
                    lbError.Text = "(*) Thông tin đăng nhập sai.";
                }
            }
        }
    }
}