using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.DAO
{
    public class LoaiDRDAO
    {
        public DataTable DanhSachLoai()
        {
            string sql = "sp_LoaiDR_Select";
            DataTable dt = new DataTable();
             dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool Insert(string tenloai)
        {
            string sql = "sp_LoaiDR_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@tenloai", SqlDbType.NVarChar);
            ten.Value = tenloai;
            ds.Add(ten);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DanhSachLoaiClaim(string idclaim)
        {
            string sql = "sp_LoaiDR_SelectClaim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@maclaim", SqlDbType.NVarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}