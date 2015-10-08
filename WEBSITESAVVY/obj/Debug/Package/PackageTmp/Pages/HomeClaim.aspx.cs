using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Pages
{
    public partial class HomeClaim : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
            }
        }

        protected void btnNhap_Click(object sender, EventArgs e)
        {
            string mathamchieu = txtThamChieu.Text;
            bool kq = cldao.KiemTraThamChieu(mathamchieu);
            if (kq == true)
            {
                Session["ThamChieu"] = mathamchieu;
                Response.Redirect("~/Pages/InformationForm.aspx?Reference=" + mathamchieu);
            }
            else
                Response.Write("<script>alert('Nhập sai tham chiếu!');</script>");
                    
        }
    }
}