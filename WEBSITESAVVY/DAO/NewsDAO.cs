using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;

namespace WEBSITESAVVY.DAO
{
    public class NewsDAO
    {
        public bool Update(NewsDTO news)
        {
            string sql = "sp_News_Update";
            List<SqlParameter> list = new List<SqlParameter>();

            list.Add(new SqlParameter("@ID_News", news.ID_News));
            list.Add(new SqlParameter("@Title", news.Title));
            list.Add(new SqlParameter("@LinkImages", news.LinkImages));
            //list.Add(new SqlParameter("@DateCreated", news.DateCreated));
            list.Add(new SqlParameter("@DateModified", news.DateModified));
            list.Add(new SqlParameter("@Brief", news.Brief));
            list.Add(new SqlParameter("@Contents", news.Contents));
            //list.Add(new SqlParameter("@ID_GDVPost", news.ID_GDVPost));
            list.Add(new SqlParameter("@ID_GDVEdit", news.ID_GDVEdit));
            list.Add(new SqlParameter("@ID_Types", news.ID_Types));

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, list);
            return kq;

        }

        public bool CreateNew(NewsDTO news)
        {
            string sql = "sp_News_Create";
            List<SqlParameter> list = new List<SqlParameter>();

            //list.Add(new SqlParameter("@ID_News", news.ID_News));
            list.Add(new SqlParameter("@Title", news.Title));
            list.Add(new SqlParameter("@LinkImages", news.LinkImages));
            list.Add(new SqlParameter("@DateCreated", news.DateCreated));
            list.Add(new SqlParameter("@DateModified", news.DateModified));
            list.Add(new SqlParameter("@Brief", news.Brief));
            list.Add(new SqlParameter("@Contents", news.Contents));
            list.Add(new SqlParameter("@ID_GDVPost", news.ID_GDVPost));
            list.Add(new SqlParameter("@ID_GDVEdit", news.ID_GDVEdit));
            list.Add(new SqlParameter("@ID_Types", news.ID_Types));

            bool kq = SqlDataAcessHelper.exNonStoreParas(sql, list);
            return kq;

        }

        public DataTable GetList()
        {
            string sql = "sp_News_List";   
            return SqlDataAcessHelper.exStoreNoParas(sql);
        }

        public DataTable GetListSearch(String keyword)
        {
            string sql = "sp_News_List_Search";
            List<SqlParameter> list = new List<SqlParameter>();
            list.Add(new SqlParameter("@keyword", keyword));
            return SqlDataAcessHelper.exStoreParas(sql, list);
        }

        public NewsDTO GetNews(int ID_News)
        {
            string sql = "sp_News_Get_ID";
            List<SqlParameter> list = new List<SqlParameter>();
            list.Add(new SqlParameter("@ID_News", ID_News));
            DataTable dt = SqlDataAcessHelper.exStoreParas(sql, list);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                NewsDTO news = new NewsDTO();
                news.ID_News = (int)row["ID_News"];
                news.Title   = row["Title"].ToString();
                news.LinkImages = row["LinkImages"].ToString();
                news.Brief   = row["Brief"].ToString();
                news.Contents = row["Contents"].ToString();

                var dateCreate = row["DateCreated"];
                if (dateCreate.ToString() != "") news.DateCreated = (DateTime)row["DateCreated"];

                var date = row["DateModified"];
                if (date.ToString() != "") news.DateModified = (DateTime)row["DateModified"];

                news.ID_GDVPost = (int)row["ID_GDVPost"];
                news.Ten_GDVPost = row["Ten_GDVPost"].ToString();
                news.ID_GDVEdit = (int)row["ID_GDVEdit"];
                news.Ten_GDVEdit = row["Ten_GDVEdit"].ToString();
                news.ID_Types = (String)row["ID_Types"];

                return news;
            }
            else
                return null;
        }
    }
}