<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="QLBH.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="styles/jquery-ui-1.11.2.custom/jquery-ui.min.css" rel="stylesheet" />
    <script src="styles/jquery-ui-1.11.2.custom/external/jquery/jquery.js"></script>
    <script src="styles/jquery-ui-1.11.2.custom/jquery-ui.min.js"></script>

    <link href="sweetalert-master/lib/sweet-alert.css" rel="stylesheet" />
    <script src="sweetalert-master/lib/sweet-alert.min.js"></script>

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
            if (e.Value.length >= 6) {
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
    Thông tin cá nhân
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
     <table id="tableDangKy" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td colspan="4" class="bold13orange">Đổi mật khẩu</td>
                                </tr>
                                <tr>
                                    <td width="15px"></td>
                                    <td width="120px"></td>
                                    <td width="200px"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Tên đăng nhập:</td>
                                    <td>
                                        <asp:Label ID="lbUsername" runat="server" CssClass="bold13orange"></asp:Label>

                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Mật khẩu cũ:</td>
                                    <td>
                                        <asp:TextBox ID="txtOldPWD" runat="server" TextMode="Password"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPWD" Display="Dynamic" ErrorMessage="Mật khẩu không được để trống" ForeColor="Red" ValidationGroup="pwd">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>                                   
                                    <td>Mật khẩu mới:</td>
                                    <td><asp:TextBox ID="txtNewPWD" runat="server" TextMode="Password"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPWD" Display="Dynamic" ErrorMessage="Mật khẩu mới không được để trống" ForeColor="Red" ValidationGroup="pwd">*</asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePWD" ControlToValidate="txtNewPWD" ErrorMessage="Mật khẩu phải lớn hơn 6 kí tự" ForeColor="Blue" ValidationGroup="pwd">@</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Nhập lại:</td>
                                    <td><asp:TextBox ID="txtConfirmPWD" runat="server" TextMode="Password"></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPWD" Display="Dynamic" ErrorMessage="Mật khẩu nhập lại không được để trống" ForeColor="Red" ValidationGroup="pwd">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPWD" ControlToValidate="txtConfirmPWD" Display="Dynamic" ErrorMessage="Mật khẩu nhập lại không trùng" ForeColor="Blue" ValidationGroup="pwd">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnChangePWD" runat="server" Text="Cập nhât" CssClass="btn btn-primary" ValidationGroup="pwd" OnClick="btnChangePWD_Click" /></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="bold13orange">Cập nhật thông tin cá nhân</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Họ tên:</td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Họ tên không được để trống" ForeColor="Red" ValidationGroup="profile">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Email:</td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không đúng định dạng" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="profile">*</asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không được để trống" ForeColor="Red" ValidationGroup="profile">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>Ngày sinh:</td>
                                    <td class="auto-style1">
                                       <asp:TextBox ID="txtDOB" runat="server" ReadOnly="False" TextMode="SingleLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDOB" Display="Dynamic" ErrorMessage="Chưa nhập ngày sinh." ForeColor="Red">*</asp:RequiredFieldValidator>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnChangeProfile" runat="server" Text="Cập nhật" CssClass="btn btn-primary" ValidationGroup="profile" OnClick="btnChangeProfile_Click" /></td>
                                    <td><asp:HyperLink ID="lnkDashboard" NavigateUrl="~/admin/adm_dashboard.aspx" runat="server" CssClass="btn btn-warning" Visible="false">Về trang Quản trị</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;

                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Các lỗi tìm thấy:" />

                                    </td>
                                </tr>
                            </table>

</asp:Content>
