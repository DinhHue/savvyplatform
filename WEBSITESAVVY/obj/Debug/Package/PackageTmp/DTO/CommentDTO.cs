using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class CommentDTO
    {
        public int ID_Comment;
        public int ID_News;
        public int ID_GDV;
        public DateTime TimmeComment;
        public String Comments;


        public CommentDTO()
        {
            this.ID_Comment = 0;
            this.ID_GDV = 0;
            this.TimmeComment = DateTime.Now;
        }

    }
}