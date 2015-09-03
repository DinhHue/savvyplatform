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
    public partial class JobList : System.Web.UI.Page
    {
        JobListDAO jldao = new JobListDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                {
                    Response.Redirect("~/Pages/Login.aspx");
                    //int ma = int.Parse(Session["MaGDV"].ToString());
                }
                else
                {
                    LoadDR();
                    loadDSJobDaiLy();
                }
            }
        }
        ClaimDAO cldao = new ClaimDAO();
        void LoadDR()
        {
            DataTable dt = new DataTable();
            dt = cldao.DSCaseName();
            if (dt.Rows.Count > 0)
            {
                drDSCase.DataSource = dt;
                drDSCase.DataTextField = "Name";
                drDSCase.DataValueField = "ID_Claim";
                drDSCase.DataBind();
            }            
        }
        void loadDSJobDaiLy()
        {
            DataTable dt = new DataTable();
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            DateTime ngay = DateTime.Today;
            dt= jldao.JobListDate(ngay, maGDV);
            if (dt.Rows.Count > 0)
            {
                grDSJobList.DataSource = dt;
                grDSJobList.DataBind();
            }
            else
            {
                lblNotification.Text = "You haven't work for today!";
                lblNotification.Visible = false;
            }
        }
        protected void btnNewJob_Click(object sender, EventArgs e)
        {
            JobListDTO jl = new JobListDTO();
            jl.MaClaim = drDSCase.SelectedItem.Value.ToString();
            jl.NameJob = txtNameJob.Text;
            jl.MaGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            jl.NgayThucHien = DateTime.Today;
            bool ad = jldao.InsertJob(jl);
            if (ad == true)
            {
                loadDSJobDaiLy();
                txtNameJob.Text = "";
            }
            else
                Response.Write("<script>alert('Updated!');<script/>");
        }

        protected void grDSJobList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
            int autoid = int.Parse(grDSJobList.DataKeys[e.RowIndex].Value.ToString());
            jldao.DeleteJob(autoid, magdv);
            loadDSJobDaiLy();
           
        }
        
    }
}