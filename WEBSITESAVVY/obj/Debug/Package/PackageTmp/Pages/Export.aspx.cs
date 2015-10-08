using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEBSITESAVVY.Pages
{
    public partial class Export : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!this.IsPostBack)
            {
                string maGDV = Session["MaGDV"].ToString();

                if (maGDV != null)
                {
                    string thamchieu;
                    if (Session["ThamChieu"] == null)
                    {
                        Response.Redirect("~/Pages/Home.aspx");
                    }
                    if (Session["ThamChieu"] != null)
                    {
                        thamchieu = Session["ThamChieu"].ToString();
                        lblThamchieu.Text = thamchieu.ToString();
                    }
                }
                else
                    Response.Redirect("/Pages/Longin.aspx");
            }
        }

        protected void btnPrint_Click1(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string thamchieu = lblThamchieu.Text;
                Session["ThamChieu"] = thamchieu;
                if (ckSR.Checked == true)
                {                    
                    Response.Redirect("~/Pages/SiteSurveyRecordView.aspx?sdhwiu983djjsf");
                }
                if (ckILA.Checked == true)
                {
                    Response.Redirect("~/Pages/InitialLossAdvice.aspx?rtyr23sdfdgoi89sd");
                }
            }
        }
    }
}