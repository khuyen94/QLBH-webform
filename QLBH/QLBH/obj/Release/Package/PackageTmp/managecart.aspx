<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="managecart.aspx.cs" Inherits="QLBH.managecart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="sweetalert-master/lib/sweet-alert.css" rel="stylesheet" />
    <script src="sweetalert-master/lib/sweet-alert.min.js"></script>

    <style type="text/css">
        #cart {
                border-collapse: collapse;
                border: solid 1px #3366CC;
            }

            #cart td.header {
                background-color: #003399;
                color: #CCCCFF;
                font-weight: bold;
            }

            #cart td {
                color: #003399;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Giỏ hàng
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div style="margin-left: 30px; margin-right: 30px">
        Giỏ hàng
    </div>

    <div style="margin-left: 30px; margin-top: 10px;">
        <asp:Label ID="lbTotal" CssClass="bold13orange" runat="server" Text=""></asp:Label>
    </div>

    <div style="padding: 20px 20px 20px 30px">
        <asp:ListView ID="lvwCart" runat="server" OnDataBound="lvwCart_DataBound" OnItemDataBound="lvwCart_ItemDataBound" OnItemCommand="lvwCart_ItemCommand">
            <LayoutTemplate>
                <table id="cart">
                                    <tr>
                                        <td class="header" width="200px">Sản phẩm</td>
                                        <td class="header" width="120px">Giá</td>
                                        <td class="header" width="90px">Số lượng</td>
                                        <td class="header" width="120px">Thành tiền</td>
                                        <td class="header">&nbsp;</td>
                                        <td class="header">&nbsp;</td>
                                    </tr>
                                   <tr runat="server" id="itemPlaceholder">

                                   </tr>
                                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Label ID="lbProName" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lbPrice" runat="server"></asp:Label></td>
                    <td><asp:TextBox ID="txtQuantity" runat="server" Width="60px" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                        <asp:CompareValidator ID="valQuantity" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtQuantity" Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                        <asp:CompareValidator ID="valQuantity2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtQuantity" Type="Integer" Operator="LessThanEqual" ValueToCompare=""></asp:CompareValidator>
                    </td>
                    <td><asp:Label ID="lbAMount" runat="server"></asp:Label></td>
                    <td><asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Imgs/delete-icon.png" CommandName="deleteItem" CommandArgument='<%# Eval("ProID") %>' CausesValidation="false" /></td>
                    <td><asp:ImageButton ID="btnUpdate" runat="server" ImageUrl="~/Imgs/update-icon.png" CommandName="updateItem" CommandArgument='<%# Eval("ProID") %>' /></td></td></td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
                Giỏ hàng rỗng.
            </EmptyDataTemplate>
        </asp:ListView>
    </div>

    <div style="padding-left: 30px">
        <a href="default.aspx" class="btn btn-primary">Về trang chủ</a>
        <asp:Button ID="btnUpdateAll" runat="server" CssClass="btn btn-success" Text="Cập nhật" />
        <asp:Button ID="btnSaveOrder" runat="server" CssClass="btn btn-danger" Text="Lập hóa đơn" OnClick="btnSaveOrder_Click" />
    </div>
</asp:Content>
