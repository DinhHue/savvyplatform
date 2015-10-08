using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class QuiTrinhDAO
    {
        public bool ThemMoi(QuiTrinhDTO qt)
        {
            string sql="sp_QuiTrinh_Them";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter tieude = new SqlParameter("@tieude", SqlDbType.NVarChar);
            tieude.Value = qt.TieuDe;
            ds.Add(tieude);

            SqlParameter tomtat = new SqlParameter("@tomtat", SqlDbType.NVarChar);
            tomtat.Value = qt.TomTat;
            ds.Add(tomtat);

            SqlParameter noidung = new SqlParameter("@noidung", SqlDbType.NVarChar);
            noidung.Value = qt.NoiDung;
            ds.Add(noidung);

            SqlParameter magdv = new SqlParameter("@nguoipost", SqlDbType.NVarChar);
            magdv.Value = qt.MaNguoiDang;
            ds.Add(magdv);

            SqlParameter ngaydang = new SqlParameter("@ngaydang",SqlDbType.DateTime);
            ngaydang.Value = qt.NgayDang;
            ds.Add(ngaydang);

            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public bool CapNhat(QuiTrinhDTO qt)
        {
            string sql= "sp_QuiTrinh_CapNhat";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tieude = new SqlParameter("@tieude", SqlDbType.NVarChar);
            tieude.Value = qt.TieuDe;
            ds.Add(tieude);

            SqlParameter tomtat = new SqlParameter("@tomtat", SqlDbType.NVarChar);
            tomtat.Value = qt.TomTat;
            ds.Add(tomtat);

            SqlParameter noidung = new SqlParameter("@noidung", SqlDbType.NVarChar);
            noidung.Value = qt.NoiDung;
            ds.Add(noidung);

            SqlParameter magdv = new SqlParameter("@nguoipost", SqlDbType.Int);
            magdv.Value = qt.MaNguoiDang;
            ds.Add(magdv);

            SqlParameter maquitrinh = new SqlParameter("@maquitrinh", SqlDbType.Int);
            maquitrinh.Value = qt.MaQuiTrinh;
            ds.Add(maquitrinh);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public DataTable DanhSach()
        {
           
            string sql="sp_QuiTrinh_DanhSach";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public QuiTrinhDTO Lay(int ma)
        {
            QuiTrinhDTO qt = new QuiTrinhDTO();
            DataTable dt = new DataTable();
            string sql= "sp_QuiTrinh_Lay";
            List<SqlParameter> ds= new List<SqlParameter>();

            SqlParameter idqt = new SqlParameter("@maquitrinh", SqlDbType.Int);
            idqt.Value = ma;
            ds.Add(idqt);
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
            
            if (dt.Rows.Count == 1)
            {
                DataRow dr = dt.Rows[0];
                qt.MaQuiTrinh = ma;
                qt.TieuDe = dr[0].ToString();
                qt.TomTat = dr[1].ToString();
                qt.NoiDung = dr[2].ToString();
            }
            return qt;
        }
        public DataTable TimKiem(string tukhoa)
        {
            DataTable dt = new DataTable();
            string sql= "sp_QuiTrinh_TimKiem";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tu = new SqlParameter("@tukhoa", SqlDbType.NVarChar);
            tu.Value = tukhoa;
            ds.Add(tu);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;            
        }
        public DataTable DSQuiTrinh()
        {
            DataTable dt= new DataTable();
            string sql = "sp_QuiTrinh_DS";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable ChiTietQuiTrinh(int maquitrinh)
        {
           
            string sql="sp_QuiTrinh_ChiTiet";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@maquitrinh", SqlDbType.Int);
            ma.Value = maquitrinh;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool XoaQuiTrinh(int maquitrinh)
        {
            string sql = "sp_QuiTrinh_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@ma", SqlDbType.Int);
            ma.Value = maquitrinh;
            ds.Add(ma);
            DataTable dt = new DataTable();
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
           
        }

        public DataTable MemosOther(int id)
        {
            string sql = "sp_Memos_OtherSubject";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }

    }
}