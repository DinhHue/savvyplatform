using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyMemos : System.Web.UI.Page
    {
        QuiTrinhDAO qt = new QuiTrinhDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
             HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
          
        }
        void loadDSQuiTrinh()
        {
            DataTable dt = new DataTable();
            dt = qt.DanhSach();
            gvDSQuiTrinh.DataSource = dt;
            gvDSQuiTrinh.DataBind();
        }


    }
}