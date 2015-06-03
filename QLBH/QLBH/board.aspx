<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="board.aspx.cs" Inherits="QLBH.board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Thông báo
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div style="margin: 30px;">
        <asp:Label ID="lbMsg" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>
