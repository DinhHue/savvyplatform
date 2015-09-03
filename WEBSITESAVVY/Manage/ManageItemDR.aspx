<%@ Page Title="Manage Item DR" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManageItemDR.aspx.cs" Inherits="WEBSITESAVVY.Manage.ManageItemDR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    .header
    {    
              background-color:#006600;
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
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<div align="center">
<table title="100%">
        <tr>
            <td colspan="2" class="headerViewform">
                PHÂN LOẠI HẠNG MỤC HỒ SƠ YÊU CẦU - TYPE OF ITEM DOCS REUQETS</td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label41" runat="server" Text="Type Name :" CssClass="labelbold"></asp:Label>
            </td>
            <td class="righthome">
                <asp:DropDownList ID="drType" runat="server" CssClass="input" Width="100%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label42" runat="server" Text="Item Name:" CssClass="labelbold"></asp:Label>
            </td>
            <td class="righthome">
                <asp:TextBox ID="txtTenLoai" runat="server" CssClass="textClaim"></asp:TextBox>
                <asp:Button ID="btnThem" runat="server" CssClass="btn" Text="Add" 
                    onclick="btnThem_Click" />
            &nbsp;<asp:Button ID="btnShowEdit" runat="server" CssClass="btn" Text="Edit Item DR" 
                    onclick="btnShowEdit_Click" />
                <asp:Button ID="btnShowEdit0" runat="server" CssClass="btn" Text="Hide Edit Item DR" 
                    onclick="btnShowEdit0_Click" />
            </td>
        </tr>
        <tr>
            <td class="leftCol" colspan="2">
                <asp:GridView ID="gvItemList" runat="server" AutoGenerateColumns="False" 
                    Width="100%" ShowHeader="False" onrowcreated="gvItemList_RowCreated" 
                    onrowdatabound="gvItemList_RowDataBound">
                    <Columns>
                       <asp:TemplateField HeaderText=" No.">
                        <ItemTemplate>
                            <div style="text-align:center">
                                <asp:Label ID="lblSTT" runat="server" Font-Bold="true" Text=""></asp:Label>
                                <asp:Label ID="lblmaLoaiDR" runat="server" 
                                    Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiDR") %>' Visible="false"></asp:Label>
                            </div>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                      </asp:TemplateField>
                       <asp:TemplateField >
                        <ItemTemplate>
                            <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoai")%></b></span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                       </asp:TemplateField>
                       <asp:TemplateField >
                <ItemTemplate>
                    <asp:Repeater ID="repeaterChild" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <%# Container.ItemIndex + 1 %>
                                </td>
                                
                                <td align="left">
                                    <%# Eval("NameItem")%>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
                <ItemStyle/>
            </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BorderColor="Black" 
                        HorizontalAlign="Center" />
                </asp:GridView>
                 
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvListItemDR" runat="server" AutoGenerateColumns="False" 
                    Width="100%" DataKeyNames="ID_Item" 
                    onrowdeleting="gvListItemDR_RowDeleting" 
                    onrowcancelingedit="gvListItemDR_RowCancelingEdit" 
                    onrowediting="gvListItemDR_RowEditing" onrowupdating="gvListItemDR_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemStyle  HorizontalAlign="Center" Width="5%" />                            
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenLoai" HeaderText="Type Name" >
                        <ItemStyle Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NameItem" HeaderText="Item Name">
                        <ItemStyle HorizontalAlign="Left" Width="70%" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" HeaderText="Update" 
                            ShowEditButton="True" EditImageUrl="~/images/edit_icon.png" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                            HeaderText="Delete" ShowDeleteButton="True" >
                        <ItemStyle Width="5%" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BorderColor="Black" 
                        HorizontalAlign="Center" />
                </asp:GridView>
            </td>
        </tr>
        </table>
        </div>
</asp:Content>
