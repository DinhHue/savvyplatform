using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;

namespace WEBSITESAVVY.DAO
{
    public class TrackingDAO
    {
        public bool InsertTracking(TrackingDTO tr)
        {
            string sql = "sp_Tracking_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idgdv", tr.MaGDV));
            ds.Add(new SqlParameter("@timeac", tr.TimeReal));
            ds.Add(new SqlParameter("@diengia", tr.NoiDung));
            ds.Add(new SqlParameter("@idclaim", tr.MaClaim));
            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
        public DataTable ListTrackingDate(DateTime ngay)
        {
            string sql = "sp_Tracking_Select_Date";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@date", ngay));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TrackingDateCase(string idclaim)
        {
            string sql = "sp_Tracking_SelectDateCase";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
        public DataTable TrackingDetailCase(string idclaim,DateTime ngay)
        {
            string sql = "sp_Tracking_select_Case";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            ds.Add(new SqlParameter("@date", ngay));
            return SqlDataAcessHelper.exStoreParas(sql, ds);
        }
    }
}