using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.DAO
{
    public class TimeSheetDAO
    {
        public DataRow SelectMa(int ma)
        {
            string sql = "sp_Timesheet_selectMa";
            List<SqlParameter> ds = new List<SqlParameter>(); ;
            SqlParameter id = new SqlParameter("@id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
                return dt.Rows[0];
            return null;
        }
        public bool UpdateMa(TimeSheetDTO ts)
        {
            string sql = "sp_Timesheet_UpdateMa";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@id", ts.ID));
            ds.Add(new SqlParameter("@idgdv",ts.MaGDV));
            ds.Add(new SqlParameter("@thamchieu", ts.ThamChieu));
            ds.Add(new SqlParameter("@ngay", ts.Ngay));
            ds.Add(new SqlParameter("@idcongtac", ts.IdCongTacTimeSheet));
            ds.Add(new SqlParameter("@diengiai", ts.DienGiai));
            ds.Add(new SqlParameter("@gio", ts.ThoiLuongPhatSinh));
            ds.Add(new SqlParameter("@gioissue",ts.TimeIssue));
            ds.Add(new SqlParameter("@extra", ts.ExtraFee));

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable TimeSheetTheoMaGDV(int ma)
        {
            string sql = "sp_TimeSheetDangThucHien_GDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maGDV", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
            
        }
        public DataTable TimeSheetTheoThamChieu(string ma)
        {
            string sql="sp_TimeSheet_ThamChieu";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimesheetTheoGDVClaim(int magdv, string maclaim)
        {
            //string sql = "sp_TimeSheet_GDV_Claim";
            string sql = "sp_Diary_timesheet_gdvtheoclaim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter MaClaim = new SqlParameter("@maclaim", SqlDbType.VarChar);
            MaClaim.Value = maclaim;
            ds.Add(MaClaim);
            SqlParameter maGDV = new SqlParameter("@maGDV", SqlDbType.Int);
            maGDV.Value = magdv;
            ds.Add(maGDV);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DSTimeSheet(int gdv, string thamchieu)
        {
            string sql="sp_TimeSheet_DS";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@magdv", SqlDbType.Int);
            id.Value = gdv;
            ds.Add(id);
            SqlParameter tc = new SqlParameter("@Tc", SqlDbType.VarChar);
            tc.Value = thamchieu;
            ds.Add(tc);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }

        public bool ThemTimeSheet(TimeSheetDTO ts)
        {
            string sql="sp_TimeSheet_Them";
            List<SqlParameter>ds=new List<SqlParameter>();

            SqlParameter a = new SqlParameter("@magdv", SqlDbType.Int);
            a.Value = ts.MaGDV;
            ds.Add(a);

            SqlParameter b = new SqlParameter("@thamchieu", SqlDbType.NVarChar);
            b.Value = ts.ThamChieu;
            ds.Add(b);

            SqlParameter c = new SqlParameter("@ngay", SqlDbType.NVarChar);
            c.Value = ts.Ngay;
            ds.Add(c);            

            SqlParameter e = new SqlParameter("@macongtactimesheet", SqlDbType.VarChar);
            e.Value = ts.IdCongTacTimeSheet;
            ds.Add(e);

            SqlParameter f = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            f.Value = ts.DienGiai;
            ds.Add(f);

            SqlParameter g = new SqlParameter("@phatsinh", SqlDbType.Float);
            g.Value = ts.ThoiLuongPhatSinh;
            ds.Add(g);
            SqlParameter giothuc = new SqlParameter("@giothuc", SqlDbType.DateTime);
            giothuc.Value = ts.GioThuc;
            ds.Add(giothuc);
            SqlParameter extra = new SqlParameter("@extra",SqlDbType.NVarChar);
            extra.Value = ts.ExtraFee;
            ds.Add(extra);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool XoaTimeSheet(int id)
        {
            string sql="sp_TimeSheet_Delete";
            List<SqlParameter>ds=new List<SqlParameter>();
            SqlParameter ma = new SqlParameter("@Id", SqlDbType.Int);
            ma.Value = id;
            ds.Add(ma);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public bool SuaTimeSheet(TimeSheetDTO ts)
        {
            string sql= "sp_TimeSheet_Sua";
            List<SqlParameter>ds=new List<SqlParameter>();

            SqlParameter ma = new SqlParameter("@id", SqlDbType.Int);
            ma.Value = ts.ID;
            ds.Add(ma);

            SqlParameter b = new SqlParameter("@thamchieu", SqlDbType.NVarChar);
            b.Value = ts.ThamChieu;
            ds.Add(b);

            SqlParameter e = new SqlParameter("@macongtactimesheet", SqlDbType.VarChar);
            e.Value = ts.IdCongTacTimeSheet;
            ds.Add(e);
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.VarChar);
            ngay.Value = ts.Ngay;
            ds.Add(ngay);
            SqlParameter f = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            f.Value = ts.DienGiai;
            ds.Add(f);

            SqlParameter g = new SqlParameter("@phatsinh", SqlDbType.Float);
            g.Value = ts.ThoiLuongPhatSinh;
            ds.Add(g);
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable TimeSheetTheoMa(int ma)
        {
            string sql="sp_TimeSheet_Ma";
            List<SqlParameter> ds = new List<SqlParameter>(); ;
            SqlParameter id = new SqlParameter("@Id", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimesheetWR(string ma)
        {
            string sql = "sp_Timesheet_ViewWR";
            List<SqlParameter> ds = new List<SqlParameter>(); ;
            SqlParameter idclaim = new SqlParameter("@maclaim", SqlDbType.VarChar);
            idclaim.Value = ma;
            ds.Add(idclaim);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public bool KiemTraTimeSheetTonTai(string thamchieu)
        {
            bool kq = false;
            string sql = "sp_TimeSheet_KiemTraTonTai";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter a = new SqlParameter("@thamchieu", SqlDbType.VarChar);
            a.Value = thamchieu;
            ds.Add(a);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                float gio= float.Parse(dr[0].ToString());
                if(gio !=0)
                    kq=true;
            }
            return kq;
        }
        public float TongThoiLuongPhatSinhTheoCliam(string ma)
        {
            string sql="sp_TimeSheet_ThoiLuongPhatSinh";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@Id", SqlDbType.VarChar);
            id.Value = ma;
            ds.Add(id);
            DataTable dt = new DataTable();
            dt= SqlDataAcessHelper.exStoreParas(sql, ds);
            float gio = 0;
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if(dr[0].ToString()!=null)
                    gio = float.Parse(dr[0].ToString());
            }
            return gio;
        }
        public DataTable TimeSheetDangThucHien_MaGDV(int ma)
        {
            string sql="sp_TimeSheetDangThucHien_GDV";
            List<SqlParameter> ds=new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maGDV", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimeSheetDangThucHien_Claim(int ma,string thamchieu)
        {
            string sql ="sp_TimeSheetDangThucHien_Claim";
            List<SqlParameter>ds=new List<SqlParameter>();
            SqlParameter id = new SqlParameter("@maGDV", SqlDbType.Int);
            id.Value = ma;
            ds.Add(id);
            SqlParameter claim = new SqlParameter("@claim", SqlDbType.NVarChar);
            claim.Value = thamchieu;
            ds.Add(claim);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DanhSachTimeSheetViewWeeklyReport(string thamchieu)
        {
            string sql = "sp_TimeSheet_ViewReport";
            List<SqlParameter> ds = new List<SqlParameter>();           
            SqlParameter claim = new SqlParameter("@tenclaim", SqlDbType.VarChar);
            claim.Value = thamchieu;
            ds.Add(claim);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable DanhSachTimeSheetClaimPending()
        {
            string sql = "sp_TimeSheet_SelectPending";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public DataTable Statistict(string start, string end)
        {
            string sql = "sp_Timesheet_statistic";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter bd = new SqlParameter("@start", SqlDbType.VarChar);
            bd.Value = start;
            ds.Add(bd);
            SqlParameter kt = new SqlParameter("@end", SqlDbType.VarChar);
            kt.Value = end;
            ds.Add(kt);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            return dt;

        }
        public DataTable DanhSachTimeSheetAll()
        {
            string sql = "sp_TimeSheet_SelectPending";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }
        public bool CapNhatTimeIssue(int ma, string diengiai, float time, string ngay)
        {
            string sql = "sp_Timesheet_UpdateTimeIssue";
            List<SqlParameter> ds = new List<SqlParameter>();

            SqlParameter a = new SqlParameter("@matimesheet", SqlDbType.Int);
            a.Value = ma;
            ds.Add(a);
            SqlParameter des = new SqlParameter("@diengiai", SqlDbType.NVarChar);
            des.Value = diengiai;
            ds.Add(des);
            SqlParameter ti = new SqlParameter("@time", SqlDbType.Float);
            ti.Value = time;
            ds.Add(ti);
            SqlParameter da = new SqlParameter("@ngay", SqlDbType.VarChar);
            da.Value = ngay;
            ds.Add(da);

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable TimesheetDate(string date1,string date2)
        {
            string sql = "sp_Timesheet_Date";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.VarChar);
            ngay.Value = date1;
            ds.Add(ngay);
            SqlParameter ngay2 = new SqlParameter("@ngayden", SqlDbType.VarChar);
            ngay2.Value = date2;
            ds.Add(ngay2);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimesheetCaseDate(string date, string id, string date2)
        {
            string sql = "sp_Timesheet_DateClaim";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.VarChar);
            ngay.Value = date;
            ds.Add(ngay);
            SqlParameter caseno = new SqlParameter("@idclaim", SqlDbType.VarChar);
            caseno.Value = id;
            ds.Add(caseno);
            SqlParameter ngay2 = new SqlParameter("@ngayden", SqlDbType.VarChar);
            ngay2.Value = date2;
            ds.Add(ngay2);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimesheetGDVCase(string id, int gdv)
        {
            string sql = "sp_TimeSheet_GDVClaimAdjuster";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter maGDV = new SqlParameter("@gdv", SqlDbType.Int);
            maGDV.Value = gdv;
            ds.Add(maGDV);
            SqlParameter caseno = new SqlParameter("@idclaim", SqlDbType.VarChar);
            caseno.Value = id;
            ds.Add(caseno);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TimeSheetGDVDate(string date, int magdv, string date2)
        {
            string sql = "sp_Timesheet_GDVDate";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter ngay = new SqlParameter("@ngay", SqlDbType.VarChar);
            ngay.Value = date;
            ds.Add(ngay);
            SqlParameter maLA = new SqlParameter("@idgdv", SqlDbType.Int);
            maLA.Value = magdv;
            ds.Add(maLA);
            SqlParameter ngay2 = new SqlParameter("@ngayden", SqlDbType.VarChar);
            ngay2.Value = date2;
            ds.Add(ngay2);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TSGDVDateClaim(string date, int magdv, string id, string date2)
        {
            string sql = "sp_Timesheet_GDVDateClaimAdjus";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter caseno = new SqlParameter("@idclaim", SqlDbType.VarChar);
            caseno.Value = id;
            ds.Add(caseno);
            SqlParameter ngay = new SqlParameter("@date", SqlDbType.VarChar);
            ngay.Value = date;
            ds.Add(ngay);
            SqlParameter maLA = new SqlParameter("@gdv", SqlDbType.Int);
            maLA.Value = magdv;
            ds.Add(maLA);

            SqlParameter ngay2 = new SqlParameter("@ngayden", SqlDbType.VarChar);
            ngay2.Value = date2;
            ds.Add(ngay2);
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public Object upTSObject(int ma, string key, string value)
        {
            string sql = "sp_Timesheet_UpdateTSChar";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@id",ma));
            ds.Add(new SqlParameter("@key",key));
            ds.Add(new SqlParameter("@value", value));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable Timesheetsummary(string thamchieu)
        {
            string sql = "sp_timesheet_summary";
            List<SqlParameter> ds = new List<SqlParameter>();
            SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            macl.Value = thamchieu;
            ds.Add(macl);
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return null;
        }
        public DataRow TSSummaryInfo(string thamchieu)
        {
            string sql = "sp_Timesheet_Summary_Info";
            List<SqlParameter> ds = new List<SqlParameter>(); ;
            SqlParameter id = new SqlParameter("@idclaim", SqlDbType.VarChar);
            id.Value = thamchieu;
            ds.Add(id);
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
                return dt.Rows[0];
            return null;
        }
        public DataTable TSSummaryGDV(string thamchieu, int gdv)
        {
            string sql = "sp_timesheet_summary_GDV_detail";
            List<SqlParameter> ds = new List<SqlParameter>();
            //SqlParameter macl = new SqlParameter("@idclaim", SqlDbType.VarChar);
            //macl.Value = thamchieu;
            //ds.Add(macl);
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            ds.Add(new SqlParameter("@idgdv", gdv));            
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            return null;
        }
        public float CyberIncomeGDV(string thamchieu, int gdv)
        {
            string sql = "sp_timesheet_summary_GDV_Sum";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            ds.Add(new SqlParameter("@idgdv", gdv));
            DataTable dt = new DataTable();
            dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                return float.Parse(dr[0].ToString());
            }
            return 0;
        }
        public DataTable ListGDV_Timesheet(string thamchieu)
        {
            string sql = "sp_Timesheet_DSGDV";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));

            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable ListIDGDV(string thamchieu)
        {
            string sql = "sp_Timesheet_DSGDV_ID";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", thamchieu));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }



        public void UpdateRowIndex(IDictionary<int, String> Dic)
        {
            string sql = "sp_TimeSheet_UpdateRowIndex";

            foreach (KeyValuePair<int, String> entry in Dic)
            {
                // do something with entry.Value or entry.Key

                List<SqlParameter> ds = new List<SqlParameter>();
                ds.Add(new SqlParameter("@id", entry.Key));
                ds.Add(new SqlParameter("@rowindex", entry.Value));

                SqlDataAcessHelper.exNonStoreParas(sql, ds);
            }

        }

    }
}