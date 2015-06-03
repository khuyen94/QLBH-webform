<%@ Page Title="" Language="C#" MasterPageFile="~/QLBH.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="QLBH.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyTitle" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
     <div class="banner-group wp100 clear">
               <img class="banner-group" src="images/banner/7.jpg" />
            </div>
          
        <div class="box">
                <div class="inside png">
                <h2>Liên hệ</h2>
                <p>Bạn có cần phải điền thông tin liên lạc trong mẫu dưới.</p>
                    <div action="" id="contacts-form">
                        <fieldset>
                        <div class="field">
                        <label>Họ tên:</label>
                        <input type="text" value="">
                        </div>
                        <div class="field">
                        <label>Địa chỉ email:</label>
                        <input type="text" value="">
                        </div>
                        <div class="field">
                        <label>Địa chỉ website:</label>
                        <input type="text" value="">
                        </div>
                        <div class="field">
                        <label>Lời nhắn:</label>
                        <textarea cols="" rows=""></textarea>
                        </div>
                        <div class="wrapper">
                        <div class="btn btn-success pd5x15 pull-right">
                        <span>
                        <span>
                        Gửi tin nhắn
                        </span>
                        </span>
                        </div>
                        </div>
                        </fieldset>
                    </div>
                </div>
            </div>
</asp:Content>
