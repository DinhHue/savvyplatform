﻿using System;
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
        NewsTypeDAO daoNewsType = new NewsTypeDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillDataTemplate();

                fillDataNewsHot();
                fillDataNews();
            }
        }


        public void fillDataTemplate()
        {
            rptTypes.DataSource = daoNewsType.GetList();
            rptTypes.DataBind();

            repeaterMostViews.DataSource = daoNews.GetListMostViewHotLimit(10);
            repeaterMostViews.DataBind();
        }

        public void fillDataNewsHot()
        {
            repeaterList.DataSource = daoNews.GetListHotLimit(10);
            repeaterList.DataBind();
        }

        public void fillDataNews()
        {
            repeaterListNew.DataSource = daoNews.GetListNewLimit(8);
            repeaterListNew.DataBind();
        }

    }
}