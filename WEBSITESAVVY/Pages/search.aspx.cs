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
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTiemKiem_Click(object sender, EventArgs e)
        {

        }
    }
}