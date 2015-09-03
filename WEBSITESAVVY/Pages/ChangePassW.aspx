<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassW.aspx.cs" Inherits="WEBSITESAVVY.Pages.ChangePassW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center">
        <tr>
            <td colspan="2" class="headerViewform">
                ĐỔI MẬT KHẨU MỚI</td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="Old Password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtOldpass" runat="server" TextMode="Password" 
                    CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="New password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password" 
                    CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label4" runat="server" Text="Repeat password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtrepeatpass" runat="server" TextMode="Password" 
                    CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="right">
                <asp:Button ID="btnchange" runat="server" Text="Change" CssClass="btn" 
                    onclick="btnchange_Click" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
