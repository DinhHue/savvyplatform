<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcDonViBaoHiemMoi.ascx.cs" Inherits="WEBSITESAVVY.Uc.UcDonViBaoHiemMoi1" %>
<style type="text/css">

        .style1
        {
            width: 100%;
        }
        
        .colleft
        {
            width: 30%;
            
        }
        </style>
    <table class="style1">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="ĐƠN VỊ BẢO HIỂM MỚI" 
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label2" runat="server" Text="Tên đơn vị :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtTendonvi" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="colleft" align="right">
                <asp:Label ID="Label3" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="drCTYTong" runat="server" Height="25px" Width="207px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTendonvi" ErrorMessage="(Chưa nhập tên đơn vị)" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label4" runat="server" Text="Địa chỉ :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="313px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label5" runat="server" Text="Điện thoại :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtDienThoai" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label6" runat="server" Text="Fax :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtFax" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label7" runat="server" Text="WebSite :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtWebsite" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label8" runat="server" Text="Mã Hóa :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtMaHoa" runat="server" Width="200px"></asp:TextBox>
                <asp:Label ID="txtThongBaoLoiMaHoa" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label9" runat="server" Text="Mã Số Thuế :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtMaSoThue" runat="server" Height="23px" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="colleft">
                &nbsp;</td>
            <td class="style2" align="left">
                <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" 
                    Width="132px" />
                <asp:Label ID="lblThemThanhCong" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
   
