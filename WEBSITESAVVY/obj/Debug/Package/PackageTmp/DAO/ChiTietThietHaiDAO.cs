using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
using System.Data;
namespace WEBSITESAVVY.DAO
{
    public class ChiTietThietHaiDAO
    {
        public bool ThemChiTietThietHai1(ChiTietThietHaiDTO ct)
        {
            string sql = "sp_ChiTietThietHai_insert1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma= new SqlParameter("@idclaim",SqlDbType.VarChar);
            ma.Value=ct.MaClaim;
            ds.Add(ma);
            SqlParameter malinhvuc= new SqlParameter("@malinhvuc",SqlDbType.Int);
            malinhvuc.Value=ct.MaLinhVucTonThat;
            ds.Add(malinhvuc);
            SqlParameter diengiai= new SqlParameter("@diengiai",SqlDbType.NVarChar);
            diengiai.Value=ct.DienGiai;
            ds.Add(diengiai);
            SqlParameter giatrikhieunai= new SqlParameter("@giatrikhieunai",SqlDbType.Float);
            giatrikhieunai.Value=ct.GiaTriKhieuNai;
            ds.Add(giatrikhieunai);
            SqlParameter chiphikhoiphuc= new SqlParameter("@chiphikhoiphuc",SqlDbType.Float);
            chiphikhoiphuc.Value=ct.ChiPhiKhoiPhuc;
            ds.Add(chiphikhoiphuc);
            SqlParameter dexuattinhtoan= new SqlParameter("@dexuattinhtoan",SqlDbType.Float);
            dexuattinhtoan.Value=ct.DeXuatTinhToan;
            ds.Add(dexuattinhtoan);
            SqlParameter ghichu= new SqlParameter("@ghichu",SqlDbType.NVarChar);
            ghichu.Value=ct.GhiChu;
            ds.Add(ghichu);
            bool kq= SqlDataAcessHelper.exNonStoreParas(sql,ds);
            return kq;
        }
        public bool ThemChiTietThietHai2(ChiTietThietHaiDTO ct)
        {
            string sql = "sp_ChiTietThietHai_insert2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = ct.MaClaim;
            ds.Add(ma);
            SqlParameter malinhvuc = new SqlParameter("@malinhvuc", SqlDbType.Int);
            malinhvuc.Value = ct.MaLinhVucTonThat;
            ds.Add(malinhvuc);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = ct.DienGiai;
            ds.Add(diengiai);
            SqlParameter giatrikhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            giatrikhieunai.Value = ct.GiaTriKhieuNai;
            ds.Add(giatrikhieunai);
            SqlParameter chiphikhoiphuc = new SqlParameter("@thiethaihoply", SqlDbType.Float);
            chiphikhoiphuc.Value = ct.ThietHaiHopLy;
            ds.Add(chiphikhoiphuc);
            SqlParameter dexuattinhtoan = new SqlParameter("@dexuattinhtoan", SqlDbType.Float);
            dexuattinhtoan.Value = ct.DeXuatTinhToan;
            ds.Add(dexuattinhtoan);
            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = ct.GhiChu;
            ds.Add(ghichu);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable DanhSachChiTietThietHai1(string idclaim, int malv)
        {
            string sql = "sp_ChiTietThietHai_select1";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            SqlParameter malinhvuc = new SqlParameter("@malinhvuc", SqlDbType.Int);
            malinhvuc.Value = malv;
            ds.Add(malinhvuc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DanhSachChiTietThietHai2(string idclaim, int malv)
        {
            string sql = "sp_ChiTietThietHai_select2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            SqlParameter malinhvuc = new SqlParameter("@malinhvuc", SqlDbType.Int);
            malinhvuc.Value = malv;
            ds.Add(malinhvuc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public int SoThuTu(string idclaim)
        {
            string sql = "sp_ChiTietThietHai_LaySTT";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int so = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                so = int.Parse(dr[0].ToString());
            }
            return so;
        }
        public DataTable LayMaLinhVucTonThat(string mathamchieu)
        {
            string sql = "sp_ChiTietThietHai_KiemTraMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = mathamchieu;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
    }
}