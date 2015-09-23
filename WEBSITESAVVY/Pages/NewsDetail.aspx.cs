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
                    news.Views += 1;

                    daoNews.Update(news);

                    lblTitle.Text = news.Title;
                    lblBrief.Text = news.Brief;
                    lblDate.Text = news.DateCreated.ToString("hh:mm dd/M/yyyy");
                    lblContent.Text = news.Contents;

                    repeaterTag.DataSource = daoNews.GetListType(int.Parse(idNews));
                    repeaterTag.DataBind();

                    this.Title = news.Title;
                    //loadComment(int.Parse(idNews));

                    //
                    fillDataTemplate();

                    loadComment(int.Parse(idNews));
                }
            }
        }


        public void fillDataTemplate()
        {
            rptTypes.DataSource = daoNewsType.GetList();
            rptTypes.DataBind();

            repeaterMostViews.DataSource = daoNews.GetListMostViewHotLimit(10);
            repeaterMostViews.DataBind();
        }


        public void loadComment(int idNews)
        {
            DataTable dt = daoNews.GetListComment(idNews);
            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 20;
            if (PageNumber >= pgitems.PageCount) PageNumber = 0;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPagesComment.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPagesComment.DataSource = pages;
                rptPagesComment.DataBind();
            }
            else
                rptPagesComment.Visible = false;

            rptComment.DataSource = pgitems;
            rptComment.DataBind();

            lblNumberComment.Text = "("+ dt.Rows.Count +")";
        }


        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
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

        protected void rptPagesComment_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

                PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
                loadComment(int.Parse(hiddenIDNews.Value.ToString()));

        }

        protected void rptPagesComment_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lb = e.Item.FindControl("btnPage") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);

            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                LinkButton linkBt = (LinkButton)e.Item.FindControl("btnPageNext");
                linkBt.CommandArgument = (PageNumber + 2).ToString();
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(linkBt);
            }
        }
    }
}