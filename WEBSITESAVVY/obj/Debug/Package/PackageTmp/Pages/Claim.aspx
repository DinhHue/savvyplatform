<%@ Page Title="View Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Claim.aspx.cs" Inherits="WEBSITESAVVY.Claim" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        width: 750px;       
        font-family: 'Times New Roman';        
        
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table cellpadding="2" cellspacing="3" class="style1"  >
    <tr>
        <td align="right" class="style12" >
            <asp:Label ID="Label1" runat="server" Text="Tham chiếu :"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtThamChieu" runat="server" Width="170px"></asp:TextBox>
            <span class="style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <asp:DropDownList ID="drGiaiDoan" runat="server">
                <asp:ListItem Value="1">Khảo Sát Rủi Ro</asp:ListItem>
                <asp:ListItem Value="2">Báo cáo đầu tiên</asp:ListItem>
                <asp:ListItem Value="3">Báo Cáo Sơ Bộ</asp:ListItem>
                <asp:ListItem Value="4">Báo Cáo Cuối Cùng</asp:ListItem>
            </asp:DropDownList>
            <span class="style12">&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Button ID="btnXem" runat="server" onclick="btnXem_Click" Text="Xem" 
                Width="71px" />
&nbsp;<span class="style12"><asp:Label ID="lblThongBaoClaim" runat="server" ForeColor="Red"></asp:Label>
        &nbsp;
            </span>
            <asp:Button ID="btnPrint" runat="server" Text="Export to PDF" 
                onclick="btnPrint_Click" />
            <span class="style12">&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Button ID="btn_ExportWord" runat="server" onclick="btn_ExportWord_Click" 
                Text="Export To Word" />
        </td>
    </tr>
    <tr>
        <td align="center"colspan="2" class="style12">
            
            &nbsp;</td>
    </tr>
    
</table>
    <asp:Panel ID="Panel1" runat="server" Font-Bold="False" 
        Font-Names="Times New Roman">
        </asp:Panel>
    </asp:Content>
