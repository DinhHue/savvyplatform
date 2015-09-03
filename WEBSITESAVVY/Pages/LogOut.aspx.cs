using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class LogOut : System.Web.UI.Page
    {
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string tenGDV = gdv.LayTenTheoMa(maGDV);
                string noidung=tenGDV+ " signed out.";
                SaveLogTracking(maGDV,noidung);
                Session.Abandon();
                Session.Clear();
                HttpCookie ck = new HttpCookie("MaGDV","");
                ck.Expires = DateTime.Now;
                Response.Cookies.Add(ck);
                
                Response.Redirect("~/Pages/Login.aspx");
            }
            
           
        }
        void SaveLogTracking(int magdv, string noidung)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = magdv;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = "";
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
    }
}