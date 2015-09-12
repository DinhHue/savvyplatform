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
    public partial class search : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        KhachHangDAO kh = new KhachHangDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    if (Request.QueryString["key"] != null)
                    {
                        string key = Request.QueryString["key"].ToString();
                        txtTuKhoa.Text = key;
                        TimAllClaim(key);
                    }
                }
            }
        }

        protected void btnTiemKiem_Click(object sender, EventArgs e)
        {
            string key = txtTuKhoa.Text.Trim();
            if (rdTimKiem.SelectedValue == "NDBH")
                TimKhachHang(key);
            if (rdTimKiem.SelectedValue == "LHTT")
                TimLHTT(key);
            if (rdTimKiem.SelectedValue == "PolicyName")
                TimPolicy(key);
            if (rdTimKiem.SelectedValue == "Brief")
                TimBrief(key);
            if (rdTimKiem.SelectedValue == "DKBS")
                TimDKBS(key);
            else
                TimAllClaim(key);
        }
        void TimKhachHang(string key)
        {
            grDSClaim.DataSource = cl.SearchNDBH(key);
            grDSClaim.DataBind();
        }
        void TimLHTT(string key)
        {
            grDSClaim.DataSource = cl.SearchLHTT(key);
            grDSClaim.DataBind();
        }
        void TimPolicy(string key)
        {
            grDSClaim.DataSource = cl.SearchPolicy(key);
            grDSClaim.DataBind();
        }
        void TimBrief(string key)
        {
            grDSClaim.DataSource = cl.SearchBrief(key);
            grDSClaim.DataBind();
        }
        void TimDKBS(string key)
        {
            grDSClaim.DataSource = cl.SearchDKBS(key);
            grDSClaim.DataBind();
        }
        void TimAllClaim(string key)
        {
            grDSClaim.DataSource = cl.SearchAllCase(key);
            grDSClaim.DataBind();
        }

        protected void grDSClaim_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grDSClaim.SelectedRow;
            if (row != null)
            {
                //string temp = row.Cells[0].Text;
                string thamchieu = row.Cells[1].Text;
                string ma = cl.LayMaTheoTen(thamchieu);
                Session["ThamChieu"] = ma;
                //int magdv = int.Parse(Session["MaGDV"].ToString());
                int magdv = 0;
                magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                int pub = gdvdao.LayMaPub(magdv);
                //bool kt = cldao.KiemTraTruyCap(pub, ma);
                bool kt = CheckPub(magdv, ma);
                if (kt == true)
                {
                    Response.Redirect("~/Pages/Layout.aspx");
                }
                else
                    Response.Write("<script> alert('You can't acess on this case!');</script>");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }
        bool CheckPub(int GDV, string idclaim)
        {
            int PUBGDV = gdvdao.LayMaPub(GDV);
            int PUBCLAIM = cl.LayMaPUB(idclaim);
            bool kt = false;
            if (PUBGDV == 1)
                kt = true;
            else
                if (PUBGDV == 2 && PUBGDV == PUBCLAIM)
                    kt = true;
                else
                    if (PUBGDV == 3 && PUBGDV == PUBCLAIM)
                        kt = true;
            return kt;
        }
    }
}