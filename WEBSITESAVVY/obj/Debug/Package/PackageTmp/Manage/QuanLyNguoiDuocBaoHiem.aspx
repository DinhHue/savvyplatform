<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDuocBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .style4
            {
                height: 19px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
        <tr>
            <td colspan="2" class="headermanager">
                <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ NGƯỜI ĐƯỢC BẢO HIỂM"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tên NĐBH :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTenNDBH" runat="server" CssClass="textmananger"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnTim" runat="server" onclick="btnTim_Click" Text="Tìm" 
                    CssClass="btn" />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="colmanager1">
                <asp:GridView ID="grDSKhachHang" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" 
                    onpageindexchanging="grDSKhachHang_PageIndexChanging" Width="100%" 
                    DataKeyNames="ID_KhachHang" onrowdeleting="grDSKhachHang_RowDeleting" 
                    onselectedindexchanging="grDSKhachHang_SelectedIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenKhachHang" HeaderText="NĐBH" >
                        <ItemStyle HorizontalAlign="Left" Width="400px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenDonVi" HeaderText="Đơn Vị Bảo Hiểm" >
                        <ItemStyle HorizontalAlign="Left" Width="350px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                        ForeColor="White" />
                    <RowStyle Font-Names="Times New Roman" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
