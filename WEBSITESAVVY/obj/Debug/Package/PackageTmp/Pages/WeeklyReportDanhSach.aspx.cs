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
    public partial class WeeklyReportDanhSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    WeeklyReportDAO wrdao = new WeeklyReportDAO();
                    gvDSWR.DataSource = wrdao.DanhSachWRAll();
                    gvDSWR.DataBind();
                }
            }
        }
        void loadDS()
        {
            WeeklyReportDAO wrdao = new WeeklyReportDAO();
            gvDSWR.DataSource = wrdao.DanhSachWRAll();
            gvDSWR.DataBind();
        }

        protected void gvDSTimeSheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDSWR.PageIndex = e.NewPageIndex;
            loadDS();
        }

        protected void gvDSWR_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSWR.Rows[e.RowIndex];
            int ma = int.Parse(gvDSWR.DataKeys[e.RowIndex].Value.ToString());
            if (ma != null)
            {
                string thamchieu = row.Cells[1].Text;
                Session["ThamChieu"] = thamchieu;
                Session["MaWR"] = ma;
                Response.Redirect("~/Pages/WeeklyReport.aspx?updateid="+ma);
            }
            else
                Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>"); 
        }


        protected void gvDSWR_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                GridViewRow row = gvDSWR.SelectedRow;
                if (row != null)
                {
                    string temp = row.Cells[2].Text;
                    int idwr = int.Parse(temp.ToString());
                    Session["MaWR"] = idwr;
                    Response.Redirect("~/Pages/WeeklyReport.aspx?viewidwr="+idwr);
                }
                else
                    Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>"); 
            }
        }       

        protected void btnThemMoi_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/WeeklyReport.aspx?updateid="+0);
        }

        protected void gvDSWR_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSWR.SelectedRow;
            if (row != null)
            {
                string temp = row.Cells[2].Text;
                Response.Redirect("~/Pages/XemWeeklyReport.aspx?viewthamchieu="+temp);
            }
            else
                Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>"); 
        }
       
    }
}