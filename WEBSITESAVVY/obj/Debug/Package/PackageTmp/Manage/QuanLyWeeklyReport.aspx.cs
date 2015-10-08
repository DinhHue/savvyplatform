using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Data.SqlClient;

namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyWeeklyReport : System.Web.UI.Page
    {
        WeeklyReportDAO wrdao = new WeeklyReportDAO();
        ClaimDAO cldao = new ClaimDAO();
        int doing = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    grDSWeeklyAll.Visible = false;
                    grDSWRDangThucHien.Visible = false;
                    lblThongBao.Text = "";
                }
            }
        }
        void LoadDSWRDangThucHien()
        {
           grDSWRDangThucHien.DataSource = wrdao.DanhSachWRClaimDangThucHien();
            grDSWRDangThucHien.DataBind();
        }
        void loadSDRWAll()
        {            
            grDSWeeklyAll.DataSource = wrdao.DanhSachWRAll();
            grDSWeeklyAll.DataBind();
        }


        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/WeeklyReport.aspx?updateid=" + 0);
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            grDSWeeklyAll.Visible = true;
            grDSWRDangThucHien.Visible = false;
            grTimeKiemWR.Visible = false;
            loadSDRWAll();
        }

        protected void btnDangThucHien_Click(object sender, EventArgs e)
        {
            grDSWeeklyAll.Visible = false;
            grDSWRDangThucHien.Visible = true;
            LoadDSWRDangThucHien();
            grTimeKiemWR.Visible = false;
        }

        protected void grDSWeeklyAll_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSWeeklyAll.PageIndex = e.NewPageIndex;
            loadSDRWAll();
        }

        protected void grDSWRDangThucHien_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSWRDangThucHien.PageIndex = e.NewPageIndex;
            LoadDSWRDangThucHien();
        }

        protected void grDSWeeklyAll_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idwr=int.Parse(grDSWeeklyAll.DataKeys[e.RowIndex].Value.ToString());
            bool kq = wrdao.Xoa(idwr);
            if (kq == true)
            {
                loadSDRWAll();
            }
        }

        protected void grDSWRDangThucHien_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idwr = int.Parse(grDSWRDangThucHien.DataKeys[e.RowIndex].Value.ToString());
            bool kq = wrdao.Xoa(idwr);
            if (kq == true)
                LoadDSWRDangThucHien();
        }

        protected void grDSWeeklyAll_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int mawr=int.Parse(grDSWeeklyAll.DataKeys[e.NewSelectedIndex].Value.ToString());
            Session["MaWR"] = mawr;
            Response.Redirect("/Pages/WeeklyReport.aspx");
        }

        protected void grDSWRDangThucHien_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int mawr=int.Parse(grDSWRDangThucHien.DataKeys[e.NewSelectedIndex].Value.ToString());
            Session["MaWR"]=mawr;
            Response.Redirect("/Pages/WeeklyReport.aspx");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = wrdao.TimKiem(txtMaThamChieu.Text);
            if (dt.Rows.Count > 0)
            {
                grDSWeeklyAll.Visible = false;
                grDSWRDangThucHien.Visible = false;
                grTimeKiemWR.Visible = true;
                grTimeKiemWR.DataSource = dt;
                grTimeKiemWR.DataBind();
            }
            else
                lblThongBao.Text = "Chưa có Weekly Report!";
        }

        protected void grTimeKiemWR_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int mawr = int.Parse(grTimeKiemWR.DataKeys[e.NewSelectedIndex].Value.ToString());
            Session["MaWR"] = mawr;
            Response.Redirect("/Pages/WeeklyReport.aspx");
        }

        protected void grTimeKiemWR_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idwr = int.Parse(grTimeKiemWR.DataKeys[e.RowIndex].Value.ToString());
            bool kq = wrdao.Xoa(idwr);
            if (kq == true)
                grTimeKiemWR.Visible = false;
        }

       
    }
}