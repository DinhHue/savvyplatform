using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WEBSITESAVVY.DAO
{
    public class ChucVuDAO
    {
        public DataTable DSChucVu()
        {
            DataTable dt = new DataTable();
            string sql = "sp_DSChucVu";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool XoaChucVu(int id)
        {
            string sql = "sp_ChucVu_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemChucVu(string ten)
        {
            string sql = "sp_ChucVu_Them";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ten", SqlDbType.NVarChar);
            ma.Value = ten;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool SuaChucVu(int a, string b)
        {
            string sql = "sp_ChucVu_Sua";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = a;
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.NVarChar);
            ten.Value = b;
            ds.Add(ma);
            ds.Add(ten);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}
