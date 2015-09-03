<%@ Page Title="WeeklyReport - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="WeeklyReport.aspx.cs" Inherits="WEBSITESAVVY.Pages.WeeklyReport" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Weekly Report</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table align="center">
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label2" runat="server" Text="Claim Ref(Tham Chiếu)" 
                    Font-Bold="False"></asp:Label>
            &nbsp;:
                &nbsp;<asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textbox" Width="20%"></asp:TextBox>
            </td>
            <td align="right" style="padding-right: 50px">
                <asp:Button ID="btnXemDS" runat="server" Text="Xem Report Khác" 
                    onclick="btnXemDS_Click" CssClass="btn" />
            </td>
        </tr>
        
        <tr class="lblNoiDungWeekly">
            <td class="leftweekly" colspan="2">
                <asp:Label ID="Label8" runat="server" Text="ĐỀ XUẤT CỦA GĐV (ADJUSTER'S PROPOSAL)" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftweekly" colspan="2">
           
            <CKEditor:CKEditorControl ID="ckDeXuatGiamDinh" runat="server" 
                BasePath="~/ckeditor" Width="100%" Height="300px"></CKEditor:CKEditorControl>
           
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightweekly">
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" Width="75px" 
                    onclick="btnCapNhat_Click" OnClientClick="aspnetForm.target='_blank';" 
                    CssClass="btn" />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
