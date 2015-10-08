<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEditDaiLy.ascx.cs" Inherits="WEBSITESAVVY.Uc.ucEditDaiLy" %>
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />


<table align="center" width="70%">
    <tr>
        <td align="center" colspan="4">
         <asp:GridView runat="server" AutoGenerateColumns="False" 
                Font-Names="Times New Roman" Font-Size="16px" Width="80%" ID="gvDSImportant">
             <Columns>
<asp:BoundField DataField="MaDaiLy" HeaderText="ID"></asp:BoundField>
<asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
<ItemStyle Width="40%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Rate" HeaderText="Rate">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
</Columns>

<HeaderStyle HorizontalAlign="Center" BackColor="#006600" Font-Names="Times New Roman" 
                 Font-Size="18px" ForeColor="White"></HeaderStyle>
</asp:GridView>

        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Label ID="lblMaDaily" runat="server" Visible="False"></asp:Label>
        </td>
        <td align="center">
            <asp:Button ID="btnUprate0" runat="server" CssClass="btn" Text="Up Rate" 
                onclick="btnUprate_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnDownrate" runat="server" CssClass="btn" Text="Down Rate" 
                onclick="btnDownrate_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnDone" runat="server" CssClass="btn" Text="Done" 
                onclick="btnDone_Click" />
        </td>
    </tr>
</table>

