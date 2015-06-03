<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adm_profileUser.aspx.cs" Inherits="QLBH.admin.profileUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Thông tin người đặt hàng
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="table-responsive" style="width: 500px">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
                <tr>
                    <td>Họ tên:</td>
                    <td>
                        <asp:Label ID="lbName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:Label ID="lbEmail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Ngày sinh:</td>
                    <td>
                        <asp:Label ID="lbDOB" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyScript" runat="server">
</asp:Content>
