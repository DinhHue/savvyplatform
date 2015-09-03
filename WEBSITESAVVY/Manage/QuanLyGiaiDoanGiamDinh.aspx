<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyGiaiDoanGiamDinh.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyGiaiDoanGiamDinh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table cellpadding="1" cellspacing="1" class="tablemanager">
    <tr>
        <td class="headermanager" colspan="2">
            <asp:Label ID="Label2" runat="server" Text="QUẢN LÝ GIAI ĐOẠN GIÁM ĐỊNH"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="leftmanager" width="20%">
            <asp:Label ID="Label1" runat="server" Text="Tên Giai Đoạn"></asp:Label>
           
        </td>
        <td class="rightmanager">
            <asp:TextBox ID="txtTenGiaiDoan" runat="server" CssClass="textmananger"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                style="height: 26px" Text="Thêm" CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:GridView ID="gvDSGiaiDoan" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id_GiaiDoanHoanThanh" onrowcancelingedit="gvDSGiaiDoan_RowCancelingEdit" 
                onrowdeleting="gvDSGiaiDoan_RowDeleting" onrowediting="gvDSGiaiDoan_RowEditing" 
                onrowupdating="gvDSGiaiDoan_RowUpdating" Font-Names="Times New Roman" 
                Font-Size="16px">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenGiaiDoan" HeaderText="Tên Giai Đoạn" >
                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Thay Đổi" ShowEditButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" Font-Bold="False" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
