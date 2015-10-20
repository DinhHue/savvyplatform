using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class ClaimDAO
    {
        public string LayMa()
        {
            //SqlCommand cmd = new SqlCommand("sp_MaClaimMoi", ConnectionData());
            string sql = "sp_MaClaimMoi";
            //cmd.CommandType = CommandType.StoredProcedure;
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            string ma=null;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = dr[0].ToString();
            }
            return ma;
        }
        public DataTable GetBasicInfor(string macl)
        {
            string sql = "sp_Claim_SelectBasicInfor";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value = macl;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int sl = dt.Rows.Count;
            return dt;
        }
        public bool UpdateBasicInforNotInsurer(ClaimDTO cl)
        {
            string sql = "sp_Claim_UpdateBasicInforNotInsure";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value =cl.MaClaim ;
            ds.Add(ma);
            SqlParameter policy = new SqlParameter("@policy", SqlDbType.NVarChar);
            policy.Value = cl.PolicyNo;
            ds.Add(policy);
            SqlParameter hieuluc = new SqlParameter("@hieuluc", SqlDbType.NVarChar);
            hieuluc.Value = cl.Effective;
            ds.Add(hieuluc);
            SqlParameter ddtt = new SqlParameter("@premises", SqlDbType.NVarChar);
            ddtt.Value = cl.Premises;
            ds.Add(ddtt);
            SqlParameter dol = new SqlParameter("@dol", SqlDbType.NVarChar);
            dol.Value = cl.Dol;
            ds.Add(dol);
          
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
           
        }
        public bool UpdateBasicInforInsure(ClaimDTO cl)
        {
            string sql = "sp_Claim_UpdateBasicInforInsure";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);
            SqlParameter policy = new SqlParameter("@policy", SqlDbType.NVarChar);
            policy.Value = cl.PolicyNo;
            ds.Add(policy);
            SqlParameter hieuluc = new SqlParameter("@hieuluc", SqlDbType.NVarChar);
            hieuluc.Value = cl.Effective;
            ds.Add(hieuluc);
            SqlParameter ddtt = new SqlParameter("@premises", SqlDbType.NVarChar);
            ddtt.Value = cl.Premises;
            ds.Add(ddtt);
            SqlParameter dol = new SqlParameter("@dol", SqlDbType.NVarChar);
            dol.Value = cl.Dol;
            ds.Add(dol);

            SqlParameter madv = new SqlParameter("@madvbh", SqlDbType.Int);
            madv.Value = cl.MaDonVi;
            ds.Add(madv);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CreateNew(ClaimDTO clm)
        {
            string sql = "sp_Claim_New";
            List<SqlParameter> list = new List<SqlParameter>();
            
            SqlParameter ma = new SqlParameter("@ma", SqlDbType.VarChar);
            ma.Value = clm.MaClaim;
            list.Add(ma);
           
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.VarChar);
            ten.Value = clm.TenClaim;
            list.Add(ten);

            SqlParameter maGDV = new SqlParameter("@maGDV", SqlDbType.Int);
            maGDV.Value = clm.MaGDV1;
            list.Add(maGDV);
            SqlParameter maDV = new SqlParameter("@maDVBH", SqlDbType.Int);
            maDV.Value = clm.MaDonVi;
            list.Add(maDV);

            SqlParameter handler = new SqlParameter("@nguoiphutrach", SqlDbType.NVarChar);
            handler.Value = clm.NguoiPhuTrach;
            list.Add(handler);

            SqlParameter maKH = new SqlParameter("@idkh", SqlDbType.Int);
            maKH.Value = clm.MaKhachHang;
            list.Add(maKH);

            SqlParameter policy = new SqlParameter("@policyno", SqlDbType.NVarChar);
            policy.Value = clm.PolicyNo;
            list.Add(policy);

            SqlParameter effecive = new SqlParameter("@effective", SqlDbType.NVarChar);
            effecive.Value = clm.Effective;
            list.Add(effecive);

            SqlParameter idtypeofloss = new SqlParameter("@idtypeofloss", SqlDbType.Int);
            idtypeofloss.Value = clm.MaloaiHinhTonThat;
            list.Add(idtypeofloss);

            SqlParameter note = new SqlParameter("@note", SqlDbType.NVarChar);
            note.Value = clm.GhiChu;
            list.Add(note);

            SqlParameter dateofloss = new SqlParameter("@dateofloss", SqlDbType.VarChar);
            dateofloss.Value = clm.Dol;
            list.Add(dateofloss);

            SqlParameter premises = new SqlParameter("@premises", SqlDbType.NVarChar);
            premises.Value = clm.Premises;
            list.Add(premises);

            SqlParameter assigeddate = new SqlParameter("@assigeddate", SqlDbType.VarChar);
            assigeddate.Value = clm.AssignedDate;
            list.Add(assigeddate);

            SqlParameter typepo = new SqlParameter("@typepolicy", SqlDbType.VarChar);
            typepo.Value = clm.TypePolicy;
            list.Add(typepo);

            SqlParameter dienbientt = new SqlParameter("@dienbientonthat", SqlDbType.NVarChar);
            dienbientt.Value = clm.DienBienTonThat1;
            list.Add(dienbientt);
            SqlParameter thongbaoCQCN = new SqlParameter("@thongbaoCQCN", SqlDbType.NVarChar);
            thongbaoCQCN.Value = clm.ThongBaoCQCN1;
            list.Add(thongbaoCQCN);
            SqlParameter ghichuTBCQCN = new SqlParameter("@ghichuTBCQCN",SqlDbType.NVarChar);
            ghichuTBCQCN.Value = clm.GhiChuTBCQCN;
            list.Add(ghichuTBCQCN);
            SqlParameter phamviTT = new SqlParameter("@phamvitonthat", SqlDbType.NVarChar);
            phamviTT.Value = clm.PhamViTonThat;
            list.Add(phamviTT);
            SqlParameter duphong = new SqlParameter("@duphongtonthat",SqlDbType.NVarChar);
            duphong.Value = clm.DuPhongTonThat;
            list.Add(duphong);
            SqlParameter phulucdinhkem = new SqlParameter("@phulucdinhkem",SqlDbType.NVarChar);
            phulucdinhkem.Value = clm.PhuLucDinhKem1;
            list.Add(phulucdinhkem);
            SqlParameter dephongvakhuyencao = new SqlParameter("@dephongvakhuyencao",SqlDbType.NVarChar);
            dephongvakhuyencao.Value = clm.DePhongVaKhuyenCao;
            list.Add(dephongvakhuyencao);
            SqlParameter ykiengdv = new SqlParameter("@ykienGDV", SqlDbType.NVarChar);
            ykiengdv.Value = clm.YKienGDV;
            list.Add(ykiengdv);
            SqlParameter giokhaosat = new SqlParameter("@giokhaosat",SqlDbType.NVarChar);
            giokhaosat.Value = clm.GioKhaoSatHienTruong;
            list.Add(giokhaosat);
            SqlParameter follower = new SqlParameter("@follower", SqlDbType.NVarChar);
            follower.Value = clm.Follower;
            list.Add(follower);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, list);
            return kq;
            
        }
        public bool InsertShort(ClaimDTO cl)
        {

            string sql = "sp_Claim_SortInsert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);

            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.NVarChar);
            ten.Value = cl.TenClaim;
            ds.Add(ten);

            SqlParameter madonvi = new SqlParameter("@madv", SqlDbType.Int);
            madonvi.Value = cl.MaDonVi;
            ds.Add(madonvi);

            SqlParameter maGDV1 = new SqlParameter("@idgdv", SqlDbType.Int);
            maGDV1.Value = cl.MaGDV1;
            ds.Add(maGDV1);

            SqlParameter maKH = new SqlParameter("@maKH", SqlDbType.Int);
            maKH.Value = cl.MaKhachHang;
            ds.Add(maKH);

            SqlParameter maloaihinhtonthat = new SqlParameter("@maloaihinhtonthat", SqlDbType.Int);
            maloaihinhtonthat.Value = cl.MaloaiHinhTonThat;
            ds.Add(maloaihinhtonthat);

            SqlParameter ghichu = new SqlParameter("@note", SqlDbType.NVarChar);
            ghichu.Value = cl.GhiChu;
            ds.Add(ghichu);

            SqlParameter chidinh = new SqlParameter("@dateasigned", SqlDbType.VarChar);
            chidinh.Value = cl.AssignedDate;
            ds.Add(chidinh);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);            
        }
        public bool ClaimMoi(ClaimDTO cl) // old function
        {
            string sql = "sp_Claim_insert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@id",SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);

            SqlParameter ten = new SqlParameter("@ten",SqlDbType.NVarChar);
            ten.Value = cl.TenClaim;
            ds.Add(ten);

            SqlParameter madonvi = new SqlParameter("@madonvi", SqlDbType.Int);
            madonvi.Value = cl.MaDonVi;
            ds.Add(madonvi);

            //SqlParameter soHDBH = new SqlParameter("@sohdbh", SqlDbType.NVarChar);
            //soHDBH.Value = cl.SoHDBH;
            //ds.Add(soHDBH);

            //SqlParameter hieuluc = new SqlParameter("@hieuluc", SqlDbType.NVarChar);
            //hieuluc.Value = cl.HieuLuc;
            //ds.Add(hieuluc);

            
            SqlParameter maKH = new SqlParameter("@maKH", SqlDbType.Int);
            maKH.Value = cl.MaKhachHang;
            ds.Add(maKH);

            SqlParameter maloaihinhtonthat = new SqlParameter("@maloaihinhtonthat",SqlDbType.Int);
            maloaihinhtonthat.Value = cl.MaloaiHinhTonThat;
            ds.Add(maloaihinhtonthat);

            SqlParameter diadiemtonthat = new SqlParameter("@diadiemtt", SqlDbType.NVarChar);
            diadiemtonthat.Value = cl.DiaDiemTonThat;
            ds.Add(diadiemtonthat);
            
            SqlParameter phamvitonthat = new SqlParameter("@phamvitt", SqlDbType.NVarChar);
            phamvitonthat.Value = cl.PhamViTonThat;
            ds.Add(phamvitonthat);

            //SqlParameter dienbientonthat = new SqlParameter("@dienbientonthat", SqlDbType.NVarChar);
            //dienbientonthat.Value = cl.DienBienTonThat;
            //ds.Add(dienbientonthat);

            //SqlParameter thongbaocqcn = new SqlParameter("@thongbaocqcn", SqlDbType.NVarChar);
            //thongbaocqcn.Value = cl.ThongBaoCQCN;
            //ds.Add(thongbaocqcn);

            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = cl.GhiChu;
            ds.Add(ghichu);
            
            SqlParameter maGDV1 = new SqlParameter("@magdv1",SqlDbType.Int);
            maGDV1.Value = cl.MaGDV1;
            ds.Add(maGDV1);

            SqlParameter ngaytonthat = new SqlParameter("@ngaytonthat", SqlDbType.VarChar);
            ngaytonthat.Value = cl.NgayTonThat;
            ds.Add(ngaytonthat);

            SqlParameter ngayBDGD = new SqlParameter("@ngaybatdaugiamdinh", SqlDbType.VarChar);
            ngayBDGD.Value = cl.NgayBatDauGiamDinh;
            ds.Add(ngayBDGD);

            //SqlParameter phulucdinhkem = new SqlParameter("@phulucdinhkem", SqlDbType.NVarChar);
            //phulucdinhkem.Value = cl.PhuLucDinhKem;
            //ds.Add(phulucdinhkem);

            SqlParameter uoctinhduphong = new SqlParameter("@uoctinhduphong", SqlDbType.NVarChar);
            uoctinhduphong.Value = cl.UocTinhDuPhong;
            ds.Add(uoctinhduphong);

            SqlParameter khuyencao = new SqlParameter("@khuyencaogiamdinhvien", SqlDbType.NVarChar);
            khuyencao.Value = cl.KhuyenCaoGDV;
            ds.Add(khuyencao);

            SqlParameter yKienGD = new SqlParameter("@ykienGD", SqlDbType.NVarChar);
            yKienGD.Value = cl.YKienGD;
            ds.Add(yKienGD);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;            
        }
        public DataTable DSClaimDangGiamDinh()
        {
            DataTable dt = new DataTable();
            string sql = "sp_DSClaimDangThucHien";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;


        }
        public DataTable LayThongBCDTCapNhat(string tenclaim)
        {
            string sql = "sp_Claim_SelectUpdate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = tenclaim;
            ds.Add(ten);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int sl = dt.Rows.Count;
            return dt;
        }
        public DataTable ClaimTheoTen(string tenclaim)
        {
            string sql = "sp_LayClaimBaoCaoDauTienTheoTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim",SqlDbType.NVarChar);
            ten.Value = tenclaim;
            ds.Add(ten);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool KiemTraThamChieu(string mathamchieu)
        {

            string sql = "sp_KiemTraMaClaim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ten.Value = mathamchieu;
            ds.Add(ten);            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kt=false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;
        }
        public DataTable LayThongTinTuBaoCaoDauTien(string thamchieu)
        {
            string sql="sp_LayThongTinTuBaoCaoDauTien";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool CapNhatBaoCaoSoBo(ClaimDTO cl )
        {
            string sql= "sp_CapNhatClaimTuBaoCaoSoBo";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamChieu = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            thamChieu.Value = cl.TenClaim;
            ds.Add(thamChieu);
            SqlParameter thamchieuKH = new SqlParameter("@thamchieuKH", SqlDbType.VarChar);
            thamchieuKH.Value = cl.ThamChieuKhachHang;
            ds.Add(thamchieuKH);

            //SqlParameter soHDBH = new SqlParameter("@soHDBH", SqlDbType.NVarChar);
            //soHDBH.Value = cl.SoHDBH;
            //ds.Add(soHDBH);

            SqlParameter diadiem = new SqlParameter("@diadiemtonthat", SqlDbType.NVarChar);
            diadiem.Value = cl.DiaDiemTonThat;
            ds.Add(diadiem);

            SqlParameter ngaytonthat = new SqlParameter("@ngaytonthat", SqlDbType.VarChar);
            ngaytonthat.Value = cl.NgayTonThat;
            ds.Add(ngaytonthat);

            SqlParameter nguyennhan = new SqlParameter("@nguyennhan", SqlDbType.NVarChar);
            nguyennhan.Value = cl.NguyenNhan;
            ds.Add(nguyennhan);
            
            SqlParameter phamvi = new SqlParameter("@phamvitonthat", SqlDbType.NVarChar);
            phamvi.Value = cl.PhamViTonThat;
            ds.Add(phamvi);

            SqlParameter thongtin = new SqlParameter("@thongtinhdbh", SqlDbType.NVarChar);
            thongtin.Value = cl.ThongTinHDBH;
            ds.Add(thongtin);

            SqlParameter dieukhoan = new SqlParameter("@dieukhoanbosung", SqlDbType.NVarChar);
            dieukhoan.Value = cl.DieuKhoanBoSung;
            ds.Add(dieukhoan);

            SqlParameter khieuNai = new SqlParameter("@khieunaindbh", SqlDbType.NVarChar);
            khieuNai.Value = cl.KhieuNaiCuaNDBH;
            ds.Add(khieuNai);

            SqlParameter duphong = new SqlParameter("@duphongboithuong", SqlDbType.NVarChar);
            duphong.Value = cl.DuPhongBoiThuong;
            ds.Add(duphong);

            SqlParameter dienbien = new SqlParameter("@dienbienchitiet", SqlDbType.NVarChar);
            dienbien.Value = cl.DienBienChiTiet;
            ds.Add(dienbien);

            SqlParameter gioithieu = new SqlParameter("@gioithieuchung", SqlDbType.NVarChar);
            gioithieu.Value = cl.GioiThieuChung;
            ds.Add(gioithieu);

            SqlParameter ngayBC = new SqlParameter("@ngaybaocaosobo", SqlDbType.VarChar);
            ngayBC.Value = cl.NgayBCSB;
            ds.Add(ngayBC);

            SqlParameter NguoiDuocBH = new SqlParameter("@ndbh", SqlDbType.NVarChar);
            NguoiDuocBH.Value = cl.NDBH;
            ds.Add(NguoiDuocBH);               

            SqlParameter Nguyennhan = new SqlParameter("@nguyennhanchitiet", SqlDbType.NVarChar);
            Nguyennhan.Value = cl.NguyenNhanChiTiet;
            ds.Add(Nguyennhan);

            SqlParameter PhamviBH = new SqlParameter("@phamvibh", SqlDbType.NVarChar);
            PhamviBH.Value = cl.PhamViBH;
            ds.Add(PhamviBH);

            SqlParameter Phamvivamucdothiethai = new SqlParameter("@phamvivamucdothiethai", SqlDbType.NVarChar);
            Phamvivamucdothiethai.Value = cl.PhamViMucDoThietHai;
            ds.Add(Phamvivamucdothiethai);

            SqlParameter DonBHKhac = new SqlParameter("@donbhkhac", SqlDbType.NVarChar);
            DonBHKhac.Value = cl.DonBHKhac;
            ds.Add(DonBHKhac);

            SqlParameter Giatrithuhoi = new SqlParameter("@giatrithuhoi", SqlDbType.NVarChar);
            Giatrithuhoi.Value = cl.GiaTriThuHoi;
            ds.Add(Giatrithuhoi);

            SqlParameter Duphongboithuongchitiet = new SqlParameter("@duphongboithuongchitiet", SqlDbType.NVarChar);
            Duphongboithuongchitiet.Value = cl.DuPhongBoiThuongChiTiet;
            ds.Add(Duphongboithuongchitiet);
            
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable LayThongTinBaoCaoCuoiCung(string thamchieu)
        {
            string sql = "sp_Claim_selectBCCC";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);           
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds) ;
            return dt;
        }
        public bool CapNhatBaoCaoCuoiCung(ClaimDTO cl)
        {
            string sql="sp_CapNhatBaoCaoCuoiCung";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            ten.Value = cl.TenClaim;
            ds.Add(ten);
            SqlParameter thamChieuKH = new SqlParameter("@thamchieuKH", SqlDbType.NVarChar);
            thamChieuKH.Value = cl.ThamChieuKhachHang;
            ds.Add(thamChieuKH);
            SqlParameter diadiemtt = new SqlParameter("@diadiemtonthat", SqlDbType.NVarChar);
            diadiemtt.Value = cl.DiaDiemTonThat;
            ds.Add(diadiemtt);
            SqlParameter ngaytonthat = new SqlParameter("@ngaytonthat", SqlDbType.VarChar);
            ngaytonthat.Value = cl.NgayTonThat;
            ds.Add(ngaytonthat);
            SqlParameter nguyennhan = new SqlParameter("@nguyennhan", SqlDbType.NVarChar);
            nguyennhan.Value = cl.NguyenNhan;
            ds.Add(nguyennhan);
            
            SqlParameter phamvitonthat = new SqlParameter("@phamvitonthat", SqlDbType.NVarChar);
            phamvitonthat.Value = cl.PhamViTonThat;
            ds.Add(phamvitonthat);
            SqlParameter thongtinndbh = new SqlParameter("@thongtinhdbh", SqlDbType.NVarChar);
            thongtinndbh.Value = cl.ThongTinHDBH;
            ds.Add(thongtinndbh);
            SqlParameter dieukhoanbosung = new SqlParameter("@dieukhoanbosung", SqlDbType.NVarChar);
            dieukhoanbosung.Value = cl.DieuKhoanBoSung;
            ds.Add(dieukhoanbosung);
            SqlParameter khieunai = new SqlParameter("@khieunai", SqlDbType.NVarChar);
            khieunai.Value = cl.KhieuNaiCuaNDBH;
            ds.Add(khieunai);
            SqlParameter tinhtoantonthat = new SqlParameter("@tinhtoantonthat", SqlDbType.NVarChar);
            tinhtoantonthat.Value = cl.TonThatTinhToan;
            ds.Add(tinhtoantonthat);
            SqlParameter trugiatrithuhoi= new SqlParameter("@trugiatrithuhoi", SqlDbType.NVarChar);
            trugiatrithuhoi.Value = cl.TruGiaTriThuHoi;
            ds.Add(trugiatrithuhoi);

            SqlParameter trumucmienthuong = new SqlParameter("@trumucmienthuong", SqlDbType.NVarChar);
            trumucmienthuong.Value = cl.TruMucMienThuong;
            ds.Add(trumucmienthuong);

            SqlParameter sotienboithuong = new SqlParameter("@sotienboithuong", SqlDbType.NVarChar);
            sotienboithuong.Value = cl.SoTienBoiThuong;
            ds.Add(sotienboithuong);

            SqlParameter tomtatvuviec = new SqlParameter("@tomtatvuviec", SqlDbType.NVarChar);
            tomtatvuviec.Value = cl.TomTatVuViec;
            ds.Add(tomtatvuviec);
            SqlParameter nguyennhanchitiet = new SqlParameter("@nguyennhanchitiet", SqlDbType.NVarChar);
            nguyennhanchitiet.Value = cl.NguyenNhanChiTiet;
            ds.Add(nguyennhanchitiet);
            SqlParameter phamvibh = new SqlParameter("@phamvibaohiem", SqlDbType.NVarChar);
            phamvibh.Value = cl.PhamViBH;
            ds.Add(phamvibh);
            SqlParameter dienbienchitiet = new SqlParameter("@dienbienchitiet", SqlDbType.NVarChar);
            dienbienchitiet.Value = cl.DienBienChiTiet;
            ds.Add(dienbienchitiet);

            SqlParameter tinhtoangiatrithiethai = new SqlParameter("@tinhtoangiatrithiethai", SqlDbType.NVarChar);
            tinhtoangiatrithiethai.Value = cl.TinhToanGiaTriThietHai;
            ds.Add(tinhtoangiatrithiethai);

            SqlParameter giatrithuhoict = new SqlParameter("@giatrithuhoichitiet", SqlDbType.NVarChar);
            giatrithuhoict.Value = cl.GiaTriThuHoiChiTiet;
            ds.Add(giatrithuhoict);

            SqlParameter dexuatboithuongchitiet = new SqlParameter("@dexuatboithuong", SqlDbType.NVarChar);
            dexuatboithuongchitiet.Value = cl.DeXuatBoiThuongChiTiet;
            ds.Add(dexuatboithuongchitiet);       
           
            SqlParameter ketluan = new SqlParameter("@ketluan", SqlDbType.NVarChar);
            ketluan.Value = cl.KetLuan;
            ds.Add(ketluan);

            SqlParameter ngaybaocao = new SqlParameter("@ngaybaocaocc", SqlDbType.VarChar);
            ngaybaocao.Value = cl.NgayBCCC;
            ds.Add(ngaybaocao);

            
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable LayBaoCaoDauTien(string thamchieu)
        {
            string sql="sp_LayClaimBaoCaoDauTienTheoTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable LayBaoCaoSoBo(string thamchieu)
        {
            string sql="sp_LayBaoCaoSoBo";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds) ;
            return dt;
        }
        public DataTable LayBaoCaoCuoiCung(string thamchieu)
        {
            string sql="sp_LayBaoCaoCuoiCung";
            List<SqlParameter> ds = new List<SqlParameter>();
            
            SqlParameter ten = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);            
            return dt;
        }
        public DataTable ClaimTimKiem(string thamchieu)
        {
            DataTable dt = new DataTable();
            string sql= "sp_Claim_TimKiem";
            List<SqlParameter> ds = new List<SqlParameter>();
           
            SqlParameter tenclaim = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            tenclaim.Value = thamchieu;
            ds.Add(tenclaim);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);           
            return dt;
        }
        public string LayMa(string ten)
        {           
            string sql = "sp_Claim_MaClaim";
            List<SqlParameter> ds = new List<SqlParameter>(); 
            SqlParameter tenclaim = new SqlParameter("@tenthamchieu", SqlDbType.VarChar);
            tenclaim.Value = ten;
            ds.Add(tenclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string ma="";
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = dr[0].ToString();
            }
            return ma;
        }
        public DataTable DanhSachClaim()
        {
            string sql= "sp_Claim_DanhSachTongQuat";           
            DataTable dt = new DataTable();            
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable LietKeVuTonThatDonViBaoHiem()
        {
            string sql="sp_Claim_LietKeVuTonThatTheoDonViBaoHiem";
            
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public string TenClaim(string macl)
        {
            string sql = "sp_Claim_LayTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ID.Value = macl;
            ds.Add(ID);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string ten = "";
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ten = dr[0].ToString();
            }
            return ten;
        }
        public DataTable TomTat(string thamchieu)
        {
           
            string sql = "sp_Claim_TomTat";
            List<SqlParameter> ma = new List<SqlParameter>();
            SqlParameter tc = new SqlParameter("tenclaim", SqlDbType.VarChar);
            tc.Value = thamchieu;
            ma.Add(tc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ma);
            
            return dt;
        }
        public string LayMaTheoTen(string thamchieu)
        {
            string sql = "sp_Claim_Ten";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@ten", SqlDbType.VarChar);
            ID.Value = thamchieu;
            ds.Add(ID);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string ten = "";
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ten = dr[0].ToString();
            }
            return ten;
        }
        public bool CapNhatBaoCaoDauTien(ClaimDTO cl)
        {
            string sql = "sp_Claim_updateBCDT";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.NVarChar);
            ten.Value = cl.TenClaim;
            ds.Add(ten);

            SqlParameter madonvi = new SqlParameter("@madonvi", SqlDbType.Int);
            madonvi.Value = cl.MaDonVi;
            ds.Add(madonvi);

            //SqlParameter soHDBH = new SqlParameter("@sohdbh", SqlDbType.NVarChar);
            //soHDBH.Value = cl.SoHDBH;
            //ds.Add(soHDBH);

            //SqlParameter hieuluc = new SqlParameter("@hieuluc", SqlDbType.NVarChar);
            //hieuluc.Value = cl.HieuLuc;
            //ds.Add(hieuluc);


            SqlParameter maKH = new SqlParameter("@maKH", SqlDbType.Int);
            maKH.Value = cl.MaKhachHang;
            ds.Add(maKH);

            SqlParameter maloaihinhtonthat = new SqlParameter("@maloaihinhtonthat", SqlDbType.Int);
            maloaihinhtonthat.Value = cl.MaloaiHinhTonThat;
            ds.Add(maloaihinhtonthat);

            SqlParameter diadiemtonthat = new SqlParameter("@diadiemtt", SqlDbType.NVarChar);
            diadiemtonthat.Value = cl.DiaDiemTonThat;
            ds.Add(diadiemtonthat);

            SqlParameter phamvitonthat = new SqlParameter("@phamvitt", SqlDbType.NVarChar);
            phamvitonthat.Value = cl.PhamViTonThat;
            ds.Add(phamvitonthat);

            //SqlParameter dienbientonthat = new SqlParameter("@dienbientonthat", SqlDbType.NVarChar);
            //dienbientonthat.Value = cl.DienBienTonThat;
            //ds.Add(dienbientonthat);

            //SqlParameter thongbaocqcn = new SqlParameter("@thongbaocqcn", SqlDbType.NVarChar);
            //thongbaocqcn.Value = cl.ThongBaoCQCN;
            //ds.Add(thongbaocqcn);

            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = cl.GhiChu;
            ds.Add(ghichu);
            SqlParameter maGDV1 = new SqlParameter("@magdv1", SqlDbType.Int);
            maGDV1.Value = cl.MaGDV1;
            ds.Add(maGDV1);

            SqlParameter ngaytonthat = new SqlParameter("@ngaytonthat", SqlDbType.VarChar);
            ngaytonthat.Value = cl.NgayTonThat;
            ds.Add(ngaytonthat);

            SqlParameter ngayBDGD = new SqlParameter("@ngaybatdaugiamdinh", SqlDbType.VarChar);
            ngayBDGD.Value = cl.NgayBatDauGiamDinh;
            ds.Add(ngayBDGD);

            //SqlParameter phulucdinhkem = new SqlParameter("@phulucdinhkem", SqlDbType.NVarChar);
            //phulucdinhkem.Value = cl.PhuLucDinhKem;
            //ds.Add(phulucdinhkem);

            SqlParameter uoctinhduphong = new SqlParameter("@uoctinhduphong", SqlDbType.NVarChar);
            uoctinhduphong.Value = cl.UocTinhDuPhong;
            ds.Add(uoctinhduphong);

            SqlParameter khuyencao = new SqlParameter("@khuyencaogiamdinhvien", SqlDbType.NVarChar);
            khuyencao.Value = cl.KhuyenCaoGDV;
            ds.Add(khuyencao);

            SqlParameter yKienGD = new SqlParameter("@ykienGD", SqlDbType.NVarChar);
            yKienGD.Value = cl.YKienGD;
            ds.Add(yKienGD);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;

        }
        public DataTable LayHienThiBaoCaoSoBo(string thamchieu)
        {
            string sql = "sp_claim_selectBCSB";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = thamchieu;
            ds.Add(ten);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public ClaimDTO LayInFo(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            string sql = "sp_Claim_SelectInfo";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                cl.MaClaim = dr[0].ToString();
                cl.TenClaim = dr[1].ToString();
                cl.MaGDV1 = int.Parse(dr[2].ToString());
                cl.TomTatVuViec = dr[3].ToString();
                cl.MaDonVi=int.Parse(dr[4].ToString());
                cl.MaKhachHang = int.Parse(dr[5].ToString());
                cl.PolicyNo = dr[6].ToString();
                cl.Effective = dr[7].ToString();
                cl.Premises = dr[8].ToString();
                cl.Dol = dr[9].ToString();
                cl.MaloaiHinhTonThat = int.Parse(dr[10].ToString());
                cl.GhiChu = dr[11].ToString();
                cl.AssignedDate = dr[12].ToString();
                cl.A1 = dr[13].ToString();
                cl.A2 = dr[14].ToString();
                cl.B1 = dr[15].ToString();
                cl.B2 = dr[16].ToString();
                cl.C1 = dr[17].ToString();
                cl.C2 = dr[18].ToString();
                cl.C3 = dr[19].ToString();
                cl.D1 = dr[20].ToString();
                cl.D2 = dr[21].ToString();
                cl.E1=dr[22].ToString();
                cl.E2=dr[23].ToString();
                cl.F1=dr[24].ToString();
                cl.F2 = dr[25].ToString();
                cl.G = dr[26].ToString();
                cl.H = dr[27].ToString();
                cl.I = dr[28].ToString();
                cl.K = dr[29].ToString();
                //cl.MaSummary = int.Parse(dr[30].ToString());
                cl.NgayBatDauGiamDinh = dr[31].ToString();
                cl.MaGiaiDoanHoanThanh = int.Parse(dr[32].ToString());
                cl.NguoiPhuTrach = dr[33].ToString();
                cl.TypePolicy = dr[34].ToString();
                cl.LossHistory = dr[35].ToString();
                cl.Discuss = dr[49].ToString();
                cl.GioiThieuNDBH = dr[51].ToString();
            }
            return cl;
        }
        public DataRow LayInFoReport(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            string sql = "sp_Claim_Report_LostList";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public DataRow LayInFoReportILA(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            string sql = "sp_Claim_SiteSurveyRecord";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public DataRow GetInfoPRIRFR(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            string sql = "sp_Claim_InforPRIRFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public DataRow LayInFoReportNormal(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            string sql = "sp_Claim_Report";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public DataRow LayCoverHome(string idclaim)
        {
            string sql = "sp_Claim_selectcoverhome";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = idclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public bool UpdateStatus(string maclaim, int idgiaidoan)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateStatus";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter idgd = new SqlParameter("@idgiaidoanhoanthanh", SqlDbType.Int);
            idgd.Value = idgiaidoan;
            ds.Add(idgd);
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateA1(string maclaim, string a)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateA1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter a1 = new SqlParameter("@a1", SqlDbType.NVarChar);
            a1.Value = a;
            ds.Add(a1);
                  
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateA2(string maclaim, string a)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateA2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter a2 = new SqlParameter("@a2", SqlDbType.NVarChar);
            a2.Value = a;
            ds.Add(a2);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateC1(string maclaim, string c)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateC1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter c1 = new SqlParameter("@c1", SqlDbType.NVarChar);
            c1.Value = c;
            ds.Add(c1);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateC2(string maclaim, string c)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateC2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter c2 = new SqlParameter("@c2", SqlDbType.NVarChar);
            c2.Value = c;
            ds.Add(c2);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateC3(string maclaim, string a)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateC3";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter c3 = new SqlParameter("@c3", SqlDbType.NVarChar);
            c3.Value = a;
            ds.Add(c3);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateE1(string maclaim, string e)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateE1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter e1 = new SqlParameter("@e1", SqlDbType.NVarChar);
            e1.Value = e;
            ds.Add(e1);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateE2(string maclaim, string e)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateE2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter e2 = new SqlParameter("@e2", SqlDbType.NVarChar);
            e2.Value = e;
            ds.Add(e2);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateG(string maclaim, string g)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateG";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@g", SqlDbType.NVarChar);
            text.Value = g;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateH(string maclaim, string h)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateH";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@h", SqlDbType.NVarChar);
            text.Value = h;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateLH(string maclaim, string lh)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateLossHistory";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@lh", SqlDbType.NVarChar);
            text.Value = lh;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateI(string maclaim, string i)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateI";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@i", SqlDbType.NVarChar);
            text.Value = i;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateGioiThieuInsured(string maclaim, string gioithieu)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateInsured";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@insured", SqlDbType.NVarChar);
            text.Value = gioithieu;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateK(string maclaim, string k)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateK";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@k", SqlDbType.NVarChar);
            text.Value = k;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateD1(string maclaim, string d)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateD1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@d1", SqlDbType.NVarChar);
            text.Value = d;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateD2(string maclaim, string d)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateD2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@text", SqlDbType.NVarChar);
            text.Value = d;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateInfo(ClaimDTO cl, KhachHangDTO kh)
        {
            bool kq = false;
            string sql = "sp_Claim_KhachHang_UpdateInfo";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);
            SqlParameter tenclaim = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            tenclaim.Value = cl.TenClaim;
            ds.Add(tenclaim);

            SqlParameter pres = new SqlParameter("@presmises", SqlDbType.NVarChar);
            pres.Value = cl.Premises;
            ds.Add(pres);
            SqlParameter pono = new SqlParameter("@policyno", SqlDbType.NVarChar);
            pono.Value = cl.PolicyNo;
            ds.Add(pono);
            SqlParameter eff = new SqlParameter("@effective", SqlDbType.NVarChar);
            eff.Value = cl.Effective;
            ds.Add(eff);

            SqlParameter typo = new SqlParameter("@typepolicy", SqlDbType.VarChar);
            typo.Value = cl.TypePolicy;
            ds.Add(typo);
            SqlParameter dol = new SqlParameter("@dateofloss", SqlDbType.VarChar);
            dol.Value = cl.Dol;
            ds.Add(dol);     
            
            SqlParameter tenndbh = new SqlParameter("@ndbh",SqlDbType.NVarChar);
            tenndbh.Value= kh.TenKhachHang;
            ds.Add(tenndbh);
            SqlParameter nguoilienhe = new SqlParameter("@contactpersonkh", SqlDbType.NVarChar);
            nguoilienhe.Value = kh.TenNguoiDaiDien;
            ds.Add(nguoilienhe);
            SqlParameter fax = new SqlParameter("@faxkh", SqlDbType.VarChar);
            fax.Value = kh.Fax;
            ds.Add(fax);
            SqlParameter dienthoai = new SqlParameter("@dienthoaikh", SqlDbType.VarChar);
            dienthoai.Value = kh.DienThoai;
            ds.Add(dienthoai);
            SqlParameter email = new SqlParameter("@emailkh", SqlDbType.VarChar);
            email.Value = kh.Email; ;
            ds.Add(email);
            SqlParameter diachi = new SqlParameter("@diachikh", SqlDbType.NVarChar);
            diachi.Value = kh.DiaChi;
            ds.Add(diachi);
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateInfoPRIRFR(ClaimDTO cl, KhachHangDTO kh)
        {
            bool kq = false;
            string sql = "sp_Claim_InforPRIRFR_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);

            SqlParameter date = new SqlParameter("@dateILA", SqlDbType.NVarChar);
            date.Value = cl.ILADATE;
            ds.Add(date);

            SqlParameter pono = new SqlParameter("@policyno", SqlDbType.NVarChar);
            pono.Value = cl.PolicyNo;
            ds.Add(pono);
            SqlParameter dol = new SqlParameter("@dol", SqlDbType.NVarChar);
            dol.Value = cl.Dol;
            ds.Add(dol);
            SqlParameter sc = new SqlParameter("@sortcause", SqlDbType.NVarChar);
            sc.Value = cl.SortCause;
            ds.Add(sc);

            SqlParameter pv = new SqlParameter("@phamvitt", SqlDbType.NVarChar);
            pv.Value = cl.PhamViTonThat;
            ds.Add(pv);

            SqlParameter napo = new SqlParameter("@namepolicy", SqlDbType.NVarChar);
            napo.Value = cl.NamePolicy;
            ds.Add(napo);
            
            SqlParameter sum = new SqlParameter("@suminsured", SqlDbType.NVarChar);
            sum.Value = cl.SumInsured;
            ds.Add(sum);

            SqlParameter eff = new SqlParameter("@effective", SqlDbType.NVarChar);
            eff.Value = cl.Effective;
            ds.Add(eff);

            SqlParameter deduc = new SqlParameter("@deductible", SqlDbType.NVarChar);
            deduc.Value = cl.MucMienThuong;
            ds.Add(deduc);

            SqlParameter dkbs = new SqlParameter("@dkbs", SqlDbType.NVarChar);
            dkbs.Value = cl.DKBS;
            ds.Add(dkbs);

            SqlParameter kn = new SqlParameter("@khieunai", SqlDbType.NVarChar);
            kn.Value = cl.KhieuNai;
            ds.Add(kn);

            SqlParameter duphong = new SqlParameter("@duphongboithuong", SqlDbType.NVarChar);
            duphong.Value = cl.DuPhongBoiThuong;
            ds.Add(duphong);

            SqlParameter makh = new SqlParameter("@makhachhang", SqlDbType.Int);
            makh.Value = kh.MaKhachHang;
            ds.Add(makh);
          
            SqlParameter trade = new SqlParameter("@trade", SqlDbType.NVarChar);
            trade.Value = kh.LinhVucKinhDoanh;
            ds.Add(trade);
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateInfoFR(ClaimDTO cl)
        {
            string sql = "sp_Claim_UpdateBasicFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.VarChar);
            ma.Value = cl.MaClaim;
            ds.Add(ma);

            SqlParameter date = new SqlParameter("@datefr", SqlDbType.NVarChar);
            date.Value = cl.BaoCaoTruocFR;
            ds.Add(date);

            SqlParameter thhl = new SqlParameter("@thiethaihoply", SqlDbType.NVarChar);
            thhl.Value = cl.ThietHaiHopLy;
            ds.Add(thhl);

            SqlParameter tthl = new SqlParameter("@tonthathople", SqlDbType.NVarChar);
            tthl.Value = cl.TonThatHopLe;
            ds.Add(tthl);

            SqlParameter trugtthuhoi = new SqlParameter("@trugiatrithuhoi", SqlDbType.NVarChar);
            trugtthuhoi.Value = cl.TruGiaTriThuHoi;
            ds.Add(trugtthuhoi);

            SqlParameter trumienthuong = new SqlParameter("@trumienthuong", SqlDbType.NVarChar);
            trumienthuong.Value = cl.TruMienThuong;
            ds.Add(trumienthuong);

            SqlParameter tamung = new SqlParameter("@tamungboithuong", SqlDbType.NVarChar);
            tamung.Value = cl.TamUngBoiThuong;
            ds.Add(tamung);

            SqlParameter boithuong = new SqlParameter("@boithuong", SqlDbType.NVarChar);
            boithuong.Value = cl.BoiThuong;
            ds.Add(boithuong);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
            
        }
        public Object getClaimField(string maclaim, string key)
        {
            string sql = "sp_Claim_GetField";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", maclaim));
            ds.Add(new SqlParameter("@key", key));

            return SqlDataAcessHelper.exScalarStore(sql, ds);
        }

        public void updateClaimField(string claimID, string key, string value)
        {
            string sql = "sp_Claim_UpdateField";
            List<SqlParameter> ds = new List<SqlParameter>();

            ds.Add(new SqlParameter("@idclaim", claimID));
            ds.Add(new SqlParameter("@key", key));
            ds.Add(new SqlParameter("@value", value));

            SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        
        public DataTable XuatClaim(string idclaim)
        {
            string sql = "sp_Claim_SelectAll";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool CapNhatBrief(string idclaim, string brief)
        {
            string sql = "sp_Claim_UpdateBrief";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            SqlParameter bri = new SqlParameter("@brief", SqlDbType.NVarChar);
            bri.Value = brief;
            ds.Add(bri);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DanhSachClaimPending()
        {
            string sql = "sp_Claim_IDPending";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public DataTable ViewSiteSurveyRecord(string idclaim)
        {
            string sql = "sp_Claim_SiteSurveyRecord";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable loadInfoBCDT(string idclaim)
        {
            string sql = "sp_Claim_SelectBCDTEdit";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool CapNhatBCDT(string id, string dienbienTT, string phamviTT, string duphongTT, string dephongkhuyencao, string ykien)
        {
            bool kq = false;
            string sql = "sp_Claim_EditBCDT";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter dienbien = new SqlParameter("@dienbienTT", SqlDbType.NVarChar);
            dienbien.Value = dienbienTT;
            ds.Add(dienbien);
            SqlParameter phamvi = new SqlParameter("@phamvitonthat", SqlDbType.NVarChar);
            phamvi.Value = phamviTT;
            ds.Add(phamvi);
            SqlParameter duphong = new SqlParameter("@duphongtonthat", SqlDbType.NVarChar);
            duphong.Value = duphongTT;
            ds.Add(duphong);
            SqlParameter dephong = new SqlParameter("@dephongvakhuyencao", SqlDbType.NVarChar);
            dephong.Value = dephongkhuyencao;
            ds.Add(dephong);
            SqlParameter yKien = new SqlParameter("@ykien", SqlDbType.NVarChar);
            yKien.Value = ykien;
            ds.Add(yKien);
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateRate(string ma, int rate)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateRate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = ma;
            ds.Add(id);
            SqlParameter rat = new SqlParameter("@rate",SqlDbType.Int);
            rat.Value = rate;
            ds.Add(rat);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        //public DataTable SelectLevel_1()
        //{
        //    //DataTable dt = new DataTable();
        //    string sql = "sp_Claim_SelectLevel1";
        //    return SqlDataAcessHelper.exStoreNoParas(sql);
        //}
        //public DataTable SelectLevel_2()
        //{
        //    //DataTable dt = new DataTable();
        //    string sql = "sp_Claim_SelectLevel2";
        //    return SqlDataAcessHelper.exStoreNoParas(sql);
        //}
        public DataTable SelectPending()
        {
            //DataTable dt = new DataTable();
            string sql = "sp_Claim_Pending";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public DataTable SelectLevel(int lev)
        {
            //DataTable dt = new DataTable();
            string sql = "sp_Claim_SelectLevel";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter muc = new SqlParameter("@level", SqlDbType.Int);
            muc.Value = lev;
            ds.Add(muc);
            return SqlDataAcessHelper.exStoreParas(sql,ds);
        }
        public DataTable SelectClosed()
        {
            //DataTable dt = new DataTable();
            string sql = "sp_Claim_Closed";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool UpdateFollower(string idclaim, string follower)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateFollower";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            SqlParameter fol = new SqlParameter("@follower ", SqlDbType.NVarChar);
            fol.Value = follower;
            ds.Add(fol);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public string selectClaimHanding(string idclaim)
        {
            string k = null;
            string sql = "sp_Claim_SelectK";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                k = dr[0].ToString();
            }
            return k;
        }
        public void UpdateAutoGiamRate()
        {
            string sql = "sp_Claim_UpdateAuToRate";
            SqlDataAcessHelper.exNonStoreNoParas(sql);
        }
        public void UpdateAutoTangRate()
        {
            string sql = "sp_Claim_UpdateAuToTangRate";
            SqlDataAcessHelper.exNonStoreNoParas(sql);
        }
        public DataTable SelectClaimMaHoa(string mahoa)
        {
            string sql = "sp_Claim_SelectTheoDonVi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter mahoadv = new SqlParameter("@mahoa", SqlDbType.VarChar);
            mahoadv.Value = mahoa;
            ds.Add(mahoadv);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSClaimTheoFollower(string follower)
        {
            string sql = "sp_Claim_SelectFowlower";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter foll = new SqlParameter("@follower", SqlDbType.NVarChar);
            foll.Value = follower;
            ds.Add(foll);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable ClaimWaitingInvoile()
        {
            string sql = "sp_ClaimWaitingInvoice";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public DataTable DSClaimTheoStatus(int id)
        {
            string sql ="sp_Claim_Status";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idgiaidoan", SqlDbType.Int);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateDocs(string tenclaim, string doc, string ngay)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateDocs";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = tenclaim;
            ds.Add(ten);
            SqlParameter ngaychidinh = new SqlParameter("@date", SqlDbType.VarChar);
            ngaychidinh.Value = ngay;
            ds.Add(ngaychidinh);
            SqlParameter docs = new SqlParameter("@docs", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateDiscuss(string maclaim, string discuss)
        {
            bool kq = false;
            string sql = "sp_Claim_insertDiscuss";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter text = new SqlParameter("@discuss", SqlDbType.NVarChar);
            text.Value = discuss;
            ds.Add(text);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public string Laybrif(string idclaim)
        {
            string des = "";
            string sql = "sp_Claim_LayBrief";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter brief = new SqlParameter("@id", SqlDbType.NVarChar);
            brief.Value = idclaim;
            ds.Add(brief);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                des = dr[0].ToString();
            }
            return des;
        }
        public DataTable ClaimPermissionList()
        {
            string sql = "sp_Claim_selectPUB";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool KiemTraTruyCap(int pub, string maclaim)
        {
            bool kq = false;
            string sql = "sp_Claim_KiemTraTruyCap";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter level = new SqlParameter("@pubgdv", SqlDbType.Int);
            level.Value = pub;
            ds.Add(level);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                //DataRow dr = dt.Rows[0];
                //int temp = int.Parse(dr[0].ToString());
               
                kq = true;
            }
            return kq;        
        }
        public bool CapNhatPub(string maclaim, int pub)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdatePUB";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = maclaim;
            ds.Add(ma);

            SqlParameter mapub = new SqlParameter("@pub", SqlDbType.Int);
            mapub.Value = pub;
            ds.Add(mapub);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public int LayMaPUB(string idclaim)
        {
            try
            {
                int temp = -1;
                string sql = "sp_Claim_LayPUB";
                List<SqlParameter> ds = new List<SqlParameter>();
                SqlParameter pub = new SqlParameter("@idclaim", SqlDbType.VarChar);
                pub.Value = idclaim;
                ds.Add(pub);
                DataTable dt = new DataTable();
                dt = SqlDataAcessHelper.exStoreParas(sql, ds);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    temp = int.Parse(dr[0].ToString());
                }
                return temp;
            }catch(Exception ex)
            {
                return 0;
            }

        }
        public DataTable ClaimCover(string id)
        {
            string sql = "sp_Claim_Cover";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable ClaimMaster(string id)
        {
            string sql = "sp_Claim_Master";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateClaimCover(ClaimDTO cl)
        {
            bool kq = false;
            string sql = "sp_Claim_CoverUpdate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = cl.MaClaim;
            ds.Add(id);
            SqlParameter bctruoc = new SqlParameter("@baocaotruoc", SqlDbType.NVarChar);
            bctruoc.Value = cl.BaoCaoTruoc;
            ds.Add(bctruoc);
            SqlParameter HDBH = new SqlParameter("@policy", SqlDbType.NVarChar);
            HDBH.Value = cl.PolicyNo;
            ds.Add(HDBH);
            SqlParameter pres = new SqlParameter("@presmises", SqlDbType.NVarChar);
            pres.Value = cl.Premises;
            ds.Add(pres);
            SqlParameter dol = new SqlParameter("@dol", SqlDbType.NVarChar);
            dol.Value = cl.Dol;
            ds.Add(dol);
            SqlParameter nguyennhan = new SqlParameter("@sortcause", SqlDbType.NVarChar);
            nguyennhan.Value = cl.SortCause;
            ds.Add(nguyennhan);
            SqlParameter phamvi = new SqlParameter("@phamvitt", SqlDbType.NVarChar);
            phamvi.Value = cl.PhamViTonThat;
            ds.Add(phamvi);
            SqlParameter SumI = new SqlParameter("@suminsured", SqlDbType.NVarChar);
            SumI.Value = cl.SumInsured;
            ds.Add(SumI);
            SqlParameter Effec = new SqlParameter("@effective", SqlDbType.NVarChar);
            Effec.Value = cl.Effective;
            ds.Add(Effec);
            SqlParameter mienthuong = new SqlParameter("@mucmienthuong", SqlDbType.NVarChar);
            mienthuong.Value = cl.MucMienThuong;
            ds.Add(mienthuong);
            SqlParameter dkbs = new SqlParameter("@dkbs", SqlDbType.NVarChar);
            dkbs.Value = cl.DKBS;
            ds.Add(dkbs);
            SqlParameter khieunai = new SqlParameter("@khieunai", SqlDbType.NVarChar);
            khieunai.Value = cl.KhieuNai;
            ds.Add(khieunai);
            SqlParameter duphong = new SqlParameter("@duphongboithuong", SqlDbType.NVarChar);
            duphong.Value = cl.DuPhongBoiThuong;
            ds.Add(duphong);
            SqlParameter dieuchinh = new SqlParameter("@dieuchinh", SqlDbType.NVarChar);
            dieuchinh.Value = cl.DieuChinh;
            ds.Add(dieuchinh);
            SqlParameter boithuong = new SqlParameter("@boithuong", SqlDbType.NVarChar);
            boithuong.Value = cl.BoiThuong;
            ds.Add(boithuong);
            SqlParameter trumienthuong = new SqlParameter("@trumucmienthuong", SqlDbType.NVarChar);
            trumienthuong.Value = cl.TruMienThuong;
            ds.Add(trumienthuong);
            SqlParameter namepolicy = new SqlParameter("@namepolicy", SqlDbType.NVarChar);
            namepolicy.Value= cl.NamePolicy;
            ds.Add(namepolicy);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public int ClaimMaKH(string idclaim)
        {
            int id = 0;
            string sql = "sp_Claim_MaKhachHang";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter malaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            malaim.Value = idclaim;
            ds.Add(malaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                id = int.Parse(dr[0].ToString());
            }
            return id;
        }
        public DataTable SelectA1(string id)
        {
            string sql = "sp_Claim_SelectA1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectGioiThieu(string id)
        {
            string sql = "sp_Claim_SelectGioiThieu";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectCircumstance(string id)
        {
            string sql = "sp_Claim_SelectCircumstance";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateExecutiveSummaryIR(string idclaim, string doc)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateExecutiveSummaryIR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim ", SqlDbType.VarChar);
            ten.Value = idclaim;
            ds.Add(ten);

            SqlParameter docs = new SqlParameter("@text", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateExecutiveSummaryFR(string idclaim, string doc)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateExecutiveSummaryFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim ", SqlDbType.VarChar);
            ten.Value = idclaim;
            ds.Add(ten);

            SqlParameter docs = new SqlParameter("@text", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable SelectExecutiveSummary(string id)
        {
            string sql = "sp_Claim_SelectExecutiveSummary";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectQuanLyKhieuNai(string id)
        {
            string sql = "sp_Claim_SelectQuanLyKhieuNai";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateCauseofLossFR(string idclaim, string doc)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateC3FR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim ", SqlDbType.VarChar);
            ten.Value = idclaim;
            ds.Add(ten);

            SqlParameter docs = new SqlParameter("@text", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable SelectCauseofLoss(string id)
        {
            string sql = "sp_Claim_SelectCauseofLos";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectPolicyLaibility(string id)
        {
            string sql = "sp_Claim_SelectPolicyLaibility";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectDetailLossExtent(string id)
        {
            string sql = "sp_Claim_SelectDetailossExtent";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool UpdateAdjustmentIR(string idclaim, string doc)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateAdjustmentIR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim ", SqlDbType.VarChar);
            ten.Value = idclaim;
            ds.Add(ten);

            SqlParameter docs = new SqlParameter("@text", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateAdjustmentFR(string idclaim, string doc)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateAdjustmentFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@idclaim ", SqlDbType.VarChar);
            ten.Value = idclaim;
            ds.Add(ten);

            SqlParameter docs = new SqlParameter("@text", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable SelectClaimAdjustment(string id)
        {
            string sql = "sp_Claim_SelectAdjustment";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectSalvage(string id)
        {
            string sql = "sp_CLaim_SelectSalvage";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectLossHistory(string id)
        {
            string sql = "sp_Claim_SelectLossHistory";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectOtherInsurer(string id)
        {
            string sql = "sp_Claim_SelectOtherInsurer";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectClaimSettlement(string id)
        {
            string sql = "sp_Claim_SelectSettlement";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable SelectClaimDiscussion(string id)
        {
            string sql = "sp_Claim_SelectDisscusion";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@idclaim", SqlDbType.VarChar);
            magd.Value = id;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable selectRiotClaim()
        {
            string sql = "sp_Claim_Riot";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public DataTable DSCaseName()
        {
            string sql = "sp_Claim_SelectCaseName";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public int LayMaGiaiDoanHoanThanh(string ten)
        {
            string sql = "sp_Claim_LayMaGiaiDoan";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magd = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            magd.Value = ten;
            ds.Add(magd);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int ma = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = int.Parse(dr[0].ToString());
            }
            return ma;
        }
        public bool UpdateDocs(string idclaim,string tenclaim, string doc, string na, int idgiaidoan, int rate, string brief, string follower)
        {
            bool kq = false;
            string sql = "sp_Claim_UpdateDocs";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            SqlParameter ten = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            ten.Value = tenclaim;
            ds.Add(ten);
            SqlParameter nextA = new SqlParameter("@nextA", SqlDbType.NVarChar);
            nextA.Value = na;
            ds.Add(nextA);
            SqlParameter docs = new SqlParameter("@docs", SqlDbType.NVarChar);
            docs.Value = doc;
            ds.Add(docs);
            SqlParameter giaidoan = new SqlParameter("@idgiaidoan", SqlDbType.Int);
            giaidoan.Value = idgiaidoan;
            ds.Add(giaidoan);
            SqlParameter raTe = new SqlParameter("@rate", SqlDbType.Int);
            raTe.Value = rate;
            ds.Add(raTe);

            SqlParameter suviec = new SqlParameter("@brief", SqlDbType.NVarChar);
            suviec.Value = brief;
            ds.Add(suviec);

            SqlParameter follo = new SqlParameter("@follower", SqlDbType.NVarChar);
            follo.Value = follower;
            ds.Add(follo);

            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool ReduceRate()
        {
            string sql = "sp_Claim_UpdateAuToRate";
            return SqlDataAcessHelper.exNonStoreNoParas(sql);
        }
        public bool UpdatePrepareILA(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVILA";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateCheckILA(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVILACheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdatePreparePR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVPR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateCheckPR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVPRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdatePrepareIR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVIR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateCheckIR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVIRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdatePrepareFR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateCheckFR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVFRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdatePrepareFFR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVFFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateCheckFFR(string idclaim, int idgdv)
        {
            string sql = "sp_CLAIM_Update_GDVFFRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@idgdv", idgdv));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataRow InfoSignatureILAPre(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyILAPre";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim",idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr=null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureILACheck(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyILACheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignaturePRPre(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyPRPre";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignaturePRCheck(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyPRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureIRPre(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyIR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureIRCheck(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyIRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureFRPre(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureFRCheck(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyFRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureFFRPre(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyFFR";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureFFRCheck(string idclaim)
        {
            string sql = "sp_Claim_Select_ChuCkyFFRCheck";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataRow InfoSignatureDirector()
        {
            string sql = "sp_Info_GiamDoc";
           
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public bool UpdateTBCQCN(string idclaim, string status)
        { 
            string sql="sp_Claimm_UpdateTBCQCN";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@stt", status));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateLHTT(string idclaim, int idlhtt)
        {
            string sql = "sp_Claim_UpdateLHTT";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@id", idlhtt));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataRow GetGeneralInformation(string idclaim)
        {
            string sql = "sp_Claim_GeneralInfo";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim",idclaim));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
            {
                dr=dt.Rows[0];
            }
            return dr;
        }
        public DataTable SearchNDBH(string key)
        {
            string sql = "sp_KhachHang_Search";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key", key));           
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable SearchLHTT(string key)
        {
            string sql = "sp_Claim_SearchLoaiHinhTT";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key ", key));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable SearchPolicy(string key)
        {
            string sql = "sp_Claim_SearchPolicy";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key ", key));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable SearchBrief(string key)
        {
            string sql = "sp_Claim_SearchBrief";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key ", key));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable SearchDKBS(string key)
        {
            string sql = "sp_Claim_SearchDKBS";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key ", key));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable SearchAllCase(string key)
        {
            string sql = "sp_Claim_SearchAll";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@key ", key));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}