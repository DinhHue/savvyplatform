<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newtimesheetpop.aspx.cs" Inherits="WEBSITESAVVY.Pages.newtimesheetpop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New TimeSheet</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase" style="color: #006600">NEW TIMESHEET</h1>
        </div>
      </div>
    </div>
  </div>
        <%-- content main --%>
<div class="ambitios_container_16">
    <div class="ambitios_content">        
        <div class="ambitios_wrapper" align="center">
         <table class="table_input" width="100%">
        <tr>
            <td class="leftmanager" width="18%">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:Label ID="lblGiamDinhVien" runat="server" Font-Bold="True"></asp:Label> 
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                 <asp:Label ID="Label2" runat="server" Text="Tham chiếu :"></asp:Label>
            </td>
            <td class="rightmanager">
               <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textmananger"></asp:TextBox> <asp:Label ID="lbllThongBao" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
               <asp:Label ID="Label12" runat="server" Text="Ngày :"></asp:Label>   
            </td>
            <td class="rightmanager">
                 <asp:TextBox ID="txtNgay" runat="server" CssClass="textmananger"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
            TargetControlID="txtNgay" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
               <asp:Label ID="Label4" runat="server" Text="Loại công tác :">
 </asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDienGiai" runat="server" CssClass="input" Width="100%" 
                    AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Choose ....</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
              <asp:Label ID="Label14" runat="server" Text="Diễn giải :"></asp:Label>
            </td>
            <td class="rightmanager">
                 <asp:TextBox ID="txtDienGiaiChiTiet" runat="server" CssClass="input" 
                    TextMode="MultiLine" Width="70%" Height="80px"></asp:TextBox>
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
           <asp:Label ID="lblThongBaoThem" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
	</div>
	</div>
</div>
    </div>
    </form>
</body>
</html>
