using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class DaiDienDAO
    {
        public bool ThemDaiDienMoi(DaiDienDTO dd)
        {
            string sql= "sp_NguoiDaiDienDonViBH";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter name = new SqlParameter("@tendaidien", SqlDbType.NVarChar);
            name.Value = dd.TenNguoiDaiDien;
            ds.Add(name);
            SqlParameter maDonVi = new SqlParameter("@madonvi", SqlDbType.Int);
            maDonVi.Value = dd.MaDonVi;
            ds.Add(maDonVi);
            SqlParameter phongban = new SqlParameter("@phongban", SqlDbType.NVarChar);
            phongban.Value = dd.PhongBan;
            ds.Add(phongban);
            SqlParameter chucvu = new SqlParameter("@chucvu", SqlDbType.NVarChar);
            chucvu.Value = dd.ChucVu;
            ds.Add(chucvu);
            SqlParameter dienthoai = new SqlParameter("@dienthoai", SqlDbType.NVarChar);
            dienthoai.Value = dd.DienThoai;
            ds.Add(dienthoai);
            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar);
            email.Value = dd.Email;
            ds.Add(email);

            SqlParameter boithuong = new SqlParameter("@boithuong", SqlDbType.Int);
            boithuong.Value = dd.ThucHienBoiThuong;
            ds.Add(boithuong);

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;

        }
        public DataTable DSNguoiDaiDien(int madonvi)
        {
            DataTable dt = new DataTable();
            string sql = "sp_DanhSachNguoiDaiDienTheoDonVi";
            
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maDV = new SqlParameter("@madonvi", SqlDbType.Int);
            maDV.Value = madonvi;
            ds.Add(maDV);
           
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool XoaDaiDien(int id)
        {
            string sql = "sp_DaiDien_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@iddaidien", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataRow InfoDaiDien(int ma)
        {
            string sql = "sp_DaiDien_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madd = new SqlParameter("@ma", SqlDbType.Int);
            madd.Value = ma;
            ds.Add(madd);

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0];
            }
            return null;
        }
        public bool UpdateDaiDien(DaiDienDTO dd)
        {
            string sql = "sp_DaiDien_Update";//@ma int,@ten nvarchar(100),@phongban nvarchar(100), @chucvu nvarchar(100),@dienthoai varchar(50),@email varchar(50)
             List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@ten", SqlDbType.NVarChar);
            ten.Value = dd.TenNguoiDaiDien;
            ds.Add(ten);
            SqlParameter ma = new SqlParameter("@ma", SqlDbType.Int);
            ma.Value = dd.MaDaiDien;
            ds.Add(ma);
            SqlParameter phongban = new SqlParameter("@phongban", SqlDbType.NVarChar);
            phongban.Value = dd.PhongBan;
            ds.Add(phongban);
            SqlParameter chucvu = new SqlParameter("@chucvu", SqlDbType.NVarChar);
            chucvu.Value = dd.ChucVu;
            ds.Add(chucvu);
            SqlParameter dienthoai = new SqlParameter("@dienthoai", SqlDbType.NVarChar);
            dienthoai.Value = dd.DienThoai;
            ds.Add(dienthoai);
            SqlParameter email = new SqlParameter("@email", SqlDbType.NVarChar);
            email.Value = dd.Email;
            ds.Add(email);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
           
        }
    }
}