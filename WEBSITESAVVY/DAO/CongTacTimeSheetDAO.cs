using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class CongTacTimeSheetDAO
    {
        public bool ThemMoi(string ma, string congtac,float rate)
        {
            string sql= "sp_CongTacTimeSheet_Moi";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ID = new SqlParameter("@ma", SqlDbType.VarChar);
            ID.Value = ma;
            ds.Add(ID);
            SqlParameter congTac = new SqlParameter("@congtac", SqlDbType.NVarChar);
            congTac.Value = congtac;
            ds.Add(congTac);
            SqlParameter DG = new SqlParameter("@rate", SqlDbType.Float);
            DG.Value = rate;
            ds.Add(DG);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable DanhSachCongTac()
        {
            string sql= "sp_CongTacTimeSheet_Lay";            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool KiemTraMa(string ma)
        {

            string sql="sp_KiemTraMaCongTacTimeSheet";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ID = new SqlParameter("@ma", SqlDbType.VarChar);
            ID.Value = ma;
            ds.Add(ID);
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreNoParas(sql);
            bool kq= false;
            if (dt.Rows.Count > 0)
                kq = true;
            return kq;
        }
        public bool CapNhat(string maold,string manew, string congtac, float rate)
        {
            string sql = "sp_CongTacTS_CapNhat";
            List<SqlParameter> ds = new List<SqlParameter>();
            
            SqlParameter IDold = new SqlParameter("@maold", SqlDbType.VarChar);
            IDold.Value = maold;
            ds.Add(IDold);
            SqlParameter IDnew = new SqlParameter("@manew", SqlDbType.VarChar);
            IDnew.Value = manew;
            ds.Add(IDnew);
            SqlParameter type = new SqlParameter("@congtac", SqlDbType.NVarChar);
            type.Value = congtac;
            ds.Add(type);
            SqlParameter DG = new SqlParameter("@rate", SqlDbType.Float);
            DG.Value = rate;
            ds.Add(DG);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool Xoa(string ma)
        {
            string sql = "sp_CongTacTS_Xoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@ma", SqlDbType.VarChar);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public float ThoiLuong(string thamchieu)
        {
            string sql = "sp_TimeSheet_ThoiLuongPhatSinh";
            DataTable dt = new DataTable();
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id",SqlDbType.VarChar);
            ma.Value = thamchieu;
            ds.Add(ma);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            float h=0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                
                h = float.Parse(dr[0].ToString());
            }
            return h;
        }
    }
}