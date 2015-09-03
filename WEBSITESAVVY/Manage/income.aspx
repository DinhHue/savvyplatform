<%@ Page Title="Income" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="income.aspx.cs" Inherits="WEBSITESAVVY.Manage.income" %>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
&nbsp;<table class="tablemanager">
        <tr>
            <td class="headbaocao">
                THU NHẬP TOÀN BỘ GIÁM ĐỊNH VIÊN THEO VỤ VIỆC</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button3" runat="server" CssClass="btn" 
                    PostBackUrl="~/Manage/manageincome.aspx" Text="New Income'Claim" />
                <asp:Button ID="Button4" runat="server" CssClass="btn" 
                    PostBackUrl="~/Manage/incomeadjusters.aspx" Text="Income'LA" />
                <asp:Button ID="Button2" runat="server" CssClass="btn" 
                    PostBackUrl="~/Pages/detailincome.aspx" Text="View Detail" />
                <%--<asp:Button ID="Button1" runat="server" CssClass="btn" 
                    PostBackUrl="~/Manage/newincome.aspx" Text="New Income" />--%>
                <asp:Button ID="btnExport" runat="server" CssClass="btn" Text="Export Excel" 
                    onclick="btnExport_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                      <asp:GridView ID="gvDSincome" runat="server" AutoGenerateColumns="False"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" Width="100%" onrowdatabound="gvDSincome_RowDataBound" 
                          ShowHeader="False" onrowcreated="gvDSincome_RowCreated">
                          <Columns>                              
                               <asp:TemplateField >
                                <ItemTemplate >                              
                                <div style="text-align:center">
                                    <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                                    <asp:Label ID="lblID_GDV" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_GDV") %>'></asp:Label>
                                </div>
                              </ItemTemplate>
                                   <ItemStyle Width="2%" />
                              </asp:TemplateField>
                             
                               <asp:TemplateField HeaderStyle-Width="15%" ItemStyle-Width="15%" >
                                <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "TenGDV") %></b></span>
                                </ItemTemplate>

<HeaderStyle Width="15%"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left" Width="30%" />
                            </asp:TemplateField>
                             
                               <asp:BoundField />
                               <asp:BoundField />
                               <asp:BoundField />
                             
                               <asp:TemplateField>
                               <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "Income","{0:#,##0}") %></b></span>
                                </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                             
                              <asp:TemplateField>
                                <ItemTemplate>
                              <%--  <tbody id_gdv="<%#DataBinder.Eval(Container.DataItem, "ID_GDV") %>" >--%>
                                    <asp:Repeater ID="repeaterChild" runat="server">
                                        <ItemTemplate>
                                            <tr id_invoice="<%# Eval("ID_GDV") %>">
                                                <td align="center"><%# Container.ItemIndex + 1 %></td>
                                                <td align="left"><%# Eval("CaseName")%></td>
                                                <td align="right"><%# Eval("IssueFee","{0:#,##0}")%></td>
                                                <td align="right"><%# Eval("RealFee", "{0:#,##0}")%></td>
                                                <td align="center"><%# Eval("Percentage", "{0:%#0.00}")%></td>
                                                <td align="right"><%# Eval("RealIncome", "{0:#,##0}")%></td>
                                                <td align="right"><%# Eval("CyberIncome", "{0:#,##0}")%></td>                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                             <%--   <tbody>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                          </Columns>
                          <FooterStyle BackColor="#006600" ForeColor="White" />
                          <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" ForeColor="White" />
                          <RowStyle Font-Names="Times New Roman" />
                      </asp:GridView>
                  </td>
        </tr>
    </table>
</asp:Content>
