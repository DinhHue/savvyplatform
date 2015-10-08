using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyTaskAssiged : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    loadGDV();
            }
        }
        void loadGDV()
        {
            GiamDinhVienDAO gdv = new GiamDinhVienDAO();
            drDSGDV.DataSource = gdv.DanhSachGiamDinhVien();
            drDSGDV.DataTextField = "TenGDV";
            drDSGDV.DataValueField = "ID_GDV";
            drDSGDV.DataBind();
        }
        protected void btnXemTask_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(drDSGDV.SelectedItem.Value.ToString());
            DaiLyDAO dl= new DaiLyDAO();
            if (ma != 0)
            {
                gvDSDaGiao.DataSource = dl.TaskManage(ma);
                gvDSDaGiao.DataBind();
            }
        }
    }
}