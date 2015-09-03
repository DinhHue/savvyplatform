<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="In.aspx.cs" Inherits="WEBSITESAVVY.Pages.In" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-left: 100px; width: 960px;">
    
        <table class="TableClaimMoi">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="NEW DAILY TO DO"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="right">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="textmananger" 
                        TextMode="MultiLine" Width="70%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <asp:Label ID="Label3" runat="server" Text="Rate"></asp:Label>
                </td>
                <td class="right">
                    <asp:DropDownList ID="drRate" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="left">
                    <asp:Label ID="Label4" runat="server" Text="Level "></asp:Label>
                </td>
                <td class="right">
                    <asp:DropDownList ID="drLevel" runat="server">
                        <asp:ListItem Value="0">Important To-Do</asp:ListItem>
                        <asp:ListItem Value="1">Waitting</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="left">
                    &nbsp;</td>
                <td class="right">
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Add" 
                        Width="50px" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
