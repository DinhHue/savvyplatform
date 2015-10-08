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
    public partial class HomeManager : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        int magdv = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");                
                else
                {
                    magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                    //bool ktcv = gdvdao.KiemTraChucVuQuanLy(magdv);
                    DataTable dt = new DataTable();
                    dt = gdvdao.CheckManager(magdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        int cv = int.Parse(dr[0].ToString());
                        if (cv != 2)
                        {
                            Response.Write("<script>alert('You can't access!');</script>");
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó
                             //Response.Redirect("~/Pages/Notification.aspx");
                        }
                    }
                    //if (ktcv == false)
                    //{
                    //    bool ktgd = gdvdao.KiemTraGiamDoc(magdv);
                    //    if (ktgd == false)
                    //    {
                    //        Response.Write("<script>alert('You can't access!');</script>");
                    //        //Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó
                    //        Response.Redirect("~/Pages/Notification.aspx");
                    //    }
                        //Response.Redirect("~/Pages/Home.aspx");
                    
                }

            }
        }
    }
}