<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loginm.aspx.cs" Inherits="WEBSITESAVVY.mobile.Loginm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style5
        {
            font-weight: 700;
        }
        .style6
        {
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <table align="center" class="login">
        <tr>
            <td align="right" width="30%" >
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập :" CssClass="style5"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="textEntry" 
                    Height="25px" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%" >
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu :" BorderColor="Black" 
                    CssClass="style6"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="passwordEntry" 
                    TextMode="Password" Height="25px" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnDangNhap" runat="server" onclick="btnDangNhap_Click" 
                    Text="Đăng nhập" CssClass="btn" />
&nbsp;<asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Pages/KhoiPhucMatKhau.aspx">Quên mật khẩu</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="right">
                Website thông tin : </td>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="http://savvyadjusters.com.vn/">Savvyadjusters.com.vn</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
