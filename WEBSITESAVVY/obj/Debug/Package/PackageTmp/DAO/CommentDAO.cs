using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;

namespace WEBSITESAVVY.DAO
{
    public class CommentDAO
    {
        public bool PostComment(CommentDTO comment)
        {
            string sql = "sp_News_PostComment";
            List<SqlParameter> list = new List<SqlParameter>();

            list.Add(new SqlParameter("@ID_News", comment.ID_News));
            list.Add(new SqlParameter("@ID_GDV", comment.ID_GDV));
            list.Add(new SqlParameter("@TimeComment", comment.TimmeComment));
            list.Add(new SqlParameter("@Comments", comment.Comments));

            return SqlDataAcessHelper.exNonStoreParas(sql, list);
        }

        public bool UpdateComment(CommentDTO comment)
        {
            string sql = "sp_News_UpdateComment";
            List<SqlParameter> list = new List<SqlParameter>();

            list.Add(new SqlParameter("@ID_Comment", comment.ID_News));
            list.Add(new SqlParameter("@ID_News", comment.ID_News));
            list.Add(new SqlParameter("@ID_GDV", comment.ID_GDV));
            list.Add(new SqlParameter("@TimeComment", comment.TimmeComment));
            list.Add(new SqlParameter("@Comments", comment.Comments));

            return SqlDataAcessHelper.exNonStoreParas(sql, list);
        }
    }
}