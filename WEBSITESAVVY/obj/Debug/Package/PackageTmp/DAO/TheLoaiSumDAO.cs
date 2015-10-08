using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class TheLoaiSumDAO
    {
        public bool Them(string ten)
        {
            string sql = "sp_TheLoaiSum_Them";
            List<SqlParameter> ds = new List<SqlParameter>() ;
            SqlParameter theloai = new SqlParameter("@theloai",SqlDbType.NVarChar);
            theloai.Value = ten;
            ds.Add(theloai);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CapNhat(int ma, string ten)
        {
            string sql= "sp_TheLoaiSum_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maTL = new SqlParameter("@id",SqlDbType.Int);
            maTL.Value = ma;
            ds.Add(maTL);
            SqlParameter theloai = new SqlParameter("@theloai", SqlDbType.NVarChar);
            theloai.Value = ten;
            ds.Add(theloai);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool Xoa(int ma)
        {
            string sql= "sp_TheLoaiSum_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter maTL = new SqlParameter("@ma", SqlDbType.Int);
            maTL.Value = ma;
            ds.Add(maTL);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds) ;
        }
        public DataTable DanhSach()
        {
            
            string sql= "sp_TheLoaiSum_DanhSach";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
            
        }
    }
}