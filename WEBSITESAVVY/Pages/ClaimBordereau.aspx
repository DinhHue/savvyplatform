<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimBordereau.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimBordereau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table align="center" width="90%">
        <tr>
            <td class="headerweekly" colspan="2">
                TỔNG HƠP CLAIM BORDEREAU</td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Select Insurer :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDSInsurer" runat="server" Width="20%">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
