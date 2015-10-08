using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class ClaimDTO
    {
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private string tenClaim;

        public string TenClaim
        {
            get { return tenClaim; }
            set { tenClaim = value; }
        }
        private int maGDV1;

        public int MaGDV1
        {
            get { return maGDV1; }
            set { maGDV1 = value; }
        }
        private int maDonVi;

        public int MaDonVi
        {
            get { return maDonVi; }
            set { maDonVi = value; }
        }
        private int maKhachHang;

        public int MaKhachHang
        {
            get { return maKhachHang; }
            set { maKhachHang = value; }
        }

        private string policyNo;

        public string PolicyNo
        {
            get { return policyNo; }
            set { policyNo = value; }
        }
        private string effective;

        public string Effective
        {
            get { return effective; }
            set { effective = value; }
        }
        private string premises;

        public string Premises
        {
            get { return premises; }
            set { premises = value; }
        }
        private string dol;

        public string Dol
        {
            get { return dol; }
            set { dol = value; }
        }
        private int maloaiHinhTonThat;

        public int MaloaiHinhTonThat
        {
            get { return maloaiHinhTonThat; }
            set { maloaiHinhTonThat = value; }
        }
        private string ghiChu;

        public string GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }
        private string assignedDate;

        public string AssignedDate
        {
            get { return assignedDate; }
            set { assignedDate = value; }
        }
        private string a1;

        public string A1
        {
            get { return a1; }
            set { a1 = value; }
        }
        private string a2;

        public string A2
        {
            get { return a2; }
            set { a2 = value; }
        }
        private string b1;

        public string B1
        {
            get { return b1; }
            set { b1 = value; }
        }
        private string b2;

        public string B2
        {
            get { return b2; }
            set { b2 = value; }
        }
        private string c1;

        public string C1
        {
            get { return c1; }
            set { c1 = value; }
        }
        private string c2;

        public string C2
        {
            get { return c2; }
            set { c2 = value; }
        }
        private string c3;

        public string C3
        {
            get { return c3; }
            set { c3 = value; }
        }
        private string d1;

        public string D1
        {
            get { return d1; }
            set { d1 = value; }
        }
        private string d2;

        public string D2
        {
            get { return d2; }
            set { d2 = value; }
        }
        private string e1;

        public string E1
        {
            get { return e1; }
            set { e1 = value; }
        }
        private string e2;

        public string E2
        {
            get { return e2; }
            set { e2 = value; }
        }
        private string f1;

        public string F1
        {
            get { return f1; }
            set { f1 = value; }
        }
        private string f2;

        public string F2
        {
            get { return f2; }
            set { f2 = value; }
        }
        private string g;

        public string G
        {
            get { return g; }
            set { g = value; }
        }
        private string h;

        public string H
        {
            get { return h; }
            set { h = value; }
        }
        private string i;

        public string I
        {
            get { return i; }
            set { i = value; }
        }
        private string k;

        public string K
        {
            get { return k; }
            set { k = value; }
        }
        private int maSummary;

        public int MaSummary
        {
            get { return maSummary; }
            set { maSummary = value; }
        }
        private string ngayBatDauGiamDinh;

        public string NgayBatDauGiamDinh
        {
            get { return ngayBatDauGiamDinh; }
            set { ngayBatDauGiamDinh = value; }
        }
        private int giaiDoanHinhThanh;

        public int GiaiDoanHinhThanh
        {
            get { return giaiDoanHinhThanh; }
            set { giaiDoanHinhThanh = value; }
        }
        private string nguoiPhuTrach;

        public string NguoiPhuTrach
        {
            get { return nguoiPhuTrach; }
            set { nguoiPhuTrach = value; }
        }
        private string typePolicy;

        public string TypePolicy
        {
            get { return typePolicy; }
            set { typePolicy = value; }
        }
        private string brief;

        public string Brief
        {
            get { return brief; }
            set { brief = value; }
        }
        private string lossHistory;

        public string LossHistory
        {
            get { return lossHistory; }
            set { lossHistory = value; }
        }
        private string dienBienTonThat;

        public string DienBienTonThat1
        {
            get { return dienBienTonThat; }
            set { dienBienTonThat = value; }
        }
        private string thongBaoCQCN;

        public string ThongBaoCQCN1
        {
            get { return thongBaoCQCN; }
            set { thongBaoCQCN = value; }
        }
        private string ghiChuTBCQCN;

        public string GhiChuTBCQCN
        {
            get { return ghiChuTBCQCN; }
            set { ghiChuTBCQCN = value; }
        }
        private string phamViTonThat;

        public string PhamViTonThat
        {
            get { return phamViTonThat; }
            set { phamViTonThat = value; }
        }
        private string duPhongTonThat;

        public string DuPhongTonThat
        {
            get { return duPhongTonThat; }
            set { duPhongTonThat = value; }
        }
        private string phuLucDinhKem;

        public string PhuLucDinhKem1
        {
            get { return phuLucDinhKem; }
            set { phuLucDinhKem = value; }
        }
        private string dePhongVaKhuyenCao;

        public string DePhongVaKhuyenCao
        {
            get { return dePhongVaKhuyenCao; }
            set { dePhongVaKhuyenCao = value; }
        }
        private string yKienGDV;

        public string YKienGDV
        {
            get { return yKienGDV; }
            set { yKienGDV = value; }
        }
        private string gioKhaoSatHienTruong;

        public string GioKhaoSatHienTruong
        {
            get { return gioKhaoSatHienTruong; }
            set { gioKhaoSatHienTruong = value; }
        }
        private int rate;

        public int Rate
        {
            get { return rate; }
            set { rate = value; }
        }
        private string docs;

        public string Docs
        {
            get { return docs; }
            set { docs = value; }
        }
        private string discuss;

        public string Discuss
        {
            get { return discuss; }
            set { discuss = value; }
        }
        private string follower;

        public string Follower
        {
            get { return follower; }
            set { follower = value; }
        }
        private string gioiThieuNDBH;

        public string GioiThieuNDBH
        {
            get { return gioiThieuNDBH; }
            set { gioiThieuNDBH = value; }
        }
        private string baoCaoTruoc;

        public string BaoCaoTruoc
        {
            get { return baoCaoTruoc; }
            set { baoCaoTruoc = value; }
        }
        private string sortCause;

        public string SortCause
        {
            get { return sortCause; }
            set { sortCause = value; }
        }
        private string sumInsured;

        public string SumInsured
        {
            get { return sumInsured; }
            set { sumInsured = value; }
        }
        private string mucMienThuong;

        public string MucMienThuong
        {
            get { return mucMienThuong; }
            set { mucMienThuong = value; }
        }
        private string dKBS;

        public string DKBS
        {
            get { return dKBS; }
            set { dKBS = value; }
        }
        private string khieuNai;

        public string KhieuNai
        {
            get { return khieuNai; }
            set { khieuNai = value; }
        }
        private string dieuChinh;

        public string DieuChinh
        {
            get { return dieuChinh; }
            set { dieuChinh = value; }
        }
        private string truMienThuong;

        public string TruMienThuong
        {
            get { return truMienThuong; }
            set { truMienThuong = value; }
        }
        private string boiThuong;

        public string BoiThuong
        {
            get { return boiThuong; }
            set { boiThuong = value; }
        }
        private string executiveSummaryIR;

        public string ExecutiveSummaryIR
        {
            get { return executiveSummaryIR; }
            set { executiveSummaryIR = value; }
        }
        private string executiveSummaryFR;

        public string ExecutiveSummaryFR
        {
            get { return executiveSummaryFR; }
            set { executiveSummaryFR = value; }
        }
        private string namePolicy;

        public string NamePolicy
        {
            get { return namePolicy; }
            set { namePolicy = value; }
        }
        private string iLADATE;

        public string ILADATE
        {
            get { return iLADATE; }
            set { iLADATE = value; }
        }
        private string tamUngBoiThuong;

        public string TamUngBoiThuong
        {
            get { return tamUngBoiThuong; }
            set { tamUngBoiThuong = value; }
        }
        private string tamUngBoiThuongChiTiet;

        public string TamUngBoiThuongChiTiet
        {
            get { return tamUngBoiThuongChiTiet; }
            set { tamUngBoiThuongChiTiet = value; }
        }
        private string tonThatHopLe;

        public string TonThatHopLe
        {
            get { return tonThatHopLe; }
            set { tonThatHopLe = value; }
        }
        private string thietHaiHopLy;

        public string ThietHaiHopLy
        {
            get { return thietHaiHopLy; }
            set { thietHaiHopLy = value; }
        }
        
        private string conclution;

        public string Conclution
        {
            get { return conclution; }
            set { conclution = value; }
        }
        private string baoCaoTruocFR;

        public string BaoCaoTruocFR
        {
            get { return baoCaoTruocFR; }
            set { baoCaoTruocFR = value; }
        }
        #region OldRecord
        private int maGiaiDoanHoanThanh;

        public int MaGiaiDoanHoanThanh
        {
            get { return maGiaiDoanHoanThanh; }
            set { maGiaiDoanHoanThanh = value; }
        }
       
        private string diaDiemTonThat;

        public string DiaDiemTonThat
        {
            get { return diaDiemTonThat; }
            set { diaDiemTonThat = value; }
        }
        private int maHienTrangTonThat;

        public int MaHienTrangTonThat
        {
            get { return maHienTrangTonThat; }
            set { maHienTrangTonThat = value; }
        }
        private int maGDV2;

        public int MaGDV2
        {
            get { return maGDV2; }
            set { maGDV2 = value; }
        }
        private int maGDV3;

        public int MaGDV3
        {
            get { return maGDV3; }
            set { maGDV3 = value; }
        }
        private int maGDV4;

        public int MaGDV4
        {
            get { return maGDV4; }
            set { maGDV4 = value; }
        }
        private string loaiThanhToan;

        public string LoaiThanhToan
        {
            get { return loaiThanhToan; }
            set { loaiThanhToan = value; }
        }
        private string ngayTonThat;

        public string NgayTonThat
        {
            get { return ngayTonThat; }
            set { ngayTonThat = value; }
        }
      

       
        private string ngayBaoCaoDauTien;

        public string NgayBaoCaoDauTien
        {
            get { return ngayBaoCaoDauTien; }
            set { ngayBaoCaoDauTien = value; }
        }

        private string thamChieuHSDinhKem;

        public string ThamChieuHSDinhKem
        {
            get { return thamChieuHSDinhKem; }
            set { thamChieuHSDinhKem = value; }
        }
        private string ngayGioKetThucKS;

        public string NgayGioKetThucKS
        {
            get { return ngayGioKetThucKS; }
            set { ngayGioKetThucKS = value; }
        }

        private string khuyenCaoGDV;

        public string KhuyenCaoGDV
        {
            get { return khuyenCaoGDV; }
            set { khuyenCaoGDV = value; }
        }

        private string uocTinhDuPhong;

        public string UocTinhDuPhong
        {
            get { return uocTinhDuPhong; }
            set { uocTinhDuPhong = value; }
        }
        private float phiGiamDinh;

        public float PhiGiamDinh
        {
            get { return phiGiamDinh; }
            set { phiGiamDinh = value; }
        }
        private int tinhTrangThanhToan;

        public int TinhTrangThanhToan
        {
            get { return tinhTrangThanhToan; }
            set { tinhTrangThanhToan = value; }
        }
        private string yKienGD;

        public string YKienGD
        {
            get { return yKienGD; }
            set { yKienGD = value; }
        }
        private string ngayBCSB;

        public string NgayBCSB
        {
            get { return ngayBCSB; }
            set { ngayBCSB = value; }
        }
        private string ngayBCCC;

        public string NgayBCCC
        {
            get { return ngayBCCC; }
            set { ngayBCCC = value; }
        }
        private string nguyenNhan;

        public string NguyenNhan
        {
            get { return nguyenNhan; }
            set { nguyenNhan = value; }
        }
        private string mucDoTT;

        public string MucDoTT
        {
            get { return mucDoTT; }
            set { mucDoTT = value; }
        }
        private string thongTinHDBH;

        public string ThongTinHDBH
        {
            get { return thongTinHDBH; }
            set { thongTinHDBH = value; }
        }
        private string dieuKhoanBoSung;

        public string DieuKhoanBoSung
        {
            get { return dieuKhoanBoSung; }
            set { dieuKhoanBoSung = value; }
        }
        private string khieuNaiCuaNDBH;

        public string KhieuNaiCuaNDBH
        {
            get { return khieuNaiCuaNDBH; }
            set { khieuNaiCuaNDBH = value; }
        }
        private string duPhongBoiThuong;

        public string DuPhongBoiThuong
        {
            get { return duPhongBoiThuong; }
            set { duPhongBoiThuong = value; }
        }
        private string gioiThieuChung;

        public string GioiThieuChung
        {
            get { return gioiThieuChung; }
            set { gioiThieuChung = value; }
        }
        private string nDBH;

        public string NDBH
        {
            get { return nDBH; }
            set { nDBH = value; }
        }
        private string dienBienChiTiet;

        public string DienBienChiTiet
        {
            get { return dienBienChiTiet; }
            set { dienBienChiTiet = value; }
        }
        private string nguyenNhanChiTiet;

        public string NguyenNhanChiTiet
        {
            get { return nguyenNhanChiTiet; }
            set { nguyenNhanChiTiet = value; }
        }
        private string phamViBH;

        public string PhamViBH
        {
            get { return phamViBH; }
            set { phamViBH = value; }
        }
        private string phamViMucDoThietHai;

        public string PhamViMucDoThietHai
        {
            get { return phamViMucDoThietHai; }
            set { phamViMucDoThietHai = value; }
        }
        private string bienPhapBanDau;

        public string BienPhapBanDau
        {
            get { return bienPhapBanDau; }
            set { bienPhapBanDau = value; }
        }
        private string donBHKhac;

        public string DonBHKhac
        {
            get { return donBHKhac; }
            set { donBHKhac = value; }
        }
        private string giaTriThuHoi;

        public string GiaTriThuHoi
        {
            get { return giaTriThuHoi; }
            set { giaTriThuHoi = value; }
        }
        private string duPhongBoiThuongChiTiet;

        public string DuPhongBoiThuongChiTiet
        {
            get { return duPhongBoiThuongChiTiet; }
            set { duPhongBoiThuongChiTiet = value; }
        }
        private string hoSoBoiThuong;

        public string HoSoBoiThuong
        {
            get { return hoSoBoiThuong; }
            set { hoSoBoiThuong = value; }
        }
        private string khaiQuatVuViecVaCapNhatTienTrinh;

        public string KhaiQuatVuViecVaCapNhatTienTrinh
        {
            get { return khaiQuatVuViecVaCapNhatTienTrinh; }
            set { khaiQuatVuViecVaCapNhatTienTrinh = value; }
        }
        private string trachNhiemCuaNDBH;

        public string TrachNhiemCuaNDBH
        {
            get { return trachNhiemCuaNDBH; }
            set { trachNhiemCuaNDBH = value; }
        }
        private string khieuNaiVaTinhToan;

        public string KhieuNaiVaTinhToan
        {
            get { return khieuNaiVaTinhToan; }
            set { khieuNaiVaTinhToan = value; }
        }
        private string ketLuan;

        public string KetLuan
        {
            get { return ketLuan; }
            set { ketLuan = value; }
        }
        private string tonThatTinhToan;

        public string TonThatTinhToan
        {
            get { return tonThatTinhToan; }
            set { tonThatTinhToan = value; }
        }
        private string truMucMienThuong;

        public string TruMucMienThuong
        {
            get { return truMucMienThuong; }
            set { truMucMienThuong = value; }
        }
        private string deXuatBoiThuong;

        public string DeXuatBoiThuong
        {
            get { return deXuatBoiThuong; }
            set { deXuatBoiThuong = value; }
        }
        private string deXuatBoiThuongChiTiet;

        public string DeXuatBoiThuongChiTiet
        {
            get { return deXuatBoiThuongChiTiet; }
            set { deXuatBoiThuongChiTiet = value; }
        }

        private string thamChieuKhachHang;

        public string ThamChieuKhachHang
        {
            get { return thamChieuKhachHang; }
            set { thamChieuKhachHang = value; }
        }      
       
        private string truGiaTriThuHoi;

        public string TruGiaTriThuHoi
        {
            get { return truGiaTriThuHoi; }
            set { truGiaTriThuHoi = value; }
        }
        private string soTienBoiThuong;

        public string SoTienBoiThuong
        {
            get { return soTienBoiThuong; }
            set { soTienBoiThuong = value; }
        }
        private string tomTatVuViec;

        public string TomTatVuViec
        {
            get { return tomTatVuViec; }
            set { tomTatVuViec = value; }
        }
        private string tinhToanGiaTriThietHai;

        public string TinhToanGiaTriThietHai
        {
            get { return tinhToanGiaTriThietHai; }
            set { tinhToanGiaTriThietHai = value; }
        }
        private string giaTriThuHoiChiTiet;

        public string GiaTriThuHoiChiTiet
        {
            get { return giaTriThuHoiChiTiet; }
            set { giaTriThuHoiChiTiet = value; }
        }
        private string ngayYeuCauGD;

        public string NgayYeuCauGD
        {
            get { return ngayYeuCauGD; }
            set { ngayYeuCauGD = value; }
        } 
        #endregion
    }
}