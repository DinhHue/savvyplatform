using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class WeeklyReportDAO
    {
        public DataTable DanhSachWRAll()
        {
            string sql = "sp_WeeklyReport_DanhSachAll";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DanhSachWRClaimDangThucHien()
        {
            string sql = "sp_WeeklyReport_DangThucHien";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool Them(WeeklyReportDTO w)
        {
            string sql = "sp_WeeklyReport_Them";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maclaim = new SqlParameter("@maclaim",SqlDbType.VarChar);
            maclaim.Value = w.MaClaim;
            ds.Add(maclaim);
            SqlParameter gdv = new SqlParameter("@idgdv",SqlDbType.Int);
            gdv.Value = w.MaGDV;
            ds.Add(gdv);
            SqlParameter giotichluy = new SqlParameter("@giotichluy", SqlDbType.Float);
            giotichluy.Value = w.GioTichLuy;
            ds.Add(giotichluy);
            SqlParameter dexuatgiamdinh = new SqlParameter("@dexuatgiamdinh",SqlDbType.NVarChar);
            dexuatgiamdinh.Value = w.DeXuatGiamDinh;
            ds.Add(dexuatgiamdinh);        
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool KiemTraWR(string thamchieu)
        {
            string sql = "sp_WeeklyReport_MaClaim";
            DataTable dt = new DataTable();
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id",SqlDbType.VarChar);
            ma.Value = thamchieu;
            ds.Add(ma);
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
            bool kq = false;
            if (dt.Rows.Count > 0)
                kq= true;
            return kq;
        }
        public bool CapNhatGioTichLuy(string thamchieu, float time)
        {

            string sql = "sp_WeeklyReport_GioTichLuy";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            maclaim.Value = thamchieu;
            ds.Add(maclaim);
            SqlParameter gio = new SqlParameter("@time", SqlDbType.Float);
            gio.Value = time;
            ds.Add(gio);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool Xoa(int ma)
        {
            string sql = "sp_WeeklyReport_Xoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idweekly", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public DataTable ChiTiet(int mawr)
        {
            string sql = "sp_WeeklyReport_ChiTiet";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idweekly",SqlDbType.Int);
            id.Value = mawr;
            ds.Add(id);
            DataTable dt = new DataTable();
            return dt = SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool CapNhat(WeeklyReportDTO w)
        {
            string sql = "sp_WeeklyReport_CapNhat";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idweekly", SqlDbType.Int);
            id.Value = w.Ma;
            ds.Add(id);
            SqlParameter dx = new SqlParameter("@dexuat",SqlDbType.NVarChar);
            dx.Value = w.DeXuatGiamDinh;
            ds.Add(dx);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public int LayMa(string maclaim)
        {
            string sql = "sp_WeeklyReport_LayMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maClaim = new SqlParameter("@maclaim",SqlDbType.VarChar);
            maClaim.Value = maclaim;
            ds.Add(maClaim);
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
        public DataTable ViewWR(string thamchieu)
        {
            string sql = "sp_WeeklyReport_View";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter claim = new SqlParameter("@thamchieu",SqlDbType.VarChar);
            claim.Value = thamchieu;
            ds.Add(claim);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimKiem(string mathamchieu)
        {
            string sql = "sp_WeeklyReport_TimKiemTheoMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maclaim = new SqlParameter("@maclaim",SqlDbType.VarChar);
            maclaim.Value = mathamchieu;
            ds.Add(maclaim);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable ListWRDonViBH(int madv)
        {
            string sql = "sp_WeeklyUpdate_SelectDonVi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter iddv = new SqlParameter("@madonvi", SqlDbType.Int);
            iddv.Value = madv;
            ds.Add(iddv);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}