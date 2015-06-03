<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adm_OrderDetail.aspx.cs" Inherits="QLBH.admin.adm_OrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Chi tiết đơn hàng
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <asp:ListView ID="lvwOrders" runat="server">
                            <EmptyDataTemplate>
                                Không có dữ liệu.
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng mua</th>
                                            <th>Giá tiền</th>
                                            <th>Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("OrderID") %></td>
                                    <td> <%# Eval("Product.ProName") %>    
                                    </td>
                                    <td><%# Eval("Quantity") %></td>
                                    <td><%# Eval("Price","{0:N0}") %></td>
                                    <td>
                                        <%# Eval("Amount") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        </div>
                    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyScript" runat="server">
</asp:Content>
