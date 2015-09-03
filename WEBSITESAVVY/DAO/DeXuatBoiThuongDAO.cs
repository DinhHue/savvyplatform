using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class DeXuatBoiThuongDAO
    {
        public bool ThemDeXuatBoiThuong(DeXuatBoiThuongDTO dx)
        {
            string sql = "sp_DeXuatBoiThuong_insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = dx.MaClain;
            ds.Add(idclaim);
            //SqlParameter stt = new SqlParameter("@stt", SqlDbType.Int);
            //stt.Value = dx.Stt;
            //ds.Add(stt);
            SqlParameter diengiai = new SqlParameter("@diengiai",SqlDbType.NVarChar);
            diengiai.Value = dx.DienGiai;
            ds.Add(diengiai);
            SqlParameter giatri = new SqlParameter("@giatrikhieunai",SqlDbType.Float);
            giatri.Value = dx.GiaTriKhieuNai;
            ds.Add(giatri);
            SqlParameter dexuat = new SqlParameter("@dexuattinhtoan",SqlDbType.Float);
            dexuat.Value = dx.DeXuatTinhToan;
            ds.Add(dexuat);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CapNhatDeXuatTinhToan(DeXuatBoiThuongDTO dx)
        {
            string sql = "sp_DeXuatBoiThuong_update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = dx.MaClain;
            ds.Add(idclaim);
            SqlParameter madexuat = new SqlParameter("@iddexuatboithuong", SqlDbType.Int);
            madexuat.Value = dx.IdDeXuatBoiThuong;
            ds.Add(madexuat);
            SqlParameter diengiai = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            diengiai.Value = dx.DienGiai;
            ds.Add(diengiai);
            SqlParameter giatri = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            giatri.Value = dx.GiaTriKhieuNai;
            ds.Add(giatri);
            SqlParameter dexuat = new SqlParameter("@dexuattinhtoan", SqlDbType.Float);
            dexuat.Value = dx.DeXuatTinhToan;
            ds.Add(dexuat);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool XoaDeXuatTinhToan(string id, int ma)
        {
            string sql = "sp_DeXuatBoiThuong_delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            SqlParameter sTT = new SqlParameter("@iddexuatboithuong", SqlDbType.Int);
            sTT.Value = ma;
            ds.Add(sTT);
           
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DanhSachDeXuat(string id)
        {
            string sql = "sp_DeXuatBoiThuong_select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            return dt = SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public int SoThuTu(string macl)
        {
            string sql = "sp_DeXuatBoiThuong_LaySTT";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = macl;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int so=0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                so = int.Parse(dr[0].ToString());
            }
            return so;
        }
    }
}