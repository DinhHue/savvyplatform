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
    public partial class BordereauClaim : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        WeeklyReportDAO wr = new WeeklyReportDAO();
        NhaBHDAO nbh = new NhaBHDAO();
        DonViBHDAO dv = new DonViBHDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    LoadDonVi();
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        protected void LoadDonVi()
        {
            drNBH.DataSource = dv.DonViWR();
            drNBH.DataTextField = "TenDonVi";
            drNBH.DataValueField = "ID_DonVi";
            drNBH.DataBind();
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            int madv= int.Parse(drNBH.SelectedItem.Value.ToString());
            Session["madonvi"] = madv;
            grDS.DataSource = wr.ListWRDonViBH(madv);
            grDS.DataBind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }

        protected void btnXuatPDF_Click(object sender, EventArgs e)
        {
            string dv=Session["madonvi"].ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", String.Format("<script>window.open('{0}');</script>", "../Pages/bordereauclaimprint.aspx?dv=" + dv));
        }
    }
}