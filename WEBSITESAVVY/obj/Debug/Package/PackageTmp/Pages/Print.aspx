<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="WEBSITESAVVY.Pages.Print" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print</title>
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <form id="form1" runat="server">
    <div class="newStyle1">        
        <asp:Label ID="lblThamchieu" runat="server"></asp:Label>
        </div>
    <div>
        <asp:Panel ID="Panel1" runat="server">
        <table width="60%" align="center">
           
            <tr>
                <td>
                    <asp:Button ID="btnPrint" runat="server" CssClass="btn" Text="Select Report" 
                        onclick="btnPrint_Click1" />
                </td>
                <td align="center" colspan="2">
                    <asp:CheckBox ID="ckSR" runat="server" Text="Site Survey Record" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="ckILA" runat="server" Text="Initial Loss Adive" />
                </td>
            </tr>
            
            <tr>
                <td width="120px">
                    &nbsp;</td>
                <td align="center">
                    &nbsp;</td>
                <td width="120px">
                    &nbsp;</td>
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
        </asp:Panel>

    
    </div>
    </form>
</body>
</html>
