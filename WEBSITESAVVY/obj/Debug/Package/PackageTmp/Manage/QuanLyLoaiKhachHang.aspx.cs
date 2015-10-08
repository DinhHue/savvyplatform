using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Collections;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyLoaiKhachHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    HienThiDanhSach();

            }
        }
        protected void HienThiDanhSach()
        {
            LoaiKhachHangDAO lkdao = new LoaiKhachHangDAO();
            gvDSLoaiKhach.DataSource = lkdao.DSLoaiKH();
            gvDSLoaiKhach.DataBind();


        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            LoaiKhachHangDAO lkdao = new LoaiKhachHangDAO();
            string ten = txtLoaiKhach.Text;
            lkdao.ThemLoaiKhach(ten);
            HienThiDanhSach();
            txtLoaiKhach.Text = "";
        }

        protected void gvDSLoaiKhach_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSLoaiKhach.EditIndex = -1;
            HienThiDanhSach();
        }

        protected void gvDSLoaiKhach_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LoaiKhachHangDAO lkdao = new LoaiKhachHangDAO();
            int autoid = int.Parse(gvDSLoaiKhach.DataKeys[e.RowIndex].Value.ToString());
            lkdao.XoaLoaiKhach(autoid);
            HienThiDanhSach();
        }

        protected void gvDSLoaiKhach_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSLoaiKhach.EditIndex = e.NewEditIndex;
            HienThiDanhSach();
        }

        protected void gvDSLoaiKhach_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSLoaiKhach.Rows[e.RowIndex];

            TextBox txt2nd_column = row.Cells[1].Controls[0] as TextBox;


            int a = Int32.Parse(gvDSLoaiKhach.DataKeys[e.RowIndex].Value.ToString());
            string b = txt2nd_column.Text;


            LoaiKhachHangDAO lkdao = new LoaiKhachHangDAO();
            lkdao.SuaLoaiKhach(a, b);

            e.Cancel = true;
            gvDSLoaiKhach.EditIndex = -1;
            HienThiDanhSach();
        }
    }
}