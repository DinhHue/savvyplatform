<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="Export.aspx.cs" Inherits="WEBSITESAVVY.Pages.Export" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Print</title>
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table width="60%" align="center">
           
            <tr>
                <td>
                    <asp:Button ID="btnPrint" runat="server" CssClass="btn" Text="Select Report Export" 
                        onclick="btnPrint_Click1" />
                </td>
                <td align="left" colspan="2" style="font-size: 16px; padding-left: 2%;">
                    <asp:CheckBox ID="ckSR" runat="server" Text="Site Survey Record" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="ckILA" runat="server" Text="Initial Loss Adive" />
                </td>
            </tr>
            
            <tr>
                <td width="120px" class="style3">
                    <asp:Label ID="lblThamchieu" runat="server"></asp:Label>
                </td>
                <td align="center" class="style3">
                    </td>
                <td width="120px" class="style3">
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>
