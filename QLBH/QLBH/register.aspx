<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="QLBH.register" %>
   
<%@ Register Assembly="BotDetect"
    Namespace="BotDetect.Web.UI"
    TagPrefix="BotDetect"
     %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <link href="styles/jquery-ui-1.11.2.custom/jquery-ui.min.css" rel="stylesheet" />
    <script src="styles/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
    <script src="styles/jquery-ui-1.11.2.custom/jquery-ui.min.js"></script>
    <style type="text/css">
        #tableDangKy {
            width: 90%;
            margin: 0 auto;
            margin-top: 15px;
        }
        .auto-style1 {
            width: 186px;
        }
    </style>
    <script type="text/javascript">
        function validatePWD(sender, e) {
            if(e.Value.length >= 6){
                e.IsValid = true;
            }
            else e.IsValid = false;
        }

        $(function () {
            $("#<%= txtDOB.ClientID%>").datepicker({
                dateFormat: "d/m/yy"
            });
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Đăng ký
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table id="tableDangKy" cellpadding="2" cellspacing="0">
        <tr>
            <td colspan="4" class="text-center bold13orange">Thông tin đăng nhập</td>
        </tr>
        <tr>
            <td width="15px">&nbsp;</td>
            <td width="120px">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td >Tên đăng nhập:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
            <td>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Chưa nhập tên đăng nhập." ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Tên đăng nhập đã tồn tại" ForeColor="Blue" OnServerValidate="cvUserName_ServerValidate">@</asp:CustomValidator>
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td >Mật khẩu:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtPWD" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Chưa nhập mật khẩu." ForeColor="Red" ControlToValidate="txtPWD">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePWD" ControlToValidate="txtPWD" ErrorMessage="Mật khẩu &gt;= 6 ký tự." ForeColor="Blue">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td >Nhập lại mật khẩu:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="Chưa nhập mật khẩu lần 2" ForeColor="Red" ControlToValidate="txtConfirm">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPWD" ControlToValidate="txtConfirm" Display="Dynamic" ErrorMessage="Mật khẩu không trùng khớp." ForeColor="Blue">*</asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
            <td class="auto-style1">
              &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
        <tr>
            <td ></td>
            <td ></td>
            <td >
                <BotDetect:Captcha ID="SampleCaptcha" runat="server" ImageSize="175, 50" />          
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td >Mã xác nhận:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
            </td>
            <td>
              <BotDetect:CaptchaValidator ID="SampleCaptchaValidator" runat="server"
                  ControlToValidate="txtCaptcha" CaptchaControl="SampleCaptcha" ErrorMessage="Mã xác nhận không đúng." EnableClientScript="true"
                  SetFocusOnError="true" ForeColor="Red">*</BotDetect:CaptchaValidator>
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
            <td class="auto-style1">
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td class="text-center bold13orange" colspan="4">Thông tin cá nhân</td>
            <td>
                &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style1">
                &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>Họ tên:</td>
            <td class="auto-style1">
                 <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Chưa nhập họ tên." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>Email:</td>
            <td class="auto-style1">
                 <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Chưa nhập email." ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không đúng định dạng." ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>Ngày sinh:</td>
            <td class="auto-style1">
                 <asp:TextBox ID="txtDOB" runat="server" ReadOnly="false" TextMode="SingleLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDOB" Display="Dynamic" ErrorMessage="Chưa nhập ngày sinh." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style1">
                &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style1">
                <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
         <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td colspan="4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Các lỗi tìm thấy:" />
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
