<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="WEBSITESAVVY.Manage.Invoice"  EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <table class="tablemanager">
        <tr>
            <td class="headermanager">
                QUẢN LÝ HOÁ ĐƠN - NĂM&nbsp;
                <asp:Label ID="lblNam" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="rowheader">
                <asp:Label ID="Label2" runat="server" Text=" Claim No.:"></asp:Label>
&nbsp;&nbsp;<asp:TextBox ID="txtClaimNo" runat="server" Width="10%"></asp:TextBox>
&nbsp;
                <asp:Label ID="Lable" runat="server" Text="Invoice No:"></asp:Label>
&nbsp;
                <asp:TextBox ID="txtInvoiceNo" runat="server" Width="10%"></asp:TextBox>
                &nbsp;<asp:Label ID="Label3" runat="server" Text="Grand Total :"></asp:Label>
&nbsp;
                <asp:TextBox ID="txtTotal" runat="server" Width="10%"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Issue Date:"></asp:Label>
&nbsp;<asp:TextBox ID="txtDateIssue" runat="server" Width="10%"></asp:TextBox>
 <ajaxToolkit:CalendarExtender ID="txtDateIssue_CalendarExtender" runat="server" 
            TargetControlID="txtDateIssue" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>
&nbsp;
                <asp:Button ID="btnInsert" runat="server" CssClass="btn" Text="Add" 
                    onclick="btnInsert_Click" />
               
              
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="grDSInvoice" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID_Invoice" onrowdatabound="grDSInvoice_RowDataBound" 
                    onrowdeleting="grDSInvoice_RowDeleting" 
                    onselectedindexchanged="grDSInvoice_SelectedIndexChanged" ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="ID_Invoice" HeaderText="ID" />
                        <asp:BoundField DataField="ID_Claim" HeaderText="No.">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenKhachHang" HeaderText="Case">
                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateIssue" HeaderText="Date" 
                            DataFormatString="{0:yyyy-MM-dd}">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="InvoiceNo" HeaderText="Invoice No.">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BVAT" HeaderText="Before VAT" 
                            DataFormatString="{0:#,##0}">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="VAT" HeaderText="VAT" DataFormatString="{0:#,##0}">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GrandTotal" HeaderText="Grand Total" 
                            DataFormatString="{0:#,##0}">
                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ThanhToan" HeaderText="Status" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="C. Status" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Xoá" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#006600" ForeColor="White" />
                    <HeaderStyle BackColor="#006600" Font-Size="18px" ForeColor="White" 
                        HorizontalAlign="Center" />
                    <RowStyle Font-Size="16px" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
                 <asp:Button ID="btnXuatExcel" runat="server" CssClass="btn" Text="Export To Excel" 
                    onclick="btnXuatExcel_Click" />
                                
    </div>
</asp:Content>
