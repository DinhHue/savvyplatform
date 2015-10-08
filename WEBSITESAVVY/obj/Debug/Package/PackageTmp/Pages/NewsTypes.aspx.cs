using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Pages
{
    public partial class NewsTypes : System.Web.UI.Page
    {
        NewsDAO daoNews = new NewsDAO();
        NewsTypeDAO daoNewsType = new NewsTypeDAO();
        static string idType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idType = Request.QueryString["id"];
                if (idType != null)
                {

                    NewsTypeDTO newsType = daoNewsType.GetNewsType(idType);

                    Page.Title = newsType.NameType;
                    lblTitle.Text = newsType.NameType;

                    fillData();
                }
            }
        }


        public void fillData()
        {
            DataTable dt = daoNews.GetListByType(idType); ;
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


        protected void rptTypes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                string type = ((HiddenField)e.Item.FindControl("id_type")).Value;
                if (type.Trim() == idType)
                {
                    ((System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("item_type")).Attributes.Add("class", "active");
                }

            }
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
    }
}