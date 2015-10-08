using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class CongTacPhongChuaChayDAO
    {
        public bool CongTacPhongChuaChayMoi(CongTacPhongChayDTO ctcc)
        {
            string sql="sp_CongTacPhongChuaChayMoi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maksrr = new SqlParameter("@id", SqlDbType.Int);
            maksrr.Value = ctcc.Id;
            ds.Add(maksrr);
            SqlParameter capnuoc = new SqlParameter("@capnuoccc",SqlDbType.NVarChar);
            capnuoc.Value = ctcc.CapNuocChuaChay;
            ds.Add(capnuoc);
            SqlParameter soluong = new SqlParameter("@soluong",SqlDbType.NVarChar);
            soluong.Value = ctcc.SoLuong;
            ds.Add(soluong);
            SqlParameter tongso = new SqlParameter("@tongso",SqlDbType.Int);
            tongso.Value = ctcc.TongSo;
            ds.Add(tongso);
            SqlParameter thuongtruc = new SqlParameter("@thuongtruc", SqlDbType.Int);
            thuongtruc.Value = ctcc.ThuongTruc;
            ds.Add(thuongtruc);
            SqlParameter huanluyen = new SqlParameter("@huanluyencc", SqlDbType.NVarChar);
            huanluyen.Value = ctcc.HuaLuyenPCCC;
            ds.Add(huanluyen);
            SqlParameter khoangcachtrampccc = new SqlParameter("@khoangcachtramcc", SqlDbType.NVarChar);
            khoangcachtrampccc.Value = ctcc.KhoangCachTramPCCC;
            ds.Add(khoangcachtrampccc);
            SqlParameter hethongcctd = new SqlParameter("@hethongcctd",SqlDbType.NVarChar);
            hethongcctd.Value = ctcc.HeThongCCTuDong;
            ds.Add(hethongcctd);
            SqlParameter mucdophu = new SqlParameter("@mucdophu",SqlDbType.NVarChar);
            mucdophu.Value = ctcc.MucDoPhu;
            ds.Add(mucdophu);
            SqlParameter motathem = new SqlParameter("@motathem",SqlDbType.NVarChar);
            motathem.Value = ctcc.MoTaThem;
            ds.Add(motathem);
            SqlParameter donvidoclap = new SqlParameter("@donvidoclap", SqlDbType.NVarChar);
            donvidoclap.Value = ctcc.DonViDocLap;
            ds.Add(donvidoclap);
            SqlParameter tinhtrang = new SqlParameter("@tinhtrang",SqlDbType.NVarChar);
            tinhtrang.Value = ctcc.TinhTrang;
            ds.Add(tinhtrang);
            SqlParameter chieudaivoinuoc = new SqlParameter("@chieudaivoinuoc",SqlDbType.NVarChar);
            chieudaivoinuoc.Value = ctcc.ChieuDaiVoiNuoc;
            ds.Add(chieudaivoinuoc);
            SqlParameter hethongbaochay = new SqlParameter("@hethongbaochay",SqlDbType.NVarChar);
            hethongbaochay.Value = ctcc.HeThongBaoChay;
            ds.Add(hethongbaochay);
            SqlParameter tinhtrangthietbi = new SqlParameter("@tinhtrangthietbi",SqlDbType.NVarChar);
            tinhtrangthietbi.Value = ctcc.TinhTrangThietBi;
            ds.Add(tinhtrangthietbi);
            SqlParameter soluongbinhcc = new SqlParameter("@soluongbinhcc",SqlDbType.Int);
            soluongbinhcc.Value = ctcc.SoLuongBinhCC;
            ds.Add(soluongbinhcc);
            SqlParameter cctreotuong = new SqlParameter("@cctreotuong",SqlDbType.NVarChar);
            cctreotuong.Value = ctcc.CCTreoTuong;
            ds.Add(cctreotuong);
            SqlParameter chuongngaivat = new SqlParameter("@chuongngaivat",SqlDbType.NVarChar);
            chuongngaivat.Value = ctcc.ChuongNgaiVat;
            ds.Add(chuongngaivat);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
    }
}