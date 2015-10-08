<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDraft.aspx.cs" Inherits="WEBSITESAVVY.Pages.FormDraft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }

input.textEntry 
{
    width: 320px;
    border: 1px solid #ccc;
    height:30px;
}

    .btn
{
    background-color:#003300;
    font-size:14;
    height:30px;
    font-weight:bold;
    color: #FFFFFF;
    width:auto;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="infoFormTableSubInfoFirst" align="center">
            <tr class="headermanager">
                <td colspan="4">
                    INFOMATIONS FIRST</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label3" runat="server" Text="Reference No :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMaClaim" runat="server" CssClass="textEntry" 
                        Enabled="False"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label2" runat="server" Text="Surveyor :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drSurveyor" runat="server" Width="300px" 
                        AppendDataBoundItems="True">
                        <asp:ListItem>[Choose Surveyor ...]</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label4" runat="server" Text="Insurer :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drInsurer" runat="server" AutoPostBack="True" 
                        CausesValidation="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                        Width="300px">
                        <asp:ListItem>[Choose Insurer]</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label5" runat="server" Text="Subsidiary :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drSubsidiary" runat="server" AutoPostBack="True" 
                        CausesValidation="True" Width="300px">
                        <asp:ListItem>[Choose Subsidiary]</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label7" runat="server" Text="Insured :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtInsurerd" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label6" runat="server" Text="Handler :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtHandler" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label8" runat="server" Text="Address :"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtAddress" runat="server" Width="320px" Height="50px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label9" runat="server" Text="Contact Person :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtContactperson" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label10" runat="server" Text="Phone :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label11" runat="server" Text="Email :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label12" runat="server" Text="Fax :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFax" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label13" runat="server" Text="Policy No :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label14" runat="server" Text="Effective :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEffective" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label15" runat="server" Text="Premises :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPresmises" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                <td class="leftmanager">
                    <asp:Label ID="Label16" runat="server" Text="Date of loss :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDateofloss" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label17" runat="server" Text="Type of loss :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drTypeofloss" runat="server" AppendDataBoundItems="True" 
                        Width="300px">
                        <asp:ListItem>[Choose type of loss]</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label18" runat="server" Text="Note :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtGhiChu" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label19" runat="server" Text="Type Policy :"></asp:Label>
                </td>
                <td>
                 <asp:TextBox ID="txtTypePolicy" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:Label ID="lblThongBaoThieu" runat="server"></asp:Label>
                   
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label20" runat="server" Text="Assigned Date :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAssignedDate" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Circumstances :</td>
                <td>
                    <asp:TextBox ID="txtCircumstances" runat="server" Width="320px" Height="50px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Reportd to the Local Authority (Police) ?</td>
                <td>
                    <asp:CheckBox ID="ckYes" runat="server" Text="Yes" Width="50px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="ckNo" runat="server" Text="No" Width="50px" />
                </td>
                <td>
                    Further notes :</td>
                <td>
                    <asp:TextBox ID="txtFurthernotes" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Extent of Loss :</td>
                <td colspan="3">
                    <asp:TextBox ID="txtExtenofLoss" runat="server" Width="800px" Height="100px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Intitial Reserve :</td>
                <td>
                    <asp:TextBox ID="txtFurthernotes0" runat="server" CssClass="textEntry"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    Appendix attached :</td>
                <td>
                    <asp:TextBox ID="txtExtenofLoss0" runat="server" Width="320px" Height="50px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Loss Mitigating Actions &amp; Recommendation :</td>
                <td colspan="3">
                    <asp:TextBox ID="txtKhuyenCao" runat="server" Width="800px" Height="100px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Loss Adjuster&#39;s Remark :</td>
                <td colspan="3">
                    <asp:TextBox ID="txtYKienGDV" runat="server" Width="800px" Height="100px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    &nbsp;</td>
                <td colspan="3">
                    &nbsp;<asp:Button ID="btnCreatnew" runat="server" CssClass="btn" Text="Create New" 
                        onclick="btnCreatnew_Click" />
                    <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
