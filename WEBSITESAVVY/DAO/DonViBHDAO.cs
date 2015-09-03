using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class DonViBHDAO
    {
        public DataTable DSDonViBaoHiem(int ma)
        {
            DataTable dt = new DataTable();
            
            string sql = "sp_DanhSachDonViBH";
            List<SqlParameter> ds = new List<SqlParameter>();
            
            SqlParameter machinhanh = new SqlParameter("@manhabaohiem", SqlDbType.Int);
            machinhanh.Value = ma;
            ds.Add(machinhanh);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            
            return dt;
        }
        public string LayMaHoa(int ma)
        {
            DataTable dt = new DataTable();

            string sql = "sp_DonViBH_LayMaHoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter madv = new SqlParameter("@id_DonVi", SqlDbType.Int);
            madv.Value = ma;
            ds.Add(madv);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            string mahoa = "";
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                mahoa = dr[0].ToString();
            }
            return mahoa;

        }
        public DataTable DSAllDonVi()
        {
            DataTable dt = new DataTable();           
            string sql = "sp_LayDanhSachDonVi";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);         
            return dt;
        }
        public DataTable DSDVMaHoa()
        {
            DataTable dt = new DataTable();
            string sql = "sp_DonViBH_DSMaHoa";
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public DataTable ThongTinDVBH(int ma)
        {
            
            DataTable dt = new DataTable();
            
            string sql = "sp_ThongTinDonViBaoHiem";           
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter machinhanh = new SqlParameter("@manhabaohiem", SqlDbType.Int);
            machinhanh.Value = ma;
            ds.Add(machinhanh);
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);           
            return dt;
        }
        public bool DonViMoi(DonViDTO dv)
        {
            
            string sql = "sp_DonViBHMoi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter name = new SqlParameter("@tendv", SqlDbType.NVarChar);
            name.Value = dv.TenDonVi;
            ds.Add(name);

            SqlParameter maNhaBH = new SqlParameter("@manhabh", SqlDbType.Int);
            maNhaBH.Value = dv.Id_NhaBH;
            ds.Add(maNhaBH);

            SqlParameter diaChi = new SqlParameter("@diachi", SqlDbType.NVarChar);
            diaChi.Value = dv.DiaChi;
            ds.Add(diaChi);

            SqlParameter dienThoai = new SqlParameter("@dienthoai",SqlDbType.VarChar);
            dienThoai.Value = dv.DienThoai;
            ds.Add(dienThoai);

            SqlParameter fax = new SqlParameter("@fax", SqlDbType.VarChar);
            fax.Value = dv.Fax;
            ds.Add(fax);

            SqlParameter web = new SqlParameter("@website", SqlDbType.VarChar);
            web.Value = dv.WebSite;
            ds.Add(web);

            SqlParameter mahoa = new SqlParameter("@mahoa", SqlDbType.VarChar);
            mahoa.Value = dv.MaHoa;
            ds.Add(mahoa);

            SqlParameter masothue = new SqlParameter("@mst", SqlDbType.VarChar);
            masothue.Value = dv.MaSoThue;
            ds.Add(masothue);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
            
                        
        }
        public bool KiemTraMaHoa(string mahoa)
        {
          
            string sql = "sp_LayMaHoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tu = new SqlParameter("@mahoa", SqlDbType.VarChar);
            tu.Value = mahoa;
            ds.Add(tu);          
                  
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
                return true;
            return false;
           
        }
        public bool XoaDonVi(int madv)
        {
            string sql = "sp_DonViBaoHiem_Xoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maHoa = new SqlParameter("@madv",SqlDbType.Int);
            maHoa.Value = madv;
            ds.Add(maHoa);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CapNhat(DonViDTO dv)
        {
            string sql = "sp_DonViBaoHiem_CapNhat";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter mahoa = new SqlParameter("@mahoa", SqlDbType.VarChar);
            mahoa.Value = dv.MaHoa;
            ds.Add(mahoa);
            SqlParameter tendv = new SqlParameter("@tendonvi",SqlDbType.NVarChar);
            tendv.Value = dv.TenDonVi;
            ds.Add(tendv);
            SqlParameter diachi = new SqlParameter("@diachi",SqlDbType.NVarChar);
            diachi.Value = dv.DiaChi;
            ds.Add(diachi);
            SqlParameter dienthoai = new SqlParameter("@dienthoai", SqlDbType.VarChar);
            dienthoai.Value = dv.DienThoai;
            ds.Add(dienthoai);
            SqlParameter fax = new SqlParameter("@fax", SqlDbType.VarChar);
            fax.Value = dv.Fax;
            ds.Add(fax);
            SqlParameter web = new SqlParameter("@website", SqlDbType.VarChar);
            web.Value = dv.WebSite;
            ds.Add(web);
            SqlParameter mst = new SqlParameter("@masothue",SqlDbType.VarChar);
            mst.Value = dv.MaSoThue;
            ds.Add(mst);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public DonViDTO LayDonVi(string mahoa)
        {
            string sql = "sp_DonViBH_LayDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maHoa = new SqlParameter("@mahoa",SqlDbType.VarChar);
            maHoa.Value = mahoa;
            ds.Add(maHoa);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            DonViDTO dv = new DonViDTO();
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                dv.Id_DonVi = int.Parse(dr[0].ToString());
                dv.TenDonVi = dr[1].ToString();
                dv.Id_NhaBH = int.Parse(dr[2].ToString());
                dv.DiaChi = dr[3].ToString();
                dv.DienThoai = dr[4].ToString();
                dv.Fax = dr[5].ToString();
                dv.WebSite = dr[6].ToString();
                dv.MaHoa = dr[7].ToString();
                dv.MaSoThue = dr[8].ToString();
                dv.SoVuThietHai = int.Parse(dr[9].ToString());
            }
            return dv;
        }
        public DataTable LayTenMaHoa(int maNBH)
        {
            string sql = "sp_DonViBaoHiem_TenMaHoa";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@manhabh", SqlDbType.Int);
            ma.Value = maNBH;
            ds.Add(ma);
            return SqlDataAcessHelper.exStoreParas(sql, ds);

        }
        public DataTable LayTenNBH_DonVi(string maclaim)
        {
            string sql = "sp_NhaBaoHiem_DonViBH_Ten";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@maclaim", SqlDbType.VarChar);
            macl.Value = maclaim;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DonViBHInfo()
        {
            string sql = "sp_DonViBH_Info";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool DonViUpdate(DonViDTO dv)
        {
            string sql = "sp_DonViBH_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = dv.Id_DonVi;
            ds.Add(id);
            SqlParameter mahoa = new SqlParameter("@mahoa", SqlDbType.VarChar);
            mahoa.Value = dv.MaHoa;
            ds.Add(mahoa);
            SqlParameter tendv = new SqlParameter("@tendv", SqlDbType.NVarChar);
            tendv.Value = dv.TenDonVi;
            ds.Add(tendv);
            SqlParameter diachi = new SqlParameter("@diachi", SqlDbType.NVarChar);
            diachi.Value = dv.DiaChi;
            ds.Add(diachi);
            SqlParameter mst = new SqlParameter("@mst", SqlDbType.VarChar);
            mst.Value = dv.MaSoThue;
            ds.Add(mst);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DonViWR()
        {
            string sql = "sp_DonViBH_SelectWR";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
    }
}