<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="ChiTietNguoiDaiDien.aspx.cs" Inherits="WEBSITESAVVY.Pages.ChiTietNguoiDaiDien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="tablemanager">
        <tr>
            <td colspan="2" class="headermanager">
                <asp:Label ID="Label1" runat="server" Text="THÔNG TIN NGƯỜI ĐƯỢC BẢO HIỂM MỚI"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tên khách hàng :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTenKH" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label9" runat="server" Text="Người đại diện :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNguoiDaiDien" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label10" runat="server" Text="Fax :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtFax" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label3" runat="server" Text="Email :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Điện thoại :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Chức vụ :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtChucVu" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Địa chỉ :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDiaChi" runat="server" Height="30px" TextMode="MultiLine" 
                    Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label11" runat="server" Text="Nhà bảo hiểm :" Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drNBH" runat="server" Height="26px" Width="250px" 
                    AutoPostBack="True" CausesValidation="True" 
                    onselectedindexchanged="drNBH_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label12" runat="server" Text="Đơn vị bảo hiểm :" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDVBH" runat="server" Height="26px" Width="250px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label8" runat="server" Text="Lĩnh vực kinh doanh :" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtLinhVucKinhDoanh" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" 
                    Width="113px" CssClass="btn" />
            </td>
        </tr>
    </table>
</asp:Content>
