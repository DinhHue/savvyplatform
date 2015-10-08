using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class IncomeDAO
    {
        public bool Insert(IncomeDTO i)
        {
            string sql = "sp_Income_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@id_invoice",i.MaInvoice));
            ds.Add(new SqlParameter("@issuefee",i.IssueFee));
            ds.Add(new SqlParameter("@realfee",i.RealFee));
            ds.Add(new SqlParameter("@percentage",i.Percentage));
            ds.Add(new SqlParameter("@cyberincome",i.CyberIncome));
            ds.Add(new SqlParameter("@realincome",i.RealIncome));
            ds.Add(new SqlParameter("@id_gdv",i.MaGDV));
            bool kq = false;
            kq= SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;
        }
        public DataTable DSIncomeClaim(string thamchieu)
        {
            string sql = "sp_Income_Claim";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DSIncomeGDV(int year, int magdv)
        {
            string sql = "sp_Income_All_Year";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@year", year));
            ds.Add(new SqlParameter("@gdv",magdv));

            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DSIncomeWorking()
        {
            string sql = "sp_GiamDinhVien_ThuNhap";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            return dt;
        }
        public bool KiemTraTrung(string thamchieu, int magdv)
        {
            string sql = "sp_Income_KiemTraTrung";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            ds.Add(new SqlParameter("@magdv", magdv));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql,ds);
            bool kt=false;
            if (dt.Rows.Count > 0)
                kt = true;
            return kt;
        }

        public DataTable TimesheetIncomeGDVDetail(string thamchieu, int gdv)
        {
            string sql = "sp_Income_Detail";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            ds.Add(new SqlParameter("@idgdv", gdv));
            DataTable dt = new DataTable();
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}