<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="newincome.aspx.cs" Inherits="WEBSITESAVVY.Manage.newincome" %>
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

</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
&nbsp;<table class="tablemanager">
        <tr>
            <td class="headbaocao">
                THÊM THÔNG TIN QUYẾT TOÁN THEO VỤ VIỆC</td>
        </tr>
        <tr>
            <td style="vertical-align: top; text-align: center">
&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="drDSClaimInvoice" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="drDSClaimInvoice_SelectedIndexChanged" 
                    CssClass="input" Width="10%">
                </asp:DropDownList>
                <asp:DropDownList ID="drDSGDV" runat="server" CssClass="input" Width="15%">
                </asp:DropDownList>
                
&nbsp;<asp:Label ID="Label2" runat="server" Text="Phí phát hành:" CssClass="labelbold"></asp:Label>
                <asp:TextBox ID="txtPhiCG" runat="server" CssClass="input"></asp:TextBox>
&nbsp;<asp:Label ID="Label3" runat="server" Text="Phí thực thu :" CssClass="labelbold"></asp:Label>
&nbsp;<asp:TextBox ID="txtPhiTT" runat="server" CssClass="input"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnInsert" runat="server" CssClass="btn" Text="Add New" 
                    onclick="btnInsert_Click" />
                <asp:Button ID="btnInsert0" runat="server" CssClass="btn" Text="Summary All" 
                    PostBackUrl="~/Manage/income.aspx" />
                <asp:Label ID="lblThongBao" runat="server" Font-Italic="True" 
                    ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                      <asp:GridView ID="gvDSTimeSheet" runat="server" AutoGenerateColumns="False"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" ShowFooter="True" Width="90%">
                          <Columns>
            
                              <%--
                              <asp:BoundField DataField="CaseName" HeaderText="Case Name.">
                                  <ItemStyle Width="15%" />
                              </asp:BoundField>--%>
                              
                              <asp:TemplateField HeaderText="STT">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                      <asp:Label ID="IdLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID_Income") %>' Visible="false"></asp:Label> 
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="2%" />
                              </asp:TemplateField>
                               
                              <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                                  <ItemStyle Width="5%" HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="TenGDV" HeaderText="GĐV">
                              <ItemStyle Width="15%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="IssueFee" HeaderText="Issue Fee" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle Width="10%" HorizontalAlign="Right" />
                              </asp:BoundField>
                               
                              <asp:BoundField DataField="RealFee" HeaderText="Real Fee" 
                                  DataFormatString="{0:#,##0}">
                                  <ItemStyle HorizontalAlign="Right" Width="10%" />
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
