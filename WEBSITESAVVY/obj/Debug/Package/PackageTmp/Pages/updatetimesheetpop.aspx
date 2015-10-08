<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatetimesheetpop.aspx.cs" Inherits="WEBSITESAVVY.Pages.updatetimesheetpop" %>

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
    <div align="center" >
    
     <table class="table_input">
        
        <tr>
            <td class="leftmanager" width="15%">
                <asp:Label ID="Label15" runat="server" Text="ID Timesheet"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            &nbsp;
                <asp:Label ID="lblID_GDV" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="lblID_CongTac" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="leftmanager" width="15%">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:Label ID="lblGDV" runat="server"></asp:Label>
                <asp:Button ID="btnChangeGDV" runat="server" CssClass="btn" Text="Change" 
                    onclick="btnChangeGDV_Click" />
                
                <asp:DropDownList ID="drGDV" runat="server" CssClass="input">
                </asp:DropDownList>
                <asp:Button ID="btnHideGDV" runat="server" CssClass="btn" Text="Hide" 
                    onclick="btnHideGDV_Click" />
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
                <asp:Label ID="lblCongTac" runat="server"></asp:Label>
                <asp:Button ID="btnChangeCT" runat="server" CssClass="btn" Text="Change" 
                    onclick="btnChangeCT_Click" />
                
                <asp:DropDownList ID="drCongTac" runat="server" CssClass="input" Width="100%">
                </asp:DropDownList>
                <asp:Button ID="btnHideCT" runat="server" CssClass="btn" Text="Hide" 
                    onclick="btnHideCT_Click" />
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
                <asp:Label ID="Label5" runat="server" Text="Số Giờ(time spent) :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtSoGio" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Nhập dấu chấm nếu giờ lẻ: 0.25)"></asp:Label>
            </td>
        </tr>
          <tr>
            <td class="leftmanager">
                <asp:Label ID="lblTIsuee" runat="server" Text="Số Giờ(time issue) :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTIssue" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Nhập dấu chấm nếu giờ lẻ: 0.25)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
               <asp:Label ID="Label1" runat="server" Text="Phí phát sinh :"></asp:Label>
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
                <asp:Button ID="btnUpdate" runat="server" CssClass="btnThem" onclick="btnUpdate_Click" 
                    Text="Update" />
            &nbsp;<asp:Label ID="lblThongBaoThem" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
