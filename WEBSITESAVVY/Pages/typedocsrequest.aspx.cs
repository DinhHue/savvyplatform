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
    public partial class typedocsrequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    LoadDS();
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        LoaiDRDAO ldrdao = new LoaiDRDAO();
        protected void LoadDS()
        {
            gvLoaiDR.DataSource = ldrdao.DanhSachLoai();
            gvLoaiDR.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string tenloai = txtTenLoai.Text;
            bool kq = false;
            if (tenloai != "")
            {
                kq = ldrdao.Insert(tenloai);
                LoadDS();
            }
            else
                Response.Write("<script>alert('Enter type name, please!');</script>");
        }
    }
}