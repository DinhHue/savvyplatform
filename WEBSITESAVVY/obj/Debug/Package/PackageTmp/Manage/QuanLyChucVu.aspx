<%@ Page Title="Quản Lý Chức Vụ" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyChucVu.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyChucVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
    <tr>
        <td colspan="2" class="headermanager">
            <asp:Label ID="Label2" runat="server" style="font-weight: 700" 
                Text="QUẢN LÝ CHỨC VỤ"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top" class="leftmanager" width="20%">
            <asp:Label ID="Label1" runat="server" Text="Tên Chức Vụ"></asp:Label>
            
        </td>
        <td align="center" valign="top" 
            
            style="font-size: 14px; font-family: 'Times New Roman', Times, serif; vertical-align: top;" 
            class="rightmanager">
           <asp:TextBox ID="txtTenChucVu" runat="server" CssClass="textmananger"></asp:TextBox>
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                style="height: 26px" Text="Thêm" CssClass="btn" />
            </td>
    </tr>
    <tr>
        <td align="center" valign="top" colspan="2" 
            style="font-size: 14px; font-family: 'Times New Roman', Times, serif; vertical-align: top;">
            <asp:GridView ID="gvDSChucVu" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="Id_ChucVu" ForeColor="#333333" 
                onrowcancelingedit="gvDSChucVu_RowCancelingEdit" 
                onrowdeleting="gvDSChucVu_RowDeleting" onrowediting="gvDSChucVu_RowEditing" 
                onrowupdating="gvDSChucVu_RowUpdating">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenChucVu" HeaderText="Tên Chức Vụ">
                    <ItemStyle Width="200px" HorizontalAlign="Left" />
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
                <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Names="Tahoma" 
                    ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
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
