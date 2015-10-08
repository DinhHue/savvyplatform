<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newclaimpop.aspx.cs" Inherits="WEBSITESAVVY.Pages.newclaimpop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .rightmanager
        {
            width:auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
      <asp:Panel ID="Panel1" runat="server" GroupingText="New Claim" Width="95%">      
    
        <table width="100%" style="text-align:center;">
            <tr>
                <td colspan="2" align="left" 
                    style="color: #FF0000; font-style: italic">
                    (*) : Bắt buộc phải chọn hoặc nhập thông tin</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label2" runat="server" Text="Surveyor :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drSurveyor" runat="server" AppendDataBoundItems="True" 
                        Width="300px" CssClass="input">
                        <asp:ListItem Value="0" Text="[Choose Surveyor ...]" />
                    </asp:DropDownList>(*)</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label3" runat="server" Text="Reference No :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:Label ID="txtMaClaim" runat="server" CssClass="labelleftlong"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label4" runat="server" Text="Insurer :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drInsurer" runat="server" AutoPostBack="True" 
                        CausesValidation="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                        Width="300px">
                        <asp:ListItem Value="0">[Choose Insurer]</asp:ListItem>
                    </asp:DropDownList>(*)</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label5" runat="server" Text="Subsidiary :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drSubsidiary" runat="server" AutoPostBack="True" 
                        CausesValidation="True" Width="300px" CssClass="input">
                        <asp:ListItem Value="0">[Choose Subsidiary]</asp:ListItem>
                    </asp:DropDownList>(*)</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label7" runat="server" Text="Insured :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtInsurerd" runat="server" CssClass="input" Width="290px"></asp:TextBox>
                    (*)</td>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label17" runat="server" Text="Type of loss :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drTypeofloss" runat="server" 
                        Width="300px" CssClass="input">
                    </asp:DropDownList>
                    (*)</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label18" runat="server" Text="Note :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtGhiChu" runat="server" CssClass="input" Width="290px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label20" runat="server" Text="Assigned Date :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtAssignedDate" runat="server" CssClass="input" ></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="txtAssignedDate">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label19" runat="server" Text="Type Policy :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drTypePolicy" runat="server">
                        <asp:ListItem Value="PD">Property &amp; Casualty</asp:ListItem>
                        <asp:ListItem Value="EG">Engineering Insurance</asp:ListItem>
                        <asp:ListItem Value="CT">Construction Insurance</asp:ListItem>
                        <asp:ListItem Value="RS">Risk Survey</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;-
                    <asp:TextBox ID="txtTypePolicy" runat="server" CssClass="input" Width="25%"></asp:TextBox>
                    <asp:Label ID="Label21" runat="server" Font-Italic="True" ForeColor="#999999" 
                        Text="mmdd"></asp:Label>
                    (*)<asp:Label ID="lblThongBaoThieu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    &nbsp;</td>
                <td class="rightmanager">
                    <asp:Button ID="btnCreatnew" runat="server" CssClass="btn" 
                        onclick="btnCreatnew_Click" Text="Create New" />
                    <input type="button" onclick="document.getElementById('form1').reset();" class="btn" value="Reset form" />   
                        <Br />
                    <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                    </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
