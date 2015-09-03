﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyLinhVucKinhDoanh.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyLinhVucKinhDoanh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table cellpadding="1" cellspacing="1" class="tablemanager">
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Label ID="Label2" runat="server" Text="QUẢN LÝ LĨNH VỰC KINH DOANH"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager" width="20%">
                <asp:Label ID="Label1" runat="server" Text="Tên Lĩnh Vực "></asp:Label>
               
            </td>
            <td valign="top" class="rightmanager">
                <asp:TextBox ID="txtLinhVuc" runat="server" CssClass="textmananger"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                    style="height: 26px" Text="Thêm" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" colspan="2">
                <asp:GridView ID="gvDSLinhVuc" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="ID_LVKD" ForeColor="#333333" 
                    onrowcancelingedit="gvDSLinhVuc_RowCancelingEdit" 
                    onrowdeleting="gvDSLinhVuc_RowDeleting" onrowediting="gvDSLinhVuc_RowEditing" 
                    onrowupdating="gvDSLinhVuc_RowUpdating" Font-Names="Times New Roman" 
                    Font-Size="16px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                             <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LinhVucKinhDoanh" HeaderText="Tên Lĩnh Vực" >
                        <ItemStyle HorizontalAlign="Left" Width="300px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Thay Đổi" ShowEditButton="True" >
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True" >
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006600" Font-Bold="False" ForeColor="White" 
                        Font-Names="Times New Roman" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Font-Bold="False" Font-Names="Times New Roman" 
                        HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
