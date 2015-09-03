using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class Print : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string thamchieu;
            if (Session["ThamChieu"] != null)
            {
                thamchieu = Session["ThamChieu"].ToString();
                lblThamchieu.Text = thamchieu.ToString();
            }
        }

        //protected void btnPrint_Click(object sender, EventArgs e)
        //{
        //    Session["ctrl"] = Panel1;
        //    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('In.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        //}

        protected void btnPrint_Click1(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                if (ckSR.Checked == true)
                {
                    string thamchieu = lblThamchieu.Text;
                    Session["ThamChieu"] = thamchieu;
                    Response.Redirect("~/Pages/SiteSurveyRecordView.aspx?!#$#sddyiqkilote");
                }
            }
        }
    }
}