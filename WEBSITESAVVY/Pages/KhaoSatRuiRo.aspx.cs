using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
namespace WEBSITESAVVY
{
    public partial class KhaoSatRuiRo : System.Web.UI.Page
    {
        KhaoSatRuiRoDTO ksrrdto = new KhaoSatRuiRoDTO();
        KhaoSatRuiRoDAO ksrrdao = new KhaoSatRuiRoDAO();
        MoTaKhuVuDTO mtkvdto = new MoTaKhuVuDTO();
        MoTaKhuVucDAO mtkvdao = new MoTaKhuVucDAO();
        QuanLyHutThuocDAO qlhtdao = new QuanLyHutThuocDAO();
        QuanLyHutThuocDTO qlhtdto = new QuanLyHutThuocDTO();
        QuanLyKhoDTO qlkdto = new QuanLyKhoDTO();
        QuanLyKhoDAO qlkdao = new QuanLyKhoDAO();
        CongTacAnNinhDTO ctandto = new CongTacAnNinhDTO();
        CongTacAnNinhDAO ctandao = new CongTacAnNinhDAO();
        CongTacPhongChayDTO ctpccdto = new CongTacPhongChayDTO();
        CongTacPhongChuaChayDAO ctpccdao = new CongTacPhongChuaChayDAO();
        NhanDienRuiRoDTO ndrrdto = new NhanDienRuiRoDTO();
        NhanDienRuiRoDAO ndrrdao = new NhanDienRuiRoDAO();
        public string maThamChieu = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    load_DropDownlist();
                    ClaimDAO cldao = new ClaimDAO();
                    string ma = cldao.LayMa();
                    lblSTT.Text = ma;
                    int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                    load_DonViBaoHiem(maNhaBH);
                    load_SLGDV();
                }
                //ThemQLHutThuoc();
            }
        }
        void load_DropDownlist()
        {
            if (!this.IsPostBack)
            {
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                DataTable dt = gdv.DanhSachGiamDinhVien();
                drGDV1.DataSource = dt;
                drGDV1.DataValueField = "ID_GDV";
                drGDV1.DataTextField = "TenGDV";
                drGDV1.DataBind();

                drGDV2.DataSource = dt;
                drGDV2.DataValueField = "ID_GDV";
                drGDV2.DataTextField = "TenGDV";
                drGDV2.DataBind();

                drGDV3.DataSource = dt;
                drGDV3.DataValueField = "ID_GDV";
                drGDV3.DataTextField = "TenGDV";
                drGDV3.DataBind();

                drGDV4.DataSource = dt;
                drGDV4.DataValueField = "ID_GDV";
                drGDV4.DataTextField = "TenGDV";
                drGDV4.DataBind();
                //các công ty tổng nha bao hiem
                NhaBHDAO nbhdao = new NhaBHDAO();
                drNBH.DataSource = nbhdao.DSCongTyTong();
                drNBH.DataValueField = "ID_NhaBH";
                drNBH.DataTextField = "TenNhaBH";
                drNBH.DataBind();
            }
        }
        void load_DonViBaoHiem(int maNhaBH)
        {
            if (!IsPostBack)
            {
                DonViBHDAO dvbhdao = new DonViBHDAO();
                drDVBH.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
                drDVBH.DataValueField = "ID_DonVi";
                drDVBH.DataTextField = "TenDonVi";
                drDVBH.DataBind();
            }
        }
        void load_SLGDV()
        {
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 1)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = false;
                drGDV2.Visible = false;
                lbGDV3.Visible = false;
                drGDV3.Visible = false;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 2)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = false;
                drGDV3.Visible = false;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 3)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = true;
                drGDV3.Visible = true;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 4)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = true;
                drGDV3.Visible = true;
                lbGDV4.Visible = true;
                drGDV4.Visible = true;
            }
        }
        protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DonViBHDAO dvbhdao = new DonViBHDAO();
            int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
            drDVBH.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
            drDVBH.DataValueField = "ID_DonVi";
            drDVBH.DataTextField = "TenDonVi";
            drDVBH.DataBind();
        }

        protected void drSoLuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_SLGDV();
        }

        protected void btn_ThemBH_Click(object sender, EventArgs e)
        {
            try
            {
                int soluong = int.Parse(drSoLuong.SelectedItem.Value.ToString());
                if (soluong == 1)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = 0;
                    ksrrdto.MaGDV3 = 0;
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 2)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = 0;
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 3)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = int.Parse(drGDV3.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 4)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = int.Parse(drGDV3.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV4 = int.Parse(drGDV4.SelectedItem.Value.ToString());
                }
                ksrrdto.ThamChieu = txtThamChieu.Text;
                ksrrdto.Id_DonViBaoHiem = int.Parse(drDVBH.SelectedItem.Value.ToString());
                //ksrrdto.BatDauHieuLuc = txtBDHieuLuc.Text;
                //ksrrdto.KetThucHieuLuc = txtKTHieuLuc.Text;
                ksrrdto.HieuLuc = txtBDHieuLuc.Text + " - " + txtKTHieuLuc.Text;
                ksrrdto.SoHDBH = txtSoHDBH.Text;
                ksrrdto.NguoiDuocBH = txtNguoiDuocBH.Text;
                ksrrdto.DiaChi = txtDiaChi.Text;
                ksrrdto.Fax = txtSoFax.Text;
                ksrrdto.NguoiLienHe = txtNguoiLienHe.Text;
                ksrrdto.DienThoai = txtDienThoai.Text;
                ksrrdto.Email = txtEmail.Text;
                ksrrdao.KhaoSatRuiRoMoi(ksrrdto);
                
                lblThongBaoBaoHiem.Text = "Tiếp tục  ở 'Tab' kế bên !";
            }
            catch(Exception ex)
            { 
                Response.Write(ex.Message);
                lblThongBaoBaoHiem.Text = ex.Message;
            }
        }

        protected void btnCapNhatMoTaKhuVuc_Click(object sender, EventArgs e)
        {
            try
            {
                maThamChieu = txtThamChieu.Text;
                int maKSRR = ksrrdao.LayMaKhaoSatRuiRo(maThamChieu);
                mtkvdto.Id = maKSRR;
                mtkvdto.TenKV1 = txtTenKV1.Text;
                mtkvdto.TenKV2 = txtTenKV2.Text;
                mtkvdto.TenKV3 = txtTenKV3.Text;
                mtkvdto.NamXD_ThueKV1 = int.Parse(txtNamXDKV1.Text);
                mtkvdto.NamXD_ThueKV2 = int.Parse(txtNamXDKV2.Text);
                mtkvdto.NamXD_ThueKV3 = int.Parse(txtNamXDKV3.Text);
                mtkvdto.HienTrangKV1 = txtHienTrangKV1.Text;
                mtkvdto.HienTrangKV2 = txtHienTrangKV2.Text;
                mtkvdto.HienTrangKV3 = txtHienTrangKV3.Text;
                mtkvdto.SoLau_ChieuCaoKV1 = txtSoLauChieuCaoKV1.Text;
                mtkvdto.SoLau_ChieuCaoKV2 = txtSoLauChieuCaoKV2.Text;
                mtkvdto.SoLau_ChieuCaoKV3 = txtSoLauChieuCaoKV3.Text;
                mtkvdto.Tuong_VachKV1 = txtTuongVach1.Text;
                mtkvdto.Tuong_VachKV2 = txtTuongVach2.Text;
                mtkvdto.Tuong_VachKV3 = txtTuongVach3.Text;
                mtkvdto.Mai_Tran_SanKV1 = txtMaiTranKV1.Text;
                mtkvdto.Mai_Tran_SanKV2 = txtMaiTranKV2.Text;
                mtkvdto.Mai_Tran_SanKV3 = txtMaiTranKV3.Text;
                mtkvdto.DienTichKV1 = txtDienTichKV1.Text;
                mtkvdto.DienTichKV2 = txtDienTichKV2.Text;
                mtkvdto.DienTichKV3 = txtDienTichKV3.Text;
                mtkvdto.GioHoatDongKV1 = txtGioHoatDongKV1.Text;
                mtkvdto.GioHoatDongKV2 = txtGioHoatDongKV2.Text;
                mtkvdto.GioHoatDongKV3 = txtGioHoatDongKV3.Text;
                mtkvdto.CacMatTiepGiapKV1 = txtCacMatTiepGiapKV1.Text;
                mtkvdto.CacMatTiepGiapKV2 = txtCacMatTiepGiapKV2.Text;
                mtkvdto.CacMatTiepGiapKV3 = txtCacMatTiepGiapKV3.Text;
                mtkvdto.SoLuongHop_VoiChuaChayKV11 = txtSoLuongVoiCCKV1.Text;
                mtkvdto.SoLuongHop_VoiChuaChayKV21 = txtSoLuongVoiCCKV2.Text;
                mtkvdto.SoLuongHop_VoiChuaChayKV31 = txtSoLuongVoiCCKV3.Text;
                mtkvdto.SoLuongBinhChuaChayKV11 = txtSoLuongBCCKV1.Text;
                mtkvdto.SoLuongBinhChuaChayKV21 = txtSoLuongBCCKV2.Text;
                mtkvdto.SoLuongBinhChuaChayKV31 = txtSoLuongBCCKV3.Text;
                mtkvdto.HeThongBaoDongKV11 = txtHeThongBaoChayDongKV1.Text;
                mtkvdto.HeThongBaoDongKV21 = txtHeThongBaoChayDongKV2.Text;
                mtkvdto.HeThongBaoDongKV31 = txtHeThongBaoChayDongKV3.Text;
                mtkvdto.HeThongChuaChayTuDongKV11 = txtHTCCTuDongKV1.Text;
                mtkvdto.HeThongChuaChayTuDongKV21 = txtHTCCTuDongKV2.Text;
                mtkvdto.HeThongChuaChayTuDongKV31 = txtHTCCTuDongKV3.Text;
                mtkvdao.MoTaKhuVucMoi(mtkvdto);
                lblThongBaoMotaKhuVuc.Text = "Tiếp tục ở 'Tab' bên cạnh !";

            }
            catch(Exception ex)
            {
                lblThongBaoMotaKhuVuc.Text=ex.Message;
            }
        }

        protected void btnCapNhatQuyDinhHutThuocLa_Click(object sender, EventArgs e)
        {
            try
            {

                ThemQLHutThuoc();
                lblThongBaoHutThuoc.Text = "Tiếp tục ở 'Tab' kế tiếp !";
            }

            catch (Exception ex)
            {
                lblThongBaoHutThuoc.Text =ex.Message;
            }
        }
        void ThemQLHutThuoc()
        {
            //if (!this.IsPostBack)
            //{
                maThamChieu = txtThamChieu.Text;
                int maKSRR = ksrrdao.LayMaKhaoSatRuiRo(maThamChieu);
                
                qlhtdto.Id = maKSRR;

                if (rdQuyDinhNo.Checked == true)
                {
                    rdQuyDinhYes.Checked = false;
                    //rdQuyDinhYes = null;
                    qlhtdto.ThucHien = rdQuyDinhNo.Text;
                    qlhtdto.NhaKho = rdNhaKhoNo.Text;
                    qlhtdto.SanXuat = "No";
                    qlhtdto.Khac = "No";

                    //lblNhungKVALL.Visible = false;
                    //lblNhaKho.Visible = false;
                    //lblSX.Visible = false;
                    //lblKhac.Visible = false;
                    //rdNhaKhoNo.Visible = false;
                    //rdNhaKhoYes.Visible = false;
                    //rdKhuSXNo.Visible = false;
                    //rdKhuSXYes.Visible = false;
                    //rdKhuvucKhacNo.Visible = false;
                    //rdKhuvucKhacYes.Visible = false;
                }
                if (rdQuyDinhYes.Checked == true)
                {
                    //rdQuyDinhNo = null;
                    rdQuyDinhNo.Checked = false;
                    string quydinh = rdQuyDinhYes.Text;
                    qlhtdto.ThucHien =quydinh ;

                    if (rdNhaKhoNo.Checked == true)
                    {
                        rdNhaKhoYes.Checked = false;
                        qlhtdto.NhaKho = "No";
                    }
                    if (rdNhaKhoYes.Checked == true)
                    {
                        rdNhaKhoNo.Checked = false;
                        qlhtdto.NhaKho = "Yes";
                    }
                    if (rdKhuSXNo.Checked == true)
                    {
                        rdKhuSXYes.Checked = false;
                        qlhtdto.SanXuat = "No";
                    }
                    if (rdKhuSXYes.Checked == true)
                    {
                        rdKhuSXNo.Checked = false;
                        qlhtdto.SanXuat = "Yes";
                    }
                    if (rdKhuvucKhacNo.Checked == true)
                    {
                        rdKhuvucKhacYes.Checked = false;
                        qlhtdto.Khac = "No";
                    }
                    if (rdKhuvucKhacYes.Checked == true)
                    {
                        rdKhuvucKhacNo.Checked = false;
                        qlhtdto.Khac = "Yes";
                    }
                }
                qlhtdto.NhanXet = txtNhanXet.Text;
                qlhtdao.QuanLyHutThuocMoi(qlhtdto);
                
            //}
        }
        protected void rdNhaKhoYes_CheckedChanged(object sender, EventArgs e)
        {
            rdNhaKhoNo.Checked = false;
        }

        protected void rdNhaKhoNo_CheckedChanged(object sender, EventArgs e)
        {
            rdNhaKhoYes.Checked = false;

        }

        protected void rdQuyDinhYes_CheckedChanged(object sender, EventArgs e)
        {
            rdQuyDinhNo.Checked = false;
        }

        protected void rdQuyDinhNo_CheckedChanged(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
                rdQuyDinhYes.Checked = false;
                
            //}
        }

        protected void rdKhuSXYes_CheckedChanged(object sender, EventArgs e)
        {
            rdKhuSXNo.Checked = false;
        }

        protected void rdKhuSXNo_CheckedChanged(object sender, EventArgs e)
        {
            rdKhuSXYes.Checked = false;
        }

        protected void rdKhuvucKhacYes_CheckedChanged(object sender, EventArgs e)
        {
            rdKhuvucKhacNo.Checked = false;
        }

        protected void rdKhuvucKhacNo_CheckedChanged(object sender, EventArgs e)
        {
            rdKhuvucKhacYes.Checked = false;
        }

        protected void btnCapNhatQuanLyKho_Click(object sender, EventArgs e)
        {
            try
            {
                int maRR = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                qlkdto.Id = maRR;
                string luutru = null;
                if (ckTrenSan.Checked == true)
                    luutru = "Trên sàn";
                if (ckTrenPallet.Checked == true)
                    luutru = "Trên Pallet";
                if (ckTrenKe.Checked == true)
                    luutru = "Trên kệ hoặc trên cao";
                if (ckCachKhac.Checked == true)
                    luutru = "Cách khác";
                qlkdto.Luutru = luutru;
                qlkdto.MoTa = txtMoTa.Text;
                qlkdto.ChieuCaoChatHang = txtChieuCaoChatHang.Text;
                qlkdto.ChieuCaoNhaKho = txtChieuCaoNhaKho.Text;
                qlkdto.VatDung = txtVatDung.Text;
                qlkdto.VatLieuDeChay = txtVatLieuDeChay.Text;
                qlkdao.QuanLyKhoMoi(qlkdto);
                lblThongBaoQuanLyKho.Text = "Tiếp tục ở 'Tab' kế bên! ";
            }
            catch (Exception ex)
            {
                lblThongBaoQuanLyKho.Text =ex.Message;
            }
        }

        protected void btnCapNhatCongTacPCCC_Click(object sender, EventArgs e)
        {
            try
            {
                int id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                ctpccdto.Id = id;
                string capnuoccc = null;
                if (rdYes.Checked == true)
                    capnuoccc = "Có cung cấp nước chữa cháy bằng tháp(giếng) ";
                if (rdNo.Checked == true)
                    capnuoccc = "Không cung cấp nước chữa cháy";
                ctpccdto.CapNuocChuaChay = capnuoccc;
                ctpccdto.SoLuong = txtSoLuong.Text;
                if (rdHuanLuyenYes.Checked == true)
                    ctpccdto.HuaLuyenPCCC = "Có huấn luyện";
                if (rdHuanLuyenNo.Checked == true)
                    ctpccdto.HuaLuyenPCCC = "Không huấn luyện";
                ctpccdto.TongSo = int.Parse(txtTongSo.Text);
                ctpccdto.ThuongTruc = int.Parse(txtThuongTruc.Text);
                if (rdDuoi5Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Dưới 5Km ";
                if (rdDuoi10Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Dưới 10Km";
                if (rdTren10Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Trên 10km " + txtMoTaKhoangCachPCCC.Text;
                if (rdLapDatHTCCTDYes.Checked == true)
                {
                    ctpccdto.HeThongCCTuDong = "Có lắp đặt hệ thống chữa cháy tự động.";
                    ctpccdto.MucDoPhu = "Không có";
                    ctpccdto.MoTaThem = txtMotaThemDoPhu.Text;

                }
                if (rdLapDatHTCCTDYNo.Checked == true)
                {
                    ctpccdto.HeThongCCTuDong = "Không lắp đặt hệ thống chữa cháy tự động.";
                    if (rd75.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 75%";
                    if (rd50.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 50%";
                    if (rd25.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 25%";
                    ctpccdto.MoTaThem = txtMotaThemDoPhu.Text;


                }
                if (rdBaotriHTCCYes.Checked == true)
                {
                    ctpccdto.DonViDocLap = "Có bảo trì định kỳ " + txtMoTaThemBaoTriCCTD.Text;
                }
                if (rdBaotriHTCCNo.Checked == true)
                    ctpccdto.DonViDocLap = "Không bảo trì định kỳ " + txtMoTaThemBaoTriCCTD.Text;
                if (rdTinhTrangHTCCTDYes.Checked == true)
                    ctpccdto.TinhTrang = "Bị cản trở " + txtMoTaThemTinhTrangHTCCTD.Text;
                if (rdTinhTrangHTCCTDNo.Checked == true)
                    ctpccdto.TinhTrang = "Không bị cản trở " + txtMoTaThemTinhTrangHTCCTD.Text;
                if (rdChieuDaiVoiNuocNo.Checked == true)
                    ctpccdto.ChieuDaiVoiNuoc = "Không đủ tầm " + txtMoTaThemChieuDaiVoiNuoc.Text;
                if (rdChieuDaiVoiNuocYes.Checked == true)
                    ctpccdto.ChieuDaiVoiNuoc = "Đủ tầm" + txtMoTaThemChieuDaiVoiNuoc.Text;
                if (rdheThongBaoChayYes.Checked == true)
                    ctpccdto.HeThongBaoChay = "Có trang bị." + txtMoTaHeThongBaoChay.Text;
                if (rdheThongBaoChayNo.Checked == true)
                {
                    ctpccdto.HeThongBaoChay = "Không có trang bị.";
                }
                ctpccdto.TinhTrangThietBi = "Theo tiêu chuẩn: " + txtTieuChuan.Text;
                ctpccdto.SoLuongBinhCC = int.Parse(txtSoLuongCC.Text);
                if (rdCCTreoTuongYes.Checked == true)
                    ctpccdto.CCTreoTuong = "Có treo tường.";
                if (rdCCTreoTuongNo.Checked == true)
                    ctpccdto.CCTreoTuong = "Không treo tường.";
                if (rdChuongNgaiVatYes.Checked == true)
                    ctpccdto.ChuongNgaiVat = "Có cản trở";
                if (rdChuongNgaiVatNo.Checked == true)
                    ctpccdto.ChuongNgaiVat = "Không cản trở";
                ctpccdao.CongTacPhongChuaChayMoi(ctpccdto);
                lblThongBaoCongTacCC.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch (Exception ex)
            {
                lblThongBaoCongTacCC.Text = ex.Message;
            }

        } 

        protected void rdNo_CheckedChanged(object sender, EventArgs e)
        {
            rdYes.Checked = false;
        }

        protected void rdYes_CheckedChanged(object sender, EventArgs e)
        {
            rdNo.Checked = false;
        }

        protected void rdHuanLuyenYes_CheckedChanged(object sender, EventArgs e)
        {
            rdHuanLuyenNo.Checked = false;
        }

        protected void rdHuanLuyenNo_CheckedChanged(object sender, EventArgs e)
        {
            rdHuanLuyenYes.Checked = false;
        }

        protected void rdDuoi5Km_CheckedChanged(object sender, EventArgs e)
        {
            rdDuoi10Km.Checked = false;
            rdTren10Km.Checked = false;
        }

        protected void rdDuoi10Km_CheckedChanged(object sender, EventArgs e)
        {
            rdDuoi5Km.Checked = false;
            rdTren10Km.Checked = false;
        }

        protected void rdTren10Km_CheckedChanged(object sender, EventArgs e)
        {
            rdDuoi5Km.Checked = false;
            rdDuoi10Km.Checked = false;
        }

        protected void rdLapDatHTCCTDYes_CheckedChanged(object sender, EventArgs e)
        {
            rdLapDatHTCCTDYNo.Checked = false;
        }

        protected void rdLapDatHTCCTDYNo_CheckedChanged(object sender, EventArgs e)
        {
            rdLapDatHTCCTDYes.Checked = false;
        }

        protected void rd75_CheckedChanged(object sender, EventArgs e)
        {
            rd25.Checked = false;
            rd50.Checked = false;
            rdMoTaThem.Checked = false;
        }

        protected void rd50_CheckedChanged(object sender, EventArgs e)
        {
            rd75.Checked = false;
            rd25.Checked = false;
            rdMoTaThem.Checked = false;
        }

        protected void rd25_CheckedChanged(object sender, EventArgs e)
        {
            rd75.Checked = false;
            rd50.Checked = false;
            rdMoTaThem.Checked = false;
        }

        protected void rdMoTaThem_CheckedChanged(object sender, EventArgs e)
        {
            rd75.Checked = false;
            rd50.Checked = false;
            rd25.Checked = false;
        }

        protected void rdBaotriHTCCYes_CheckedChanged(object sender, EventArgs e)
        {
            rdBaotriHTCCNo.Checked = false;
        }

        protected void rdBaotriHTCCNo_CheckedChanged(object sender, EventArgs e)
        {
            rdBaotriHTCCYes.Checked = false;
        }

        protected void rdTinhTrangHTCCTDYes_CheckedChanged(object sender, EventArgs e)
        {
            rdTinhTrangHTCCTDNo.Checked = false;
        }

        protected void rdTinhTrangHTCCTDNo_CheckedChanged(object sender, EventArgs e)
        {
            rdTinhTrangHTCCTDYes.Checked = false;
        }

        protected void rdChieuDaiVoiNuocYes_CheckedChanged(object sender, EventArgs e)
        {
            rdChieuDaiVoiNuocNo.Checked = false;
        }

        protected void rdChieuDaiVoiNuocNo_CheckedChanged(object sender, EventArgs e)
        {
            rdChieuDaiVoiNuocYes.Checked = false;
        }

        protected void rdheThongBaoChayYes_CheckedChanged(object sender, EventArgs e)
        {
            rdheThongBaoChayNo.Checked = false;
        }

        protected void rdheThongBaoChayNo_CheckedChanged(object sender, EventArgs e)
        {
            rdheThongBaoChayYes.Checked = false;
        }

        protected void rdCCTreoTuongYes_CheckedChanged(object sender, EventArgs e)
        {
            rdCCTreoTuongNo.Checked = false;

        }

        protected void rdCCTreoTuongNo_CheckedChanged(object sender, EventArgs e)
        {
            rdCCTreoTuongYes.Checked = false;
        }

        protected void rdChuongNgaiVatYes_CheckedChanged(object sender, EventArgs e)
        {
            rdChuongNgaiVatNo.Checked = false;
        }

        protected void rdChuongNgaiVatNo_CheckedChanged(object sender, EventArgs e)
        {
            rdChuongNgaiVatYes.Checked = false;
        }

        protected void rdespYes_CheckedChanged(object sender, EventArgs e)
        {
            rdespNo.Checked = false;
        }

        protected void rdespNo_CheckedChanged(object sender, EventArgs e)
        {
            rdespYes.Checked = false;
        }

        protected void rdGanKeSongYes_CheckedChanged(object sender, EventArgs e)
        {
            rdGanKeSongNo.Checked = false;
        }

        protected void rdGanKeSongNo_CheckedChanged(object sender, EventArgs e)
        {
            rdGanKeSongYes.Checked = false;
        }

        protected void rdBaoTriDinhKyYes_CheckedChanged(object sender, EventArgs e)
        {
            rdBaoTriDinhKyNo.Checked = false;
        }

        protected void rdBaoTriDinhKyNo_CheckedChanged(object sender, EventArgs e)
        {
            rdBaoTriDinhKyYes.Checked = false;
        }

        protected void rdHanCatYes_CheckedChanged(object sender, EventArgs e)
        {
            rdHanCatNo.Checked = false;
        }

        protected void rdHanCatNo_CheckedChanged(object sender, EventArgs e)
        {
            rdHanCatYes.Checked = false;
        }

        protected void rdAnToanCoLapYes_CheckedChanged(object sender, EventArgs e)
        {
            rdAnToanCoLapNo.Checked = false;
        }

        protected void rdAnToanCoLapNo_CheckedChanged(object sender, EventArgs e)
        {
            rdAnToanCoLapYes.Checked = false;
        }

        protected void rdQuiDinhPhatSinhNhietYes_CheckedChanged(object sender, EventArgs e)
        {
            rdQuiDinhPhatSinhNhietNo.Checked = false;
        }

        protected void rdQuiDinhPhatSinhNhietNo_CheckedChanged(object sender, EventArgs e)
        {
            rdQuiDinhPhatSinhNhietYes.Checked = false;
        }

        protected void rdQuiDinhLienQuanPSNYes_CheckedChanged(object sender, EventArgs e)
        {
            rdQuiDinhLienQuanPSNo.Checked = false;
        }

        protected void rdQuiDinhLienQuanPSNo_CheckedChanged(object sender, EventArgs e)
        {
            rdQuiDinhLienQuanPSNYes.Checked = false;
        }

        protected void rdCoNauBepYes_CheckedChanged(object sender, EventArgs e)
        {
            rdCoNauBepNo.Checked = false;
        }

        protected void rdCoNauBepNo_CheckedChanged(object sender, EventArgs e)
        {
            rdCoNauBepYes.Checked = false;
        }

        protected void rdVSPhuHopYes_CheckedChanged(object sender, EventArgs e)
        {
            rdVSPhuHopNo.Checked = false;
        }

        protected void rdVSPhuHopNo_CheckedChanged(object sender, EventArgs e)
        {
            rdVSPhuHopYes.Checked = false;
        }

        protected void btnCapNhatNhanDienRuiRo_Click(object sender, EventArgs e)
        {
            try
            {
                ndrrdto.Id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                if (rdespNo.Checked == true)
                {
                    ndrrdto.Eps = "Không";
                }
                if (rdespYes.Checked == true)
                    ndrrdto.Eps = "Có và diện tích lắp đặt: " + txtESP.Text;
                if (rdGanKeSongNo.Checked == true)
                    ndrrdto.GanNguonNuoc = "Không";
                if (rdGanKeSongYes.Checked == true)
                    ndrrdto.GanNguonNuoc = "Có, Khoảng cách: " + txtKhoangCachBoSong.Text;
                ndrrdto.NgayBaoTriDienGanNhat = txtNgayBaoTriGanNhat.Text;
                if (rdBaoTriDinhKyNo.Checked == true)
                    ndrrdto.DinhKy = "Không";
                if (rdBaoTriDinhKyYes.Checked == true)
                    ndrrdto.DinhKy = "Có";
                ndrrdto.XuLyRac = txtXuLyRacThai.Text;
                if (rdHanCatNo.Checked == true)
                    ndrrdto.HanCat = "Không";
                if (rdHanCatYes.Checked == true)
                {
                    ndrrdto.HanCat = "Có";
                    if (rdAnToanCoLapNo.Checked == true)
                        ndrrdto.HanCat = ndrrdto.HanCat + "Không có quui định an toàn hoặc cô lập khỏi khu vực nguy hiểm";
                    if (rdAnToanCoLapYes.Checked == true)
                        ndrrdto.HanCat = ndrrdto.HanCat + "Có qui định an toàn hoặc cô lập khỏi khu vực nguy hiểm";
                }
                if (rdQuiDinhPhatSinhNhietNo.Checked == true)
                    ndrrdto.QuiDinhPhatSinhNhiet = "Không, " + txtMoTaThemQuiDinhPhatSinhNhiet.Text;
                if (rdQuiDinhPhatSinhNhietYes.Checked == true)
                    ndrrdto.QuiDinhPhatSinhNhiet = "Có, " + txtMoTaThemQuiDinhPhatSinhNhiet.Text;
                if (rdQuiDinhLienQuanPSNYes.Checked == true)
                {
                    ndrrdto.DungCuPhunSon = "Có";
                    ndrrdto.HTThongGio = txtHeThongThongGio.Text;
                    ndrrdto.HTPCCC = txtHTPCCC.Text;
                }
                if (rdQuiDinhLienQuanPSNo.Checked == true)
                {
                    ndrrdto.DungCuPhunSon = "Không";
                    ndrrdto.HTThongGio = "_";
                    ndrrdto.HTPCCC = "_";
                }
                if (rdCoNauBepNo.Checked == true)
                {
                    ndrrdto.NauBep = "Không";

                }
                if (rdCoNauBepYes.Checked == true)
                {
                    ndrrdto.NauBep = "Có, các loại bếp và công suất cụ thể :  " + txtLietKeLoaiBepVaCongSuat.Text;
                }
                if (rdVSPhuHopNo.Checked == true)
                    ndrrdto.VeSinh = "Không, công tác vệ sinh định kỳ: " + txtCongTacVeSinhDinhKy.Text;
                if (rdVSPhuHopYes.Checked == true)
                    ndrrdto.VeSinh = "Có công tác vệ sinh định kỳ: " + txtCongTacVeSinhDinhKy.Text;
                if (rdRatTot.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Rất tốt";
                if (rdTot.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Tốt";
                if (rdVuaPhai.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Vừa phải";
                if (rdChuaPhuHop.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Chưa phù hợp";
                if (rdKhoangCachDuongDayDienNo.Checked == true)
                    ndrrdto.KhoangCach = "Không, " + txtUocTinhKhoangCach.Text;
                if (rdKhoangCachDuongDayDienYes.Checked == true)
                    ndrrdto.KhoangCach = "Có, " + txtUocTinhKhoangCach.Text;
                ndrrdao.NhanDienRuiRoMoi(ndrrdto);
                //lblThongBaoNDRR.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch (Exception ex)
            {
                lblThongBaoNDRR.Text = ex.Message;
            }
        }

        protected void rdLapDatHTBaoTromYes_CheckedChanged(object sender, EventArgs e)
        {
            rdLapDatHTBaoTromNo.Checked = false;
        }

        protected void rdLapDatHTBaoTromNo_CheckedChanged(object sender, EventArgs e)
        {
            rdLapDatHTBaoTromYes.Checked = false;
        }

        protected void rdGiamSatYes_CheckedChanged(object sender, EventArgs e)
        {
            rdGiamSatNo.Checked = false;
        }

        protected void rdGiamSatNo_CheckedChanged(object sender, EventArgs e)
        {
            rdGiamSatYes.Checked = false;
        }

        protected void rdCameraANYes_CheckedChanged(object sender, EventArgs e)
        {
            rdCameraANNo.Checked = false;
        }

        protected void rdCameraANNo_CheckedChanged(object sender, EventArgs e)
        {
            rdCameraANYes.Checked = false;
        }

        protected void rdHDBaoTriYes_CheckedChanged(object sender, EventArgs e)
        {
            rdHDBaoTriNo.Checked = false;
        }

        protected void rdHDBaoTriNo_CheckedChanged(object sender, EventArgs e)
        {
            rdHDBaoTriYes.Checked = false;
        }

        protected void rdKhoaChimCoDinhYes_CheckedChanged(object sender, EventArgs e)
        {
            rdKhoaChimCoDinhNo.Checked = false;
        }

        protected void rdKhoaChimCoDinhNo_CheckedChanged(object sender, EventArgs e)
        {
            rdKhoaChimCoDinhYes.Checked = false;
        }

        protected void rdThietLapKhoaYes_CheckedChanged(object sender, EventArgs e)
        {
            rdThietLapKhoaNo.Checked = false;
        }

        protected void rdThietLapKhoaNo_CheckedChanged(object sender, EventArgs e)
        {
            rdThietLapKhoaYes.Checked = false;
        }

        protected void btnCapNhatCongTacAnNinh_Click(object sender, EventArgs e)
        {
            try
            {
                ctandto.Id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                if (rdLapDatHTBaoTromNo.Checked == true)
                    ctandto.LapDatHTBT = "Không";
                if (rdLapDatHTBaoTromYes.Checked == true)
                    ctandto.LapDatHTBT = "Có";
                if (rdGiamSatNo.Checked == true)
                    ctandto.HoatDongGiamSat = "Không";
                if (rdGiamSatYes.Checked == true)
                    ctandto.HoatDongGiamSat = "Có, " + txtThucHienGiamSat.Text;
                if (rdCameraANNo.Checked == true)
                    ctandto.CameraAnNinh = "Không";
                if (rdCameraANYes.Checked == true)
                    ctandto.CameraAnNinh = "Có, " + txtSoLuongVaBoTri.Text;
                if (rdHDBaoTriNo.Checked == true)
                    ctandto.HopDongBaoTri = "Không";
                if (rdHDBaoTriYes.Checked == true)
                    ctandto.HopDongBaoTri = "Có";
                if (rdKhoaChimCoDinhNo.Checked == true)
                    ctandto.KhoaChim = "Không,Giờ đóng/ mở: " + txtGioMo_DongCua.Text;
                if (rdKhoaChimCoDinhYes.Checked == true)
                {
                    if (rdThietLapKhoaNo.Checked == true)
                        ctandto.KhoaChim = "Có, không có cửa cuốn mô tơ điện" ;
                    if (rdThietLapKhoaYes.Checked == true)
                        ctandto.KhoaChim = "Có, Có thiết lặp cửa cuốn mô-tơ điện ngoài giờ làm việc";
                }
                ctandto.ThietKeKhoaCuaSo = txtDangThietKeCuaSo.Text + ", Giờ đóng/mở: " + txtGioMo_DongCua.Text;
                if (ckBVANNo.Checked == true)
                    ctandto.BaoVe = "Không, " + txtMoTaDonViThueBaoVe.Text;
                if (ckBVANYes.Checked == true)
                    ctandto.BaoVe = "Có, " + txtMoTaDonViThueBaoVe.Text;
                if (ckDVTTNo.Checked == true)
                    ctandto.NguoiThuongTruc = "Không, " + txtMoTaThuongTruc.Text;
                if (ckDVTTYes.Checked == true)
                    ctandto.NguoiThuongTruc = "Có" + txtMoTaThuongTruc.Text;
                ctandao.CongtacAnNinhMoi(ctandto);
                //lblThongBaoCongTacAN.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch(Exception ex)
            {
                lblThongBaoCongTacAN.Text = ex.Message;
            }

        }

        protected void btnCapNhatYKienGDV_Click(object sender, EventArgs e)
        {
            try
            {
                string ykien = ckYKienQuanSatDanhGia.Text;
                string gioBD = txtGioBatDau.Text;
                string gioKT = txtGioKetThuc.Text;
                int ma = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                ksrrdao.CapNhatYkienGDV(ma, ykien, gioBD, gioKT);
                lblThongBaoCapNhatYKienGDV.Text = "Đã hoàn tất khảo sát rủi ro!";
            }
            catch (Exception ex)
            {
                lblThongBaoCapNhatYKienGDV.Text = ex.Message;
            }
        }
        void KhaoSatRuiRoMoi()
        {
            try
            {
                int soluong = int.Parse(drSoLuong.SelectedItem.Value.ToString());
                if (soluong == 1)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = 0;
                    ksrrdto.MaGDV3 = 0;
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 2)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = 0;
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 3)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = int.Parse(drGDV3.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV4 = 0;
                }
                if (soluong == 4)
                {
                    ksrrdto.MaGDV1 = int.Parse(drGDV1.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV2 = int.Parse(drGDV2.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV3 = int.Parse(drGDV3.SelectedItem.Value.ToString());
                    ksrrdto.MaGDV4 = int.Parse(drGDV4.SelectedItem.Value.ToString());
                }
                if (txtThamChieu.Text != null)
                {
                    ksrrdto.ThamChieu = txtThamChieu.Text;
                    ksrrdto.Id_DonViBaoHiem = int.Parse(drDVBH.SelectedItem.Value.ToString());
                    ksrrdto.HieuLuc= txtBDHieuLuc.Text+"-"+txtKTHieuLuc.Text;
                    if (txtSoHDBH.Text != null)
                    {
                        ksrrdto.SoHDBH = txtSoHDBH.Text;
                    }
                    else
                        ksrrdto.SoHDBH = "____";
                    if (txtNguoiDuocBH.Text != null)
                    {
                        ksrrdto.NguoiDuocBH = txtNguoiDuocBH.Text;
                        ksrrdto.DiaChi = txtDiaChi.Text;
                        if (txtSoFax.Text != null)
                        {
                            ksrrdto.Fax = txtSoFax.Text;
                        }
                        else
                            ksrrdto.Fax = "_____";
                        if (txtNguoiLienHe.Text != null)
                        {
                            ksrrdto.NguoiLienHe = txtNguoiLienHe.Text;
                            if (txtDienThoai.Text != null)
                            {
                                ksrrdto.DienThoai = txtDienThoai.Text;
                                if (txtEmail.Text != null)
                                    ksrrdto.Email = txtEmail.Text;
                                else
                                    ksrrdto.Email = "_____";
                                ksrrdao.KhaoSatRuiRoMoi(ksrrdto);

                               // lblThongBaoBaoHiem.Text = "Tiếp tục  ở 'Tab' kế bên !";
                            }
                            else
                                lblThongBaoSoDT.Text = "Chưa có số điện thoại";
                        }
                        else
                            lblThongBaoNguoiLienHe.Text = "Nhập tên người liên hệ";
                    }
                    else
                        lblThongBaoNguoiDuocBH.Text = "Nhập tên NĐBH";
                }
                else
                    lblThongBaoLoiThamChieu.Text = "Phải có tham chiếu";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                lblThongBaoBaoHiem.Text = ex.Message;
            }
        }
        void MoTaKhuVucMoi()
        {
            try
            {
                maThamChieu = txtThamChieu.Text;
                int maKSRR = ksrrdao.LayMaKhaoSatRuiRo(maThamChieu);
                mtkvdto.Id = maKSRR;
                if (txtTenKV1.Text != null)
                {
                    mtkvdto.TenKV1 = txtTenKV1.Text;
                }
                else
                    mtkvdto.TenKV1 = "_____";
                if (txtTenKV2.Text != null)
                    mtkvdto.TenKV2 = txtTenKV2.Text;
                else
                    mtkvdto.TenKV2 = "____";
                if (txtTenKV3.Text != null)
                    mtkvdto.TenKV3 = txtTenKV3.Text;
                else
                    mtkvdto.TenKV3 = "____";
                if (txtNamXDKV1.Text != null)
                    mtkvdto.NamXD_ThueKV1 = int.Parse(txtNamXDKV1.Text);
                else
                    mtkvdto.NamXD_ThueKV1 = 0;
                if (txtNamXDKV2.Text != null)
                    mtkvdto.NamXD_ThueKV2 = int.Parse(txtNamXDKV2.Text);
                else
                    mtkvdto.NamXD_ThueKV2 = 0;
                if (txtNamXDKV3.Text != null)
                    mtkvdto.NamXD_ThueKV3 = int.Parse(txtNamXDKV3.Text);
                else
                    mtkvdto.NamXD_ThueKV3 = 0;
                if (txtHienTrangKV1.Text != null)
                    mtkvdto.HienTrangKV1 = txtHienTrangKV1.Text;
                else
                    mtkvdto.HienTrangKV1 = "_____";
                if (txtHienTrangKV2.Text != null)
                    mtkvdto.HienTrangKV2 = txtHienTrangKV2.Text;
                else
                    mtkvdto.HienTrangKV2 = "_____";
                if (txtHienTrangKV3.Text != null)
                    mtkvdto.HienTrangKV3 = txtHienTrangKV3.Text;
                else
                    mtkvdto.HienTrangKV3 = "_____";
                if (txtSoLauChieuCaoKV1.Text != null)
                    mtkvdto.SoLau_ChieuCaoKV1 = txtSoLauChieuCaoKV1.Text;
                else
                    mtkvdto.SoLau_ChieuCaoKV1 = "_____";
                if (txtSoLauChieuCaoKV2.Text != null)
                    mtkvdto.SoLau_ChieuCaoKV2 = txtSoLauChieuCaoKV2.Text;
                else
                    mtkvdto.SoLau_ChieuCaoKV2 = "_____";
                if (txtSoLauChieuCaoKV3.Text != null)
                    mtkvdto.SoLau_ChieuCaoKV3 = txtSoLauChieuCaoKV3.Text;
                else
                    mtkvdto.SoLau_ChieuCaoKV3 = "_____";
                if (txtTuongVach1.Text != null)
                    mtkvdto.Tuong_VachKV1 = txtTuongVach1.Text;
                else
                    mtkvdto.Tuong_VachKV1 = "_____";
                if (txtTuongVach2.Text != null)
                    mtkvdto.Tuong_VachKV2 = txtTuongVach2.Text;
                else
                    mtkvdto.Tuong_VachKV2 = "_____";
                if (txtTuongVach3.Text != null)
                    mtkvdto.Tuong_VachKV3 = txtTuongVach3.Text;
                else
                    mtkvdto.Tuong_VachKV3 = "_____";
                if (txtMaiTranKV1.Text != null)
                    mtkvdto.Mai_Tran_SanKV1 = txtMaiTranKV1.Text;
                else
                    mtkvdto.Mai_Tran_SanKV1 = "_____";
                if (txtMaiTranKV2.Text != null)
                    mtkvdto.Mai_Tran_SanKV2 = txtMaiTranKV2.Text;
                else
                    mtkvdto.Mai_Tran_SanKV2 = "_____";
                if (txtMaiTranKV3.Text != null)
                    mtkvdto.Mai_Tran_SanKV3 = txtMaiTranKV3.Text;
                else
                    mtkvdto.Mai_Tran_SanKV3 = "_____";
                if (txtDienTichKV1.Text != null)
                    mtkvdto.DienTichKV1 = txtDienTichKV1.Text;
                else
                    mtkvdto.DienTichKV1 = "______";
                if (txtDienTichKV2.Text != null)
                    mtkvdto.DienTichKV2 = txtDienTichKV2.Text;
                else
                    mtkvdto.DienTichKV2 = "_____";
                if (txtDienTichKV3.Text != null)
                    mtkvdto.DienTichKV3 = txtDienTichKV3.Text;
                else
                    mtkvdto.DienTichKV3 = "_____";
                if(txtGioHoatDongKV1.Text!=null)
                    mtkvdto.GioHoatDongKV1 = txtGioHoatDongKV1.Text;
                else
                    mtkvdto.GioHoatDongKV1="_____";
                if (txtGioHoatDongKV2.Text != null)
                    mtkvdto.GioHoatDongKV2 = txtGioHoatDongKV2.Text;
                else
                    mtkvdto.GioHoatDongKV2 = "_____";
                if (txtGioHoatDongKV3.Text != null)
                    mtkvdto.GioHoatDongKV3 = txtGioHoatDongKV3.Text;
                else
                    mtkvdto.GioHoatDongKV3 = "_____";
                if(txtCacMatTiepGiapKV1.Text!=null)
                    mtkvdto.CacMatTiepGiapKV1 = txtCacMatTiepGiapKV1.Text;
                else
                    mtkvdto.CacMatTiepGiapKV1="_____";
                if (txtCacMatTiepGiapKV2.Text != null)
                    mtkvdto.CacMatTiepGiapKV2 = txtCacMatTiepGiapKV2.Text;
                else
                    mtkvdto.CacMatTiepGiapKV2 = "_____";
                if (txtCacMatTiepGiapKV3.Text != null)
                    mtkvdto.CacMatTiepGiapKV3 = txtCacMatTiepGiapKV3.Text;
                else
                    mtkvdto.CacMatTiepGiapKV3 = "_____";
                if (txtSoLuongVoiCCKV1.Text != null)
                    mtkvdto.SoLuongHop_VoiChuaChayKV11 = txtSoLuongVoiCCKV1.Text;
                else
                    mtkvdto.SoLuongHop_VoiChuaChayKV11 = "______";
                if (txtSoLuongVoiCCKV2.Text != null)
                    mtkvdto.SoLuongHop_VoiChuaChayKV21 = txtSoLuongVoiCCKV2.Text;
                else
                    mtkvdto.SoLuongHop_VoiChuaChayKV21 = "_____";
                if (txtSoLuongVoiCCKV3.Text != null)
                    mtkvdto.SoLuongHop_VoiChuaChayKV31 = txtSoLuongVoiCCKV3.Text;
                else
                    mtkvdto.SoLuongHop_VoiChuaChayKV31 = "_____";
                if (txtSoLuongBCCKV1.Text != null)
                    mtkvdto.SoLuongBinhChuaChayKV11 = txtSoLuongBCCKV1.Text;
                else
                    mtkvdto.SoLuongBinhChuaChayKV11 = "_____";
                if (txtSoLuongBCCKV2.Text != null)
                    mtkvdto.SoLuongBinhChuaChayKV21 = txtSoLuongBCCKV2.Text;
                else
                    mtkvdto.SoLuongBinhChuaChayKV21 = "_____";
                if (txtSoLuongBCCKV3.Text != null)
                    mtkvdto.SoLuongBinhChuaChayKV31 = txtSoLuongBCCKV3.Text;
                else
                    mtkvdto.SoLuongBinhChuaChayKV31 = "_____";
                if (txtHeThongBaoChayDongKV1.Text != null)
                    mtkvdto.HeThongBaoDongKV11 = txtHeThongBaoChayDongKV1.Text;
                else
                    mtkvdto.HeThongBaoDongKV11 = "_____";
                if (txtHeThongBaoChayDongKV2.Text != null)
                    mtkvdto.HeThongBaoDongKV21 = txtHeThongBaoChayDongKV2.Text;
                else
                    mtkvdto.HeThongBaoDongKV21 = "_____";
                if (txtHeThongBaoChayDongKV3.Text != null)
                    mtkvdto.HeThongBaoDongKV31 = txtHeThongBaoChayDongKV3.Text;
                else
                    mtkvdto.HeThongBaoDongKV31 = "______";
                if (txtHTCCTuDongKV1.Text != null)
                    mtkvdto.HeThongChuaChayTuDongKV11 = txtHTCCTuDongKV1.Text;
                else
                    mtkvdto.HeThongChuaChayTuDongKV11 = "_____";
                if (txtHTCCTuDongKV2.Text != null)
                    mtkvdto.HeThongChuaChayTuDongKV21 = txtHTCCTuDongKV2.Text;
                else
                    mtkvdto.HeThongChuaChayTuDongKV21 = "_____";
                if (txtHTCCTuDongKV3.Text != null)
                    mtkvdto.HeThongChuaChayTuDongKV31 = txtHTCCTuDongKV3.Text;
                else
                    mtkvdto.HeThongChuaChayTuDongKV31 = "_____";
                mtkvdao.MoTaKhuVucMoi(mtkvdto);
               // lblThongBaoMotaKhuVuc.Text = "Tiếp tục ở 'Tab' bên cạnh !";

            }
            catch (Exception ex)
            {
                lblThongBaoMotaKhuVuc.Text = ex.Message;
            }
        }
        void QuanLyHutThuocMoi()
        {
            try
            {

                ThemQLHutThuoc();
                lblThongBaoHutThuoc.Text = "Tiếp tục ở 'Tab' kế tiếp !";
            }

            catch (Exception ex)
            {
                lblThongBaoHutThuoc.Text = ex.Message;
            }
        }
        void CongTacPCCCMoi()
        {
            try
            {
                int id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                ctpccdto.Id = id;
                string capnuoccc = null;
                if (rdYes.Checked == true)
                    capnuoccc = "Có cung cấp nước chữa cháy bằng tháp(giếng) ";
                if (rdNo.Checked == true)
                    capnuoccc = "Không cung cấp nước chữa cháy";
                ctpccdto.CapNuocChuaChay = capnuoccc;
                ctpccdto.SoLuong = txtSoLuong.Text;
                if (rdHuanLuyenYes.Checked == true)
                    ctpccdto.HuaLuyenPCCC = "Có huấn luyện";
                if (rdHuanLuyenNo.Checked == true)
                    ctpccdto.HuaLuyenPCCC = "Không huấn luyện";
                ctpccdto.TongSo = int.Parse(txtTongSo.Text);
                ctpccdto.ThuongTruc = int.Parse(txtThuongTruc.Text);
                if (rdDuoi5Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Dưới 5Km ";
                if (rdDuoi10Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Dưới 10Km";
                if (rdTren10Km.Checked == true)
                    ctpccdto.KhoangCachTramPCCC = "Trên 10km, " + txtMoTaKhoangCachPCCC.Text;
                if (rdLapDatHTCCTDYes.Checked == true)
                {
                    ctpccdto.HeThongCCTuDong = "Có lắp đặt hệ thống chữa cháy tự động.";
                    ctpccdto.MucDoPhu = "Không có";
                    ctpccdto.MoTaThem = txtMotaThemDoPhu.Text;

                }
                if (rdLapDatHTCCTDYNo.Checked == true)
                {
                    ctpccdto.HeThongCCTuDong = "Không lắp đặt hệ thống chữa cháy tự động.";
                    if (rd75.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 75%";
                    if (rd50.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 50%";
                    if (rd25.Checked == true)
                        ctpccdto.MucDoPhu = "Phủ 25%";
                    ctpccdto.MoTaThem = txtMotaThemDoPhu.Text;


                }
                if (rdBaotriHTCCYes.Checked == true)
                {
                    ctpccdto.DonViDocLap = "Có bảo trì định kỳ " + txtMoTaThemBaoTriCCTD.Text;
                }
                if (rdBaotriHTCCNo.Checked == true)
                    ctpccdto.DonViDocLap = "Không bảo trì định kỳ " + txtMoTaThemBaoTriCCTD.Text;
                if (rdTinhTrangHTCCTDYes.Checked == true)
                    ctpccdto.TinhTrang = "Bị cản trở " + txtMoTaThemTinhTrangHTCCTD.Text;
                if (rdTinhTrangHTCCTDNo.Checked == true)
                    ctpccdto.TinhTrang = "Không bị cản trở " + txtMoTaThemTinhTrangHTCCTD.Text;
                if (rdChieuDaiVoiNuocNo.Checked == true)
                    ctpccdto.ChieuDaiVoiNuoc = "Không đủ tầm " + txtMoTaThemChieuDaiVoiNuoc.Text;
                if (rdChieuDaiVoiNuocYes.Checked == true)
                    ctpccdto.ChieuDaiVoiNuoc = "Đủ tầm" + txtMoTaThemChieuDaiVoiNuoc.Text;
                if (rdheThongBaoChayYes.Checked == true)
                    ctpccdto.HeThongBaoChay = "Có trang bị." + txtMoTaHeThongBaoChay.Text;
                if (rdheThongBaoChayNo.Checked == true)
                {
                    ctpccdto.HeThongBaoChay = "Không có trang bị.";
                }
                ctpccdto.TinhTrangThietBi = "Theo tiêu chuẩn: " + txtTieuChuan.Text;
                ctpccdto.SoLuongBinhCC = int.Parse(txtSoLuongCC.Text);
                if (rdCCTreoTuongYes.Checked == true)
                    ctpccdto.CCTreoTuong = "Có treo tường.";
                if (rdCCTreoTuongNo.Checked == true)
                    ctpccdto.CCTreoTuong = "Không treo tường.";
                if (rdChuongNgaiVatYes.Checked == true)
                    ctpccdto.ChuongNgaiVat = "Có cản trở";
                if (rdChuongNgaiVatNo.Checked == true)
                    ctpccdto.ChuongNgaiVat = "Không cản trở";
                ctpccdao.CongTacPhongChuaChayMoi(ctpccdto);
                //lblThongBaoCongTacCC.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch (Exception ex)
            {
                lblThongBaoCongTacCC.Text = ex.Message;
            }
        }
        void QuanLyKhoMoi()
        {
            try
            {
                int maRR = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                qlkdto.Id = maRR;
                string luutru = null;
                if (ckTrenSan.Checked == true)
                    luutru = "Trên sàn";
                if (ckTrenPallet.Checked == true)
                    luutru = "Trên Pallet";
                if (ckTrenKe.Checked == true)
                    luutru = "Trên kệ hoặc trên cao";
                if (ckCachKhac.Checked == true)
                    luutru = "Cách khác";
                qlkdto.Luutru = luutru;
                if (txtMoTa.Text != null)
                    qlkdto.MoTa = txtMoTa.Text;
                else
                    qlkdto.MoTa = "";
                if (txtChieuCaoChatHang.Text != null)
                    qlkdto.ChieuCaoChatHang = txtChieuCaoChatHang.Text;
                else
                    qlkdto.ChieuCaoChatHang = "";
                if (txtChieuCaoNhaKho.Text != null)
                    qlkdto.ChieuCaoNhaKho = txtChieuCaoNhaKho.Text;
                else
                    qlkdto.ChieuCaoNhaKho = "";
                if (txtVatDung.Text != null)
                    qlkdto.VatDung = txtVatDung.Text;
                else
                    qlkdto.VatDung = "";
                if (txtVatLieuDeChay.Text != null)
                    qlkdto.VatLieuDeChay = txtVatLieuDeChay.Text;
                else
                    qlkdto.VatLieuDeChay = "";
                qlkdao.QuanLyKhoMoi(qlkdto);
                //lblThongBaoQuanLyKho.Text = "Tiếp tục ở 'Tab' kế bên! ";
            }
            catch (Exception ex)
            {
                lblThongBaoQuanLyKho.Text = ex.Message;
            }
        }
        void NhanDienRuiRoMoi()
        {
            try
            {
                ndrrdto.Id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                if (rdespNo.Checked == true)
                {
                    ndrrdto.Eps = "Không";
                }
                if (rdespYes.Checked == true)
                    ndrrdto.Eps = "Có và diện tích lắp đặt: " + txtESP.Text;
                if (rdGanKeSongNo.Checked == true)
                    ndrrdto.GanNguonNuoc = "Không";
                if (rdGanKeSongYes.Checked == true)
                    ndrrdto.GanNguonNuoc = "Có, Khoảng cách: " + txtKhoangCachBoSong.Text;
                ndrrdto.NgayBaoTriDienGanNhat = txtNgayBaoTriGanNhat.Text;
                if (rdBaoTriDinhKyNo.Checked == true)
                    ndrrdto.DinhKy = "Không";
                if (rdBaoTriDinhKyYes.Checked == true)
                    ndrrdto.DinhKy = "Có";
                ndrrdto.XuLyRac = txtXuLyRacThai.Text;
                if (rdHanCatNo.Checked == true)
                    ndrrdto.HanCat = "Không";
                if (rdHanCatYes.Checked == true)
                {
                    ndrrdto.HanCat = "Có";
                    if (rdAnToanCoLapNo.Checked == true)
                        ndrrdto.HanCat = ndrrdto.HanCat + ", Không có quui định an toàn hoặc cô lập khỏi khu vực nguy hiểm";
                    if (rdAnToanCoLapYes.Checked == true)
                        ndrrdto.HanCat = ndrrdto.HanCat + ", Có quui định an toàn hoặc cô lập khỏi khu vực nguy hiểm";

                }
                if (rdQuiDinhPhatSinhNhietNo.Checked == true)
                    ndrrdto.QuiDinhPhatSinhNhiet = "Không, " + txtMoTaThemQuiDinhPhatSinhNhiet.Text;
                if (rdQuiDinhPhatSinhNhietYes.Checked == true)
                    ndrrdto.QuiDinhPhatSinhNhiet = "Có, " + txtMoTaThemQuiDinhPhatSinhNhiet.Text;
                if (rdQuiDinhLienQuanPSNYes.Checked == true)
                {
                    ndrrdto.DungCuPhunSon = "Có";
                    ndrrdto.HTThongGio = txtHeThongThongGio.Text;
                    ndrrdto.HTPCCC = txtHTPCCC.Text;
                }
                if (rdQuiDinhLienQuanPSNo.Checked == true)
                {
                    ndrrdto.DungCuPhunSon = "Không";
                    ndrrdto.HTThongGio = "______";
                    ndrrdto.HTPCCC = "_______";
                }
                if (rdCoNauBepNo.Checked == true)
                {
                    ndrrdto.NauBep = "Không";

                }
                if (rdCoNauBepYes.Checked == true)
                {
                    ndrrdto.NauBep = "Có, các loại bếp và công suất cụ thể :  " + txtLietKeLoaiBepVaCongSuat.Text;
                }
                if (rdVSPhuHopNo.Checked == true)
                    ndrrdto.VeSinh = "Không, công tác vệ sinh định kỳ: " + txtCongTacVeSinhDinhKy.Text;
                if (rdVSPhuHopYes.Checked == true)
                    ndrrdto.VeSinh = "Có công tác vệ sinh định kỳ: " + txtCongTacVeSinhDinhKy.Text;
                if (rdRatTot.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Rất tốt";
                if (rdTot.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Tốt";
                if (rdVuaPhai.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Vừa phải";
                if (rdChuaPhuHop.Checked == true)
                    ndrrdto.DanhGiaCTVS = "Chưa phù hợp";
                if (rdKhoangCachDuongDayDienNo.Checked == true)
                    ndrrdto.KhoangCach = "Không, " + txtUocTinhKhoangCach.Text;
                if (rdKhoangCachDuongDayDienYes.Checked == true)
                    ndrrdto.KhoangCach = "Có, " + txtUocTinhKhoangCach.Text;
                ndrrdao.NhanDienRuiRoMoi(ndrrdto);
                //lblThongBaoNDRR.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch (Exception ex)
            {
                lblThongBaoNDRR.Text = ex.Message;
            }
        }
        void CongTacAnNinhMoi()
        {
            try
            {
                ctandto.Id = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                if (rdLapDatHTBaoTromNo.Checked == true)
                    ctandto.LapDatHTBT = "Không";
                if (rdLapDatHTBaoTromYes.Checked == true)
                    ctandto.LapDatHTBT = "Có";
                if (rdGiamSatNo.Checked == true)
                    ctandto.HoatDongGiamSat = "Không";
                if (rdGiamSatYes.Checked == true)
                    ctandto.HoatDongGiamSat = "Có, " + txtThucHienGiamSat.Text;
                if (rdCameraANNo.Checked == true)
                    ctandto.CameraAnNinh = "Không";
                if (rdCameraANYes.Checked == true)
                    ctandto.CameraAnNinh = "Có, " + txtSoLuongVaBoTri.Text;
                if (rdHDBaoTriNo.Checked == true)
                    ctandto.HopDongBaoTri = "Không";
                if (rdHDBaoTriYes.Checked == true)
                    ctandto.HopDongBaoTri = "Có";
                if (rdKhoaChimCoDinhNo.Checked == true)
                    ctandto.KhoaChim = "Không, Giờ đóng/ mở: " + txtGioMo_DongCua.Text;
                if (rdKhoaChimCoDinhYes.Checked == true)
                {
                    if (rdThietLapKhoaNo.Checked == true)
                        ctandto.KhoaChim = "Có, không có cửa cuốn mô tơ điện";
                    if (rdThietLapKhoaYes.Checked == true)
                        ctandto.KhoaChim = "Có, Có thiết lặp cửa cuốn mô-tơ điện ngoài giờ làm việc";
                }
                ctandto.ThietKeKhoaCuaSo = txtDangThietKeCuaSo.Text + "Giờ đóng/mở: " + txtGioMo_DongCua.Text;
                if (ckBVANNo.Checked == true)
                    ctandto.BaoVe = "Không, " + txtMoTaDonViThueBaoVe.Text;
                if (ckBVANYes.Checked == true)
                    ctandto.BaoVe = "Có, " + txtMoTaDonViThueBaoVe.Text;
                if (ckDVTTNo.Checked == true)
                    ctandto.NguoiThuongTruc = "Không, " + txtMoTaThuongTruc.Text;
                if (ckDVTTYes.Checked == true)
                    ctandto.NguoiThuongTruc = "Có" + txtMoTaThuongTruc.Text;
                ctandao.CongtacAnNinhMoi(ctandto);
               // lblThongBaoCongTacAN.Text = "Tiếp tục ở 'Tab' kế bên.";
            }
            catch (Exception ex)
            {
                lblThongBaoCongTacAN.Text = ex.Message;
            }
        }
        void CapNhatYKienGiamDinhVien()
        {
            try
            {
                string ykien;
                if(ckYKienQuanSatDanhGia.Text!=null)
                    ykien=ckYKienQuanSatDanhGia.Text;
                else
                    ykien="";
                string gioBD;
                if (txtGioBatDau.Text != null)
                    gioBD = txtGioBatDau.Text;
                else
                    gioBD = "";
                string gioKT;
                if (txtGioKetThuc.Text != null)
                    gioKT = txtGioKetThuc.Text;
                else
                    gioKT = "";
                int ma = ksrrdao.LayMaKhaoSatRuiRo(txtThamChieu.Text);
                ksrrdao.CapNhatYkienGDV(ma, ykien, gioBD, gioKT);
                lblThongBaoCapNhatYKienGDV.Text = "Đã hoàn tất khảo sát rủi ro!";
            }
            catch (Exception ex)
            {
                lblThongBaoCapNhatYKienGDV.Text = ex.Message;
            }
        }
        void KhachHangMoiTuKhaoSatRuiRo()
        {
            try
            {
                KhachHangDTO khdto = new KhachHangDTO();
                KhachHangDAO khdao = new KhachHangDAO();
                if (txtNguoiDuocBH.Text != null)
                    khdto.TenKhachHang = txtNguoiDuocBH.Text;
                else
                    khdto.TenKhachHang = "";
                if (txtNguoiLienHe.Text != null)
                    khdto.TenNguoiDaiDien = txtNguoiLienHe.Text;
                else
                    khdto.TenNguoiDaiDien = "";
                if (txtSoFax.Text != null)
                    khdto.Fax = txtSoFax.Text;
                else
                    khdto.Fax = "";
                if (txtDienThoai.Text != null)
                    khdto.DienThoai = txtDienThoai.Text;
                else
                    khdto.DienThoai = "";
                if (txtDiaChi.Text != null)
                    khdto.DiaChi = txtDiaChi.Text;
                else
                    khdto.DiaChi = "";
                if (txtEmail.Text != null)
                    khdto.Email = txtEmail.Text;
                else
                    khdto.Email = "";
                khdto.ChucVu = "__";
                khdto.MaLoaiKhachHang = 1;
                khdto.MaLVKD = 7;
                khdao.KhachHangMoi(khdto);
            }
            catch (Exception ex)
            {
                lblThongBaoCapNhatYKienGDV.Text = ex.Message;
            }
        }
        protected void btnKhaoSatRuiRoMoi_Click(object sender, EventArgs e)
        {
            KhaoSatRuiRoMoi();
            MoTaKhuVucMoi();
            QuanLyHutThuocMoi();
            QuanLyKhoMoi();
            CongTacPCCCMoi();
            NhanDienRuiRoMoi();
            CongTacAnNinhMoi();
            CapNhatYKienGiamDinhVien();
            KhachHangMoiTuKhaoSatRuiRo();
        }

       






      
    }
}