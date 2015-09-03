<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="HomeClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.HomeClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
      <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="tableweekly" align="center">
        <tr>
            <td colspan="2" class="headermanager">
                Nhập tham chiếu claim cần thực hiện vào bên dưới:</td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tham chiếu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="input"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnNhap" runat="server" Text="Go" 
                    onclick="btnNhap_Click" CssClass="btn" Width="100px" />
            </td>
        </tr>
    </table>
</asp:Content>
