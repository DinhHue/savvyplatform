using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Globalization;

namespace WEBSITESAVVY.Master
{
    public partial class news : System.Web.UI.MasterPage
    {

        NewsDAO daoNews = new NewsDAO();
        NewsTypeDAO daoNewsType = new NewsTypeDAO();
        GiamDinhVienDAO gdvDao = new GiamDinhVienDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["MaGDV"] == null) Response.Redirect("../Pages/Login.aspx");    

                loadTemplate();
            }
        }

        public void loadTemplate()
        {
            int idGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            lblName.Text = gdvDao.LayTenTheoMa(idGDV);

            if (!gdvDao.KiemTraBacQuanLy(idGDV)) itemAdmin.Visible = false;
                
            rptTypes.DataSource = daoNewsType.GetListSummary();
            rptTypes.DataBind();

            if (repeaterMostViews.DataSource == null)
            {
                repeaterMostViews.DataSource = daoNews.GetListMostViewHotLimit(10);
                repeaterMostViews.DataBind();
            }

            //Load Group Year
            repeaterYear.DataSource = daoNews.GroupByYear();
            repeaterYear.DataBind();
            
        }

        protected void repeaterYear_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //Load group Year item
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int year = (int)DataBinder.Eval(e.Item.DataItem, "Year");
                DataTable dt = daoNews.GroupByMonth(year);
                Repeater repeaterItemYear = (Repeater)e.Item.FindControl("repeaterItemYear");

                repeaterItemYear.DataSource = dt;
                repeaterItemYear.DataBind();
            }
            
        }


        protected void repeaterItemYear_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int month = (int)DataBinder.Eval(e.Item.DataItem, "Month");
                Label lblMonth = (Label)e.Item.FindControl("lblMonth");
                lblMonth.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month);
            }

        }


    }
}