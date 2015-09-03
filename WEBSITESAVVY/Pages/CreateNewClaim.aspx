<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="CreateNewClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.CreateNewClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase"> New Claim</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table align="center" class="style3">       
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Reference No :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtMaClaim" runat="server" Enabled="False" Width="50px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label3" runat="server" Text="Surveyor :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drSurveyor" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                    Width="300px">
                    <asp:ListItem>[Choose Surveyor]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Insurer :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drInsurer" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                    Width="300px">
                    <asp:ListItem>[Choose Insurer]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label18" runat="server" Text="Subsidiary :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drSubsidiary" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" Width="300px">
                    <asp:ListItem>[Choose Subsidiary]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Handler :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtHandler" runat="server" CssClass="textEntry" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Insured :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtInsured" runat="server" CssClass="textEntry" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label7" runat="server" Text="Address :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="textEntry" Width="70%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label8" runat="server" Text="Contact Person :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtContactPerson" runat="server" CssClass="textEntry" 
                    Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label9" runat="server" Text="Phone :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label10" runat="server" Text="Email :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label11" runat="server" Text="Policy no :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="textEntry" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label12" runat="server" Text="Effective :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtEffective" runat="server" CssClass="textEntry" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label13" runat="server" Text="Premises :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtPremises" runat="server" CssClass="textEntry" Width="70%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label14" runat="server" Text="Date of Loss :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDateofLoss" runat="server" CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label15" runat="server" Text="Type of Loss :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drTypeofLoss" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                    Width="300px">
                    <asp:ListItem>[Choose Type of Loss]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label16" runat="server" Text="Note :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNote" runat="server" CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label17" runat="server" Text="Type Policy :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTypePolicy" runat="server" CssClass="textEntry"></asp:TextBox>
&nbsp;<asp:Label ID="lblThongBaoLoi" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnCreateNew" runat="server" CssClass="btn" 
                    Text="Create New Claim" onclick="btnCreateNew_Click" />
                <asp:Label ID="lblThongBao" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                &nbsp;</td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
