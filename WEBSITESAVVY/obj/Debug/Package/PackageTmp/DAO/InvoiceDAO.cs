using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;

namespace WEBSITESAVVY.DAO
{
    public class InvoiceDAO
    {
        public bool Insert(InvoiceDTO invdto)
        {
            string sql = "sp_Invoice_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            macl.Value = invdto.MaClaim;
            ds.Add(macl);

            SqlParameter soinv = new SqlParameter("@soinv", SqlDbType.VarChar);
            soinv.Value = invdto.NoInvoice;
            ds.Add(soinv);

            SqlParameter tt = new SqlParameter("@grandtotal", SqlDbType.Float);
            tt.Value = invdto.GrandTotal;
            ds.Add(tt);

            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.Date);
            ngay.Value = invdto.DateIssue;
            ds.Add(ngay);

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, ds);
            return kq;

        }
        public DataTable SelectYear(int year)
        {
            string sql = "sp_Invoice_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter _year = new SqlParameter("@year", SqlDbType.Int);
            _year.Value = year;
            ds.Add(_year);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool UpdatePaid(int ma)
        {
            string sql = "sp_Invoice_Paid";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@mainvoice", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exNonStoreParas(sql,ds);
        }

        public bool Delete(int ma)
        {
            string sql = "sp_Invoice_Delete";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@mainvoice", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public int SelectMaMax()
        {
            string sql = "sp_Invoice_SelectMa";
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreNoParas(sql);
            int ma = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                ma = int.Parse(dr[0].ToString());
            }
            return ma;
        }
    }
}