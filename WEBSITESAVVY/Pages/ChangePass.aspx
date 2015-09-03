<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="WEBSITESAVVY.Pages.ChangePass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="ambitios_rows_sub">
<div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Change Password</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
      <div class="box-right-form" style="height: 500px">
    <table class="tableweekly" align="center">
        <tr>
            <td colspan="2" class="headerViewform">
                ĐỔI MẬT KHẨU MỚI</td>
        </tr>
        <tr>
            <td class="left">
                <asp:Label ID="Label2" runat="server" Text="Old Password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtOldpass" runat="server" TextMode="Password" 
                    CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="left">
                <asp:Label ID="Label3" runat="server" Text="New password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password" 
                    CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="left">
                <asp:Label ID="Label4" runat="server" Text="Repeat password :"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtrepeatpass" runat="server" TextMode="Password" 
                    CssClass="textEntry"></asp:TextBox>
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
    </div>
    </div>
    </div>
</asp:Content>
