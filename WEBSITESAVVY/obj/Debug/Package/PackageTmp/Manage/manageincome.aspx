<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="manageincome.aspx.cs" Inherits="WEBSITESAVVY.Manage.manageincome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table class="tablemanager">
        <tr>
            <td class="headbaocao" colspan="2">
                <asp:Button ID="btnViewAll" runat="server" CssClass="btn" 
                    Text="View Summary Income" PostBackUrl="~/Manage/income.aspx" />
            &nbsp;<asp:Button ID="btnViewDetail" runat="server" CssClass="btn" 
                    Text="View Detail Income'Claim" PostBackUrl="~/Pages/detailincome.aspx" />
            </td>
        </tr>
        <tr>
            <td class="headbaocao" colspan="2">
                THÊM MỚI THU NHẬP&nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label2" runat="server" Text="Case No."></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtId_claim" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label3" runat="server" Text="Invoice No."></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtInvoice" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label4" runat="server" Text="Grand Total "></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTongTien" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label5" runat="server" Text="Issue Date"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtIssueDate" runat="server" CssClass="input"></asp:TextBox><ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
            TargetControlID="txtIssueDate" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label6" runat="server" Text="Issue Fee"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtIssueFee" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                <asp:Label ID="Label7" runat="server" Text="Real Fee"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtRealfee" runat="server" CssClass="input"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnLuu" runat="server" CssClass="btn" onclick="btnLuu_Click" 
                    Text="Save" />
            </td>
        </tr>
        <tr>
            <td class="leftpop">
                &nbsp;</td>
            <td class="rightmanager">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
