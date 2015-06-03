<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adm_TypeProducts.aspx.cs" Inherits="QLBH.admin.adm_TypeProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../sweetalert-master/lib/sweet-alert.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Quản lý loại sản phẩm
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <a href="javascript:;" role="button" class="btn btn-default" data-toggle="modal" data-target="#addTypeProductModal">
                <i class="fa fa-plus"></i>&nbsp;Thêm
            </a>
        </div>
    </div>
    <div class="row">
     <div class="col-md-12">
        <asp:ListView ID="lvwTypeProducts" runat="server" OnItemEditing="lvwTypeProducts_ItemEditing" DataKeyNames="TypeID" OnItemCanceling="lvwTypeProducts_ItemCanceling" OnItemUpdating="lvwTypeProducts_ItemUpdating" OnItemDeleting="lvwTypeProducts_ItemDeleting">
            <LayoutTemplate>
                 <table class="table table-hover" style="width: 600px !important">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Danh mục</th>
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
                <tr>
                        <td><%# Eval("TypeID") %></td>
                        <td><%# Eval("TypeName") %></td>
                        <td>
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-default btn-xs" CommandName="Delete">
                                <i class="fa fa-remove"></i>
                            </asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-default btn-xs" CommandName="Edit">
                                <i class="fa fa-pencil"></i>
                            </asp:LinkButton>
                        </td>
                    </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
                Không có dữ liệu.
            </EmptyDataTemplate>
            <EditItemTemplate>
                <tr>
                    <td><%# Eval("TypeID") %></td>
                    <td>
                        <asp:TextBox ID="txtTypeName" runat="server" Text='<%# Bind("TypeName")%>'></asp:TextBox></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:ImageButton ID="btnUpdate" runat="server" ImageUrl="~/Imgs/update-icon.png" CommandName="Update" />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Imgs/cancel-icon.png" CommandName="Cancel" /></td>
                </tr>
            </EditItemTemplate>
        </asp:ListView>
    </div>
        </div>

    <%-- add Category modal --%>
    <div class="modal fade" id="addTypeProductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Thêm loại sản phẩm</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="<%= txtTypeName.ClientID %>" class="col-sm-2 control-label">Tên loại</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtTypeName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>

                    <asp:LinkButton ID="btnAddTypeProduct" runat="server" CssClass="btn btn-primary" OnClick="btnAddTypeProduct_Click"> 
                        <i class="fa fa-check">&nbsp;Lưu</i>

                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyScript" runat="server">
    <script src="../sweetalert-master/lib/sweet-alert.min.js"></script>
    
    <script>

        $('#addTypeProductModal').on('shown.bs.modal', function (e) {
            $("#<%= txtTypeName.ClientID%>").focus();
        });

        $("a[id*='btnDelete']").click(function () {

            var href = $(this).prop('href');
            swal(
                {
                    title: "Bạn thật sự muốn xóa?",
                    text: "Bạn sẽ không thể khôi phục lại nó.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: false
                },
                function () {
                    location.href = href;
                }
            );
            return false;
        });
    </script>
</asp:Content>
