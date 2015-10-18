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
    }
}