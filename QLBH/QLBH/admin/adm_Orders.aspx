<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adm_Orders.aspx.cs" Inherits="QLBH.admin.adm_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- DataTables CSS -->
    <link href="style/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet" />

    <!-- DataTables Responsive CSS -->
    <link href="style/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet" />

    <link href="style/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Quản lí đơn hàng
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Danh sách đơn hàng
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <asp:ListView ID="lvwOrders" runat="server" DataKeyNames="OrderID" OnItemDeleting="lvwOrders_ItemDeleting" OnItemCommand="lvwOrders_ItemCommand" OnItemDataBound="lvwOrders_ItemDataBound">
                            <EmptyDataTemplate>
                                Không có dữ liệu.
                            </EmptyDataTemplate>
                            <LayoutTemplate>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Người đặt hàng</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th>&nbsp;</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr class="chk-default">
                                    <td><a href="adm_OrderDetail.aspx?orderId=<%# Eval("OrderID") %>"><%# Eval("OrderID") %></a></td>
                                    <td><a href="adm_profileUser.aspx?f_Id=<%# Eval("User.f_ID") %>"><%# Eval("User.f_Name") %></a>
                                    </td>
                                    <td><%# Eval("OrderDate") %></td>
                                    <td><%# Eval("Total","{0:N0}") %></td>
                                    <td>
                                        <h4>
                                            <asp:Label ID="lbChuaGiao" runat="server" Text="Chưa giao" CssClass="label label-danger" Visible="false"></asp:Label></h4>
                                        <h4>
                                            <asp:Label ID="lbDaGiao" runat="server" Text="Đã giao" CssClass="label label-success" Visible="false"></asp:Label></h4>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-default btn-xs" CommandName="Delete">
                                <i class="fa fa-remove"></i>
                                        </asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-default btn-xs" CommandName="EditOrder" CommandArgument='<%# Eval("OrderID") %>'>
                                <i class="fa fa-pencil"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <%-- add Category modal --%>
                <div class="modal fade" id="editOrderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Cập nhật đơn hàng</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="<%= txtUserName.ClientID %>" class="col-sm-2 control-label">Tên khách hàng</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtOrderId" runat="server" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <label for="<%= txtNgayDatHang.ClientID %>" class="col-sm-2 control-label">Ngày đặt hàng:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtNgayDatHang" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="<%= txtTotal.ClientID %>" class="col-sm-2 control-label">Tổng tiền:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <label for="<%= cboStatus.ClientID %>" class="col-sm-2 control-label">Tình Trạng:</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList ID="cboStatus" runat="server" CssClass="form-control selectpicker">
                                                <asp:ListItem Text="Đã giao" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Chưa giao" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>

                                <asp:LinkButton ID="btnEditOrder" runat="server" CssClass="btn btn-primary" OnClick="btnEditOrder_Click"> 
                        <i class="fa fa-check">&nbsp;Lưu</i>

                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyScript" runat="server">
    <script>
        $('.selectpicker').selectpicker();
    </script>

</asp:Content>
