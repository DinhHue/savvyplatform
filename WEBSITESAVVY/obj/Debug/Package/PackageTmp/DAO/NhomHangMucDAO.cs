using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class NhomHangMucDAO
    {
        public DataTable DanhSach()
        {
            string sql = "sp_NhomHangMuc_select";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool ThemMoi(string ten)
        {
            string sql = "sp_NhomHangMuc_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tennhom = new SqlParameter("@tennhomhangmuc", SqlDbType.NVarChar);
            tennhom.Value = ten;
            ds.Add(tennhom);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);            
        }
        public bool CapNhat(int ma, string ten)
        {
            string sql = "sp_NhomHangMuc_Update";

            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            SqlParameter tennhom = new SqlParameter("@ten", SqlDbType.NVarChar);
            tennhom.Value = ten;
            ds.Add(tennhom);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);  
        }
        public bool Xoa(int ma)
        {
            string sql = "sp_NhomHangMuc_Delete";

            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}