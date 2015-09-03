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
    public partial class KhoiPhucMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKhoiPhucMatKhau_Click(object sender, EventArgs e)
        {
            GiamDinhVienDAO gd = new GiamDinhVienDAO();
            SendMailDAO sm = new SendMailDAO();
           int magdv = gd.KiemTraEmail(txtEmail.Text);
            if (magdv!=0)
            {
                string link = "<a href=http://p.savvyadjusters.com/Pages/DoiMatKhau.aspx?ID=" + magdv + ">" + "Click Here</a>";
                string send= sm.khoiPhucMatKhau("PlatForm_ChangePassWord",txtEmail.Text, link);
                if( send=="oke")
                    Response.Write("<script>alert('Vui lòng kiểm tra email!');</script>");
            }
        }
    }
}