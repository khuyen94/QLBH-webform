﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH
{
    public partial class board : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                string msg = Request.QueryString["msg"];
                switch(msg)
                {
                    case "1":
                        lbMsg.Text = "Đăng ký thành công. Mời đăng nhập.";
                            break;
                    case "2":
                            lbMsg.Text = "Bạn không đủ quyền truy cập.";
                            break;
                    default:
                            lbMsg.Text = "Chủ đề không tồn tại.";
                            break;
                }
            }
        }
    }
}