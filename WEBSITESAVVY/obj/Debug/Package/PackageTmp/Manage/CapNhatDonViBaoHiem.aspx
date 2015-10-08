<%@ Page Title="Cập Nhật Đơn Vị Bảo Hiểm" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="CapNhatDonViBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Manage.CapNhatDonViBaoHiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            font-family: "Times New Roman", Times, serif;
            background-color: #E5E5E5;
            font-size: 16px;
            vertical-align: top;
            text-align: right;
            width: 200px;
            padding-right: 5px;
            height: 31px;
        }
        .style5
        {
            font-family: "Times New Roman", Times, serif;
            font-size: 14px;
            vertical-align: top;
            text-align: left;
            padding-left: 10px;
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table align="center" class="tablemanager">
        <tr>
            <td align="center" colspan="2" class="headermanager">
                <asp:Label ID="Label1" runat="server" Text="CẬP NHẬT ĐƠN VỊ BẢO HIỂM " 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label10" runat="server" Text="Tên Đơn Vị :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTendonvi" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label3" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNhaBH" runat="server" Enabled="False" 
                    CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Địa chỉ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="400px" 
                    CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Điện thoại :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Fax :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtFax" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label7" runat="server" Text="WebSite :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtWebsite" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label8" runat="server" Text="Mã Hóa :"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="txtMaHoa" runat="server" Enabled="False" 
                    CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label9" runat="server" Text="Mã Số Thuế :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtMaSoThue" runat="server" Height="23px" 
                    CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="buttonmananger">
                <asp:Button ID="btnCapNhat" runat="server" onclick="btnCapNhat_Click" 
                    style="height: 26px" Text="Cập Nhật" CssClass="btn" />
                <asp:Label ID="lblThongBao" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
