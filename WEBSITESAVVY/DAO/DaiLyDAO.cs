using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;

namespace WEBSITESAVVY.DAO
{
    public class DaiLyDAO
    {
        public bool DaiLyMoi(DAILYDTO dl)
        {
            string sql = "sp_DaiLyToDo_insert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter maclaim = new SqlParameter("@maclaim", SqlDbType.VarChar);
            maclaim.Value = dl.MaClaim;
            ds.Add(maclaim);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = dl.DienGiai;
            ds.Add(diengiai);
            SqlParameter rate = new SqlParameter("@rate",SqlDbType.Int);
            rate.Value = dl.Rate;
            ds.Add(rate);
            SqlParameter mucdo = new SqlParameter("@mamucdo",SqlDbType.Int);
            mucdo.Value = dl.Lev;
            ds.Add(mucdo);
            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = dl.MaGDV;
            ds.Add(gdv);
            SqlParameter date = new SqlParameter("@ngay", SqlDbType.Date);
            date.Value = dl.Ngay;
            ds.Add(date);
            SqlParameter datedead = new SqlParameter("@deadline", SqlDbType.Date);
            datedead.Value = dl.Deadline;
            ds.Add(datedead);
            SqlParameter gdvgiao = new SqlParameter("@idgdvnhan",SqlDbType.Int);
            gdvgiao.Value = dl.MaGDVNhan;
            ds.Add(gdvgiao);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThongBaoCheck(DAILYDTO dl)
        {
            string sql = "sp_DaiLyToDo_insertTB";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter maclaim = new SqlParameter("@maclaim", SqlDbType.VarChar);
            maclaim.Value = dl.MaClaim;
            ds.Add(maclaim);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = dl.DienGiai;
            ds.Add(diengiai);
            SqlParameter rate = new SqlParameter("@rate", SqlDbType.Int);
            rate.Value = dl.Rate;
            ds.Add(rate);
            SqlParameter mucdo = new SqlParameter("@mamucdo", SqlDbType.Int);
            mucdo.Value = dl.Lev;
            ds.Add(mucdo);
            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = dl.MaGDV;
            ds.Add(gdv);
            SqlParameter date = new SqlParameter("@ngay", SqlDbType.Date);
            date.Value = dl.Ngay;
            ds.Add(date);
            SqlParameter datedead = new SqlParameter("@deadline", SqlDbType.Date);
            datedead.Value = dl.Deadline;
            ds.Add(datedead);
            SqlParameter gdvgiao = new SqlParameter("@idgdvnhan", SqlDbType.Int);
            gdvgiao.Value = dl.MaGDVNhan;
            ds.Add(gdvgiao);
            SqlParameter report = new SqlParameter("@rp", SqlDbType.VarChar);
            report.Value = dl.Report;
            ds.Add(report);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataRow LayThongBao(string rp, string id)
        {
            string sql = "sp_DaiLyToDo_SelectThongBao";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@report", rp));
            ds.Add(new SqlParameter("@idclaim",id));
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr=null;
            if (dt.Rows.Count > 0)
                dr = dt.Rows[0];
            return dr;
        }
        public DataTable ListImportant(int magdv)
        {
            string sql = "sp_DaiLy_selectImportant";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = magdv;
            ds.Add(gdv);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable ListWaiting(int magdv)
        {
            string sql = "sp_DaiLy_selectWaiting";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = magdv;
            ds.Add(gdv);
            return SqlDataAcessHelper.exStoreParas(sql,ds);
        }
        public bool UpRate(int madaily)
        {
            string sql = "sp_Daily_UpRate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool DownRate(int madaily)
        {
            string sql = "sp_Daily_DownRate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public string LayTinhTrang(string id, string report)
        {
            string sql = "sp_DAILYTODO_KiemTraTinhTrang";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", id));
            ds.Add(new SqlParameter("@report", report));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string tt = null;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                tt = dr[0].ToString();
            }
            return tt;
        }
        public DataTable DaiLyTheoMa(int madaily)
        {
            string sql = "sp_DaiLy_SelectMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ma", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DaiLyDone(int magdv)
        {
            string sql = "sp_DaiLy_SelectDone";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool DoneDaily(int madaily)
        {
            string sql = "sp_Daily_Done";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool DeleteDaiLy(int madaily)
        {
            string sql = "sp_DaiLy_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool UpdateDaily(int madaily,string diengiai, DateTime date)
        {
            string sql = "sp_DAILYTODO_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            SqlParameter dienGiai = new SqlParameter("@diengiai",SqlDbType.NVarChar);
            dienGiai.Value = diengiai;
            ds.Add(dienGiai);
            SqlParameter dead = new SqlParameter("@deadline",SqlDbType.Date);
            dead.Value = date;
            ds.Add(dead);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool Chuyen(int madaily)
        {
            string sql = "sp_Dailytodo_Chuyen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ChuyenImportant(int madaily)
        {
            string sql = "sp_Dailytodo_ChuyenImportant";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable TaskReceived(int magdv)
        {
            string sql = "sp_TaskReceived";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TaskAssigned(int magdv)
        {
            string sql = "sp_TaskAssigned";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TaskClaim(string idclaim)
        {
            string sql = "sp_TaskCase";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TaskAssigedDone(int magdv)
        {
            string sql = "sp_TaskDone";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TaskManage(int magdv)
        {
            string sql = "sp_TaskManage";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable GetEmailNguoiGiao(int madaily)
        { 
            string sql="sp_DaiLyToDo_LayEmailNguoiGiao";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            //string email = "";
            //if (dt.Rows.Count > 0)
            //{
            //    DataRow dr = dt.Rows[0];
            //    email = dr[0].ToString();
            //}
            return dt;
        }
        public DataTable GetInfoTask(int madaily)
        {
          
            string sql = "sp_DaiLy_EmailReceiver";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@madaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            DataTable dt = new DataTable();
            return dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            //if (dt.Rows.Count > 0)
            //{
            //    DataRow dr = dt.Rows[0];
            //    email = dr[0].ToString();
            //}
            //return email;
        }
        public DataTable AllTask()
        {
            string sql = "sp_Tasktodo_AllTask";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool UpdateYkien(int madaily, string ykien)
        {
            string sql = "sp_DaiLy_EditYKien";

            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@iddaily", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);

            SqlParameter yk = new SqlParameter("@ykien", SqlDbType.NVarChar);
            yk.Value = ykien;
            ds.Add(yk);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable SelectDaiLy(int madaily)
        {
            string sql = "sp_DaiLy_SelectDaiLyNhan";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = madaily;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }

        public bool CheckedReport(string idclaim, string report,string ykien, DateTime ngayxong)
        {
            string sql = "sp_DAILYTODO_CheckedSR01";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@report",report));
            ds.Add(new SqlParameter("@ykien", ykien));
            ds.Add(new SqlParameter("@datedone", ngayxong));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

        public DataRow SelectMessageReport(string idclaim, string report)
        {
            string sql = "sp_DAILYTODO_SelectRP";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@report", report));
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
            {
                dr = dt.Rows[0];                
            }
            return dr;
        }
    }
}