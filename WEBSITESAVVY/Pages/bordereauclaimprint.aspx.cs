using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Pages
{
    public partial class bordereauclaimprint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                int madv = int.Parse(Request.QueryString["dv"]);
                WeeklyReportDAO wr = new WeeklyReportDAO();
                lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy");                
                grDS.DataSource = wr.ListWRDonViBH(madv);
                grDS.DataBind();
            }
        }
    }
}