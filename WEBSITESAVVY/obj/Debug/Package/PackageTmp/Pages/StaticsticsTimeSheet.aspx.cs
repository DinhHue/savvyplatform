using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class StaticsticsTimeSheet : System.Web.UI.Page
    {
        TimeSheetDAO ts = new TimeSheetDAO();
        ClaimDAO cl = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                lblThongBao.Visible = false;
                //string maGDV = ;
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                //DataTable dt = new DataTable();
                //dt = cl.DanhSachClaimPending();
                //if (dt.Rows.Count > 0)
                //{
                //    int count = dt.Rows.Count;
                //    DataColumn col = dt.Columns[0];
                //    DataRow dr = dt.Rows[0];
                //    for (int i = 0; i <= count - 1; i++)
                //    {
                //        string idclaim = col[i];
                //        DataTable dt2 = new DataTable();
                //        dt2 = dr.LietKeGDVCLaim(idclaim);
                //        dtlist.DataSource = dt2;
                //        dtlist.DataBind();
                //    }
                //}
            }

        }

        
        protected void btnXem_Click(object sender, EventArgs e)
        {
            //DateTime st = DateTime.Parse(txtTimeStart.Text);
            //DateTime kt = DateTime.Parse(txtTimeEnd.Text);
            string st = txtTimeStart.Text;
            string kt = txtTimeEnd.Text;
            DataTable dt = new DataTable();
            dt = ts.Statistict(st, kt);
            if (dt.Rows.Count > 0)
            {
                gvDS.DataSource = dt;
                gvDS.DataBind();
            }
            else
            {
                lblThongBao.Text = "Không có diary để thống kê!";
                lblThongBao.Visible = true;
            }
        }
    }
}