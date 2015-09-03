using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class LoaiKhachHangDAO
    {
        public DataTable DSLoaiKH()
        {
            string sql="sp_DSLoaiKH";
            DataTable dt = new DataTable();
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool XoaLoaiKhach(int id)
        {
            string sql="sp_LoaiKhach_Delete";
            List<SqlParameter>ds=new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool ThemLoaiKhach(string ten)
        {
            string sql="sp_LoaiKhach_Them";
            List<SqlParameter>ds=new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ten", SqlDbType.NVarChar);
            ma.Value = ten;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool SuaLoaiKhach(int a, string b)
        {
            string sql="sp_LoaiKhach_Sua";
            List<SqlParameter>ds=new List<SqlParameter>();
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