using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;

namespace WEBSITESAVVY.DAO
{
    public class NewsTypeDAO
    {
        public DataTable GetList()
        {
            string sql = "sp_TypeNews_List";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }

        public DataTable GetListSummary()
        {
            string sql = "sp_News_TypeSummary";
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }

        public NewsTypeDTO GetNewsType(String id)
        {
            string sql = "sp_TypeNews_ID";
            List<SqlParameter> list = new List<SqlParameter>();
            list.Add(new SqlParameter("@id", id));
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, list);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                NewsTypeDTO typeNews = new NewsTypeDTO();
                typeNews.ID_Type = id;
                typeNews.NameType = row["NameType"].ToString();

                return typeNews;
            }
            else
                return null;
        }
    }
}