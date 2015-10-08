<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BienBanGiamDinhHienTruong.ascx.cs" Inherits="WEBSITESAVVY.Uc.BienBanGiamDinhHienTruong" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<table cellpadding="2" cellspacing="3" 
    style="padding-left: 20px; left: 10px; float: left; width: 600px;">
    <tr align="right">
        <td align="right" rowspan="1" style="float: left; padding-left: 40px;" 
            width="200px">
            <asp:Label ID="Label2" runat="server" Text="Mã :"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:TextBox ID="txtMaClaim" runat="server" ReadOnly="True" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr align="right">
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label20" runat="server" Text="Số lượng GĐV :"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drSoLuong" runat="server" AutoPostBack="True" Height="24px" 
                onselectedindexchanged="drSoLuong_SelectedIndexChanged" Width="182px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr align="right">
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="lbGDV1" runat="server" Text="Giám Định Viên 1:"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drGDV1" runat="server" Height="25px" Width="184px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr align="right">
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="lbGDV2" runat="server" Text="Giám Định Viên 2:" Visible="False"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drGDV2" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr align="right">
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="lbGDV3" runat="server" Text="Giám Định Viên 3:" Visible="False"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drGDV3" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr align="right">
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="lbGDV4" runat="server" Text="Giám Định Viên 4:" Visible="False"></asp:Label>
        </td>
        <td align="left" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drGDV4" runat="server" Height="25px" Width="184px" 
                Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label1" runat="server" Text="Tên :"></asp:Label>
        </td>
        <td align="left" class="style3" style="float: left; padding-left: 40px;">
            <asp:TextBox ID="txtTenClaim" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="1" style="float: left; padding-left: 40px;" 
            width="200px">
            <asp:Label ID="Label16" runat="server" Text="Nhà Bảo Hiểm :"></asp:Label>
        </td>
        <td align="left" class="style5" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drNBH" runat="server" Height="25px" Width="245px" 
                AutoPostBack="True" CausesValidation="True" 
                onselectedindexchanged="drNBH_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label3" runat="server" Text="Đơn Vị Bảo Hiểm :"></asp:Label>
        </td>
        <td align="left" class="style6" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drDVBH" runat="server" Height="25px" Width="245px" 
                AutoPostBack="True" CausesValidation="True" 
                onselectedindexchanged="drDVBH_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            </td>
    </tr>
    <tr>
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label26" runat="server" Text="Số HĐBH :"></asp:Label>
        </td>
        <td align="left" class="style5" style="float: left; padding-left: 40px;">
            <asp:TextBox ID="txtSoHDBH" runat="server" Height="22px" Width="250px"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label27" runat="server" Text="Hiệu lực :"></asp:Label>
        </td>
        <td align="left" class="style5" style="float: left; padding-left: 40px;">
            <asp:TextBox ID="txtHieuLuc" runat="server" Height="22px" Width="250px"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td align="right" style="float: left; padding-left: 40px;" width="200px">
            <asp:Label ID="Label4" runat="server" Text="Khách Hàng :"></asp:Label>
        </td>
        <td align="left" class="style5" style="float: left; padding-left: 40px;">
            <asp:DropDownList ID="drKH" runat="server" Height="25px" Width="245px">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label31" runat="server" Font-Bold="True" 
                Text="THÔNG TIN SƠ BỘ VỀ TỔN THẤT"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="right" style="padding-left: 40px; float: left">
            <asp:Label ID="Label5" runat="server" Text="Ngày Tổn Thất :"></asp:Label>
        </td>
        <td align="left" class="style3" style="padding-left: 40px; float: left">
            <asp:TextBox ID="txtNgayTonThat" runat="server" Width="243px"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txtNgayTonThat_CalendarExtender" 
                runat="server" TargetControlID="txtNgayTonThat">
            </ajaxToolkit:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td align="right" class="style8" style="padding-left: 40px; float: left">
            <asp:Label ID="Label22" runat="server" Text="Địa điểm tổn thất :"></asp:Label>
        </td>
        <td align="left" class="style8" style="padding-left: 40px; float: left">
            <asp:TextBox ID="txtDiaDiemTonThat" runat="server" Width="450px" Height="25px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right" style="padding-left: 40px; float: left">
            <asp:Label ID="Label6" runat="server" Text="Loại Hình Tổn Thất :"></asp:Label>
        </td>
        <td align="left" class="style3" style="padding-left: 40px; float: left">
            <asp:DropDownList ID="drLoaiHinhTonThat" runat="server" Height="25px" 
                Width="250px">
            </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <asp:Label ID="Label23" runat="server" Text="Diễn biến tổn thất :"></asp:Label>
        </td>
    </tr>
     <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <CKEditor:CKEditorControl ID="ckDienBienTonThat" runat="server" Height="250px" 
                BasePath="~/ckeditor" Width="730px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td align="right" style="padding-left: 40px; float: left">
            <asp:Label ID="Label21" runat="server" Text="Thông  báo Cơ Quang chức năng :"></asp:Label>
        </td>
        <td align="left" class="style3" style="padding-left: 40px; float: left">
            <asp:TextBox ID="txtThongBaoCQChucNang" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <asp:Label ID="Label15" runat="server" Text="Phạm Vi Tổn Thất :"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <CKEditor:CKEditorControl ID="ckPhamViTonThat" runat="server" Height="250px" 
                BasePath="~/ckeditor" Width="730px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td align="right" style="padding-left: 40px; float: left">
            <asp:Label ID="Label24" runat="server" Text="Ước tính dự phòng :"></asp:Label>
        </td>
        <td align="left" class="style3" style="padding-left: 40px; float: left">
            <asp:TextBox ID="txtUocTinhDuPhong" runat="server" Width="243px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <asp:Label ID="Label25" runat="server" Text="Tham chiếu hồ sơ đính kèm :"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <CKEditor:CKEditorControl ID="ckThamChieuHSDK" runat="server" Height="250px" 
                BasePath="~/ckeditor" Width="730px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <asp:Label ID="Label29" runat="server" 
                Text="Đề phòng, hạn chế tổn thất và khuyến cáo của GĐV :" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <CKEditor:CKEditorControl ID="ckKhuyenCaoGDV" runat="server" Height="250px" 
                BasePath="~/ckeditor" Width="730px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <asp:Label ID="Label32" runat="server" 
                Text="Ý kiến Giám định viên" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="padding-left: 40px; float: left">
            <CKEditor:CKEditorControl ID="ckYkienGDV" runat="server" Height="250px" 
                BasePath="~/ckeditor" Width="730px"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" />
        </td>
    </tr>
</table>
