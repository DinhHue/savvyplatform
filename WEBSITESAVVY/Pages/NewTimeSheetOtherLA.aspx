<%@ Page Title="New Timesheet - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="NewTimeSheetOtherLA.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewTimeSheetOtherLA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
          <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">NEW TIMESHEET FOR OTHER ADJUSTER</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
      <%--  <asp:panel runat="server">--%>
    <table class="table_input">
        
        <tr>
            <td class="leftmanager" width="15%">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drGDV" runat="server" CssClass="input">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tham chiếu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="lbllThongBao" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label12" runat="server" Text="Ngày :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgay" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
                    TargetControlID="txtNgay" Format="yyyy-MM-dd">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Loại công tác:"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDienGiai" runat="server" CssClass="input" Width="100%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label14" runat="server" Text="Diễn Giải :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDienGiaiChiTiet" runat="server" TextMode="MultiLine" 
                    Width="55%" Height="50px" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Số Giờ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtSoGio" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Nhập dấu chấm nếu giờ lẻ: 0.25)"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="leftmanager">
               <asp:Label ID="Label15" runat="server" Text="Phí phát sinh :"></asp:Label>
            </td>
            <td class="rightmanager">
              <asp:TextBox ID="txtEtraFee" runat="server" CssClass="textmananger" Width="40%"></asp:TextBox>
&nbsp;<asp:Label ID="Label16" runat="server" Font-Italic="True" ForeColor="#999999" 
    Text="(Lấy dự báo thời tiết, đi lại (km),...)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnThem" runat="server" CssClass="btnThem" onclick="btnThem_Click" 
                    Text="Thêm" />
            &nbsp;<asp:Label ID="lblThongBaoThem" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
   
    </div>
    </div>
    </div>
</asp:Content>
