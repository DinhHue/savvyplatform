<%@ Page Title="Doi Mat Khau" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="WEBSITESAVVY.Pages.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
      <div class="box-right-form" style="height: 500px">
     
 <table class="tablechangepasss" align="center">
       <%-- <tr>
            <td colspan="2" class="headermanager" align="center">
                <asp:Label ID="Label2" runat="server" Text="Mật Khẩu Mới"></asp:Label>
            &nbsp;
            </td>
        </tr>--%>
        <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
        <tr>
            <td class="colmanager1" colspan="2">
                <strong>CHANGE PASSWORD</strong></td>
        </tr>
        <tr>
            <td class="leftpop" width="30%">
                <asp:Label ID="Label3" runat="server" Text="Mật khẩu :"></asp:Label>
            </td>
            <td class="rightmanager" width="70%">
                <asp:TextBox ID="txtpass1" runat="server" CssClass="textEntry" 
                    TextMode="Password" Width="80%"></asp:TextBox>
&nbsp;
                </td>
        </tr>
        <tr>
            <td class="leftpop" width="30%">
                <asp:Label ID="Label4" runat="server" Text="Nhập lại mật khẩu :"></asp:Label>
            </td>
            <td class="rightmanager" width="70%">
                <asp:TextBox ID="txtpass2" runat="server" CssClass="textEntry" 
                    TextMode="Password" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnThayDoi" runat="server" CssClass="btn" Text="Thay Đổi" 
                    onclick="btnKhoiPhucMatKhau_Click" />
            </td>
        </tr>
    </table>
   
   </div
 </div>
    </div>
   <%-- </div>--%>
</asp:Content>
