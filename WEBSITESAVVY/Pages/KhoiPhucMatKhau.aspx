<%@ Page Title="Khoi Phuc Mat Khau" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KhoiPhucMatKhau.aspx.cs" Inherits="WEBSITESAVVY.Pages.KhoiPhucMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Get back Password</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
      <div class="box-right-form" style="height: 500px">
    <table class="table_input" align="center" width="50%">
       <%-- <tr>
            <td colspan="2" class="headerTimesheet">
                <asp:Label ID="Label2" runat="server" 
                    Text="Nhập chính xác email đang sử dụng !"></asp:Label>
            </td>
        </tr>--%>
        <tr>
            <td align="center">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry" Width="60%"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnKhoiPhucMatKhau" runat="server" CssClass="btn" Text="Send" 
                    onclick="btnKhoiPhucMatKhau_Click" />
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
    </div>
</asp:Content>
