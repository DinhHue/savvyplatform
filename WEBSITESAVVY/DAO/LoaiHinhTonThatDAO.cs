using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class LoaiHinhTonThatDAO
    {
        public DataTable DSLoaiHinhTT()
        {            
           string sql= "sp_DSLoaiHinhTonThat";
           DataTable dt = new DataTable();
           dt = SqlDataAcessHelper.exStoreNoParas(sql);
           return dt;
        }
        public bool Them(string ten)
        {
            string sql = "sp_LoaiHinhTonThat_Them";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter loaihinh = new SqlParameter("@ten", SqlDbType.NVarChar);
            loaihinh.Value = ten;
            ds.Add(loaihinh);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CapNhat(int ma, string ten)
        {
            string sql = "sp_LoaiHinhTonThat_CapNhat";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@ma",SqlDbType.Int);
            ID.Value = ma;
            ds.Add(ID);
            SqlParameter loai = new SqlParameter("@ten",SqlDbType.NVarChar);
            loai.Value = ten;
            ds.Add(loai);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);

        }
        public bool Xoa(int ma)
        {
            string sql = "sp_LoaiHinhTonThat_Xoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@ma", SqlDbType.Int);
            ID.Value = ma;
            ds.Add(ID);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}