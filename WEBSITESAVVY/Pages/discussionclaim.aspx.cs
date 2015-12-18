using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
namespace WEBSITESAVVY.Pages
{
    public partial class discussionclaim : System.Web.UI.Page
    {
        static string mClaimID = "";

        ClaimDAO cldao = new ClaimDAO();
        //SendMailDAO sm = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (!this.IsPostBack)
            {

                load(mClaimID);

            }
        }
        void load(string mClaimID)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectClaimDiscussion(mClaimID);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                if (dr[0].ToString() != "")
                    lblK.Text = dr[0].ToString();
            }
        }
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected string TenGDV()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengdv = gdvdao.LayTenTheoMa(maGDV);
            //tengdv=lblGDV.ToString();
            return tengdv;

        }
    }
}