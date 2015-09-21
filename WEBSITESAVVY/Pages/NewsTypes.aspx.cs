using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Pages
{
    public partial class NewsTypes : System.Web.UI.Page
    {
        NewsDAO daoNews = new NewsDAO();
        NewsTypeDAO daoNewsType = new NewsTypeDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var idType = Request.QueryString["id"];
                if (idType != null)
                {
                    rptTypes.DataSource = daoNewsType.GetList();
                    rptTypes.DataBind();


                    //
                    repeaterList.DataSource = daoNews.GetListByType(idType);
                    repeaterList.DataBind();
                }
            }
        }

        protected void repeaterList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}