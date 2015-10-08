using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class MenhGiaDAO
    {
        public bool Them(string ten)
        {
            string sql= "sp_MenhGia_Them";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter menhgia = new SqlParameter("@ten", SqlDbType.NVarChar);
            menhgia.Value = ten;
            ds.Add(menhgia);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool KiemTra(string ten)
        {
            string sql="sp_MenhGia_KiemTra";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter menhgia = new SqlParameter("@ten", SqlDbType.NVarChar);
            menhgia.Value = ten;
            ds.Add(menhgia);            
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql,ds);
            bool kq= false;
            if (dt.Rows.Count > 0)
                kq = true;
            return kq;
        }
        public DataTable DanhSach()
        {
            string sql="sp_MenhGia_DanhSach";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool CapNhat(int ma, string ten)
        {
            string sql = "sp_MenhGia_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            SqlParameter menhgia = new SqlParameter("@ten", SqlDbType.NVarChar);
            menhgia.Value = ten;
            ds.Add(menhgia);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}