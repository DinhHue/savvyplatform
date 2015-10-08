using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class JobListDAO
    {
        public bool InsertJob(JobListDTO j)
        {          
            string sql = "sp_JobList_insert";
            List<SqlParameter> list = new List<SqlParameter>();

            SqlParameter ngay = new SqlParameter("@date", SqlDbType.Date);
            ngay.Value = j.NgayThucHien;
            list.Add(ngay);

            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = j.NameJob;
            list.Add(diengiai);

            SqlParameter maclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            maclaim.Value = j.MaClaim;
            list.Add(maclaim);

            SqlParameter maGDV = new SqlParameter("@idgdv", SqlDbType.Int);
            maGDV.Value = j.MaGDV;
            list.Add(maGDV);
            
            return SqlDataAcessHelper.exNonStoreParas(sql, list);             
        }

        public bool DeleteJob(int majob,int magdv)
        {
            string sql = "sp_JobList_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@idjob", SqlDbType.Int);
            ma.Value = majob;
            ds.Add(ma);

            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = magdv;
            ds.Add(gdv);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

        public bool UpdateJob(int idjob, string diengiai, int idgdv)
        {
            string sql = "sp_JobList_Update";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@idjob", SqlDbType.Int);
            ma.Value = idjob;
            ds.Add(ma);

            SqlParameter ten = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            ten.Value = diengiai;
            ds.Add(ten);

            SqlParameter gdv = new SqlParameter("@idgdv", SqlDbType.Int);
            gdv.Value = idgdv;
            ds.Add(gdv);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

        public DataTable JobFollow(int gdv, int maclaim)
        {
            string sql = "sp_JobList_SelectFollow";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = gdv;
            ds.Add(ma);
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = maclaim;
            ds.Add(idclaim);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable JobManage()
        {
            string sql = "sp_JobList_SelectFollow";            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable JobCaseFollow(int gdv)
        {
            string sql = "sp_JobList_NoCase";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = gdv;
            ds.Add(ma);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable JobListDate(DateTime date, int magdv)
        {
            string sql = "sp_JobList_SelectDate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.DateTime);
            ngay.Value = date;
            ds.Add(ngay);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable JobListAllDate(DateTime date)
        {
            string sql = "sp_JobList_AllToday";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ngay = new SqlParameter("@date", SqlDbType.DateTime);
            ngay.Value = date;
            ds.Add(ngay);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
    }
}