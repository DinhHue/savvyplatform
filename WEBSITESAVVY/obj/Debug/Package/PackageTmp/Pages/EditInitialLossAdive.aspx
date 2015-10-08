<%@ Page Title="UpdateBCDT" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="EditInitialLossAdive.aspx.cs" Inherits="WEBSITESAVVY.Pages.EditInitialLossAdive" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">EDIT INITIAL LOSS ADVICE</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table align="center" frame="box" 
        style="border-collapse: collapse; empty-cells: inherit; border-spacing: inherit; table-layout: auto;" 
        width="80%">
        <tr>
            <td colspan="2" class="headermanager" align="center">
                <asp:Label ID="Label2" runat="server" 
                    Text=" CHỈNH SỬA NỘI DUNG BÁO CÁO ĐẦU TIÊN"></asp:Label>
            &nbsp;<br />
                <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label7" runat="server" Text="Người liên hệ "></asp:Label>
            </td>
            <td class="rightmanager">
                    <asp:TextBox ID="txtTenNguoiLienHe" runat="server" CssClass="textClaim"></asp:TextBox>
&nbsp;<asp:Label ID="lblIDKH" runat="server"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label8" runat="server" Text="Điện thoại"></asp:Label>
            </td>
            <td class="rightmanager">
                    <asp:TextBox ID="txtDienThoai" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="rightmanager">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label1" runat="server" Text="Circumstances"></asp:Label>
            </td>
            <td class="rightmanager">
                    <CKEditor:CKEditorControl ID="ckDienBienTonThat" runat="server" 
                        BasePath="~/ckeditor" Height="300px" Width="100%" FontNames="Times New Roman/Times New Roman, Times, serif;
"></CKEditor:CKEditorControl>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label3" runat="server" Text="Extent of Loss"></asp:Label>
            </td>
            <td class="rightmanager">
                    <CKEditor:CKEditorControl ID="ckExtentofloss" runat="server" 
                        BasePath="~/ckeditor" Height="300px" Width="100%" FontNames="Times New Roman/Times New Roman, Times, serif;
"></CKEditor:CKEditorControl>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label4" runat="server" Text="Initial Reserve"></asp:Label>
            </td>
            <td class="rightmanager">
                    <asp:TextBox ID="txtintitialreserve" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label5" runat="server" 
                    Text="Loss Mitigating Actions &amp; Recommendation"></asp:Label>
            </td>
            <td class="rightmanager">
                    <CKEditor:CKEditorControl ID="ckDePhongTonThatVaKhuyenCao" runat="server" 
                        BasePath="~/ckeditor" Height="300px" Width="100%" 
                        FontNames="Times New Roman/Times New Roman, Times, serif;"></CKEditor:CKEditorControl>
                </td>
        </tr>
        <tr>
            <td style="font-size: 16px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                <asp:Label ID="Label6" runat="server" Text="Loss Adjuster’s Remark"></asp:Label>
            </td>
            <td class="rightmanager">
                    <CKEditor:CKEditorControl ID="ckYKienGDV" runat="server" BasePath="~/ckeditor" 
                        Height="300px" Width="100%" 
                        FontNames="Times New Roman/Times New Roman, Times, serif;"></CKEditor:CKEditorControl>
                </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; vertical-align: top; text-align: right; padding-right: 10px; width: 10%">
                            <asp:Button ID="btnThem0" runat="server" CssClass="btn" 
                                PostBackUrl="~/Pages/ClaimDetail1.aspx?Ref=Cover" Text="Back Detail Claim" />
                        </td>
            <td class="rightmanager">
                <asp:Button ID="btnCreatnew" runat="server" CssClass="btn" 
                        onclick="btnCreatnew_Click" Text="Update" />
                    </td>
        </tr>
        </table>
        </div>
        </div>
        </div>
</asp:Content>
