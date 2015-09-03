<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="docsresquest.aspx.cs" Inherits="WEBSITESAVVY.Pages.docsresquest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
      <style type="text/css">
    .header
    {      
         color:White;
         text-align:center;      
         font-weight: bold; 
         border: 1px solid #CDCDCD ;  
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td colspan="3" class="headerViewform">
                DOCUMENT REQUEST LIST</td>
        </tr>
        <tr>
            <td class="leftdr">
                <asp:Label ID="Label41" runat="server" Text="Type DR :"></asp:Label>
            </td>
            <td class="righttdr" colspan="2">
                <asp:DropDownList ID="drTypeDR" runat="server" Width="80%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftdr">
                <asp:Label ID="Label42" runat="server" Text="Items DR :"></asp:Label>
            </td>
            <td class="righttdr">
                <asp:TextBox ID="txtItem" runat="server" CssClass="text" TextMode="MultiLine" 
                    Width="100%"></asp:TextBox>
&nbsp;
                </td>
            <td style="vertical-align: top; text-align: left">
                <asp:Button ID="btnThem" runat="server" CssClass="btn" Text="Add" 
                    onclick="btnThem_Click" />
            </td>
        </tr>
        <tr>
            <td class="leftdr">
                &nbsp;</td>
            <td class="righttdr" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                    onclick="btnUpdate_Click" Text="Edit Docs Request" />
            &nbsp;<asp:Button ID="btnView" runat="server" CssClass="btn" 
                    onclick="btnView_Click" Text="View Docs Request" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="gvDRList" runat="server" AutoGenerateColumns="False" 
                    onrowdatabound="gvDRList_RowDataBound" Width="100%" 
                    onrowcreated="gvDRList_RowCreated" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                        <ItemTemplate >
                        <div style="text-align:center">
                            <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                            <asp:Label ID="lblmaLoaiDR" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiDR") %>'></asp:Label>
                        </div>
                         </ItemTemplate>
                            <ItemStyle Width="5%" />
                        </asp:TemplateField>                         
                        <asp:TemplateField>
                        <ItemTemplate >
                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoai")%></b></span>
                         </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                         <ItemTemplate>                
                        <asp:Repeater ID="repeaterChild" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td align="center"><%# Container.ItemIndex + 1 %></td>
                                    <td align="left"><%# Eval("TenDR") %></td>
                                    <td align="center"><%# "<" %> <%#  Eval("TinhTrang ") %> <%# Eval(" NgayNhan")%> <%# ">" %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                    </Columns>
                   
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="gvDRUpdate" runat="server" AutoGenerateColumns="False" 
                    Width="100%" DataKeyNames="ID_DR" 
                    onrowcancelingedit="gvDRUpdate_RowCancelingEdit" 
                    onrowediting="gvDRUpdate_RowEditing" onrowupdating="gvDRUpdate_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="ID_DR" HeaderText="ID">
                        <ItemStyle Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenLoai" HeaderText="TYPE DR">
                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenDR" HeaderText="ITEMS">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TinhTrang" HeaderText="STATUS">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="DATE">
                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate> <%#Eval("NgayNhan")%></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNgay" runat="server" CssClass="textmananger"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
                                TargetControlID="txtNgay" DaysModeTitleFormat="yyyy-MM,dd" 
                                Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
                            </ajaxToolkit:CalendarExtender>                             
                        </EditItemTemplate>  
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                            HeaderText="UPDATE" ShowEditButton="True">
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" Width="5%" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" HorizontalAlign="Center" 
                        Font-Italic="False" Font-Strikeout="False" ForeColor="#003300" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
