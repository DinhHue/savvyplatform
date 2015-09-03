<%@ Page Title="New Diary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiaryMoi.aspx.cs" Inherits="WEBSITESAVVY.Pages.DiaryMoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table align="center">
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Label ID="Label9" runat="server" Text="THÊM DIARY MỚI"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên"></asp:Label>
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
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Chỉ nhập mã đầu tham chiếu, ví dụ: 1301)"></asp:Label>
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
                    TargetControlID="txtNgay">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Diễn Giải :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDienGiai" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Số Giờ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtSoGio" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Nhập dấu chấm nếu giờ lẻ: 0.5)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Ngày Bắt Đầu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgayBatDau" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgayBatDau_CalendarExtender" 
                    runat="server" TargetControlID="txtNgayBatDau">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label7" runat="server" Text="Ngày Kết Thúc :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgayKetThuc" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgayKetThuc_CalendarExtender" 
                    runat="server" TargetControlID="txtNgayKetThuc">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label8" runat="server" Text="Kết Quả Ghi Nhận"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtKetQuaGhiNhan" runat="server" CssClass="textmananger" 
                    TextMode="MultiLine" Width="300px">(Được cập nhật sau ngày kết thúc)</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnThem" runat="server" CssClass="btn" onclick="btnThem_Click" 
                    Text="Thêm" />
            &nbsp;<asp:Label ID="lblThongBaoThem" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
