using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Text;

namespace WEBSITESAVVY.Pages
{
    public partial class eventscase : System.Web.UI.Page
    {
        TrackingDAO tr = new TrackingDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    if (Session["ThamChieu"] != null)
                    {
                        string idclaim = Session["ThamChieu"].ToString();
                        gvtrackinglist.DataSource = tr.TrackingDateCase(idclaim);
                        gvtrackinglist.DataBind();
                    }
                   
                }
                else
                    Response.Redirect("~/Pages/Login.aspx");
            }
        }
        DataTable LoadDate(string idclaim)
        {
            
            return tr.TrackingDateCase(idclaim);
            
        }
        protected String getRoman(int number)
        {
            String[] riman = { "M", "XM", "CM", "D", "XD", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
            //String[] riman = { "-" };
            int[] arab = { 1000, 990, 900, 500, 490, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
            StringBuilder result = new StringBuilder();
            int i = 0;
            while (number > 0 || arab.Length == (i - 1))
            {
                while ((number - arab[i]) >= 0)
                {
                    number -= arab[i];
                    result.Append(riman[i]);
                }
                i++;
            }

            return result.ToString();
        }

        protected void gvtrackinglist_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string idclaim = Session["ThamChieu"].ToString();
                Label lblngay = (Label)e.Row.FindControl("lblngay");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                //lblSTT.Text = getRoman(e.Row.RowIndex + 1);
                lblSTT.Text = "***";
                DateTime ngay=DateTime.Parse(lblngay.Text);
                DataTable dt = tr.TrackingDetailCase(idclaim, ngay);
                Repeater repeaterChild = (Repeater)e.Row.FindControl("repeaterChild");

                repeaterChild.DataSource = dt;
                repeaterChild.DataBind();
            }
        }

        protected void gvtrackinglist_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }
    }
}