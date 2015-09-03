using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class GiaiDoanDAO
    {
        public DataTable DSGiaiDoan()
        {
            DataTable dt = new DataTable();
            string sql= "sp_GIAIDOAN_select";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool XoaGiaiDoan(int id)
        {
            string sql= "sp_GiaiDoan_Delete";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemGiaiDoan(string ten)
        {
            string sql= "sp_GiaiDoan_Them";
            List<SqlParameter>ds=new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ten", SqlDbType.NVarChar);
            ma.Value = ten;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool SuaGiaiDoan(int a, string b)
        {
            string sql="sp_GiaiDoan_Sua";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = a;
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.NVarChar);
            ten.Value = b;
            ds.Add(ma);
            ds.Add(ten);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
    }
}