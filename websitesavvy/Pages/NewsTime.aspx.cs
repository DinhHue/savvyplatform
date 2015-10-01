using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class NewsTime : System.Web.UI.Page
    {
        NewsDAO newsDao = new NewsDAO();
        static int year = DateTime.Now.Year;
        static int month = DateTime.Now.Month;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["year"] != null)
                    year = int.Parse(Request.QueryString["year"].ToString());
                if (Request.QueryString["month"] != null)
                    month = int.Parse(Request.QueryString["month"].ToString());

                String title = String.Format("Bài viết tháng {0} năm {1}", month, year);
                Page.Title = title;
                lblTitle.Text = title;

                fillData();
            }
        }

        public void fillData()
        {
            DataTable dt = newsDao.GetListSearchByYearMonth(year, month);
            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 20;
            if (PageNumber >= pgitems.PageCount) PageNumber = 0;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
                rptPages.Visible = false;

            repeaterList.DataSource = pgitems;
            repeaterList.DataBind();
        }

        protected void rptPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            fillData();
        }
        protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton lb = e.Item.FindControl("btnPage") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);

                if (lb.CommandArgument == (PageNumber + 1).ToString())
                {
                    lb.CssClass = "selected";
                }
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                LinkButton linkBt = (LinkButton)e.Item.FindControl("btnPageNext");
                linkBt.CommandArgument = (PageNumber + 2).ToString();
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(linkBt);
            } 
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
    }
}