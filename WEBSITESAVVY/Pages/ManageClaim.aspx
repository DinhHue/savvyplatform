<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="ManageClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.ManageClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<style type="text/css">
.colthamchieu
{
    vertical-align:top;
    width:230px;
    
    background-color:#EBEBEB;
    text-align:right;
    padding-right:30px;
    font-weight:bold;
}
.colright
{
    vertical-align: top;
    text-align:right;
    width:120px;
    font-weight: normal;
    background-color:#EBEBEB;
}
.colleft
{
    width:150px;
    text-align:left;
    vertical-align: top;
    padding-left:20px;
    font-weight: normal;
    background-color:#EBEBEB;
}
    .colgiua
    {
    vertical-align:top;
    text-align:left;
    }
.colcontentright
{
        padding-right:30px;
        text-align:left;
        vertical-align:top;
        
    font-weight: normal;
}
.lbbold
{
    font-weight:700;     
}
.colrightleft
{
vertical-align:top;
padding-right:30px;
font-weight:normal;  
width:200px;
}
.chamright
{
text-align:right;
font-weight:bold;
}
.style3
{
    width: 980px;
    font-family:Times New Roman;
    font-size:14px;
    border: thin groove #808080
}
.textright
{
vertical-align:top;
padding-left:20px;
padding-right:20px;
}
.textleft
{
vertical-align:top;
padding-left:20px;
}
            
    .style4
    {
        vertical-align: top;
        padding-left: 20px;
        height: 20px;
    }
    .style5
    {
        vertical-align: top;
        padding-left: 20px;
        padding-right: 20px;
        height: 20px;
    }
            
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">    
    <asp:Panel ID="panel1" runat="server">
        <table class="style3" align="center" style="border: thin groove #808080">
            <tr>
                <td align="center" colspan="4" bgcolor="#CCCCCC">
                    <asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="X-Large" 
                ForeColor="Black" Text="SUMMARY CLAIM"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="colthamchieu">
                    <asp:Label ID="Label3" runat="server" Text="Tham chiếu Hồ sơ Giám định"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Font-Italic="True" 
                Text="Claim File's Reference Number" Font-Bold="False"></asp:Label>
                </td>
                <td align="left" class="colgiua">
                    <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                </td>
                <td style="vertical-align: top; text-align: right; padding-right: 10px" 
                    width="130px" class="colright">
                    <asp:Label ID="Label5" runat="server" Text="Giám định viên" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Font-Italic="True" Text="Surveyor"></asp:Label>
                </td>
                <td align="left" class="colrightleft">
                    <asp:Label ID="lblGDV1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>        
        <table class="style3" align="center">
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label7" runat="server" Text="Nhà bảo hiểm" Font-Bold="True" 
                        CssClass="colright"></asp:Label>
                    <br />
                    <asp:Label ID="Label8" runat="server" Font-Italic="True" Text="Insurer" 
                        Font-Bold="False"></asp:Label>
                </td>
                <td class="colgiua" colspan="3">
                    <asp:Label ID="Label58" runat="server" Text=":" Font-Bold="True"></asp:Label>
                    &nbsp;<asp:Label ID="lblNhaBaoHiem" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="colright">
                    <asp:Label ID="Label9" runat="server" Text="Số HĐBH" Font-Bold="True"></asp:Label>
                    &nbsp;<strong>:</strong><br />
                    <asp:Label ID="Label10" runat="server" Font-Italic="True" Text="Policy No."></asp:Label>
                    &nbsp;&nbsp;
                </td>
                <td align="left" class="colrightleft">
                    <asp:Label ID="lblSoHDBH" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label11" runat="server" Text="Đơn vị" style="font-weight: 700"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    <asp:Label ID="Label12" runat="server" Font-Italic="True" Text="Subsidiary"></asp:Label>
                </td>
                <td class="colgiua" colspan="3">
                    <asp:Label ID="Label84" runat="server" Font-Bold="True" Text=":"></asp:Label>
                    &nbsp;<asp:Label ID="lblDonVi" runat="server" CssClass="bold"></asp:Label>
                </td>
                <td class="colright">
                    <asp:Label ID="lblFax0" runat="server" Font-Bold="True">Hiệu lực</asp:Label>
                    &nbsp;<strong>:</strong><br />
                    <asp:Label ID="lblFax1" runat="server" Font-Italic="True">Effective</asp:Label>
                    &nbsp;<td align="left" class="colrightleft">
                    <asp:Label ID="lblHieuLuc" runat="server"></asp:Label>
                </td>
                </td>
                
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label15" runat="server" Text="Người được BH" 
                style="font-weight: 700"></asp:Label>
                    <br />
                    <asp:Label ID="Label16" runat="server" Font-Italic="True" Text="Insurerd"></asp:Label>
                </td>
                <td class="colgiua" colspan="3">
                    <asp:Label ID="Label85" runat="server" Text=":" Font-Bold="True"></asp:Label>
                    &nbsp;<asp:Label ID="lblNDBH" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td class="colright">
                    <asp:Label ID="Label13" runat="server" Text="Số Fax" Font-Bold="True"></asp:Label>
                    &nbsp;<strong>:</strong><br />
                    <asp:Label ID="Label14" runat="server" Font-Italic="True" Text="Fax No."></asp:Label>
                    &nbsp;
                </td>
                <td align="left" class="colrightleft">
                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label17" runat="server" Text="Địa chỉ" style="font-weight: 700"></asp:Label>
                    &nbsp;<br />
                    <asp:Label ID="lblFax2" runat="server" Font-Italic="True">Address</asp:Label>
                </td>
                <td colspan="5" class="colcontentright">
                    <asp:Label ID="Label86" runat="server" Text=":" Font-Bold="True"></asp:Label>
                    &nbsp;<asp:Label ID="lblDiaChi" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="lblFax3" runat="server" style="font-weight: 700">Người liên hệ</asp:Label>
                    &nbsp;<br />
                    <asp:Label ID="lblFax4" runat="server" Font-Italic="True">Contact Person</asp:Label>
                </td>
                <td style="vertical-align: top">
                    <asp:Label ID="Label89" runat="server" Font-Bold="True" Text=":"></asp:Label>
                    &nbsp;<asp:Label ID="lblNguoiLienHe" runat="server" Font-Bold="False"></asp:Label>
                </td>
                <td class="colgiua" bgcolor="#EBEBEB">
                    <asp:Label ID="Label18" runat="server" Text="Số điện thoại " 
                style="font-weight: 700"></asp:Label>
                    <strong>:</strong>&nbsp;<br />
                    <asp:Label ID="Label19" runat="server" Font-Italic="True" Text="Phone No."></asp:Label></td>
                <td style="vertical-align: top">
                    <asp:Label ID="lblSoDienThoai" runat="server"></asp:Label></td>
                <td bgcolor="#EBEBEB">
                    
                    <asp:Label ID="Label21" runat="server" style="font-weight: 700" 
                        Text="Thư điện tử"></asp:Label>
                    &nbsp;<strong>:</strong><br />
                    <asp:Label ID="Label22" runat="server" Font-Italic="True" Text="Email"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td align="left" style="vertical-align: top">
                   
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                   
                </td>
            </tr>
            <tr>
                <td colspan="6" class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="6" style="vertical-align: top">
                    &nbsp;</td>
            </tr>
            
        </table>
        <table class="style3" align="center">
        <tr>
                <td align="center" colspan="6" 
                    style="vertical-align: top; border-top-style: groove; border-top-width: thin; border-top-color: #999999;" 
                    bgcolor="#CCCCCC">
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="Black" Text="THÔNG TIN SƠ BỘ VỀ TỔN THẤT" Font-Names="Times New Roman"></asp:Label>
                    <br />
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Italic="True" 
                Font-Size="Medium" ForeColor="Black" 
                Text="INITIAL INFORMATION OF LOSS / DAMAGE"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label25" runat="server" Text="Địa điểm tổn thất" 
                style="font-weight: 700"></asp:Label>
                    &nbsp;<br />
                    <asp:Label ID="Label26" runat="server" Font-Italic="True" Text="Premises"></asp:Label>
                </td>
                <td class="colcontentright">
                    &nbsp;<asp:Label ID="lblDiaDiemTT" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label27" runat="server" Text="Ngày tổn thất" 
                style="font-weight: 700"></asp:Label>
                  <br />
                    <asp:Label ID="Label55" runat="server" Text="Date of Loss" Font-Italic="False" 
                style="font-style: italic;" Font-Bold="False"></asp:Label>
                </td>
                <td class="colcontentright">
                    <asp:Label ID="lblNgayTonThat" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label28" runat="server" Text="Loại hình tổn thất" 
                style="font-weight: 700"></asp:Label>
                   <br />
                    <asp:Label ID="Label29" runat="server" Font-Italic="True" Text="Type of Loss"></asp:Label>
                </td>
                <td class="colcontentright">
                    <asp:Label ID="lblLoaiHinhTonThat" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label30" runat="server" Text="Diễn biến tổn thất" 
                CssClass="lbbold"></asp:Label>
                   <br />
                    <asp:Label ID="Label31" runat="server" Font-Italic="True" Text="Circumstances"></asp:Label>
                </td>
                <td class="colcontentright">
                    <asp:Label ID="lblDienBienTonThat" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleft" colspan="1">
                    <asp:Label ID="Label32" runat="server" Text="Thông báo CQ chức năng" 
                CssClass="lbbold"></asp:Label>
                   <br />
                    <asp:Label ID="Label33" runat="server" 
                Text="Reported to the Local Authority(Police)?" style="font-style: italic"></asp:Label>
                </td>
                <td class="colcontentright">
                    <asp:Label ID="lblThongBaoCQChucNang" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
      
        <table class="style3" align="center">
            <tr>
                <td class="textleft" bgcolor="#CCCCCC" width="49%">
                    <asp:Label ID="Label62" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="16px" ForeColor="Black" 
                        Text="NGUYÊN NHÂN TỔN THẤT/ PROXIMATE CAUSE OF LOSS :"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" bgcolor="#CCCCCC" width="49%">
                    <asp:Label ID="Label63" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="16px" ForeColor="Black" 
                        Text="PHẠM VI BẢO HIỂM/ POLICY LIABILITY :"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4" width="49%">
                    <asp:Label ID="lblNguyenNhanTT" runat="server"></asp:Label>
                </td>
                <td width="2%" class="style2">
                    </td>
                <td class="style5" width="49%">
                    <asp:Label ID="lblPhamViBH" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="textleft" bgcolor="#CCCCCC" width="49%">
                    <asp:Label ID="Label64" runat="server" Font-Bold="True" Font-Size="16px" 
                        ForeColor="Black" Text="DIỄN BIẾN KHIẾU NẠI/ CLAIM DIARY :"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="textleft" width="49%">
                    <asp:Label ID="lblDienBienKhieuNai" runat="server"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    &nbsp;</td>
            </tr>
        </table>
       
        <table class="style3" align="center">
            <tr>
                <td align="center" colspan="3" bgcolor="#CCCCCC">
                    <asp:Label ID="Label65" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" 
                        Text="PHẠM VI TỔN THẤT &amp; TÍNH TOÁN / LOSS EXTENT &amp; ADJUSTMENT :"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    <asp:Label ID="lblLoaiTonThat" runat="server" Font-Bold="True" Font-Size="16px" 
                        ForeColor="Black"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    <asp:Label ID="Label67" runat="server" CssClass="lbbold" 
                        Font-Names="Times New Roman" 
                        Text="1- Mô tả phạm vi thiệt hại/ Description of damage:"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%" class="textright">
                    <asp:Label ID="Label69" runat="server" CssClass="lbbold" 
                        Font-Names="Times New Roman" Text="2- Tiến độ xử lý / Handling process:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    <asp:Label ID="lblMoTaPhamViThietHai" runat="server"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%" class="textright">
                    <asp:GridView ID="gvDSTienDoXuLy" runat="server" AutoGenerateColumns="False" 
                        Font-Names="Times New Roman">
                        <Columns>
                            <asp:TemplateField HeaderText="STT(No)"> <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate></asp:TemplateField>
                            <asp:BoundField DataField="HoSoYeuCau" 
                                HeaderText="Hồ sơ yêu cầu (Docs requested)" />
                            <asp:BoundField DataField="TinhTrang" 
                                HeaderText="Tình Trạng(Current status)" />
                            <asp:BoundField DataField="PhuongAnDeXuat" 
                                HeaderText="Phương án đề xuất (Proposal)" />
                        </Columns>
                        <HeaderStyle BackColor="#006600" ForeColor="White" HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    &nbsp;</td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%" class="textright">
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    <asp:Label ID="Label71" runat="server" CssClass="lbbold" 
                        Font-Names="Times New Roman" Text="3- Chi Tiết Thiệt Hại/ Loss summary:"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%" class="textright">
                    <asp:Label ID="Label72" runat="server" CssClass="lbbold" 
                        Font-Names="Times New Roman" 
                        Text="4- Phương án tính toán đề xuất/ Basic of Claim Adjustment:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="49%" class="textleft">
                    <asp:GridView ID="gvDanhSachChiTietThietHai1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" Font-Names="Times New Roman" 
                        onpageindexchanging="gvDanhSachChiTietThietHai1_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DienGiai" HeaderText="Diễn giải" />
                            <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="Giá trị khiếu nại" />
                            <asp:BoundField DataField="ChiPhiKhoiPhuc" HeaderText="Chi phí khôi phục" />
                            <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Đề xuất tính toán" />
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" />
                        </Columns>
                        <HeaderStyle BackColor="#006600" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="gvDanhSachChiTietThietHai2" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" Font-Names="Times New Roman" 
                        onpageindexchanging="gvDanhSachChiTietThietHai2_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DienGiai" HeaderText="Diễn giải" />
                            <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="Giá trị khiếu nại" />
                            <asp:BoundField DataField="ThietHaiHopLy" HeaderText="Thiệt hại hợp lý" />
                            <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Đề xuất tính toán" />
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" />
                        </Columns>
                        <HeaderStyle BackColor="#006600" ForeColor="White" />
                    </asp:GridView>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td width="49%" class="textright">
                    <asp:Label ID="lblGiaTriDeXuat" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        
        <br />
        <table align="center" class="style3">
            <tr>
                <td align="center" colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" bgcolor="#CCCCCC" class="textleft" height="20px" width="49%">
                    <asp:Label ID="Label83" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="16px" ForeColor="Black" 
                        Text="GIÁ TRỊ THU HỒI/ SALVAGE :"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td align="left" bgcolor="#CCCCCC" class="textright" height="20px" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold" 
                    width="49%">
                    <%--<asp:Label ID="Label82" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="16px" ForeColor="Black" 
                        Text="ĐỀ XUẤT BỒI THƯỜNG/ CLAIM SUMMARY:"></asp:Label>--%>ĐỀ XUẤT BỒI 
                    THƯỜNG/ CLAIM SUMMARY:
                </td>
            </tr>
            <tr>
                <td class="textleft" width="49%">
                    <asp:Label ID="lblGiaTriThuHoi" runat="server"></asp:Label>
                    <br />
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    <asp:GridView ID="gvDeXuatBoiThuong" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" Font-Names="Times New Roman" 
                        onpageindexchanging="gvDeXuatBoiThuong_PageIndexChanging" 
                        onrowdatabound="gvDeXuatBoiThuong_RowDataBound" ShowFooter="True" Width="49%">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DienGiai" HeaderText="Diễn Giải( Description)">
                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GiaTriKhieuNai" 
                                HeaderText="Giá trị khiếu nại(Claim amount)">
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DeXuatTinhToan" 
                                HeaderText="Đề xuất tính toán( Claim Adjusterment)">
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <HeaderStyle BackColor="#006600" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="textleft" width="49%">
                    &nbsp;</td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#CCCCCC" class="textleft" width="49%">
                    <asp:Label ID="Label81" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="16px" ForeColor="Black" 
                        Text="KẾT LUẬN "></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="textleft" width="49%">
                    <asp:Label ID="lblKetLuan" runat="server"></asp:Label>
                </td>
                <td width="2%">
                    &nbsp;</td>
                <td class="textright" width="49%">
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
   
</asp:Content>
