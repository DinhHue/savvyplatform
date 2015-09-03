<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatecoverhome.aspx.cs" Inherits="WEBSITESAVVY.Pages.updatecoverhome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div>
        <table width="100%">
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label7" runat="server" Text="Name Case :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:TextBox ID="txtNameCase" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label1" runat="server" Text="Brief :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:TextBox ID="txtBrief" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label3" runat="server" Text="Status :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    <asp:Button ID="btnChangeStatus" runat="server" CssClass="btn" 
                        onclick="btnChangeStatus_Click" Text="Change" />
                    <asp:DropDownList ID="drStatus" runat="server" CssClass="input" Width="70%">
                    </asp:DropDownList>
                &nbsp;<asp:Button ID="btnHideStatus" runat="server" CssClass="btn" 
                        onclick="btnHideStatus_Click" Text="Hide" />
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label4" runat="server" Text="Progress :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:TextBox ID="txtProgress" runat="server" CssClass="input" 
                        TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label2" runat="server" Text="Next Action :"></asp:Label>
                </td>
                <td class="rightpop">
                   <asp:TextBox ID="txtnextA" runat="server" CssClass="input" 
                        TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label5" runat="server" Text="Follower :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:Label ID="lblFollower" runat="server"></asp:Label>
                    <asp:Button ID="btnChangeFollower" runat="server" CssClass="btn" 
                        onclick="btnChangeFollower_Click" Text="Change" />
                    <asp:DropDownList ID="drGDV" runat="server" CssClass="input" Width="50%">
                    </asp:DropDownList>
                &nbsp;<asp:Button ID="drHideGDV" runat="server" CssClass="btn" 
                        onclick="drHideGDV_Click" Text="Hide" />
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label6" runat="server" Text="Rate :"></asp:Label>
                </td>
                <td class="rightpop">
                    <asp:TextBox ID="txtRate" runat="server" CssClass="input" Width="10%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn" Text="Update" 
                        onclick="btnUpdate_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
