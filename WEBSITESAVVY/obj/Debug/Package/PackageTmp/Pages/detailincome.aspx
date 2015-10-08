<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="detailincome.aspx.cs" Inherits="WEBSITESAVVY.Pages.detailincome" %>
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
    <table class="tablemanager" width="100%">
        <tr>
            <td colspan="2" class="headbaocao">
                XEM CHI TIẾT TIMESHEET THU NHẬP CỦA GDV THEO VỤ</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DropDownList ID="drDSClaim" runat="server" CssClass="input" 
                    AppendDataBoundItems="True">
                    <asp:ListItem>Choose ...</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:Button ID="btnView" runat="server" CssClass="btn" Text="View Detail" 
                    onclick="btnView_Click" />
            &nbsp;<asp:Button ID="btnExport" runat="server" CssClass="btn" Text="Export Excel" 
                    onclick="btnExport_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                      <asp:GridView ID="gvDSincome" runat="server" AutoGenerateColumns="False"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" Width="100%" onrowdatabound="gvDSincome_RowDataBoun" 
                          ShowHeader="False" onrowcreated="gvDSincome_RowCreated">
                          <Columns>                              
                              <%--  <asp:TemplateField>
                                <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "IssueFee","{0:#,##0}") %></b></span>
                                </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>--%>
                               <asp:TemplateField >
                                <ItemTemplate >                              
                                <div style="text-align:center">
                                    <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                                    <asp:Label ID="lblID_GDV" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_GDV") %>'></asp:Label>
                                </div>
                              </ItemTemplate>
                                   <ItemStyle Width="2%" />
                              </asp:TemplateField>
                             
                               <asp:TemplateField  ItemStyle-Width="5%" >
                                <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "TenGDV") %></b></span>
                                </ItemTemplate>

                                <HeaderStyle Width="10%"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                              <asp:BoundField />
                               <asp:BoundField />
                               <asp:BoundField />
                               <asp:TemplateField>
                                 <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "Percentage", "{0:%#0.00}")%></b></span>
                                </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                             
                               <asp:TemplateField>
                                <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "CyberIncome","{0:#,##0}") %></b></span>
                                </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                             
                               <asp:TemplateField>
                               <ItemTemplate >
                                    <span><b><%#DataBinder.Eval(Container.DataItem, "RealIncome","{0:#,##0}") %></b></span>
                                </ItemTemplate>
                                   <ItemStyle HorizontalAlign="Right" />
                               </asp:TemplateField>
                             
                              <asp:TemplateField>
                                <ItemTemplate>
                              <%--  <tbody id_gdv="<%#DataBinder.Eval(Container.DataItem, "ID_GDV") %>" >--%>
                                    <asp:Repeater ID="repeaterChild" runat="server">
                                        <ItemTemplate>
                                            <tr id_invoice="<%# Eval("ID_TimeSheet") %>">
                                                <td align="center"><%# Container.ItemIndex + 1 %></td>                                               
                                                <td align="left"><%# Eval("NgayThuc")%></td>
                                                 <td align="center"><%# Eval("Ngay")%></td>
                                                <td align="left"><%# Eval("CongTac")%></td>
                                                <td align="right"><%# Eval("ThoiLuongPhatSinh", "{0:#,##0}")%></td>
                                                <td align="right"><%# Eval("Rate", "{0:#,##0}")%></td>                                                
                                                <td align="right"><%# Eval("ThanhTien", "{0:#,##0}")%></td>
                                                <td align="right"></td>
                                                <td align="right"></td>
                                           </tr>
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
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
