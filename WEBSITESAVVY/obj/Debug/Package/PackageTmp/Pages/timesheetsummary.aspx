<%@ Page Title="Timesheet - Summary" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="timesheetsummary.aspx.cs" Inherits="WEBSITESAVVY.Pages.timesheetsummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
    <table align="center" width="100%">
        <tr>
            <td colspan="2" class="headerweekly">
                TIME-SHEET - REPORT</td>
        </tr>
        <tr>
            <td class="leftedit">
                <asp:Label ID="Label1" runat="server" Text="Insured:"></asp:Label>
            </td>
            <td class="righthome">
                <asp:Label ID="lblInsured" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftedit">
                <asp:Label ID="Label2" runat="server" Text="Case No.:"></asp:Label>
            </td>
            <td class="righthome">
                <asp:Label ID="lblTenClaim" runat="server"></asp:Label>
               </td>
        </tr>
        <tr>
            <td class="leftedit">
                <asp:Label ID="Label3" runat="server" Text="D.I.O:"></asp:Label>
            </td>
            <td class="righthome">
                <asp:Label ID="lblNgayChiDinh" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                      <asp:GridView ID="gvDSTimeSheet" runat="server" AutoGenerateColumns="False"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" ShowFooter="True" Width="90%" 
                          onrowdatabound="gvDSTimeSheet_RowDataBound">
                          <Columns>
            
                              <asp:TemplateField HeaderText="STT">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                      <asp:Label ID="IdLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID_TimeSheet") %>' Visible="false"></asp:Label> 
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="2%" />
                              </asp:TemplateField>
                               
                              <asp:BoundField DataField="Ngay" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}">
                                  <ItemStyle Width="10%" HorizontalAlign="Center" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="CongTac" HeaderText="Work-Done Description">
                                  <ItemStyle Width="30%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                                  <ItemStyle Width="5%" HorizontalAlign="Center" />
                              </asp:BoundField>
                           
                              <asp:BoundField DataField="TenGDV" HeaderText="Adjusters">
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="Rate" HeaderText="Rate  (VNĐ/hr)" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle Width="5%" HorizontalAlign="Right" />
                              </asp:BoundField>
                               
                              <asp:BoundField DataField="ThanhTien" HeaderText="Amount  (VNĐ)" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle HorizontalAlign="Right" Width="5%" />
                              </asp:BoundField>
                          </Columns>
                          <FooterStyle BackColor="#006600" ForeColor="White" />
                          <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" ForeColor="White" />
                          <RowStyle Font-Names="Times New Roman" />
                      </asp:GridView>
                  </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                      

                        </td>
        </tr>
    </table>
    </div>
    <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
                                 <asp:Button ID="btnXuatExcel" runat="server" CssClass="btn" OnClick="btnXuatExcel_Click"
                          Text="Export to Excel" />
    </div>
</asp:Content>
