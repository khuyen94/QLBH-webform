<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="QLBH.details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #productList {
            margin: 15px 0 0 0;
            padding: 0;
            list-style: none;
        }

            #productList li {
                float: left;
                margin: 0 0px 15px 15px;
                border: 1px dashed #CCCCCC;
                padding: 10px;
                width: 200px;
                display: inline-block;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Chi tiết sản phẩm
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Image ID="img" runat="server" Height="300px" Width="400px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lbProName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Giá bán:
                <asp:Label ID="lbPrice" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Tồn kho:
                <asp:Label ID="lbQuantity" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Xuất xứ:
                <asp:Label ID="lbOrigin" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Số lượng bán:
                <asp:Label ID="lbSaleQuantity" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Lượt xem:
                <asp:Label ID="lbPageView" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Loại laptop:
                <asp:Label ID="lbTypePro" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Nhà sản xuất:
                <asp:Label ID="lbCatPro" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lbFullDes" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Panel ID="pnCart" runat="server">
                    Số lượng:
                <asp:TextBox ID="txtQuantity" runat="server" Width="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantity" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" Text="*" ControlToValidate="txtQuantity" ForeColor="Blue" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" Text="*" ControlToValidate="txtQuantity" ForeColor="Blue" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Đặt hàng" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <%-- sản phẩm cùng nhà sản xuất --%>
    <span style="color: blue"><h3>Sản phẩm cùng nhà sản xuất</h3></span>
    <div class="group product clearfix">
     <asp:ListView ID="lvwProducts" runat="server" >
        <LayoutTemplate>
            <ul id="productList">
                <li runat="server" id="itemPlaceholder"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
                <a href="details.aspx?proId=<%# Eval("ProID") %>"><img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
                <br />
                <span class="bold13orange"><%# Eval("ProName") %>
                    <br />
                </span>
                <span class="bold11red"><%# Eval("Price","{0:N0}") %>
                    <br />
                <a href="details.aspx?proId=<%# Eval("ProID") %>" class="btn btn-info">Chi tiết</a>
            </li>
        </ItemTemplate>
        <EmptyDataTemplate>
            Không có sản phẩm.
        </EmptyDataTemplate>
    </asp:ListView>
        </div>
    <%-- Sản phẩm cùng loại --%>
    <span style="color: blue"><h3>Sản phẩm cùng loại</h3></span>
    <div class="group product clearfix">
        <asp:ListView ID="lvwProductType" runat="server" >
        <LayoutTemplate>
            <ul id="productList">
                <li runat="server" id="itemPlaceholder"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
                <a href="details.aspx?proId=<%# Eval("ProID") %>"><img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
                <br />
                <span class="bold13orange"><%# Eval("ProName") %>
                    <br />
                </span>
                <span class="bold11red"><%# Eval("Price","{0:N0}") %>
                    <br />
                <a href="details.aspx?proId=<%# Eval("ProID") %>" class="btn btn-info">Chi tiết</a>
            </li>
        </ItemTemplate>
        <EmptyDataTemplate>
            Không có sản phẩm.
        </EmptyDataTemplate>
    </asp:ListView>
        </div>
</asp:Content>
