<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcQuanLyCongTacTimeSheet.ascx.cs" Inherits="WEBSITESAVVY.Uc.UcQuanLyCongTacTimeSheet" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>

<table class="style1">
    <tr>
        <td align="right">
            <asp:Label ID="Label1" runat="server" Text="Mã"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtMa" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label2" runat="server" Text="Công Tác :"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtCongTac" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            &nbsp;</td>
        <td align="left">
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" />
            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
        </td>
    </tr>
</table>

