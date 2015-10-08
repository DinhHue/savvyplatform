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
    public partial class ListviewJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load all of the territories into a DataView from the SqlDataSource
            territoryData = (DataView)territoriesDataSource.Select(DataSourceSelectArguments.Empty);
            territoryData2 = (DataView)territoriesDataSource.Select(DataSourceSelectArguments.Empty);
            if (!this.IsPostBack)
            {
                GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
                lblThongBao.Visible = true;
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");

                else
                {
                    int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                    bool ktcv = gdvdao.KiemTraChucVuQuanLy(magdv);
                    if (ktcv == false)
                    {
                        bool ktgd = gdvdao.KiemTraGiamDoc(magdv);
                        if (ktgd == false)
                        {
                            Response.Write("<script>alert('You can't access!');</script>");
                            //Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó
                            Response.Redirect("~/Pages/Notification.aspx");
                        }
                        
                    }
                    lblNgay.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    loadAllWorkDay();
                }

            }
        }
        DataView territoryData;
        DataView territoryData2;  
        protected void employeesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // For each DataRow in the GridView, 
            // programmatically access the BulletedList, filter
            // the DataView based on the GridView row's 
            // EmployeeID value and bind the filtered DataView
            // to the BulletedList
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                BulletedList bl =(BulletedList)e.Row.FindControl("bltTerritories");
               
                territoryData.RowFilter = "ID_Claim = " +
                  ((DataRowView)e.Row.DataItem)["ID_Claim"].ToString();
                bl.DataSource = territoryData;
                bl.DataBind();
                BulletedList bl2 = (BulletedList)e.Row.FindControl("bltNgayThucHien");
                territoryData2.RowFilter = "ID_Claim = " +
                  ((DataRowView)e.Row.DataItem)["ID_Claim"].ToString();
                bl2.DataSource = territoryData2;
                bl2.DataBind();
            }
        }
      void loadAllWorkDay()
        {
            DateTime date = DateTime.Today;
          JobListDAO jldao= new JobListDAO();
          DataTable dt = new DataTable();
          dt=jldao.JobListAllDate(date);
          if (dt.Rows.Count > 0)
          {
              grViewAllWorkToday.DataSource = dt;
              grViewAllWorkToday.DataBind();
          }
          else
          {
              lblThongBao.Text = "Haven't work for today!";
              lblThongBao.Visible = false;
          }
        }
    }
}