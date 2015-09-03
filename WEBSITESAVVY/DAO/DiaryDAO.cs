using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.DAO
{
    public class DiaryDAO
    {
        public DataTable DSDiaryTheoGDV(int maGDV)
        {
            string sql = "sp_Diary_select_GDV2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maGDV", SqlDbType.Int);
            ma.Value = maGDV;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSDiaryTheoThamChieu(string thamchieu)
        {
            string sql = "sp_Diary_select_ThamChieu2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tc = new SqlParameter("@maClaim", SqlDbType.VarChar);
            tc.Value = thamchieu;
            ds.Add(tc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSDiaryDangThucHien()
        {
            string sql = "sp_Diary_select_DangThucHien2";

            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool DiaryMoi(DiaryDTO dr)
        {
            string sql = "sp_Diary_insert2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magdv = new SqlParameter("@maGDV", SqlDbType.Int);
            magdv.Value = dr.MaGDV;
            ds.Add(magdv);
            SqlParameter macl = new SqlParameter("@maClaim", SqlDbType.VarChar);
            macl.Value = dr.MaClaim;
            ds.Add(macl);
            SqlParameter ngaythuc = new SqlParameter("@ngaythuc", SqlDbType.DateTime);
            ngaythuc.Value = dr.NgayThuc;
            ds.Add(ngaythuc);
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.DateTime);
            ngay.Value = dr.Ngay;
            ds.Add(ngay);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = dr.DienGiai;
            ds.Add(diengiai);
            SqlParameter sogio = new SqlParameter("@sogio", SqlDbType.Float);
            sogio.Value = dr.SoGio;
            ds.Add(sogio);
            SqlParameter batdau = new SqlParameter("@ngaygiobatdau", SqlDbType.DateTime);
            batdau.Value = dr.NgayGioBatDau;
            ds.Add(batdau);
            SqlParameter ketthuc = new SqlParameter("@ngaygioketthuc", SqlDbType.DateTime);
            ketthuc.Value = dr.NgayGioKetThuc;
            ds.Add(ketthuc);
            SqlParameter ketqua = new SqlParameter("@ketqua", SqlDbType.NVarChar);
            ketqua.Value = dr.KetQua;
            ds.Add(ketqua);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool CapNhatDiary(DiaryDTO dr)
        {
            string sql = "sp_Diary_update2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madr = new SqlParameter("@madiary", SqlDbType.Int);
            madr.Value = dr.MaDiary;
            ds.Add(madr);
            SqlParameter macl = new SqlParameter("@maClaim", SqlDbType.VarChar);
            macl.Value = dr.MaClaim;
            ds.Add(macl);

            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.DateTime);
            ngay.Value = dr.Ngay;
            ds.Add(ngay);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = dr.DienGiai;
            ds.Add(diengiai);
            SqlParameter sogio = new SqlParameter("@sogio", SqlDbType.Float);
            sogio.Value = dr.SoGio;
            ds.Add(sogio);
            SqlParameter batdau = new SqlParameter("@ngaygiobatdau", SqlDbType.DateTime);
            batdau.Value = dr.NgayGioBatDau;
            ds.Add(batdau);
            SqlParameter ketthuc = new SqlParameter("@ngaygioketthuc", SqlDbType.DateTime);
            ketthuc.Value = dr.NgayGioKetThuc;
            ds.Add(ketthuc);
            SqlParameter ketqua = new SqlParameter("@ketqua", SqlDbType.NVarChar);
            ketqua.Value = dr.KetQua;
            ds.Add(ketqua);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool XoaDiary(int ma)
        {
            string sql = "sp_Diary_delete2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madr = new SqlParameter("@madiary", SqlDbType.Int);
            madr.Value = ma;
            ds.Add(madr);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable ThongTinCLaim_Diary(string ma)
        {
            string sql = "sp_Claim_Diary2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madr = new SqlParameter("@mathamchieu", SqlDbType.VarChar);
            madr.Value = ma;
            ds.Add(madr);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSDiaryTheoGDV_ThamChieu(string thamchieu, int ma)
        {
            string sql = "sp_Diary_selectThamChieu_GDV2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter magdv = new SqlParameter("@magdv", SqlDbType.Int);
            magdv.Value = ma;
            ds.Add(magdv);
            SqlParameter matc = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            matc.Value = thamchieu;
            ds.Add(matc);
           
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        //Lay timesheet
        public DataTable DSTimeSheetPending()
        {
            string sql = "sp_Diary_timesheet_allpending2";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DSTimeSheetTheoThamChieu(string thamchieu)
        {
            string sql = "sp_Diary_timesheet_thamchieu2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@mathamchieu", SqlDbType.VarChar);
            ma.Value = thamchieu;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
            return dt;
        }
        public DataTable DSTimeSheetTheoGDV(int magdv)
        {
            string sql = "sp_Diary_timesheet_gdv2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSTimeSheetTheoGDV_ThamChieu(int magdv,string thamchieu)
        {
            string sql = "sp_Diary_timesheet_gdvtheoclaim2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter gdv = new SqlParameter("@magdv", SqlDbType.Int);
            gdv.Value = magdv;
            ds.Add(gdv);
            SqlParameter tc = new SqlParameter("@mathamchieu", SqlDbType.VarChar);
            tc.Value = thamchieu;
            ds.Add(tc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public float TongThoiLuongPhatSinh(string mathamchieu)
        {
            string sql = "sp_Diary_TongThoiLuongPhatSinh2";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tc = new SqlParameter("@mathamchieu", SqlDbType.VarChar);
            tc.Value = mathamchieu;
            ds.Add(tc);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas( sql,ds);
            float thoiluong = -1;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string temp = dr[0].ToString();
                if (temp !="")
                    thoiluong = float.Parse(dr[0].ToString());
                else
                    return 0;
            }
            return thoiluong;
        }
        public DataTable Statistict(DateTime start, DateTime end)
        {
            string sql = "sp_Diary_Timesheetstatistic";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter bd = new SqlParameter("@start", SqlDbType.DateTime);
            bd.Value = start;
            ds.Add(bd);
            SqlParameter kt = new SqlParameter("@end", SqlDbType.DateTime);
            kt.Value = end;
            ds.Add(kt);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;

        }
        public DataTable LietKeGDVCLaim(string claim)
        {
            string sql = "sp_Diary_LietKeGDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.DateTime);
            id.Value = claim;
            ds.Add(id);
           
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool updateResult(int id, string result)
        {
            string sql = "sp_Diary_UpdateResult";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madr = new SqlParameter("@iddiary", SqlDbType.Int);
            madr.Value = id;
            ds.Add(madr);
            SqlParameter macl = new SqlParameter("@ketqua", SqlDbType.NVarChar);
            macl.Value = result;
            ds.Add(macl);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}