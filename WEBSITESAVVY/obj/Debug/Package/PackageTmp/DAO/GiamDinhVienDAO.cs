using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class GiamDinhVienDAO
    {
        public string LayGDVTheoClaim(string maclaim)
        {
            string sql = "sp_GiamDinhVien_LayGDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maclaim", SqlDbType.VarChar);
            id.Value = maclaim;
            ds.Add(id);
            DataTable dt = new DataTable();
            dt=SqlDataAcessHelper.exStoreParas(sql, ds);
            string ten = "";
            if (dt.Rows.Count == 1)
            {
                DataRow dr = dt.Rows[0];
                ten = dr[0].ToString();
            }
            return ten;
        }

        public DataTable DanhSachQuanLyGDV()
        {
            string sql = "sp_DanhSachGDVManager";

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DSGiamDinhVienWorking()
        {
            string sql = "sp_GiamDinhVien_DS";

            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable DanhSachGiamDinhVien()
        {
            string sql= "sp_DanhSachGDV";
           
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public string LayMaTen(int magdv)
        {
            string sql = "sp_GiamDinhVien_LayMaTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string ten = "";
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ten = dr[0].ToString();
            }
            return ten;
        }
        public DataTable LayGDVClaim(string thamchieu)
        {
            string sql= "sp_LayGDVClaim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tenclaim = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            tenclaim.Value = thamchieu;
            ds.Add(tenclaim);
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql,ds);
            return dt;
        }
        public DataTable GiamDinhVienTheoMa(int ma)
        {
            string sql= "sp_GiamDinhVien_Ma";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql,ds);
        }
        public DataTable KiemTraDangNhap(string username, string password)
        {
            string sql= "sp_GiamDinhVien_KTDN";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter user = new SqlParameter("@user", SqlDbType.NVarChar);
            user.Value = username;
            ds.Add(user);
            SqlParameter pass = new SqlParameter("@pass", SqlDbType.NVarChar);
            pass.Value = password;
            ds.Add(pass);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable MaGiamDinhVienTheoTen(string ten)
        {
            string sql="sp_GiamDinhVien_MaTheoTen";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@ten", SqlDbType.NVarChar);
            id.Value = ten;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool ThemGiamDinhVien(string ten, string dt, string email, string ngaysinh, string diachi, int chucvu, string user, string pass,string maT, float rate,string fullname)
        {
            string sql="sp_GiamDinhVien_Them";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter a = new SqlParameter("@ten", SqlDbType.NVarChar);
            a.Value = ten;
            ds.Add(a);

            SqlParameter b = new SqlParameter("@dienthoai", SqlDbType.NVarChar);
            b.Value = dt;
            ds.Add(b);

            SqlParameter c = new SqlParameter("@email", SqlDbType.NVarChar);
            c.Value = email;
            ds.Add(c);

            SqlParameter d = new SqlParameter("@ngaysinh", SqlDbType.NVarChar);
            d.Value = ngaysinh;
            ds.Add(d);

            SqlParameter e = new SqlParameter("@diachi", SqlDbType.NVarChar);
            e.Value = diachi;
            ds.Add(e);

            SqlParameter f = new SqlParameter("@chucvu", SqlDbType.Int);
            f.Value = chucvu;
            ds.Add(f);

            SqlParameter g = new SqlParameter("@username", SqlDbType.NVarChar);
            g.Value = user;
            ds.Add(g);

            SqlParameter h = new SqlParameter("@pass", SqlDbType.NVarChar);
            h.Value = pass;
            ds.Add(h);
            SqlParameter maten = new SqlParameter("@maten", SqlDbType.VarChar);
            maten.Value = maT;
            ds.Add(maten);
            SqlParameter dongia = new SqlParameter("@rate", SqlDbType.Float);
            dongia.Value = rate;
            ds.Add(dongia);
            ds.Add(new SqlParameter("@fullname", fullname));

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool XoaGDV(int id)
        {
            string sql="sp_GiamDinhVien_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool SuaGDV(int id, string ten, string dt, string email, string diachi, int chucvu, string una, string maname, int kh, int pub,float rate, string fullname)
        {
            string sql= "sp_GiamDinhVien_Sua";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);

            SqlParameter a = new SqlParameter("@ten", SqlDbType.NVarChar);
            a.Value = ten;
            ds.Add(a);
            SqlParameter b = new SqlParameter("@dienthoai", SqlDbType.NVarChar);
            b.Value = dt;
            ds.Add(b);
            SqlParameter c = new SqlParameter("@email", SqlDbType.NVarChar);
            c.Value = email;
            ds.Add(c);
            SqlParameter e = new SqlParameter("@diachi", SqlDbType.NVarChar);
            e.Value = diachi;
            ds.Add(e);

            SqlParameter f = new SqlParameter("@chucvu", SqlDbType.Int);
            f.Value = chucvu;
            ds.Add(f);
            SqlParameter uname = new SqlParameter("@username", SqlDbType.VarChar);
            uname.Value = una;
            ds.Add(uname);
            SqlParameter maten = new SqlParameter("@maten",SqlDbType.VarChar);
            maten.Value = maname;
            ds.Add(maten);

            SqlParameter kichhoat = new SqlParameter("@kh", SqlDbType.Int);
            kichhoat.Value = kh;
            ds.Add(kichhoat);
            SqlParameter phobien = new SqlParameter("@pub", SqlDbType.Int);
            phobien.Value = pub;
            ds.Add(phobien);
            SqlParameter dongia = new SqlParameter("@rate", SqlDbType.Float);
            dongia.Value = rate;
            ds.Add(dongia);
            ds.Add(new SqlParameter("@fullname", fullname));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThayDoiMatKhau(int id, string passcu, string passmoi)
        {
            string sql= "sp_GiamDinhVien_TDMK";
            List<SqlParameter>ds= new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);

            SqlParameter a = new SqlParameter("@pc", SqlDbType.NVarChar);
            a.Value = passcu;
            ds.Add(a);

            SqlParameter b = new SqlParameter("@pm", SqlDbType.NVarChar);
            b.Value = passmoi;
            ds.Add(b);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
            
        }
        public bool KiemTraChucVuQuanLy(int ID)
        {
            string sql="sp_GiamDinhVien_AdminDN";
            List<SqlParameter> ds=new List<SqlParameter>();
            SqlParameter ma=new SqlParameter("@magdv",SqlDbType.Int);
            ma.Value = ID;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kt = false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;
        }
        public bool KiemTraGiamDoc(int magdv)
        {
            string sql = "sp_GiamDinhVien_GiamDoc";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kt = false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;
        }
        public int LayChucVu(int ID)
        {
            string sql = "sp_GiamDinhVien_ChucVu";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magvd", SqlDbType.Int);
            ma.Value = ID;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int chucvu = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                chucvu = int.Parse(dr[0].ToString());
            }

            return chucvu;
        }
        public int KiemTraEmail(string email)
        {
            int magdv =0;
            string sql = "sp_GiamDinhVien_KiemTraEmail";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter e = new SqlParameter("@email", SqlDbType.VarChar);
            e.Value = email;
            ds.Add(e);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                magdv = int.Parse(dr[0].ToString());
            }
            return magdv;
        }
        public bool DoiMatKhau(int id, string newpass)
        {
            string sql = "sp_GiamDinhVien_CapNhatMauKhau";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idgdv", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter pas = new SqlParameter("@pass", SqlDbType.VarChar);
            pas.Value = newpass;
            ds.Add(pas);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool SoSanhPassword(string pass,string user)
        {
            bool kt= false;
            string sql = "sp_GiamDinhVien_LayMatKhau";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ten = new SqlParameter("@user", SqlDbType.VarChar);
            ten.Value = user;
            ds.Add(ten);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string pa = null ;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                pa = dr[0].ToString();
            }
            if (pass == pa)
                kt = true;
            return kt;
        }
        public bool KiemTraMatKhau(int id, string oldpass)
        {
            string sql = "sp_GiamDinhVien_KiemTra";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter pass = new SqlParameter("@pass", SqlDbType.VarChar);
            pass.Value = oldpass;
            ds.Add(pass);
            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kt = false;
            if (dt.Rows.Count > 0)
            {
                kt = true;
            }
            return kt;
        }
        public string LayEmail(string name)
        {
            string email = "";
            string sql = "sp_GiamDinhVien_LayEmail";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter gdv = new SqlParameter("@ten", SqlDbType.VarChar);
            gdv.Value = name;
            ds.Add(gdv);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                email = dr[0].ToString();
            }
            return email;
        }
        public string LayUsername(int ma)
        {
            string name = "";
            string sql = "sp_GiamDinhVien_username";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@magdv ", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                name = dr[0].ToString();
            }
            return name;
        }
        public string LayTenTheoMa(int id)
        {
            string ten = "";
            string sql = "sp_GiamDinhVien_LayTenTheoMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter gdv = new SqlParameter("@magdv", SqlDbType.Int);
            gdv.Value = id;
            ds.Add(gdv);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ten = dr[0].ToString();
            }
            return ten;
        }
        public int LayMaPub(int ID)
        {
            string sql = "sp_GiamDinhVien_LayPub";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter pub = new SqlParameter("@magdv ", SqlDbType.Int);
            pub.Value = ID;
            ds.Add(pub);
            int mapub = -1;
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                mapub = int.Parse(dr[0].ToString());
            }
            return mapub;
        }
        public DataTable LayTenvaChucVu(int ma)
        {
            string sql = "sp_GiamDinhVien_selectTen";           
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable CheckManager(int ID)
        {
            string sql = "sp_GiamDinhVien_QuanLy";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = ID;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable ThuNhapGDV(int ma, int year)
        {
            string sql = "sp_GiamDinhVien_ThuNhapAllYear";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idgdv",ma));
            ds.Add(new SqlParameter("@year",year));
            return SqlDataAcessHelper.exStoreParas(sql, ds);

        }
        public bool KiemTraBacQuanLy(int magdv)
        {
            string sql = "sp_GiamDinhVien_KiemTraQuanLy";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@magdv", SqlDbType.Int);
            ma.Value = magdv;
            ds.Add(ma);
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kt=false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;
        }
    }
}