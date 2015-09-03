using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.DAO
{
    public class LoaiHangMucDAO
    {
        public bool InsetLoaiHangMuc(string ten, string claim)
        {
            string sql = "sp_LoaiHangMuc_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter tenhangmuc = new SqlParameter("@tenhangmuc", SqlDbType.NVarChar);
            tenhangmuc.Value = ten;
            ds.Add(tenhangmuc);
            SqlParameter idclaim = new SqlParameter("@idclaim",SqlDbType.VarChar);
            idclaim.Value = claim;
            ds.Add(idclaim);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool DeleteLoaiHangMuc(int id)
        {
            string sql = "sp_LoaiHangMuc_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idloaihangmuc", SqlDbType.NVarChar);
            ma.Value = id;
            ds.Add(ma);           
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public bool UpdateLoaiHangMuc(int id, string tenloai)
        {
            string sql = "sp_LoaiHangMuc_Edit";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@idloaihangmuc", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            SqlParameter tenloaihangmuc = new SqlParameter("@ten", SqlDbType.NVarChar);
            tenloaihangmuc.Value = tenloai;
            ds.Add(tenloaihangmuc);
            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable DanhSachHangMuc(string idclaim)
        {
            string sql = "sp_LoaiHangMuc_Select";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id= new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value= idclaim;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }

        public static DataTable GetListInLostList(string idclaim)
        {
            string sql = "sp_LoaiHangMuc_Select_In_LostList_Claim";
            List<SqlParameter> ds= new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@claimID", SqlDbType.VarChar);
            id.Value= idclaim;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }

        public static DataTable GetListInSummary(string idclaim)
        {
            string sql = "sp_LoaiHangMuc_Select_In_Summary_Claim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@claimID", SqlDbType.VarChar);
            id.Value = idclaim;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}