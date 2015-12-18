using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class task : System.Web.UI.Page
    {
        public static string mClaimID = "";
        DaiLyDAO dldao = new DaiLyDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (!this.IsPostBack)
            {
                gvDSDuocNhan.DataSource = dldao.TaskClaim(mClaimID);
                gvDSDuocNhan.DataBind();
            }
        }
    }
}