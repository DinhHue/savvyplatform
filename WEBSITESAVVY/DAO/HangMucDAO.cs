using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class HangMucDAO
    {
        public DataTable DanhSachHangMuc()
        {
            DataTable dt = new DataTable();
            string sql = "sp_HangMuc_Select";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool CapNhat(int id, string ten)
        {
            string sql = "sp_HangMuc_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter name = new SqlParameter("@hangmuc", SqlDbType.NVarChar);
            name.Value = ten;
            ds.Add(name);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool Xoa(int id)
        {
            string sql = "sp_HangMuc_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);           
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemMoi(int id, string ten)
        {
            string sql = "sp_HangMuc_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter name = new SqlParameter("@tenhangmuc", SqlDbType.NVarChar);
            name.Value = ten;
            ds.Add(name);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public int MaMax()
        {
            string sql = "sp_HangMuc_MaxID";
            int ma = 0;
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = int.Parse(dr[0].ToString());
            }
            return ma;
        }
    }
}