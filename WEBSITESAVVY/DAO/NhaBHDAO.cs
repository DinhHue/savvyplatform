using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class NhaBHDAO
    {
        public DataTable DSCongTyTong()
        {
            DataTable dt = new DataTable();
            string sql = "sp_DSNhaBH";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable CongTyTheoTen(string ten)
        {
            string sql= "sp_NhaBaoHiem_Ten";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter nbh = new SqlParameter("@ten", SqlDbType.NVarChar);
            nbh.Value = ten;
            ds.Add(nbh);
            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds); ;
            return dt;
        }
        public bool XoaCongTy(int id)
        {
            string sql= "sp_CongTyBaoHiem_Delete";
            List<SqlParameter> ds = new List<SqlParameter>(); 
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool ThemCongTy(string ten)
        {
           string sql="sp_CongTyBaoHiem_Them";
           List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ten", SqlDbType.NVarChar);
            ma.Value = ten;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds); ;
        }
        public bool SuaCongTy(int a, string b)
        {
            string sql="sp_CongTyBaoHiem_Sua";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = a;
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.NVarChar);
            ten.Value = b;
            ds.Add(ma);
            ds.Add(ten);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public string LayTen(int ma)
        {
            string sql = "sp_NhaBaoHiem_LayTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@ma",SqlDbType.Int);
            ID.Value = ma;
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
    }
}