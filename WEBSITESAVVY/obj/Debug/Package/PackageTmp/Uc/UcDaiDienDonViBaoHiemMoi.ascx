<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcDaiDienDonViBaoHiemMoi.ascx.cs" Inherits="WEBSITESAVVY.Uc.UcDonViBaoHiemMoi" %>
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
    <table class="style1" style="font-family: 'Times New Roman', Times, serif">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="ĐẠI DIỆN ĐƠN VỊ BẢO HIỂM" 
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label8" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="drNBH" runat="server" AutoPostBack="True" 
                    CausesValidation="True" onselectedindexchanged="drNBH_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label2" runat="server" Text="Đơn vị :"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="drDV" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label3" runat="server" Text="Họ tên :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtHoTen" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label4" runat="server" Text="Phòng ban :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtphongban" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label5" runat="server" Text="Chức vụ :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtchucvu" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label6" runat="server" Text="Điện thoại :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtdienthoai" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label7" runat="server" Text="Email :"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtemail" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="colleft">
                <asp:Label ID="Label9" runat="server" Text="Liên hệ bồi thường  :"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="drThucHienBoiThuong" runat="server">
                    <asp:ListItem Value="1">Có</asp:ListItem>
                    <asp:ListItem Value="0">Không</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td align="left">
                <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

