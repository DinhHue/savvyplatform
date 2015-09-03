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
    public partial class QuanLyKhachHang : System.Web.UI.Page
    {
        KhachHangDAO khdao = new KhachHangDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    loadDS();
            }
        }
        void loadDS()
        {
            grDSKhachHang.DataSource = khdao.DSNDBH();
            grDSKhachHang.DataBind();
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {

        }

        protected void grDSKhachHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSKhachHang.PageIndex = e.NewPageIndex;
            loadDS();
        }

        protected void grDSKhachHang_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void grDSKhachHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(grDSKhachHang.DataKeys[e.RowIndex].Value.ToString());
            bool kq = khdao.Xoa(ma);
            if (kq == true)
            {
                loadDS();

            }
        }


    }
}