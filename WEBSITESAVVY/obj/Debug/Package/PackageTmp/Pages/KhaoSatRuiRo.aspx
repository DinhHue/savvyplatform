<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KhaoSatRuiRo.aspx.cs" Inherits="WEBSITESAVVY.KhaoSatRuiRo" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            
            
        }
        .style2
        {
            height: 40px;
            
        }
        .style3
        {
            height: 30px;
        }
        .style4
        {
            height: 25px;
        }
        .style6
        {
            width: 159px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
  
            
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
                BackColor="White" BorderColor="#003300" EnableTheming="True" 
                ForeColor="#003300">
              
        <ajaxToolkit:TabPanel runat="server" HeaderText="Bảo Hiểm" ID="TabPanel1">
         <ContentTemplate>
 <table align="center" class="style1">
        <tr>
            <td>
                <asp:Label ID="Label408" runat="server" Text="Số Thứ Tự :"></asp:Label>
                <asp:Label ID="lblSTT" runat="server" Font-Names="Times New Roman"></asp:Label>
            </td>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="MẪU KHẢO SÁT RỦI RO"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="#EDEFF4" >
            <td rowspan="5" align="right">
                <asp:Label ID="Label2" runat="server" Text="Tham Chiếu" Font-Bold="False"></asp:Label>
            </td>
            <td rowspan="5">
                
                <asp:TextBox ID="txtThamChieu" runat="server" Width="209px"></asp:TextBox>
                <asp:Label ID="lblThongBaoLoiThamChieu" runat="server" ForeColor="Red" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td align="right">
                <asp:Label ID="Label406" runat="server" Text="Số lượng GĐV :" Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drSoLuong" runat="server" AutoPostBack="True" Height="24px" 
                    onselectedindexchanged="drSoLuong_SelectedIndexChanged" Width="182px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="lbGDV1" runat="server" Text="Giám định viên 1" Visible="False" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV1" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="lbGDV2" runat="server" Text="Giám định viên 2" Visible="False" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV2" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="lbGDV3" runat="server" Text="Giám định viên 3" Visible="False" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV3" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="lbGDV4" runat="server" Text="Giám định viên 4" Visible="False" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV4" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="Nhà bảo hiểm" Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drNBH" runat="server" Height="25px" Width="216px" 
                    onselectedindexchanged="drNBH_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td align="right">
                <asp:Label ID="Label7" runat="server" Text="Số HĐBH" Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoHDBH" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" rowspan="2" bgcolor="#EDEFF4" align="right">
                <asp:Label ID="Label5" runat="server" Text="Đơn vị" Font-Bold="False"></asp:Label>
            </td>
            <td class="style2" rowspan="2" bgcolor="#EDEFF4">
                <asp:DropDownList ID="drDVBH" runat="server" Height="25px" Width="213px">
                </asp:DropDownList>
            </td>
            <td class="style2" bgcolor="#EDEFF4" align="right">
                <asp:Label ID="Label6" runat="server" Text="Bắt đầu hiệu lực :" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:TextBox ID="txtBDHieuLuc" runat="server" Width="209px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtBDHieuLuc_CalendarExtender" runat="server" 
                    TargetControlID="txtBDHieuLuc" Enabled="True">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style2" bgcolor="#EDEFF4" align="right">
                <asp:Label ID="Label409" runat="server" Text="Kết thúc hiệu lực :" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:TextBox ID="txtKTHieuLuc" runat="server" Width="209px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtKTHieuLuc_CalendarExtender" runat="server" 
                    TargetControlID="txtKTHieuLuc" Enabled="True">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label410" runat="server" Text="Người được bảo hiểm" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="3" align="left">
                <asp:TextBox ID="txtNguoiDuocBH" runat="server" Height="25px" Width="335px"></asp:TextBox>
                <asp:Label ID="lblThongBaoNguoiDuocBH" runat="server" ForeColor="Red" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="Label8" runat="server" Text="Địa chỉ" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="3" bgcolor="#EDEFF4" align="left">
                <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="398px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label10" runat="server" Text="Người liên hệ" Font-Bold="False"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="txtNguoiLienHe" runat="server" Width="209px"></asp:TextBox>
                <asp:Label ID="lblThongBaoNguoiLienHe" runat="server" ForeColor="Red" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Số Fax :" Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoFax" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right">
                <asp:Label ID="Label12" runat="server" Text="Email :" Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                
                <asp:TextBox ID="txtEmail" runat="server" Width="209px"></asp:TextBox>
                <asp:Label ID="lblThongBaoSoDT" runat="server" ForeColor="Red" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="Label407" runat="server" Text="Điện Thoại" Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:TextBox ID="txtDienThoai" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
         <tr>
         <td></td>
            <td>
                
                <asp:Label ID="lblThongBaoBaoHiem" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
         </ContentTemplate>
         
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="Khu Vực" ID="TabPanel2">
        <ContentTemplate>
        <table class="style1" align="center">
    <tr class="style2">
        <td align="center" colspan="4">
            <asp:Label ID="Label13" runat="server" 
                Text="MÔ TẢ  NGÔI NHÀ / KIẾN TRÚC (KHU VỰC CHÍNH)"></asp:Label>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4">
            <asp:Label ID="Label18" runat="server" Text="Khu vực" Font-Bold="False"></asp:Label>
        </td>
        <td align="center" bgcolor="#EDEFF4">
            <asp:Label ID="Label28" runat="server" Text="(1)"></asp:Label>
        </td>
        <td align="center" bgcolor="#EDEFF4">
            <asp:Label ID="Label29" runat="server" Text="(2)"></asp:Label>
        </td>
        <td align="center" bgcolor="#EDEFF4">
            <asp:Label ID="Label30" runat="server" Text="(3)"></asp:Label>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label14" runat="server" Text="Tên/ Chức Năng " Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTenKV1" runat="server" Width="195px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTenKV2" runat="server" Width="195px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTenKV3" runat="server" Width="195px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label15" runat="server" Text="Năm XD/ Thuê" Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtNamXDKV1" runat="server" Width="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtNamXDKV1"></asp:RequiredFieldValidator>
            <asp:Label ID="lblThongBaoNam1" runat="server" ForeColor="Red" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtNamXDKV2" runat="server" Width="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtNamXDKV2"></asp:RequiredFieldValidator>
            <asp:Label ID="lblThongBaoNam2" runat="server" ForeColor="Red" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtNamXDKV3" runat="server" Width="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtNamXDKV3"></asp:RequiredFieldValidator>
            <asp:Label ID="lblThongBaoNam3" runat="server" ForeColor="Red" 
                Font-Bold="False"></asp:Label>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label16" runat="server" Text="Hiện Trạng" Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHienTrangKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHienTrangKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHienTrangKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label17" runat="server" Text="Số lầu/ Chiều cao" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLauChieuCaoKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLauChieuCaoKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLauChieuCaoKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label19" runat="server" Text="Tường/ Vách" Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTuongVach1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTuongVach2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtTuongVach3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label20" runat="server" Text="Mái/ Trần/ Sàn" Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtMaiTranKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtMaiTranKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtMaiTranKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label21" runat="server" Text="Diện tích" Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtDienTichKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtDienTichKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtDienTichKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label22" runat="server" Text="Giờ hoạt động" Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtGioHoatDongKV1" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtGioHoatDongKV2" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtGioHoatDongKV3" runat="server" Width="195px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label23" runat="server" Text="Các mặt tiếp giáp (Đ-T-N-B)" 
                Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtCacMatTiepGiapKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtCacMatTiepGiapKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtCacMatTiepGiapKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label24" runat="server" Text="Số lượng vòi/ Hộp chữ cháy" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLuongVoiCCKV1" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLuongVoiCCKV2" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtSoLuongVoiCCKV3" runat="server" Width="195px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label25" runat="server" Text="Số lượng bình chữa cháy" 
                Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtSoLuongBCCKV1" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtSoLuongBCCKV2" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtSoLuongBCCKV3" runat="server" Width="195px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label26" runat="server" Text="Hệ thống báo cháy/ báo động " 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtHeThongBaoChayDongKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtHeThongBaoChayDongKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" align="center">
            <asp:TextBox ID="txtHeThongBaoChayDongKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label27" runat="server" Text="Hệ thống chữa cháy tự động " 
                Font-Bold="False"></asp:Label>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHTCCTuDongKV1" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHTCCTuDongKV2" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="center">
            <asp:TextBox ID="txtHTCCTuDongKV3" runat="server" Width="195px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
     <tr><td></td>
            <td>
              
                <asp:Label ID="lblThongBaoMotaKhuVuc" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
        </ContentTemplate>
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="Hút Thuốc Lá" ID="TabPanel3">
        <ContentTemplate>
         <table class="style1" align="center">
    <tr class="style2">
        <td align="center" colspan="3">
            <asp:Label ID="Label31" runat="server" 
                Text="QUY ĐỊNH VÀ BIỆN PHÁP QUẢN LÝ &quot;HÚT THUỐC LÁ&quot;"></asp:Label>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            &nbsp;</td>
        <td align="center" colspan="2" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdQuyDinhYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdQuyDinhYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdQuyDinhNo" runat="server" Text="No" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdQuyDinhNo_CheckedChanged" 
                Font-Bold="False" />
        </td>
    </tr>
        <tr bgcolor="#EDEFF4">
        <td rowspan="3" bgcolor="White" align="right">
            <asp:Label ID="Label32" runat="server" Font-Bold="False" 
                Text="Qui định &quot;No smoking&quot;?"></asp:Label>
            <asp:Label ID="lblNhungKVALL" runat="server" 
                
                
                
                Text="Những khu vực nào sau đây có quy định/ biển báo &quot;Cấm hút thuốc&quot;" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="White" align="right">
            <br />
            <asp:Label ID="lblNhaKho" runat="server" Text="Khu vực nhà kho ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="White">
            <asp:RadioButton ID="rdNhaKhoYes" runat="server" Text="Yes" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdNhaKhoYes_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rdNhaKhoNo" runat="server" Text="No" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdNhaKhoNo_CheckedChanged" 
                Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="lblSX" runat="server" Text="Khu vực sản xuất ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdKhuSXYes" runat="server" Text="Yes" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdKhuSXYes_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rdKhuSXNo" runat="server" Text="No" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdKhuSXNo_CheckedChanged" 
                Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="lblKhac" runat="server" Text="Khu vực khác ?" Font-Bold="False"></asp:Label>
        </td>
        <td>
            <asp:RadioButton ID="rdKhuvucKhacYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdKhuvucKhacYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdKhuvucKhacNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdKhuvucKhacNo_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label37" runat="server" 
                Text="Nhận xét về tình hình thực hiện quy định trên :" Font-Bold="False"></asp:Label>
        </td>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:TextBox ID="txtNhanXet" runat="server" Height="72px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
     <tr> <td align="right"></td>
            <td>
               
                <asp:Label ID="lblThongBaoHutThuoc" runat="server" Font-Bold="False"></asp:Label>
            </td>
           
        </tr>
    </table>
        </ContentTemplate>
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="Quản Lý Kho" ID="TabPanel4">
         <ContentTemplate>
          <table class="style1" align="center">
    <tr class="style2">
        <td align="center" colspan="2">
            <asp:Label ID="Label38" runat="server" 
                Text="HÀNG HÓA / KHO TÀNG"></asp:Label>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label39" runat="server" 
                Text="Hàng hóa được lưu kho được quản lý như thế nào ?" Font-Bold="False"></asp:Label>
        </td>
        <td align="center" bgcolor="#EDEFF4">
            <asp:CheckBox ID="ckTrenSan" runat="server" Text="Trên sàn" Font-Bold="False" />
            <asp:CheckBox ID="ckTrenPallet" runat="server" Text="Trên Pallet" 
                Font-Bold="False" />
            <asp:CheckBox ID="ckTrenKe" runat="server" Text="Trên kệ hoặc trên cao" 
                Font-Bold="False" />
            <asp:CheckBox ID="ckCachKhac" runat="server" Text="Cách khác" 
                Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label40" runat="server" 
                Text="Mô tả cụ thể :" Font-Bold="False"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMoTa" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
            <br />
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label41" runat="server" 
                Text="Chiều cao chất hàng (Mô tả cụ thể nếu có nhiều quy cách)" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4">
            <asp:TextBox ID="txtChieuCaoChatHang" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label42" runat="server" 
                Text="Chiều cao trần nhà kho hoặc nơi chứa hàng" Font-Bold="False"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtChieuCaoNhaKho" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label43" runat="server" 
                Text="Liệt kê các vật dụng/ hàng hóa có thể tự cháy hoặc dễ bắt cháy" 
                Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4">
            <asp:TextBox ID="txtVatDung" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label44" runat="server" 
                Text="Những vật liệu dễ cháy được chứa &amp; quản lý như thế nào ? " 
                Font-Bold="False"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtVatLieuDeChay" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
     <tr><td align="right"></td>
            <td>
               
                <asp:Label ID="lblThongBaoQuanLyKho" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
         </ContentTemplate>
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="PCCC" ID="TabPanel5">
         <ContentTemplate>
         <table class="style1" align="center">
    <tr class="style2">
        <td align="center" colspan="5">
            <asp:Label ID="Label45" runat="server" 
                Text="CÔNG TÁC PHÒNG / CHỮA CHÁY"></asp:Label>
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label46" runat="server" Text="Cấp nước chữa cháy :" 
                Font-Bold="False"></asp:Label>
        </td>
        <td align="center" colspan="4" bgcolor="#EDEFF4">
            <asp:Label ID="Label47" runat="server" Text="Dung tích tháp nước hoặc giếng ?" 
                Font-Bold="False"></asp:Label>
&nbsp;<asp:RadioButton ID="rdYes" runat="server" Text="Yes" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdYes_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rdNo" runat="server" Text="No" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rdNo_CheckedChanged" 
                Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td align="right">
            <asp:Label ID="Label48" runat="server" 
                Text="Số lượng, chủng loại, công suất, bơm nước chữa cháy :" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4">
            <asp:TextBox ID="txtSoLuong" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
            <br />
        </td>
    </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label49" runat="server" 
                Text="Đội PCCC được huấn luyện ?" Font-Bold="False"></asp:Label>
        </td>
        <td bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdHuanLuyenYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdHuanLuyenYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdHuanLuyenNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdHuanLuyenNo_CheckedChanged" Font-Bold="False" />
&nbsp;</td>
        <td bgcolor="#EDEFF4">
            <asp:Label ID="Label50" runat="server" Text="Tổng số :" Font-Bold="False"></asp:Label>
            <asp:TextBox ID="txtTongSo" runat="server" Width="35px"></asp:TextBox>
        </td>
        <td bgcolor="#EDEFF4" class="style6">
            <asp:Label ID="Label51" runat="server" Text="Thường trực :" Font-Bold="False"></asp:Label>
            <asp:TextBox ID="txtThuongTruc" runat="server" Width="35px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
        <tr>
        <td rowspan="3" align="right">
            <asp:Label ID="Label52" runat="server" 
                Text="Khoảng cách từ Trạm PCCC đến trạm gần nhất ?" Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4">
            <asp:RadioButton ID="rdDuoi5Km" runat="server" Text="Dưới 5 Km" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdDuoi5Km_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td colspan="4" class="style3">
            <asp:RadioButton ID="rdDuoi10Km" runat="server" Text="Dưới 10 Km" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdDuoi10Km_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td colspan="2">
            <asp:RadioButton ID="rdTren10Km" runat="server" Text="Trên 10 Km (nêu rõ)" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdTren10Km_CheckedChanged" Font-Bold="False" />
        </td>
        <td colspan="2">
            <asp:TextBox ID="txtMoTaKhoangCachPCCC" runat="server" Height="16px" TextMode="MultiLine" 
                Width="150px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="3" bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label53" runat="server" 
                Text="Có lắp đặt HT chữa cháy tự động cho tất cã các khu vực ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdLapDatHTCCTDYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdLapDatHTCCTDYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdLapDatHTCCTDYNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdLapDatHTCCTDYNo_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:Label ID="Label54" runat="server" 
                Text="Nếu không, mô tả độ phủ chi tiết :" Font-Bold="False"></asp:Label>
            <asp:RadioButton ID="rd75" runat="server" Text="75%" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rd75_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rd50" runat="server" Text="50%" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rd50_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rd25" runat="server" Text="25%" AutoPostBack="True" 
                CausesValidation="True" oncheckedchanged="rd25_CheckedChanged" 
                Font-Bold="False" />
            <asp:RadioButton ID="rdMoTaThem" runat="server" Text="Mô tả thêm" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdMoTaThem_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:TextBox ID="txtMotaThemDoPhu" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="2" bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label55" runat="server" 
                
                Text="Có đơn vị độc lập  thực hiện bảo trì định kỳ cho hệ thống tự động  ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdBaotriHTCCYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdBaotriHTCCYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdBaotriHTCCNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdBaotriHTCCNo_CheckedChanged" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label56" runat="server" Text="Mô tả thêm :" Font-Bold="False"></asp:Label>
        </td>
    </tr>
        <tr>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:TextBox ID="txtMoTaThemBaoTriCCTD" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="2" align="right">
            <asp:Label ID="Label57" runat="server" 
                Text="Hộp chữa cháy có bị khóa, che lấp hoặc bị cản trở tiếp cận ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4">
            <asp:RadioButton ID="rdTinhTrangHTCCTDYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdTinhTrangHTCCTDYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdTinhTrangHTCCTDNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdTinhTrangHTCCTDNo_CheckedChanged" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label58" runat="server" Text="Mô tả thêm :" Font-Bold="False"></asp:Label>
        </td>
    </tr>
        <tr>
        <td colspan="4">
            <asp:TextBox ID="txtMoTaThemTinhTrangHTCCTD" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="2" bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label59" runat="server" Text="Chiều dài vòi nước có đủ tầm ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdChieuDaiVoiNuocYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdChieuDaiVoiNuocYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdChieuDaiVoiNuocNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdChieuDaiVoiNuocNo_CheckedChanged" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label60" runat="server" Text="Mô tả thêm :" Font-Bold="False"></asp:Label>
        </td>
    </tr>
        <tr>
        <td colspan="4" bgcolor="#EDEFF4">
            <asp:TextBox ID="txtMoTaThemChieuDaiVoiNuoc" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="2" align="right">
            <asp:Label ID="Label61" runat="server" Text="Có trang bị hệ thống báo cháy ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="4">
            <asp:RadioButton ID="rdheThongBaoChayYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdheThongBaoChayYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdheThongBaoChayNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdheThongBaoChayNo_CheckedChanged" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label62" runat="server" Text="Mô tả thêm :" Font-Bold="False"></asp:Label>
        </td>
    </tr>
        <tr>
        <td colspan="4">
            <asp:TextBox ID="txtMoTaHeThongBaoChay" runat="server" Height="16px" TextMode="MultiLine" 
                Width="438px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td rowspan="3" bgcolor="#EDEFF4" align="right">
            <asp:Label ID="Label63" runat="server" 
                Text="Tình hình trang bị và quản lý dụng cụ chữa cháy cầm tay :" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:Label ID="txtTieuChuan" runat="server" Text="Theo tiêu chuần : " 
                Font-Bold="False"></asp:Label>
            <asp:TextBox ID="txtTieuChuanBCC" runat="server" Width="37px"></asp:TextBox>
        </td>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:Label ID="Label377" runat="server" Text="Số lượng bình chữa cháy :" 
                Font-Bold="False"></asp:Label>
            <asp:TextBox ID="txtSoLuongCC" runat="server" Width="37px"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:Label ID="Label388" runat="server" 
                Text="Tất cã bình chữa cháy có treo trên tường ?" Font-Bold="False"></asp:Label>
        </td>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdCCTreoTuongYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdCCTreoTuongYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdCCTreoTuongNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdCCTreoTuongNo_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
        <tr>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:Label ID="Label399" runat="server" 
                Text="Có chướng ngại vật cản trở tiếp cận bình chữa cháy ?" 
                Font-Bold="False"></asp:Label>
        </td>
        <td colspan="2" bgcolor="#EDEFF4">
            <asp:RadioButton ID="rdChuongNgaiVatYes" runat="server" Text="Yes" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdChuongNgaiVatYes_CheckedChanged" Font-Bold="False" />
            <asp:RadioButton ID="rdChuongNgaiVatNo" runat="server" Text="No" 
                AutoPostBack="True" CausesValidation="True" 
                oncheckedchanged="rdChuongNgaiVatNo_CheckedChanged" Font-Bold="False" />
        </td>
    </tr>
     <tr><td align="right">&nbsp;</td>
            <td>
               
                <asp:Label ID="lblThongBaoCongTacCC" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
         </ContentTemplate>
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="Nhận diện nguồn rủi ro" ID="TabPanel6">
         <ContentTemplate>
         <table class="style1">
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label65" runat="server" Text="NHẬN DIỆN CÁC NGUỒN RỦI RO"></asp:Label>
            </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label66" runat="server" 
                    Text="Có lắp đặt tường / Trần bằng tấm &quot;Sanwich-panel&quot; (EPS) ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdespYes" runat="server" Text="Yes" AutoPostBack="True" 
                    CausesValidation="True" oncheckedchanged="rdespYes_CheckedChanged" 
                    Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdespNo" runat="server" Text="No" AutoPostBack="True" 
                    CausesValidation="True" oncheckedchanged="rdespNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label67" runat="server" 
                    Text="Nếu có, ước diện tích sàn có lắp đặt tấm EPS:" Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtESP" runat="server" Height="16px" TextMode="MultiLine" 
                    Width="204px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="right" style="vertical-align: top">
                <asp:Label ID="Label68" runat="server" 
                    Text="Nhà xưởng của NĐBH có gần kề sông / hồ(&lt;500m) không ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:RadioButton ID="rdGanKeSongYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdGanKeSongYes_CheckedChanged" Font-Bold="False" />
                <asp:RadioButton ID="rdGanKeSongNo" runat="server" Text="No" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdGanKeSongNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label69" runat="server" 
                    Text="Nếu có, nêu rõ khoảng cách bao xa :" Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtKhoangCachBoSong" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label70" runat="server" 
                    Text="Lần gần nhất hệ thống điện được bảo trì (đinh kỳ) ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:TextBox ID="txtNgayBaoTriGanNhat" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgayBaoTriGanNhat_CalendarExtender" runat="server" 
                    TargetControlID="txtNgayBaoTriGanNhat" Enabled="True">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label71" runat="server" 
                    Text="Công tác kiểm tra hệ thống điện định kỳ ?" Font-Bold="False"></asp:Label><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdBaoTriDinhKyYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdBaoTriDinhKyYes_CheckedChanged" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdBaoTriDinhKyNo" runat="server" Text="No" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdBaoTriDinhKyNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: top">
                <asp:Label ID="Label72" runat="server" 
                    Text="Rác thải được mang ra khỏi địa điểm như thế nào, bao lâu / lần ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:TextBox ID="txtXuLyRacThai" runat="server" TextMode="MultiLine" 
                    Width="286px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label73" runat="server" 
                    Text="Công việc hàn cắt có được tiến hành tại địa điểm ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdHanCatYes" runat="server" Text="Yes" AutoPostBack="True" 
                    CausesValidation="True" oncheckedchanged="rdHanCatYes_CheckedChanged" 
                    Font-Bold="False" />
                <asp:RadioButton ID="rdHanCatNo" runat="server" Text="No" 
                    oncheckedchanged="rdHanCatNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label74" runat="server" 
                    Text="Nếu có, có qui định an toàn hoặc cô lập khỏi khu vực nguy hiểm ? " 
                    Font-Bold="False"></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdAnToanCoLapYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdAnToanCoLapYes_CheckedChanged" Font-Bold="False" />
                <asp:RadioButton ID="rdAnToanCoLapNo" runat="server" Text="No" 
                    oncheckedchanged="rdAnToanCoLapNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="right" style="vertical-align: top">
                <asp:Label ID="Label75" runat="server" 
                    Text="Có quy định nào liên quan đến hoạt động có phát sinh nhiệt ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:RadioButton ID="rdQuiDinhPhatSinhNhietYes" runat="server" Text="Yes" 
                    oncheckedchanged="rdQuiDinhPhatSinhNhietYes_CheckedChanged" 
                    AutoPostBack="True" Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdQuiDinhPhatSinhNhietNo" runat="server" Text="No" 
                    oncheckedchanged="rdQuiDinhPhatSinhNhietNo_CheckedChanged" 
                    AutoPostBack="True" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label76" runat="server" Text="Mô tả thêm :" Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtMoTaThemQuiDinhPhatSinhNhiet" runat="server" 
                    TextMode="MultiLine" Width="274px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="4" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label77" runat="server" 
                    Text="NĐBH có sử dụng buồng / bồn phun sơn ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdQuiDinhLienQuanPSNYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdQuiDinhLienQuanPSNYes_CheckedChanged" 
                    Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdQuiDinhLienQuanPSNo" runat="server" Text="No" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdQuiDinhLienQuanPSNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label78" runat="server" 
                    
                    Text="Nếu có, mô tả chi tiết hệ thống thông gió và hệ thống PCCC bên dưới :" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label79" runat="server" Text="HT thông gió :" Font-Bold="False"></asp:Label>
&nbsp;</td>
            <td bgcolor="#EDEFF4">
                <asp:TextBox ID="txtHeThongThongGio" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label80" runat="server" Text="HT PCCC :" Font-Bold="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:TextBox ID="txtHTPCCC" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="right" style="vertical-align: top">
                <asp:Label ID="Label81" runat="server" Text="Có nấu bếp tại địa điểm ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:RadioButton ID="rdCoNauBepYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" 
                    oncheckedchanged="rdCoNauBepYes_CheckedChanged" Font-Bold="False" />
                <asp:RadioButton ID="rdCoNauBepNo" runat="server" Text="No" AutoPostBack="True" 
                    CausesValidation="True" oncheckedchanged="rdCoNauBepNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label82" runat="server" 
                    Text="Liệt kê các loại bếp và công suất cụ thể :" Font-Bold="False"></asp:Label>
                
                <br />
                <asp:TextBox ID="txtLietKeLoaiBepVaCongSuat" runat="server" Height="20px" TextMode="MultiLine" 
                    Width="415px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label83" runat="server" 
                    Text="Các đường ống dẫn / phễu lọc bụi có được vệ sinh phù hợp ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdVSPhuHopYes" runat="server" Text="Yes" 
                    oncheckedchanged="rdVSPhuHopYes_CheckedChanged" Font-Bold="False" />
                <asp:RadioButton ID="rdVSPhuHopNo" runat="server" Text="No" 
                    oncheckedchanged="rdVSPhuHopNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label84" runat="server" 
                    Text="Công tác vệ sinh định kỳ ?" Font-Bold="False"></asp:Label>
                
                <asp:TextBox ID="txtCongTacVeSinhDinhKy" runat="server" Height="20px" TextMode="MultiLine" 
                    Width="415px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: top">
                <asp:Label ID="Label85" runat="server" 
                    Text="Đánh giá công tác vệ sinh và bảo quản trật tự khu vực SX ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:RadioButton ID="rdRatTot" runat="server" Text="Rất tốt" 
                    AutoPostBack="True" CausesValidation="True" Font-Bold="False" />
                <asp:RadioButton ID="rdTot" runat="server" Text="Tốt" AutoPostBack="True" 
                    CausesValidation="True" Font-Bold="False" />
                <asp:RadioButton ID="rdVuaPhai" runat="server" Text="Vừa phải" 
                    AutoPostBack="True" CausesValidation="True" Font-Bold="False" />
                <asp:RadioButton ID="rdChuaPhuHop" runat="server" Text="Chưa phù hợp" 
                    AutoPostBack="True" CausesValidation="True" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label122" runat="server" 
                    
                    Text="Khoảng cách giữa địa điểm khảo sát và đường dây điện công cộng có xa &gt;100m ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdKhoangCachDuongDayDienYes" runat="server" Text="Yes" 
                    AutoPostBack="True" CausesValidation="True" Font-Bold="False" />
                <asp:RadioButton ID="rdKhoangCachDuongDayDienNo" runat="server" Text="No" 
                    AutoPostBack="True" CausesValidation="True" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label231" runat="server" 
                    Text="Nếu đúng, ước tính bao xa ?" Font-Bold="False"></asp:Label>
                
                <asp:TextBox ID="txtUocTinhKhoangCach" runat="server" Height="20px" TextMode="MultiLine" 
                    Width="415px"></asp:TextBox>
            </td>
        </tr>
         <tr>
         <td>&nbsp;</td>
            <td align="left">
                <asp:Label ID="lblThongBaoNDRR" runat="server" Font-Bold="False"></asp:Label>
            </td>
        </tr>
    </table>
         </ContentTemplate>
        </ajaxToolkit:TabPanel>
         <ajaxToolkit:TabPanel runat="server" HeaderText="Công tác an ninh" ID="TabPanel7">
         <ContentTemplate>
         <table class="style1">
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label86" runat="server" Text="CÔNG TÁC AN NINH / BẢO VỆ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label87" runat="server" 
                    Text="Có lắp đặt hệ thống báo trộm ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdLapDatHTBaoTromYes" runat="server" Text="Yes" 
                    AutoPostBack="True" oncheckedchanged="rdLapDatHTBaoTromYes_CheckedChanged" 
                    Font-Bold="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdLapDatHTBaoTromNo" runat="server" Text="No" 
                    AutoPostBack="True" oncheckedchanged="rdLapDatHTBaoTromNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="right" style="vertical-align: top">
                <asp:Label ID="Label88" runat="server" 
                    Text="Nếu có, có luôn được giám sát ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                <asp:RadioButton ID="rdGiamSatYes" runat="server" Text="Yes" 
                    AutoPostBack="True" oncheckedchanged="rdGiamSatYes_CheckedChanged" 
                    Font-Bold="False" />
                <asp:RadioButton ID="rdGiamSatNo" runat="server" Text="No" AutoPostBack="True" 
                    oncheckedchanged="rdGiamSatNo_CheckedChanged" Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label89" runat="server" 
                    Text="Nếu có, việc giám sát thực hiện ra sao ?" Font-Bold="False"></asp:Label><br />
                <asp:TextBox ID="txtThucHienGiamSat" runat="server" TextMode="MultiLine" 
                    Width="361px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label90" runat="server" 
                    Text="Hệ thống camera an ninh ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdCameraANYes" runat="server" AutoPostBack="True" 
                    OnCheckedChanged="rdCameraANYes_CheckedChanged" Text="Yes" 
                    Font-Bold="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdCameraANNo" runat="server" AutoPostBack="True" 
                    OnCheckedChanged="rdCameraANNo_CheckedChanged" Text="No" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label91" runat="server" 
                    Text="Mô tả số lượng và bố trí ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:TextBox ID="txtSoLuongVaBoTri" runat="server" TextMode="MultiLine" 
                    Width="358px"></asp:TextBox>
            </td>
        </tr>
         <tr>
        <td align="right" style="vertical-align: top">
            <asp:Label ID="Label92" runat="server" 
                Text="Hệ Thống an ninh có hợp đồng  bảo trì ?" Font-Bold="False"></asp:Label>
        </td>
        <td colspan="2" align="left">
        
                <asp:RadioButton ID="rdHDBaoTriYes" runat="server" Text="Yes" 
                    AutoPostBack="True" oncheckedchanged="rdHDBaoTriYes_CheckedChanged" 
                    Font-Bold="False" />
                <asp:RadioButton ID="rdHDBaoTriNo" runat="server" Text="No" AutoPostBack="True" 
                    oncheckedchanged="rdHDBaoTriNo_CheckedChanged" Font-Bold="False" />
        
        </td>
        </tr>
        <tr>
            <td rowspan="2" bgcolor="#EDEFF4" align="right" style="vertical-align: top">
                <asp:Label ID="Label93" runat="server" 
                    Text="Các cửa sổ có khóa chìm cố định ?" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:RadioButton ID="rdKhoaChimCoDinhYes" runat="server" Text="Yes" 
                    AutoPostBack="True" oncheckedchanged="rdKhoaChimCoDinhYes_CheckedChanged" 
                    Font-Bold="False" />
                <asp:RadioButton ID="rdKhoaChimCoDinhNo" runat="server" Text="No" 
                    AutoPostBack="True" oncheckedchanged="rdKhoaChimCoDinhNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
       
        <tr>
            <td colspan="2" bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label94" runat="server" 
                    
                    
                    Text="Nếu có cửa cuốn mô tơ điện, có thiết lập khóa an ninh nhằm khóa mô-tơ ngoài giờ làm việc ?" 
                    Font-Bold="False"></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rdThietLapKhoaYes" runat="server" Text="Yes" 
                    AutoPostBack="True" oncheckedchanged="rdThietLapKhoaYes_CheckedChanged" 
                    Font-Bold="False" />
                <asp:RadioButton ID="rdThietLapKhoaNo" runat="server" Text="No" 
                    AutoPostBack="True" oncheckedchanged="rdThietLapKhoaNo_CheckedChanged" 
                    Font-Bold="False" />
            </td>
        </tr>
        <tr>
            <td rowspan="2" align="right" style="vertical-align: top">
                <asp:Label ID="Label95" runat="server" 
                    Text="Cửa số được thiết kế dạng khe cố định hay là loại mở có khóa ?" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">

                <asp:TextBox ID="txtDangThietKeCuaSo" runat="server" TextMode="MultiLine" 
                    Width="358px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Label ID="Label96" runat="server" Text="Giờ đóng / mở :" Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtGioMo_DongCua" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td bgcolor="#EDEFF4" align="right" style="vertical-align: top">
            <asp:Label ID="Label411" runat="server" 
                Text="Đơn vị có thuê bảo vệ an ninh ngoài giờ làm việc ?" 
                Font-Bold="False"></asp:Label><br />
            </td>
            <td bgcolor="#EDEFF4" align="left">
                <asp:CheckBox ID="ckBVANYes" runat="server" Text="Yes" Font-Bold="False" />
                <asp:CheckBox ID="ckBVANNo" runat="server" Text="No" Font-Bold="False" />
                <br />
            </td>
            <td bgcolor="#EDEFF4" align="left">
                <asp:Label ID="Label412" runat="server" Text="Nếu có, mô tả chi tiết :" 
                    Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtMoTaDonViThueBaoVe" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: top">
                <asp:Label ID="Label413" runat="server" 
                    Text="Đơn vị có thuê người trong nom địa điểm thường trược ?" 
                    Font-Bold="False"></asp:Label><br />
                     
            </td>
            <td align="left">
                <asp:CheckBox ID="ckDVTTYes" runat="server" Text="Yes" Font-Bold="False" />
                <asp:CheckBox ID="ckDVTTNo" runat="server" Text="No" Font-Bold="False" />
            </td>
            <td align="left">
                <asp:Label ID="Label414" runat="server" Text="Nếu có, mô tả chi tiết :" 
                    Font-Bold="False"></asp:Label>
                <asp:TextBox ID="txtMoTaThuongTruc" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                
                <asp:Label ID="lblThongBaoCongTacAN" runat="server" Font-Bold="False"></asp:Label>
            </td>
            <td colspan="2" align="left">
                &nbsp;</td>
        </tr>
        </table>
         </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="Ý kiện GĐV" ID="TabPanel8">
         <ContentTemplate>
          <table class="style1">
        <tr>
            <td align="left" colspan="2">
                <asp:Label ID="Label97" runat="server" 
                    Text="GHI THÊM NHẬN ĐỊNH HOẶC QUAN SÁT CỦA GIÁM ĐỊNH VIÊN NGOÀI NHỮNG Ý NÊU TRÊN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
  <CKEditor:CKEditorControl ID="ckYKienQuanSatDanhGia" runat="server" Height="225px" 
                    Width="689px"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td align="left">
                <asp:Label ID="Label415" runat="server" Text="Thời gian bắt đầu khảo sát :" 
                    Font-Bold="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtGioBatDau" runat="server" Height="18px" Width="188px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td align="left">
                <asp:Label ID="Label416" runat="server" Text="Thời gian kết thúc  khảo sát :" 
                    Font-Bold="False"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtGioKetThuc" runat="server" Height="16px" Width="187px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
              <tr>
                  <td class="style4" colspan="2">
                  <asp:Label ID="Label4" runat="server" Font-Bold="False"></asp:Label>
                  </td>
                  <td class="style4">
                      &nbsp;</td>
              </tr>
        </table>
         </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
       <table align="center" >
           <tr>
               <td align="center">

                <asp:Button runat="server" Text="Thêm Mới" Height="35px" Width="134px" 
                       ID="btnKhaoSatRuiRoMoi" OnClick="btnKhaoSatRuiRoMoi_Click"></asp:Button>
                       <asp:Label ID="lblThongBaoCapNhatYKienGDV" runat="server"></asp:Label>
               </td>
           </tr>
       </table>     
  
            
           
            
  
            
</asp:Content>
