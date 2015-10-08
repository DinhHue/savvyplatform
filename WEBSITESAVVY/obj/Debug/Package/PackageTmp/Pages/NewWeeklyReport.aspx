<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewWeeklyReport.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewWeeklyReport" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table align="center">
        <tr>
            <td align="center" colspan="2" class="headerweekly">
                <asp:Label ID="Label1" runat="server" Text="WEEKLY REPORT"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label2" runat="server" Text="Claim Ref(Tham Chiếu)" 
                    Font-Bold="False"></asp:Label>
            &nbsp;:
                <asp:TextBox ID="txtMaThamChieu" runat="server" Width="150px" 
                    ontextchanged="txtThamChieu_TextChanged"></asp:TextBox>
                &nbsp;<asp:Label ID="Label12" runat="server" Font-Italic="True" Font-Size="10pt" 
                    ForeColor="#FF7171" Text="(Nhập mã vụ: 1301, 1302,...)"></asp:Label>
            </td>
            <td align="right">
                <asp:Button ID="btnXemDS" runat="server" Text="Xem Report Khác" 
                    onclick="btnXemDS_Click" CssClass="btn" />
            </td>
        </tr>
     <%--   <tr>
            <td class="leftweekly">
                <asp:Label ID="Label3" runat="server" 
                    Text=" Giám Định Viên Thụ Lý(GĐV thụ lý) " Font-Bold="False"></asp:Label>
            </td>
            <td class="labelNoidung" colspan="2">
                <asp:DropDownList ID="drGDV" runat="server" Width="192px">
                </asp:DropDownList>
            </td>
        </tr>--%>
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label4" runat="server" Text="Time Spent (Giờ tính phí lũy)" 
                    Font-Bold="False"></asp:Label>
            &nbsp; :&nbsp;
                <asp:TextBox ID="txtGioTichLuy" runat="server" Width="50px" Enabled="False"></asp:TextBox>
            </td>
            <td class="labelNoidung">
            &nbsp;</td>
        </tr>
   <%--     <tr>
            <td class="leftweekly">
                <asp:Label ID="Label5" runat="server" Text="Vụ việc (Case Name)" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="labelNoidung" colspan="2">
                <asp:TextBox ID="txtVuViec" runat="server" Width="400px" 
                    ontextchanged="txtThamChieu_TextChanged"></asp:TextBox>
            </td>
        </tr>--%>
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label6" runat="server" Text="Dự Phòng Tổn Thất (Loss Reserve) " 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="labelNoidung" colspan="2">
                <asp:TextBox ID="txtDuPhongTonThat" runat="server" Width="400px" 
                    ontextchanged="txtThamChieu_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr class="lblNoiDungWeekly">
            <td class="leftweekly">
                <asp:Label ID="Label7" runat="server" 
                    Text="TIẾN TRÌNH &amp; VƯỚNG MẮC (PENDING ISSUES)" Font-Bold="False"></asp:Label>
            </td>
            <td class="leftweekly">
                <asp:Label ID="Label8" runat="server" Text="ĐỀ XUẤT CỦA GĐV (ADJUSTER'S PROPOSAL)" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <CKEditor:CKEditorControl ID="ckTienTrinhVaVuongMac" runat="server" 
                BasePath="~/ckeditor" Width="600px" Height="300px"></CKEditor:CKEditorControl>
            </td>
            <td class="labelNoidung">
            <CKEditor:CKEditorControl ID="ckDeXuatGiamDinh" runat="server" 
                BasePath="~/ckeditor" Width="600px" Height="300px"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label9" runat="server" 
                    Text="HỒ SƠ ĐÃ YÊU CẦU (REQUESTED DOCUMENTS)" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="leftweekly">
                <asp:Label ID="Label10" runat="server" 
                    Text="TÌNH TRẠNG HỒ SƠ (CURRENT STATUS)" Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            <CKEditor:CKEditorControl ID="ckHoSoDaNhan" runat="server" 
                BasePath="~/ckeditor" Width="600px" Height="300px"></CKEditor:CKEditorControl>
            </td>
            <td class="labelNoidung">
            <CKEditor:CKEditorControl ID="ckHoSoConThieu" runat="server" 
                BasePath="~/ckeditor" Width="600px" Height="300px"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" Width="75px" 
                    onclick="btnCapNhat_Click" OnClientClick="aspnetForm.target='_blank';" 
                    CssClass="btn" />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
