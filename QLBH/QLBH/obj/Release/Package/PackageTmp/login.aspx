<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="QLBH.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        #tableDangNhap {
            width: 90%;
            margin: 0 auto;
            margin-top: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Đăng nhập
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table id="tableDangNhap" cellpadding="2" cellspacing="0" >
        <tr>
            <td class="title bold13orange" colspan="4">Thông tin đăng nhập</td>
        </tr>
        <tr>
            <td width="15px">&nbsp;</td>
            <td width="120px">&nbsp;</td>
            <td width="200px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td width="15px">&nbsp;</td>
            <td width="120px">Tên đăng nhập:</td>
            <td width="200px">
                <asp:TextBox ID="txtUsername" runat="server" ValidationGroup="login"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Chưa nhập Username" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Mật khẩu:</td>
            <td>
                <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" ValidationGroup="login"></asp:TextBox>

            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPWD" Display="Dynamic" ErrorMessage="Chưa nhập password" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="chkRemember" runat="server" CssClass="checkbox" />
                <label style="color: #c74fd0; display: inline-block" for="<%= chkRemember.ClientID %>">[Ghi nhớ tài khoản này?]</label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" CssClass="btn btn-primary" OnClick="btnLogin_Click" ValidationGroup="login" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="3">
                <span style="color: red"></span>
                <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Các lỗi tìm thấy:" />
            </td>
        </tr>
    </table>
</asp:Content>
