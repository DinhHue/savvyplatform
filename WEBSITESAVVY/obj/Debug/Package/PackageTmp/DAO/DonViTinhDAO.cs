using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class DonViTinhDAO
    {
        public bool Insert(string ten)
        {
            string sql = "sp_DonViTinh_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tendonvi = new SqlParameter("@tendonvi", SqlDbType.NVarChar);
            tendonvi.Value = ten;
            ds.Add(tendonvi);
            bool kq = false;
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }

        public bool Delete(int ma)
        {
            string sql = "sp_DonViTinh_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@madonvi", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            bool kq = false;
            kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable SelectAll()
        { 
            string sql="sp_DonViTinh_Select";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
    }
}