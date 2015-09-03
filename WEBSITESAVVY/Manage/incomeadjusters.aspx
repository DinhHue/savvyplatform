<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="incomeadjusters.aspx.cs" Inherits="WEBSITESAVVY.Manage.incomeadjusters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         .header
    {      
         color:White;
         background:#060;
         text-align:center;      
         font-weight: bold;   
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
    
    .tDnD_whileDrag {
        background-color: #DCDCDC;
    }
    
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <table width="80%">
        <tr>
            <td class="headbaocao" colspan="2">
                THU NHẬP CỦA TỪNG GIÁM ĐỊNH VIÊN</td>
        </tr>
        <tr>
            <td class="lefthome">
                <asp:DropDownList ID="drGDV" runat="server" AppendDataBoundItems="True" 
                    CssClass="input">
                    <asp:ListItem>Choose GDV</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="righthome">
                <asp:Button ID="btnView" runat="server" CssClass="btn" Text="View Select" 
                    onclick="btnView_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                      <asp:GridView ID="gvDSTimeSheet" runat="server" AutoGenerateColumns="False"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" ShowFooter="True" Width="90%" 
                          onrowdatabound="gvDSTimeSheet_RowDataBound">
                          <Columns>
            
                              <%--
                              <asp:BoundField DataField="CaseName" HeaderText="Case Name.">
                                  <ItemStyle Width="15%" />
                              </asp:BoundField>--%>
                              
                              <asp:TemplateField HeaderText="STT">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                      <asp:Label ID="IdLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID_Claim") %>' Visible="false"></asp:Label> 
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="2%" />
                              </asp:TemplateField>
                               
                              <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                                  <ItemStyle Width="5%" HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="GrandTotal" HeaderText="Total Fee" 
                                  DataFormatString="{0:#,##0}">
                              <ItemStyle HorizontalAlign="Right" Width="10%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="IssueFee" HeaderText="Issue Fee" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle Width="10%" HorizontalAlign="Right" />
                              </asp:BoundField>
                               
                              <asp:BoundField DataField="RealFee" HeaderText="Real Fee" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="Percentage" DataFormatString="{0:%#0.00}" 
                                  HeaderText="Rate Fee">
                              <ItemStyle Width="5%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="CyberIncome" HeaderText="Cyber Income" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle Width="10%" HorizontalAlign="Right" />
                              </asp:BoundField>
                           
                              <asp:BoundField DataField="RealIncome" HeaderText="Real Income" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle HorizontalAlign="Right" Width="10%" />
                              </asp:BoundField>
                              
                          </Columns>
                          <FooterStyle BackColor="#006600" ForeColor="White" />
                          <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" ForeColor="White" />
                          <RowStyle Font-Names="Times New Roman" />
                      </asp:GridView>
                  </td>
        </tr>
    </table>

</asp:Content>
