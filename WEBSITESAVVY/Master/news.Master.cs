using System;
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