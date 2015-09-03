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
    public partial class ListWeeklyReport : System.Web.UI.Page
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
        protected void btnThemMoi_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/WeeklyReport.aspx?updateid=" + 0);
        }

        protected void gvDSTimeSheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDSWR.PageIndex = e.NewPageIndex;
            loadDS();
        }

        protected void gvDSWR_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                GridViewRow row = gvDSWR.SelectedRow;
                if (row != null)
                {
                    WeeklyReportDAO wr = new WeeklyReportDAO();
                    string temp = row.Cells[1].Text;
                    //int ma = int.Parse(gvDSWR.DataKeys[e.RowIndex].Value.ToString());
                    //int idwr= wr.l
                    int idwr = int.Parse(temp.ToString());
                    Session["MaWR"] = idwr;
                    Response.Redirect("~/Pages/WeeklyReport.aspx?viewidwr=" + idwr);
                }
                else
                    Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>");
            }
        }

        protected void gvDSWR_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ma = int.Parse(gvDSWR.DataKeys[e.RowIndex].Value.ToString());
            if (ma != null)
            {
                //string temp = row.Cells[1].Text;
                //int idwr = int.Parse(temp.ToString());
                Session["MaWR"] = ma;
                Response.Redirect("~/Pages/WeeklyReport.aspx?updateid=" + ma);
            }
            else
                Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>"); 
        }

        protected void gvDSWR_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSWR.SelectedRow;
            if (row != null)
            {
                string temp = row.Cells[1].Text;
                //int idwr = int.Parse(temp.ToString());
                Session["ThamChieu"] = temp;
                //Response.Redirect("~/Pages/XemWeeklyReport.aspx?viewthamchieu=" + temp);
                ClientScript.RegisterStartupScript(this.GetType(), "newWindow", String.Format("<script>window.open('{0}');</script>", "../Pages/XemWeeklyReport.aspx?viewthamchieu=" + temp));
            }
            else
                Response.Write("<script> alert ('Weekly report này đã bị xóa hoặc không tồn tại!');</script>"); 
        }
    }
}