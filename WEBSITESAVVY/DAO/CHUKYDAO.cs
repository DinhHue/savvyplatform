using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.DAO
{
    public class CHUKYDAO
    {
        public DataRow SelectChuKy(string idclaim)
        {
            string sql = "sp_CHUKY_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@idclaim", idclaim));
            DataTable dt= SqlDataAcessHelper.exStoreParas(sql, ds);
            DataRow dr = null;
            if (dt.Rows.Count > 0)
            {
                dr = dt.Rows[0];
            }
            return dr;
        }
        public void UpdateChuKy(string claimID, string key, string value)
        {
            string sql = "sp_ChuKy_UpdateField";
            List<SqlParameter> ds = new List<SqlParameter>();

            ds.Add(new SqlParameter("@idclaim", claimID));
            ds.Add(new SqlParameter("@key", key));
            ds.Add(new SqlParameter("@value", value));

            SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }
    }
}