using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class NewsDTO
    {
        public int          ID_News;
        public String       Title;
        public String       LinkImages;
        public DateTime     DateCreated;
        public DateTime     DateModified;
        public String       Brief;
        public String       Contents;
        public int          ID_GDVPost;
        public String       Ten_GDVPost;
        public int          ID_GDVEdit;
        public String       Ten_GDVEdit;
        public String       ID_Types;

        public NewsDTO()
        {
            this.ID_News = 0;
            this.Title = "";
            this.LinkImages = "";
            this.DateCreated = DateTime.Now;
            this.DateModified = DateTime.Now;
            this.Brief = "";
            this.Contents = "";
            this.ID_Types = " ";
        }
    }
}