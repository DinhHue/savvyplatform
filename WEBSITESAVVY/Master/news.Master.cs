﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Master
{
    public partial class news : System.Web.UI.MasterPage
    {

        NewsDAO daoNews = new NewsDAO();
        NewsTypeDAO daoNewsType = new NewsTypeDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTemplate();
            }
        }

        public void loadTemplate()
        {
            rptTypes.DataSource = daoNewsType.GetList();
            rptTypes.DataBind();

            if (repeaterMostViews.DataSource == null)
            {
                repeaterMostViews.DataSource = daoNews.GetListMostViewHotLimit(10);
                repeaterMostViews.DataBind();
            }
            
        }
    }
}