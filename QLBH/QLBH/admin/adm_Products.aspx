<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="adm_Products.aspx.cs" Inherits="QLBH.admin.adm_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../sweetalert-master/lib/sweet-alert.css" rel="stylesheet" />
    <link href="style/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
    <link href="style/bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Quản lí sản phẩm
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <a href="javascript:;" role="button" class="btn btn-default" data-toggle="modal" data-target="#addProductModal">
                <i class="fa fa-plus"></i>&nbsp;Thêm
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:ListView ID="lvwProducts" runat="server" DataKeyNames="ProID" OnItemCanceling="lvwProducts_ItemCanceling" OnItemEditing="lvwProducts_ItemEditing" OnItemDeleting="lvwProducts_ItemDeleting" OnItemCommand="lvwProducts_ItemCommand">
                <EmptyDataTemplate>
                    Không có dữ liệu.
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <table class="table table-hover" >
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Xuất xứ</th>
                                <th>Danh mục</th>
                                <th>Loại sản phẩm</th>
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
                        <td><%# Eval("ProID") %></td>
                        <td><%# Eval("ProName") %></td>
                        <td><%# Eval("Price","{0:N0}") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("Origin") %></td>
                        <td><%# Eval("Category.CatName") %></td>
                        <td><%# Eval("TypeProduct.TypeName") %></td>
                        <td>
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-default btn-xs" CommandName="Delete">
                                <i class="fa fa-remove"></i>
                            </asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-default btn-xs" CommandName="EditProduct" CommandArgument='<%# Eval("ProID") %>'>
                                <i class="fa fa-pencil"></i>
                            </asp:LinkButton>

                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>


    <!-- addProduct Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Thêm sản phẩm</h4>
                </div>
                <div class="modal-body form-horizontal" id="formValidator" >

                    <div class="form-group">
                        <label for="<%=txtProName.ClientID %>" class="col-sm-2 control-label">Sản phẩm:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtProName" runat="server" CssClass="form-control" name="txtProName" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập tên sản phẩm" ForeColor="Red" ControlToValidate="txtProName" ValidationGroup="addPro"></asp:RequiredFieldValidator>     
                        </div>
                        <label for="<%=txtOrigin.ClientID %>" class="col-sm-2 control-label">Xuất xứ:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtOrigin" runat="server" CssClass="form-control" name="txtOrigin" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bạn chưa nhập xuất xứ" ForeColor="Red" ControlToValidate="txtOrigin" ValidationGroup="addPro"></asp:RequiredFieldValidator>     
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboTypePro.ClientID %>" class="col-sm-2 control-label">Loại sản phẩm:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="cboTypePro" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
                        </div>
                        <label for="<%=cboCategories.ClientID %>" class="col-sm-2 control-label">Danh mục:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="cboCategories" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPrice.ClientID %>" class="col-sm-2 control-label">Giá:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập giá" ForeColor="Red" ControlToValidate="txtPrice" ValidationGroup="addPro"></asp:RequiredFieldValidator>     
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Chỉ được nhập số" ForeColor="Red" ValidationGroup="addPro" ControlToValidate="txtPrice" Operator="GreaterThanEqual" Type="Currency" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>                    
                        </div>
                        <label for="<%=txtQ.ClientID %>" class="col-sm-2 control-label">Số lượng:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtQ" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn chưa nhập số lượng" ForeColor="Red" ControlToValidate="txtQ" ValidationGroup="addPro"></asp:RequiredFieldValidator>     
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Chỉ được nhập số" ForeColor="Red" ValidationGroup="addPro" ControlToValidate="txtQ" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>                                               
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=fuMain.ClientID %>" class="col-sm-2 control-label">Hình lớn:</label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuMain" runat="server" data-filename-placement="inside" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="chỉ hổ trợ jpg,png" ForeColor="Red" ControlToValidate="fuMain" ValidationExpression=".+\.(jpg|png|JPG)$"></asp:RegularExpressionValidator>
                        </div>
                        <label for="<%=fuThumbs.ClientID %>" class="col-sm-2 control-label">Hình nhỏ:</label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuThumbs" runat="server" data-filename-placement="inside" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="chỉ hổ trợ jpg,png" ForeColor="Red" ControlToValidate="fuThumbs" ValidationExpression=".+\.(jpg|png|JPG)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtTinyDes.ClientID %>" class="col-sm-2 control-label">Mô tả:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtTinyDes" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-2">
                            <asp:TextBox ID="txtFullDes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <asp:LinkButton ID="btnAddProduct" runat="server" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" ValidationGroup="addPro">
            <i class="fa fa-check"></i> &nbsp;Lưu
                    </asp:LinkButton>

                </div>
            </div>
        </div>
    </div>



    <!-- editProduct Modal -->
    <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editProductModalLabel">Chỉnh sửa sản phẩm</h4>
                </div>
                <div class="modal-body form-horizontal">

                    <div class="form-group">
                        <label for="<%=txtProNameE.ClientID %>" class="col-sm-2 control-label">Sản phẩm:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtProIDE" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtProNameE" runat="server" CssClass="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn chưa nhập tên sản phẩm" ForeColor="Red" ControlToValidate="txtProNameE" ValidationGroup="editPro"></asp:RequiredFieldValidator>     
                        </div>
                        <label for="<%=txtOriginE.ClientID %>" class="col-sm-2 control-label">Xuất xứ:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtOriginE" runat="server" CssClass="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Bạn chưa nhập xuất xứ" ForeColor="Red" ControlToValidate="txtOriginE" ValidationGroup="editPro"></asp:RequiredFieldValidator>     
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <label for="<%=cboTypeProE.ClientID %>" class="col-sm-2 control-label">Loại sản phẩm:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="cboTypeProE" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
                        </div>
                        <label for="<%=cboCategoriesE.ClientID %>" class="col-sm-2 control-label">Danh mục:</label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="cboCategoriesE" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPriceE.ClientID %>" class="col-sm-2 control-label">Giá:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtPriceE" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Bạn chưa nhập giá" ForeColor="Red" ControlToValidate="txtPriceE" ValidationGroup="editPro"></asp:RequiredFieldValidator>     
                            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Chỉ được nhập số" ForeColor="Red" ValidationGroup="editPro" ControlToValidate="txtPriceE" Operator="GreaterThanEqual" Type="Currency" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>                    
                            
                        </div>
                        <label for="<%=txtQE.ClientID %>" class="col-sm-2 control-label">Số lượng:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtQE" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Bạn chưa nhập số lượng" ForeColor="Red" ControlToValidate="txtQE" ValidationGroup="editPro"></asp:RequiredFieldValidator>     
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Chỉ được nhập số" ForeColor="Red" ValidationGroup="editPro" ControlToValidate="txtQE" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>                                               
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=fuMainE.ClientID %>" class="col-sm-2 control-label">Hình lớn:</label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuMainE" runat="server" data-filename-placement="inside" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="chỉ hổ trợ jpg,png" ForeColor="Red" ControlToValidate="fuMain" ValidationExpression=".+\.(jpg|png|JPG)$"></asp:RegularExpressionValidator>
                        </div>
                        <label for="<%=fuThumbsE.ClientID %>" class="col-sm-2 control-label">Hình nhỏ:</label>
                        <div class="col-sm-4">
                            <asp:FileUpload ID="fuThumbsE" runat="server" data-filename-placement="inside" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="chỉ hổ trợ jpg,png" ForeColor="Red" ControlToValidate="fuThumbs" ValidationExpression=".+\.(jpg|png|JPG)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtTinyDesE.ClientID %>" class="col-sm-2 control-label">Mô tả:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtTinyDesE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-2">
                            <asp:TextBox ID="txtFullDesE" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click" ValidationGroup="editPro">
            <i class="fa fa-check"></i> &nbsp;Lưu
                    </asp:LinkButton>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyScript" runat="server">
 
    <script src="../sweetalert-master/lib/sweet-alert.min.js"></script>
    <script src="../scripts/tinymce/tinymce.min.js"></script>
    <script src="../scripts/bootstrap-file-input.js"></script>
    <script src="style/bootstrap-select/js/bootstrap-select.min.js"></script>


    <script>

        $('.selectpicker').selectpicker();

        tinymce.init(
           {
               selector: 'textarea',
               menubar: false,
               toolbar1: "styleselect | bold italic | link imgae | alignleft aligncenter alighright | bullist numlist",
               toolbar2: "fontselect | fontsizeselect | forecolor backcolor",
               plugins: 'link image textcolor',
               encoding: "xml",
           }
       );

        $('input[type=file]').bootstrapFileInput();

        $('#addProductModal').on('shown.bs.modal', function (e) {
            $("#<%= txtProName.ClientID%>").focus();
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
