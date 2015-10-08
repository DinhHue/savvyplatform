<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyTheLoaiSummary.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyTheLoaiSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
   
    <table class="tablemanager">
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ THỂ LOẠI SUMMARY"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager" width="10%">
                <asp:Label ID="Label2" runat="server" Text="Tên :" CssClass="lable"></asp:Label>
                &nbsp;
                &nbsp;&nbsp;&nbsp;
                </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTenTheLoai" runat="server" CssClass="textmananger"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThemMoi" runat="server" Text="Thêm" 
                    onclick="btnThemMoi_Click" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">

    <asp:GridView ID="grDSTheLoai" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_TheLoaiSum" 
        onrowcancelingedit="grDSTheLoai_RowCancelingEdit" 
        onrowdeleting="grDSTheLoai_RowDeleting" onrowediting="grDSTheLoai_RowEditing" 
        onrowupdating="grDSTheLoai_RowUpdating" Font-Names="Times New Roman" Font-Size="16px">
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemStyle Width="50px" />
                <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TheLoai" HeaderText="Thể Loại" >
            <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:CommandField HeaderText="Sửa" 
                ShowEditButton="True" >
            <ItemStyle Width="50px" HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True" >
            <ItemStyle Width="50px" HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <HeaderStyle BackColor="#006600" BorderColor="White" Font-Names="Times New Roman" 
            ForeColor="White" />
        <RowStyle Font-Names="Times New Roman" HorizontalAlign="Left" 
            VerticalAlign="Top" />
    </asp:GridView>
            </td>
        </tr>
    </table>

    </asp:Content>
