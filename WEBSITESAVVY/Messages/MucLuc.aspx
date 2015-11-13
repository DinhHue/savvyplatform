<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MucLuc.aspx.cs" Inherits="WEBSITESAVVY.Messages.MucLuc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mục lục</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="panel_PR" runat="server" >
            <ul>
                <li><asp:CheckBox ID="ckbPR_GioiThieuChung" Checked="true" Text="Giới Thiệu Chung" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_NguoiDuocBaoHiem" Checked="true" Text="Người Được Bảo Hiểm" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_DienBien" Checked="true" Text="Diễn Biến" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_NguyenNhan" Checked="true" Text="Nguyên Nhân" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_PhamViBaoHiem" Checked="true" Text="Phạm Vi Bảo Hiểm" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_PhamViVaMucDoThietHai" Checked="true" Text="Phạm Vi Và Mức Độ Thiệt Hại" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_DonBaoHiemKhac" Checked="true" Text="Đơn Bảo Hiểm Khác" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_GiaTriThuHoi" Checked="true" Text="Giá Trị Thu Hồi" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_TheQuyenTruyDoiBenThuBa" Checked="true" Text="Thế Quyền Truy Đòi Bên Thứ Ba" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_DuPhongBoiThuong" Checked="true" Text="Dự Phòng Bồi Thường" runat="server" /> </li>
                <li><asp:CheckBox ID="ckbPR_BaoCaoTiepTheo" Checked="true" Text="Báo Cáo Tiếp Theo" runat="server" /> </li>
            </ul>

            <asp:Button  Text="Update" runat="server" onclick="update_Click"/>

        </asp:Panel>
    </div>
    </form>
</body>
</html>
