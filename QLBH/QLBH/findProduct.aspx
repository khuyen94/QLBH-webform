<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="findProduct.aspx.cs" Inherits="QLBH.findProduct" %>
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
    Kết quả tìm kiếm
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:ListView ID="lvwProducts" runat="server" OnItemCommand="lvwProducts_ItemCommand" OnItemDataBound="lvwProducts_ItemDataBound">
            <LayoutTemplate>
                <ul id="productList">
                    <li runat="server" id="itemPlaceholder"></li>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <a href="details.aspx?proId=<%# Eval("ProID") %>">
                        <img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
                    <br />
                    <span class="bold13orange"><%# Eval("ProName") %>
                        <br />
                    </span>
                    <span class="bold11red">Giá: <%# Eval("Price","{0:N0}") %>
                        <br />
                    </span>
                    Số lượng: <%# Eval("Quantity") %>
                    <br />
                    <a href="details.aspx?proId=<%# Eval("ProID") %>" class="btn btn-info">Chi tiết</a>
                    <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-inverse" CommandName="addToCart" CommandArgument='<%# Eval("ProID") %>'>Đặt hàng</asp:LinkButton>
                     <asp:Label ID="lbHetHang" runat="server" Text="Hết hàng" CssClass="label label-warning" Visible="false"></asp:Label>
                </li>
            </ItemTemplate>
            <EmptyDataTemplate>
                Không có sản phẩm.
            </EmptyDataTemplate>
        </asp:ListView>

    <div style="clear: both; text-align: center">
        <asp:DataPager ID="dp" runat="server" PagedControlID="lvwProducts" PageSize="9">
            <Fields>
                <asp:NextPreviousPagerField
                    ShowFirstPageButton="true"
                    FirstPageText="Đầu"
                    ShowNextPageButton="false" />
                <asp:NumericPagerField
                    ButtonCount="3"
                     CurrentPageLabelCssClass="bold13orange" />
                <asp:NextPreviousPagerField
                    ShowLastPageButton="true"
                    LastPageText=">>"
                    NextPageText=">"
                    ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>
