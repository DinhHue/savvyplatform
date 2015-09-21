using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class News : System.Web.UI.Page
    {
        NewsDAO daoNews = new NewsDAO();
        CommentDAO daoComment = new CommentDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}