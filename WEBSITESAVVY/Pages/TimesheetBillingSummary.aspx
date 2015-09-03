<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="TimesheetBillingSummary.aspx.cs" Inherits="WEBSITESAVVY.Pages.TimesheetBillingSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td colspan="2" 
                style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold; vertical-align: top; text-align: center">
                BẢNG TỔNG HỢP TÍNH PHÍ GIÁM ĐỊNH<br />
                <em>(BILLING SUMMARY)</em></td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label1" runat="server" Text="NGƯỜI ĐƯỢC BẢO HIỂM"></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Font-Italic="True" 
                    Text="- Insured's name"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblNDBH" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label2" runat="server" Text="THAM CHIẾU VỤ VIỆC"></asp:Label>
                <br />
                <asp:Label ID="Label11" runat="server" Font-Italic="True" 
                    Text="- Case Registered"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblTenClaim" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label3" runat="server" Text="NGÀY CHỈ ĐỊNH"></asp:Label>
                <br />
                <asp:Label ID="Label12" runat="server" Font-Italic="True" 
                    Text="- Date of Instruction"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblNgayChiDinh" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label4" runat="server" Text="TÍNH PHÍ CHUYÊN GIA"></asp:Label>
                <br />
                <asp:Label ID="Label13" runat="server" Font-Italic="True" 
                    Text="- Professional Fees"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label5" runat="server" Text="CHI PHÍ GIÁM ĐỊNH"></asp:Label>
                <br />
                <asp:Label ID="Label14" runat="server" Font-Italic="True" Text="Survey Expense"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label6" runat="server" Text="CỘNG TRƯỚC THUẾ"></asp:Label>
                <br />
                <asp:Label ID="Label15" runat="server" Font-Italic="True" 
                    Text="- Amount Before Tax"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblTongTienTruocThue" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label7" runat="server" Text="THUẾ GTGT 10%"></asp:Label>
                <br />
                <asp:Label ID="Label16" runat="server" Font-Italic="True" 
                    Text="- Value Added Tax"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblThue10" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label8" runat="server" Text="ĐỀ NGHỊ THANH TOÁN"></asp:Label>
                <br />
                <asp:Label ID="Label17" runat="server" Font-Italic="True" 
                    Text="- Chargeable Amount"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblTongTien" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 12px; font-weight: bold; padding-left: 10px; padding-top: 5px;" 
                width="30%">
                <asp:Label ID="Label9" runat="server" Text="SỐ TIỀN BẰNG CHỮ"></asp:Label>
                <br />
                <asp:Label ID="Label18" runat="server" Font-Italic="True" Text="- In words"></asp:Label>
            </td>
            <td style="padding-top: 5px; padding-left: 5px; padding-right: 10px">
                <asp:Label ID="lblSoTienBangChu" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
