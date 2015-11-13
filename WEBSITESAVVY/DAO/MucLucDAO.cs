using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;

namespace WEBSITESAVVY.DAO
{
    public class MucLucDAO
    {
        public static MucLucDTO getMucLuc(string ID_Claim, string ClaimType)
        {
            string sql = "sp_MucLuc_Select";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@ID_Claim", ID_Claim));
            ds.Add(new SqlParameter("@ClaimType", ClaimType));
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, ds);
            if(dt.Rows.Count > 0 )
            {
                MucLucDTO mucLuc = new MucLucDTO();
                mucLuc.ID_Claim = dt.Rows[0]["ID_Claim"].ToString();
                mucLuc.ClaimType = dt.Rows[0]["ClaimType"].ToString();
                mucLuc.JsonValue = dt.Rows[0]["JsonValue"].ToString();

                return mucLuc;
            }
            return null;
        }

        public static bool Insert(MucLucDTO mucLuc)
        {
            string sql = "sp_MucLuc_Insert";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@ID_Claim", mucLuc.ID_Claim));
            ds.Add(new SqlParameter("@ClaimType", mucLuc.ClaimType));
            ds.Add(new SqlParameter("@JsonValue", mucLuc.JsonValue));

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

        public static bool Update(MucLucDTO mucLuc)
        {
            string sql = "sp_MucLuc_Update";
            List<SqlParameter> ds = new List<SqlParameter>();
            ds.Add(new SqlParameter("@ID_Claim", mucLuc.ID_Claim));
            ds.Add(new SqlParameter("@ClaimType", mucLuc.ClaimType));
            ds.Add(new SqlParameter("@JsonValue", mucLuc.JsonValue));

            return SqlDataAcessHelper.exNonStoreParas(sql, ds);
        }

    }
}