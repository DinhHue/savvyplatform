<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewClaim.ascx.cs" Inherits="WEBSITESAVVY.Pages.ucNewClaim" %>
<style type="text/css">

    .style1
    {
        width: 100%;
    }
        #txtTenClaim
        {
            width: 171px;
        }
    .style4
    {
        width: 129px;
    }
    </style>
    <table cellpadding="2" cellspacing="3" class="style1">
    <tr align="right">
        <td align="right">
            <asp:Label ID="Label2" runat="server" Text="Mã :"></asp:Label>
        </td>
        <td align="left" class="style3">
            <asp:TextBox ID="txtMaClaim" runat="server" ReadOnly="True" Width="242px"></asp:TextBox>
        </td>
        <td align="left" class="style3" colspan="2">
            <asp:Label ID="lbGDV1" runat="server" Text="Giám Định Viên 1:" Visible="False"></asp:Label>
            <asp:DropDownList ID="drGDV1" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label1" runat="server" Text="Tên :"></asp:Label>
        </td>
        <td align="left" class="style3">
            <asp:TextBox ID="txtTenClaim" runat="server" Width="243px"></asp:TextBox>
        </td>
        <td align="left" class="style3">
            <asp:Label ID="lbGDV2" runat="server" Text="Giám Định Viên 2:" Visible="False"></asp:Label>
        </td>
        <td align="left" class="style3">
            <asp:DropDownList ID="drGDV2" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" rowspan="2">
            <asp:Label ID="Label16" runat="server" Text="Nhà Bảo Hiểm :"></asp:Label>
        </td>
        <td align="left" class="style5" rowspan="2">
            <asp:DropDownList ID="drNBH" runat="server" Height="25px" Width="245px">
            </asp:DropDownList>
        </td>
        <td align="left" class="style5">
            <asp:Label ID="lbGDV3" runat="server" Text="Giám Định Viên 3:" Visible="False"></asp:Label>
        </td>
        <td align="left" class="style5">
            <asp:DropDownList ID="drGDV3" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="left" class="style5">
            <asp:Label ID="lbGDV4" runat="server" Text="Giám Định Viên 4:" Visible="False"></asp:Label>
        </td>
        <td align="left" class="style5">
            <asp:DropDownList ID="drGDV4" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label3" runat="server" Text="Đơn Vị Bảo Hiểm :"></asp:Label>
        </td>
        <td align="left" class="style6" colspan="3">
            <asp:DropDownList ID="drDVBH" runat="server" Height="25px" Width="245px">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="Button5" runat="server" 
                PostBackUrl="~/Pages/DonViBaoHiemMoi.aspx" Text="Đơn vị bảo hiểm mới" 
                Width="134px" />
            
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label4" runat="server" Text="Khách Hàng :"></asp:Label>
        </td>
        <td align="left" class="style5" colspan="3">
            <asp:DropDownList ID="drKH" runat="server" Height="25px" Width="245px">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnKhachHangMoi" runat="server" 
                PostBackUrl="~/Pages/ChiTietNguoiDaiDien.aspx" Text="Khách hàng mới" 
                Width="134px" />
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label5" runat="server" Text="Ngày Tổn Thất :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtNgayTonThat" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label6" runat="server" Text="Loại Hình Tổn Thất :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:DropDownList ID="drLoaiHinhThanhToan" runat="server" Height="25px" 
                Width="250px">
                <asp:ListItem>Time Sheet</asp:ListItem>
                <asp:ListItem>Phí Cố Định</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label8" runat="server" Text="Hiện Trạng Tổn Thất :"></asp:Label>
        </td>
        <td align="left" colspan="4">
            <table border="1" class="style1">
                <tr>
                    <td class="style4" align="right">
                        Hạng mục tài sản</td>
                    <td align="center">
                        Thiệt hại hoàn toàn</td>
                    <td align="center">
                        thiệt hại một phần</td>
                    <td align="center">
                        Có thể sửa chữa</td>
                    <td align="center">
                        Không bị ảnh hưởng</td>
                    <td>
                        Ý Kiến GDV</td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Nhà, Xưởng</td>
                    <td align="center">
                        <asp:CheckBox ID="nx1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nx2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nx3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nx4" runat="server" />
                    </td>
                    <td rowspan="9">
                        <asp:TextBox ID="txtYKienGDV" runat="server" Height="169px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Vật kiến trúc</td>
                    <td align="center">
                        <asp:CheckBox ID="vkt1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vkt2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vkt3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vkt4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Máy móc</td>
                    <td align="center">
                        <asp:CheckBox ID="mm1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="mm2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="mm3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="mm4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Công cụ, dụng cụ</td>
                    <td align="center">
                        <asp:CheckBox ID="cc1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="cc2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="cc3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="cc4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Thiết bị văn phòng</td>
                    <td align="center">
                        <asp:CheckBox ID="tbvp1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tbvp2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tbvp3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tbvp4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Nguyên vật liệu</td>
                    <td align="center">
                        <asp:CheckBox ID="nvl1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nvl2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nvl3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="nvl4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Bán thành phẩm</td>
                    <td align="center">
                        <asp:CheckBox ID="btp1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="btp2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="btp3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="btp4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Thành phẩm</td>
                    <td align="center">
                        <asp:CheckBox ID="tp1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tp2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tp3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="tp4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style4" align="right">
                        Vật dụng khác</td>
                    <td align="center">
                        <asp:CheckBox ID="vdk1" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vdk2" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vdk3" runat="server" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="vdk4" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label15" runat="server" Text="Phạm Vi Tổn Thất"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtPhamViTonThat" runat="server" Width="373px" Height="46px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label9" runat="server" Text="Ngày Bắt Đầu Giám Định :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtNgayBatDau" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label10" runat="server" Text="Ngày Kết Thúc Giám Định :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtNgayKetThuc" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label11" runat="server" Text="Tổng Giá Trị Thiệt Hại :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtTongGiaTriThietHai" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label12" runat="server" Text="Phí Giám Định :"></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:TextBox ID="txtPhiGiamDinh" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label13" runat="server" Text="Tình Trạng Thanh Toán "></asp:Label>
        </td>
        <td align="left" class="style3" colspan="3">
            <asp:DropDownList ID="drTinhTrangThanhToan" runat="server" Height="25px" 
                Width="250px">
                <asp:ListItem>Chưa Thanh Toán</asp:ListItem>
                <asp:ListItem>Đã Thanh Toán</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="4">
            <asp:Button ID="btnThem" runat="server" Height="33px" Text="Thêm" 
                Width="134px" onclick="btnThem_Click" />
            <asp:Button ID="Button4" runat="server" Height="33px" Text="Reset" 
                Width="134px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>

