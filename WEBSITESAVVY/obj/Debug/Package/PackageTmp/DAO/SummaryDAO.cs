using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class SummaryDAO
    {
        public bool Them(string idlaim)
        {
            string sql= "sp_Summary_Moi";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idlaim;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }
        public int MaSum(string thamchieu)
        {
            string sql= "sp_Summary_IDSUM";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tc= new SqlParameter("@thamchieu", SqlDbType.VarChar);
            tc.Value=thamchieu;
            ds.Add(tc);          
            DataTable dt= new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql,ds);
            int id=0;
            if(dt.Rows.Count>0)
            {
                DataRow dr= dt.Rows[0];
                id=int.Parse(dr[0].ToString());
            }
            return id;
        }

        public bool KiemTraClaim(string thamchieu)
        {
            string sql= "sp_Summary_KiemTraThamChieu";
            List<SqlParameter>ds= new List<SqlParameter>();
            SqlParameter thamChieu = new SqlParameter("@thamchieu",SqlDbType.VarChar);
            thamChieu.Value = thamchieu;
            ds.Add(thamChieu);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            bool kq = false;
            if (dt.Rows.Count > 0)
            {
                kq = true;
            }
            return kq;
        }
        public DataTable TongThietHai(string thamchieu)
        {
            string sql= "sp_Summary_DanhSachSum";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter thamChieu = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            thamChieu.Value = thamchieu;
            ds.Add(thamChieu);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;
        }
        public int LayMaSummaryMoi(string idclaim)
        {
            string sql = "sp_Summary_createnew";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            DataTable dt= new DataTable();
            int mas=0;
            dt= SqlDataAcessHelper.exStoreParas(sql, ds);
            if(dt.Rows.Count>0)
            {
                DataRow dr= dt.Rows[0];
                if(dr!=null)                
                    mas = int.Parse(dr[0].ToString());               
            }
            return mas;
        }
        public int KiemTraMa(string idclaim)
        {

            string sql = "sp_Summary_kiemtra";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idclaim", SqlDbType.VarChar);
            ma.Value = idclaim;
            ds.Add(ma);
            DataTable dt = new DataTable();
            int mas = 0;
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr != null)
                    mas = int.Parse(dr[0].ToString());
            }
            return mas;
        }

        public static DataTable SelectSummaryDetail(string idclaim, int idLoaiHangMuc)
        {
            string sql = "sp_Summary_Select_Claim_LoaiHangMuc";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@claimID", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            SqlParameter paramLoaiHangMuc = new SqlParameter("@idLoaiHangMuc", SqlDbType.VarChar);
            paramLoaiHangMuc.Value = idLoaiHangMuc;
            ds.Add(paramLoaiHangMuc);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}