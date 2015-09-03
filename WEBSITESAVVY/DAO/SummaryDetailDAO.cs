using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class SummaryDetailDAO
    {
        public bool Them_Building(SummarydetailDTO sum)
        {
            string sql= "sp_SummaryBuilding_Them";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter idsum = new SqlParameter("@idsum",SqlDbType.Int);
            idsum.Value = sum.MaSummary;
            ds.Add(idsum);
            
            SqlParameter idtheloai = new SqlParameter("@idtheloai", SqlDbType.Int);
            idtheloai.Value = sum.MaTheLoai;
            ds.Add(idtheloai);
            SqlParameter hangmuc = new SqlParameter("@hangmuc",SqlDbType.NVarChar);
            hangmuc.Value = sum.TenHangMuc;
            ds.Add(hangmuc);
            SqlParameter GTkhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            GTkhieunai.Value = sum.GiaTriKhieuNai;
            ds.Add(GTkhieunai);
        
            SqlParameter ghichu = new SqlParameter("@ghichu",SqlDbType.NVarChar);
            ghichu.Value = sum.GhiChu;
            ds.Add(ghichu);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable DanhSachBuilding(string id)
        {
            string sql= "sp_Summary_DanhSachB";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            
            return dt;
        }
        public DataTable DanhSachStock(string id)
        {
            string sql= "sp_Summary_DanhSachS";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DanhSachMachinery(string id)
        {
            string sql= "sp_Summary_DanhSachM";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DanhSachOther(string id)
        {
            string sql= "sp_Summary_DanhSachO";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DanhSachLiability(string id)
        {
            string sql = "sp_Summary_DanhSachL";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public DataTable DanhSachConstruction(string id)
        {
            string sql = "sp_Summary_DanhSachC";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public bool ThemMaChinery(SummarydetailDTO s)
        {
            string sql= "sp_Summary_InsertM";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter idsum = new SqlParameter("@idsum", SqlDbType.Int);
            idsum.Value = s.MaSummary;
            ds.Add(idsum);

            SqlParameter theloai = new SqlParameter("@idtheloaisum", SqlDbType.Int);
            theloai.Value = s.MaTheLoai;
            ds.Add(theloai);

            SqlParameter hangmuc = new SqlParameter("@hangmuc", SqlDbType.NVarChar);
            hangmuc.Value = s.TenHangMuc;
            ds.Add(hangmuc);

            SqlParameter giatrikhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            giatrikhieunai.Value = s.GiaTriKhieuNai;
            ds.Add(giatrikhieunai);
                    
            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = s.GhiChu;
            ds.Add(ghichu);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemStock(SummarydetailDTO s)
        {
            string sql="sp_Summary_InsertS";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter idsum = new SqlParameter("@idsum", SqlDbType.Int);
            idsum.Value = s.MaSummary;
            ds.Add(idsum);

            SqlParameter theloai = new SqlParameter("@idtheloaisum", SqlDbType.Int);
            theloai.Value = s.MaTheLoai;
            ds.Add(theloai);

            SqlParameter hangmuc = new SqlParameter("@hangmuc", SqlDbType.NVarChar);
            hangmuc.Value = s.TenHangMuc;
            ds.Add(hangmuc);

            SqlParameter giatrikhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            giatrikhieunai.Value = s.GiaTriKhieuNai;
            ds.Add(giatrikhieunai);

            SqlParameter solong = new SqlParameter("@soluong", SqlDbType.Int);
            solong.Value = s.SoLuong;
            ds.Add(solong);

            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = s.GhiChu;
            ds.Add(ghichu);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemOther(SummarydetailDTO s)
        {
            string sql= "sp_Summary_InsertO";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter idsum = new SqlParameter("@idsum", SqlDbType.Int);
            idsum.Value = s.MaSummary;
            ds.Add(idsum);

            SqlParameter theloai = new SqlParameter("@idtheloaisum", SqlDbType.Int);
            theloai.Value = s.MaTheLoai;
            ds.Add(theloai);

            SqlParameter hangmuc = new SqlParameter("@hangmuc", SqlDbType.NVarChar);
            hangmuc.Value = s.TenHangMuc;
            ds.Add(hangmuc);

            SqlParameter giatrikhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            giatrikhieunai.Value = s.GiaTriKhieuNai;
            ds.Add(giatrikhieunai);

            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = s.GhiChu;
            ds.Add(ghichu);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool ThemSummaryDettailMoi(SummarydetailDTO sum)
        {
            string sql = "sp_Summary_Detail_insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idsum = new SqlParameter("@idsummary", SqlDbType.Int);
            idsum.Value = sum.MaSummary;
            ds.Add(idsum);
            SqlParameter idtheloai = new SqlParameter("@idtheloaisum", SqlDbType.Int);
            idtheloai.Value = sum.MaTheLoai;
            ds.Add(idtheloai);
            SqlParameter hangmuc = new SqlParameter("@tenhangmuc", SqlDbType.NVarChar);
            hangmuc.Value = sum.TenHangMuc;
            ds.Add(hangmuc);
            SqlParameter GTkhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            GTkhieunai.Value = sum.GiaTriKhieuNai;
            ds.Add(GTkhieunai);
            SqlParameter sl = new SqlParameter("@soluong", SqlDbType.Int);
            sl.Value = sum.SoLuong;
            ds.Add(sl);
            SqlParameter thiethai = new SqlParameter("@thiethaihoply", SqlDbType.Float); ;
            thiethai.Value = sum.ThietHaiHopLy;
            ds.Add(thiethai);
            SqlParameter dexuat = new SqlParameter("@dexuattinhtoan", SqlDbType.Float);
            dexuat.Value = sum.DeXuatTinhToan;
            ds.Add(dexuat);
            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = sum.GhiChu;
            ds.Add(ghichu);
            SqlParameter mamg = new SqlParameter("@mamenhgia", SqlDbType.Int);
            mamg.Value = sum.MaMenhGia;
            ds.Add(mamg);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool CapNhatSummaryDetail(SummarydetailDTO sum)
        {
            string sql = "sp_Summary_Detail_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idsum = new SqlParameter("@idsummary", SqlDbType.Int);
            idsum.Value = sum.MaSummary;
            ds.Add(idsum);
            SqlParameter idsumd = new SqlParameter("@idsummarydetail", SqlDbType.Int);
            idsumd.Value = sum.MaSummaryDetail;
            ds.Add(idsumd);
            SqlParameter hangmuc = new SqlParameter("@tenhangmuc", SqlDbType.NVarChar);
            hangmuc.Value = sum.TenHangMuc;
            ds.Add(hangmuc);
            SqlParameter GTkhieunai = new SqlParameter("@giatrikhieunai", SqlDbType.Float);
            GTkhieunai.Value = sum.GiaTriKhieuNai;
            ds.Add(GTkhieunai);
            SqlParameter sl = new SqlParameter("@soluong", SqlDbType.Int);
            sl.Value = sum.SoLuong;
            ds.Add(sl);
            SqlParameter thiethai = new SqlParameter("@thiethaihoply", SqlDbType.Float); ;
            thiethai.Value = sum.ThietHaiHopLy;
            ds.Add(thiethai);
            SqlParameter dexuat = new SqlParameter("@dexuattinhtoan", SqlDbType.Float);
            dexuat.Value = sum.DeXuatTinhToan;
            ds.Add(dexuat);
            SqlParameter ghichu = new SqlParameter("@ghichu", SqlDbType.NVarChar);
            ghichu.Value = sum.GhiChu;
            ds.Add(ghichu);
            
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public int KiemTraSummary(string id)
        {
            string sql = "sp_SummaryDetail_KiemTra";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            int dem=-1;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                dem = int.Parse(dr[0].ToString());
            }
            return dem;
        }
        public DataTable LaySummaryAll(string idclaim)
        {
            
            string sql = "sp_SummaryDetail_SelectAll";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("idclaim", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
            
        }
        public DataTable loadTotalSum(string id)
        {
            string sql = "sp_Summary_SelectTotal";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter idclaim = new SqlParameter("@idclaim", SqlDbType.VarChar);
            idclaim.Value = id;
            ds.Add(idclaim);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }

        public void updateField(string idSumDetail, string key, string value)
        {
            string sql = "[sp_SummaryDetail_UpdateField]";
            List<SqlParameter> ds = new List<SqlParameter>();

            ds.Add(new SqlParameter("@idSumDetail", idSumDetail));
            ds.Add(new SqlParameter("@key", key));
            ds.Add(new SqlParameter("@value", value));

            SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
		
		public void updateAllField(IDictionary<string, string> Dic)
        {
            string sql = "[sp_Summary_Detail_UpdateAllField]";
            List<SqlParameter> ds = new List<SqlParameter>();
			
			foreach (KeyValuePair<string, string> entry in Dic)
            {
                // do something with entry.Value or entry.Key
                ds.Add(new SqlParameter("@" + entry.Key , entry.Value ));
            }
			
			SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

		
    }
}