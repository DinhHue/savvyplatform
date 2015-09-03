using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class ViewSiteSurverRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["GDV"] != null)
                {
                    string maclaim = Request.QueryString["IDClaim"];
                    
                }
                else
                    Response.Redirect("~/Pages/Login.aspx");
            }
        }
        void ViewClaim(string idclaim)
        {
            ClaimDAO cl = new ClaimDAO();
            DataTable dt = new DataTable();
            dt = cl.ViewSiteSurveyRecord(idclaim);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblNgayThucHien.Text = dr[0].ToString();
                
            }
        }
    }
}