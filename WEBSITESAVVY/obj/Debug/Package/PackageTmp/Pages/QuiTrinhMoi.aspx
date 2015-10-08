<%@ Page Title="New memos - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="QuiTrinhMoi.aspx.cs" Inherits="WEBSITESAVVY.Pages.XuLyQuiTrinh" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<span runat="server" id="tabid" style="display:none">memos</span>
 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">NEW&nbsp; regulations</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
    <table class="tablenew" align="center">
        <tr>
            <td align="center">

<table class="style1">
    <tr>
        <td align="center" colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" align="right">
            <asp:Label ID="Label5" runat="server" Text="Ngày đăng :" Font-Bold="False"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtNgayDang" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3" align="right">
            <asp:Label ID="Label2" runat="server" Text="Tiêu đề :" Font-Bold="False"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="input" Width="350px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtTieuDe" ErrorMessage="Chưa có tiêu đề." ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3" align="right" valign="top">
            <asp:Label ID="Label3" runat="server" Text="Tóm tắt" Font-Bold="False"></asp:Label>
        </td>
        <td align="left">
            <asp:TextBox ID="txtTomTat" runat="server" Height="100px" CssClass="input" TextMode="MultiLine" 
                Width="500px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtTomTat" ErrorMessage="Chưa có tóm tắt." ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3" align="right">
            <asp:Label ID="Label4" runat="server" Text="Nội dung :" Font-Bold="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2" colspan="2" align="center">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="ckNoiDung" ErrorMessage="Chưa có nội dung." ForeColor="Red"></asp:RequiredFieldValidator>
            <CKEditor:CKEditorControl ID="ckNoiDung" runat="server" BasePath="~/ckeditor" 
                Height="498px" Width="744px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnBaiVietMoi" runat="server" CssClass="btn" onclick="btnBaiVietMoi_Click" 
                Text="Thêm" Width="77px" /><br />

            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
        </td>
    </tr>
</table>

            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
