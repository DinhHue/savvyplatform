using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class NewsDetail : System.Web.UI.Page
    {
        NewsDAO daoNews = new NewsDAO();
        CommentDAO daoComment = new CommentDAO();
        NewsTypeDAO daoNewsType = new NewsTypeDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var idNews = Request.QueryString["id"];
                if (idNews != null)
                {
                    hiddenIDNews.Value = idNews;

                    
                    NewsDTO news = daoNews.GetNews(int.Parse(idNews));
                    lblTitle.Text = news.Title;
                    lblBrief.Text = news.Brief;
                    lblDate.Text = news.DateCreated.ToString("dd/M/yyyy");
                    lblContent.Text = news.Contents;

                    this.Title = news.Title;
                    //loadComment(int.Parse(idNews));

                    //
                    rptTypes.DataSource = daoNewsType.GetList();
                    rptTypes.DataBind();

                    loadComment(int.Parse(idNews));
                }
            }
        }

        public void loadComment(int idNews)
        {
            DataTable dt = daoNews.GetListComment(idNews);
            rptComment.DataSource = dt;
            rptComment.DataBind();
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            int idNews = int.Parse(hiddenIDNews.Value);
            int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);

            CommentDTO comment = new CommentDTO();
            comment.ID_News = idNews;
            comment.ID_GDV = idgdv;
            comment.Comments = txtComment.Text.ToString();

            daoComment.PostComment(comment);

            loadComment(idNews);
            txtComment.Text = "";
        }
    }
}