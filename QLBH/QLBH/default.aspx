<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="QLBH._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/engine1/style.css" rel="stylesheet" type="text/css" />
    <script src="styles/js/wowslider/jquery.js" type="text/javascript"></script>

    <script src="styles/js/wowslider/script.js" type="text/ecmascript"></script>
    <script src="styles/js/wowslider/wowslider.js" type="text/javascript"></script>

    <link href="sweetalert-master/lib/sweet-alert.css" rel="stylesheet" />
    <script src="sweetalert-master/lib/sweet-alert.min.js"></script>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <%--Start WOWSlider --%>
    <div id="wowslider-container1">
	<div class="ws_images"><ul>
<li><img src="images/slider/1.jpg" alt="c13f72f237d765fc0e69e35ba7eb9dd9" title="c13f72f237d765fc0e69e35ba7eb9dd9" id="wows1_0"/></li>
<li><img src="images/slider/2.jpg" alt="a8235d1055e66c22d61373e942096745" title="a8235d1055e66c22d61373e942096745" id="wows1_1"/></li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#" title="c13f72f237d765fc0e69e35ba7eb9dd9">1</a>
<a href="#" title="a8235d1055e66c22d61373e942096745">2</a>
</div></div>
<span class="wsl"><a href="http://wowslider.com">Carousel Plugin</a> by WOWSlider.com v4.3</span>
	<div class="ws_shadow"></div>
	</div>
    
    <%-- End WOWSlider --%>
    <div class="group product clearfix">
        <div class="header2">
            <span class="title">
                <span>Sản phẩm mới
                </span>
            </span>
        </div>
        <%-- Hiển thị sản phẩm mới --%>
        <asp:ListView ID="lvwProducts" runat="server" OnItemDataBound="lvwProducts_ItemDataBound1" OnItemCommand="lvwProducts_ItemCommand">
            <LayoutTemplate>
                <ul id="productList">
                    <li runat="server" id="itemPlaceholder"></li>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <a href="details.aspx?proId=<%# Eval("ProID") %>">
                        <img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" width="200" height="150" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
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
    </div>

    <%-- Sản phẩm bán chạy --%>
    <div class="group product clearfix">
        <div class="header2">
            <span class="title">
                <span>Sản phẩm bán chạy</span>
            </span>
        </div>
        <asp:ListView ID="lvwSalePro" runat="server" OnItemDataBound="lvwSalePro_ItemDataBound1" OnItemCommand="lvwSalePro_ItemCommand">
            <LayoutTemplate>

                <ul id="productList">
                    <li runat="server" id="itemPlaceholder"></li>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>

                <li>
                    <a href="details.aspx?proId=<%# Eval("ProID") %>">
                        <img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" width="200" height="150" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
                    <br />
                    <span class="bold13orange"><%# Eval("ProName") %>
                        <br />
                    </span>
                    <br />
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
    </div>
    <%-- Sản phẩm xem nhiều --%>
    <div class="group product clearfix">
        <div class="header2">
            <span class="title">
                <span>Sản phẩm xem nhiều</span>
            </span>
        </div>
        <asp:ListView ID="lvwViewPro" runat="server" OnItemDataBound="lvwViewPro_ItemDataBound1" OnItemCommand="lvwViewPro_ItemCommand">
            <LayoutTemplate>

                <ul id="productList">
                    <li runat="server" id="itemPlaceholder"></li>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>

                <li>
                    <a href="details.aspx?proId=<%# Eval("ProID") %>">
                        <img src="Imgs/sp/<%# Eval("ProID") %>/main_thumbs.jpg" width="200" height="150" alt="<%# Eval("ProName") %>" title="<%# Eval("ProName") %>" /></a>
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
    </div>
</asp:Content>
