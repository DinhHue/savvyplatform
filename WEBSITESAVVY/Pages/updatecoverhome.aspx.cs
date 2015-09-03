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
    public partial class updatecoverhome : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        GiaiDoanDAO gd = new GiaiDoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    drGDV.Visible = false;
                    drStatus.Visible = false;
                    btnHideStatus.Visible = false;
                    drHideGDV.Visible = false;
                    if (Request.QueryString["idClaim"] != null)
                    {
                        string mClaimID = Request.QueryString["idClaim"];
                        loadInfor(mClaimID);
                    }
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        void loaddr()
        {
            drGDV.DataSource = gdv.DanhSachGiamDinhVien();
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataTextField = "TenGDV";
            drGDV.DataBind();
            drStatus.DataSource = gd.DSGiaiDoan();
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
        }
        protected void loadInfor(string maclaim)
        {
            DataRow dr = cl.LayCoverHome(maclaim);
            if (dr != null)
            {
                txtNameCase.Text = dr["TenClaim"].ToString();
                txtBrief.Text=dr["Brief"].ToString();
                txtnextA.Text = dr["nextA"].ToString();
                txtProgress.Text=dr["Docs"].ToString();
                txtRate.Text = dr["Rate"].ToString();
                lblStatus.Text=dr["TenGiaiDoan"].ToString();
                lblFollower.Text=dr["Follower"].ToString();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string maclaim = Request.QueryString["idClaim"];
            DataRow dr = cl.LayCoverHome(maclaim);
            int maGD_old = int.Parse(dr["ID_GiaiDoanHoanThanh"].ToString());
            string tenclaim = txtNameCase.Text.Trim();
            string brief = txtBrief.Text.Trim();
            string nA = txtnextA.Text.Trim();
            int giaidoan = 0;
            if (lblStatus.Visible == true)
                giaidoan = maGD_old;
            else
                giaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
            int rate = int.Parse(txtRate.Text);
            string doc = txtProgress.Text.Trim();

            string follower = lblFollower.Text;
            if(drGDV.Visible==true)
                follower = drGDV.SelectedItem.ToString();
            bool kq = cl.UpdateDocs(maclaim,tenclaim, doc, nA, giaidoan, rate, brief, follower);
            if (kq == true)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " updated information cover case " + maclaim + " .";
                SaveLogTracking(maGDV, noidung, maclaim);
                Response.Write("<script> window.parent.closeDialog(); </script>");
                Response.Write("<script> window.parent.location.reload();</script>");
            }
            else
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " failed to update information cover case " + maclaim + " .";
                SaveLogTracking(maGDV, noidung, maclaim);
                Response.Write("<script>alert('Update fail!');</script>");
            }
        }
        void SaveLogTracking( int maGDV,string noidung, string maclaim)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = maGDV;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = maclaim;
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
        protected void btnChangeStatus_Click(object sender, EventArgs e)
        {
            lblStatus.Visible = false;
            drStatus.Visible = true;
            drStatus.DataSource = gd.DSGiaiDoan();
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
            btnChangeStatus.Visible = false;
            btnHideStatus.Visible = true;
        }

        protected void btnChangeFollower_Click(object sender, EventArgs e)
        {
            lblFollower.Visible = false;
            drHideGDV.Visible = true;
            btnChangeFollower.Visible = false;
            drGDV.Visible = true;
            drGDV.DataSource = gdv.DanhSachGiamDinhVien();
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataTextField = "TenGDV";
            drGDV.DataBind();
        }

        protected void btnHideStatus_Click(object sender, EventArgs e)
        {
            btnChangeStatus.Visible = true;
            lblStatus.Visible = true;
            btnHideStatus.Visible = false;
            drStatus.Visible = false;
        }

        protected void drHideGDV_Click(object sender, EventArgs e)
        {
            btnChangeFollower.Visible = true;
            lblFollower.Visible = true;
            drGDV.Visible = false;
            drHideGDV.Visible = false;
        }
    }
}