using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyClaim : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        ClaimDAO cldao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    grDSClaim.Visible = false;
                    grDSLietKe.Visible = false;
                    loadGDV();
                    grDSClaim0.Visible = false;
                }
            }
        }
        void loadGDV()
        {
            GiamDinhVienDAO gdv = new GiamDinhVienDAO();
            drFollower.DataSource = gdv.DanhSachGiamDinhVien();
            drFollower.DataTextField = "TenGDV";
            drFollower.DataValueField = "ID_GDV";
            drFollower.DataBind();
        }

        protected void btnDSClaimHoanThanh_Click(object sender, EventArgs e)
        {
            dt = cldao.DanhSachClaim();
            grDSClaim.DataSource = dt;
            grDSClaim.DataBind();
            grDSClaim.Visible = true;
        }

        protected void btnLietKe_Click(object sender, EventArgs e)
        {
            dt = cldao.LietKeVuTonThatDonViBaoHiem();
            grDSLietKe.DataSource = dt;
            grDSLietKe.DataBind();
            grDSLietKe.Visible = true;
        }

        protected void btnFollower_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                DataTable dt = new DataTable();
               // int idgdv = int.Parse(drFollower.SelectedItem.Value.ToString());
                string follower = drFollower.SelectedItem.ToString();
                dt = cldao.DSClaimTheoFollower(follower);
                if (dt.Rows.Count > 0)
                {
                    grDSClaim0.DataSource = dt;
                    grDSClaim0.DataBind();
                    grDSClaim0.Visible = true;
                }
                else
                    grDSClaim0.Visible = false;
            }
        }
    }
}