using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class DanhMucThietHaiDAO
    {
        public bool ThemDanhMucThietHai(DanhMucThietHaiDTO dm)
        {
            string sql = "sp_DanhMucThietHai_insert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter maclaim = new SqlParameter("@maclaim",SqlDbType.VarChar);
            maclaim.Value = dm.MaClaim;
            ds.Add(maclaim);           

            SqlParameter mahangmuc = new SqlParameter("@mahangmuc",SqlDbType.Int);
            mahangmuc.Value = dm.MaHangMuc;
            ds.Add(mahangmuc);

            SqlParameter trangthai = new SqlParameter("@trangthai", SqlDbType.NVarChar);
            trangthai.Value = dm.TrangThai;
            ds.Add(trangthai);

            SqlParameter tinhtrang = new SqlParameter("@tinhtrang",SqlDbType.VarChar);
            tinhtrang.Value = dm.TinhTrang;
            ds.Add(tinhtrang);

            SqlParameter ykien = new SqlParameter("@ykien", SqlDbType.NVarChar);
            ykien.Value = dm.YKienGDV;
            ds.Add(ykien);

            SqlParameter thiethaiht = new SqlParameter("@thiethaihoantoan", SqlDbType.NVarChar);
            thiethaiht.Value = dm.ThietHaiHoanToan;
            ds.Add(thiethaiht);

            SqlParameter motachung = new SqlParameter("@motachung",SqlDbType.NVarChar);
            motachung.Value = dm.MoTaChung;
            ds.Add(motachung);

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;

        }
        public bool CapNhatDanhMucThietHai(DanhMucThietHaiDTO dm)
        {
            string sql = "sp_DanhMucThietHai_update";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@ma", SqlDbType.Int);
            ma.Value = dm.Ma;
            ds.Add(ma);

            ds.Add(new SqlParameter("@maHangMuc", dm.MaHangMuc));
            ds.Add(new SqlParameter("@thiethaihoantoan", dm.ThietHaiHoanToan));

            SqlParameter trangthai = new SqlParameter("@trangthai",SqlDbType.NVarChar);
            trangthai.Value = dm.TrangThai;
            ds.Add(trangthai);           

            SqlParameter tinhtrang = new SqlParameter("@tinhtrang", SqlDbType.VarChar);
            tinhtrang.Value = dm.TinhTrang;
            ds.Add(tinhtrang);

            SqlParameter ykien = new SqlParameter("@ykien", SqlDbType.NVarChar);
            ykien.Value = dm.YKienGDV;
            ds.Add(ykien);
            SqlParameter motachung = new SqlParameter("@motachung", SqlDbType.NVarChar);
            motachung.Value = dm.MoTaChung;
            ds.Add(motachung);

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable DanhSachDanhMucThietHaiTheoClaim(string mathamchieu)
        {
            string sql = "sp_DanhMucThietHai_select";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter maclaim = new SqlParameter("@maclaim",SqlDbType.VarChar);
            maclaim.Value = mathamchieu;
            ds.Add(maclaim);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool XoaDanhMucThietHai(int ma)
        {
            string sql = "sp_DanhMucThietHai_delete";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter madanhmuc = new SqlParameter("@ma", SqlDbType.Int);
            madanhmuc.Value = ma;
            ds.Add(madanhmuc);

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }

        public DataRow GetDanhMucThietHai(String ma)
        {
            string sql = "sp_DanhMucThietHai_getDM";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@id", ma));

            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt.Rows[0];
        }
    

    }
}