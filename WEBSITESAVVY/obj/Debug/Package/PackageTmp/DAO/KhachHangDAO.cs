using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class KhachHangDAO
    {
        public DataTable DSNguoiDaiDien()
        {
            string sql= "sp_DSNguoiDaiDien"; 
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DSNguoiDuocBaoHiem()
        {
            string sql="sp_DSNGuoiDuocBaoHiem";
            
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DSLoaiKH()
        {
            string sql= "sp_DSLoaiKH";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool KhachHangMoi(KhachHangDTO kh)
        {
            string sql= "sp_KhachHangMoi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@ma", SqlDbType.Int);
            ma.Value = kh.MaKhachHang;
            ds.Add(ma);
            SqlParameter ten = new SqlParameter("@tenKH",SqlDbType.NVarChar);
            ten.Value = kh.TenKhachHang;
            ds.Add(ten);
            SqlParameter tenNguoiDaiDien = new SqlParameter("@tenNguoiDaiDien", SqlDbType.NVarChar);
            tenNguoiDaiDien.Value = kh.TenNguoiDaiDien;
            ds.Add(tenNguoiDaiDien);
            SqlParameter email = new SqlParameter("@email",SqlDbType.VarChar);
            email.Value = kh.Email;
            ds.Add(email);
            SqlParameter dienthoai = new SqlParameter("@dienthoai",SqlDbType.VarChar);
            dienthoai.Value = kh.DienThoai;
            ds.Add(dienthoai);
            SqlParameter fax = new SqlParameter("@fax", SqlDbType.VarChar);
            fax.Value = kh.Fax;
            ds.Add(fax);
            
            SqlParameter diachi = new SqlParameter("@diachi",SqlDbType.NVarChar);
            diachi.Value = kh.DiaChi;
            ds.Add(diachi);
          
            SqlParameter madvbh = new SqlParameter("@madvbh", SqlDbType.Int);
            madvbh.Value = kh.MaDonViBH;
            ds.Add(madvbh);

            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public int LayMaKH()
        {
            string sql = "sp_KhachHang_LayMa";
            int ma=0;
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                int temp = int.Parse(dr[0].ToString());
                if (temp!=0)
                    ma = temp;                
            }
            return ma+1;
        }
        public DataTable DSNguoiDBHTheoDonVi(int madv)
        {
            string sql= "sp_KhachHang_DonViBH";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madvbh = new SqlParameter("@madvbh", SqlDbType.Int);
            madvbh.Value = madv;
            ds.Add(madvbh);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DSNDBH()
        {
            string sql = "sp_KhachHang_DanhSach";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool Xoa(int ma)
        {
            string sql = "sp_KhachHang_Xoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ID = new SqlParameter("@id",SqlDbType.Int);
            ID.Value = ma;
            ds.Add(ID);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public KhachHangDTO LayInfo(string maclaim)
        {
            KhachHangDTO kh = new KhachHangDTO();
            string sql = "sp_KhachHang_select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            { 
                DataRow dr= dt.Rows[0];
                kh.TenKhachHang = dr[0].ToString();
                kh.TenNguoiDaiDien = dr[1].ToString();
                kh.DiaChi = dr[2].ToString();
                kh.DienThoai = dr[3].ToString();
                kh.Fax = dr[5].ToString();
                kh.Email = dr[4].ToString();
            }
            return kh;
        }
        public bool Updatecover(int ma, string ten, string diachi, string linhvuckd)
        {
            string sql = "sp_KhachHang_UpdateCover";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter makh = new SqlParameter("@id", SqlDbType.Int);
            makh.Value = ma;
            ds.Add(makh);
            SqlParameter tenkh = new SqlParameter("@ten", SqlDbType.NVarChar);
            tenkh.Value = ten;
            ds.Add(tenkh);
            SqlParameter diachikh = new SqlParameter("@diachi", SqlDbType.NVarChar);
            diachikh.Value = diachi;
            ds.Add(diachikh);
            SqlParameter linhvuc = new SqlParameter("@linhvuckinhdoanh", SqlDbType.NVarChar);
            linhvuc.Value = linhvuckd;
            ds.Add(linhvuc);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);

        }
        public bool CapNhatDaiDien(int ma, string ten, string dienthoai, string email)
        {
            string sql = "sp_KhachHang_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter makh = new SqlParameter("@maKH", SqlDbType.Int);
            makh.Value = ma;
            ds.Add(makh);
            SqlParameter tendaidien = new SqlParameter("@tendaidien", SqlDbType.NVarChar);
            tendaidien.Value = ten;
            ds.Add(tendaidien);
            SqlParameter phone = new SqlParameter("@dienthoai", SqlDbType.VarChar);
            phone.Value = dienthoai;
            ds.Add(phone);
            SqlParameter imei = new SqlParameter("@email", SqlDbType.VarChar);
            imei.Value = email;
            ds.Add(imei);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);   
        }
        public bool UpdateKHBasic(KhachHangDTO kh)
        {
            string sql = "sp_KhachHang_UpdateKH";
          
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter makh = new SqlParameter("@maKH", SqlDbType.Int);
            makh.Value = kh.MaKhachHang;
            ds.Add(makh);
            SqlParameter insured = new SqlParameter("@tenndbh", SqlDbType.NVarChar);
            insured.Value = kh.TenKhachHang;
            ds.Add(insured);
            SqlParameter adress = new SqlParameter("@diachi", SqlDbType.NVarChar);
            adress.Value = kh.DiaChi;
            ds.Add(adress);
            SqlParameter daidien = new SqlParameter("@tendaidien", SqlDbType.NVarChar);
            daidien.Value = kh.TenNguoiDaiDien;
            ds.Add(daidien);
            SqlParameter phone = new SqlParameter("@dienthoai", SqlDbType.VarChar);
            phone.Value = kh.DienThoai;
            ds.Add(phone);
            SqlParameter fax = new SqlParameter("@fax", SqlDbType.VarChar);
            fax.Value = kh.Fax;
            ds.Add(fax);
            SqlParameter trade = new SqlParameter("@trade", SqlDbType.NVarChar);
            trade.Value = kh.LinhVucKinhDoanh;
            ds.Add(trade);
            SqlParameter email = new SqlParameter("@email", SqlDbType.NVarChar);
            email.Value = kh.Email;
            ds.Add(email);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}