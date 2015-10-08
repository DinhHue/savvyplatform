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
    public partial class QuanLyMenhGia : System.Web.UI.Page
    {
        MenhGiaDAO mgdao = new MenhGiaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    lblThongBao.Text = "";
                    HienThiGridview();
                }
            }
        }
        void HienThiGridview()
        {
            DataTable dt = new DataTable();
            dt = mgdao.DanhSach();
            grDanhSachMenhGia.DataSource = dt;
            grDanhSachMenhGia.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMenhGia.Text != "")
                {
                    string mg = txtMenhGia.Text.Trim();
                    bool kq = mgdao.KiemTra(mg);
                    if (kq == false)
                    {
                        bool them = mgdao.Them(mg);
                        if (them == true)
                        {
                            lblThongBao.Text = "Đã thêm!";
                            HienThiGridview();
                        }
                        else
                            lblThongBao.Text = "Fail!";
                    }
                    else
                        lblThongBao.Text = "Đã có!";
                }
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }

        protected void grDanhSachMenhGia_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDanhSachMenhGia.EditIndex = -1;
            HienThiGridview();
        }

        protected void grDanhSachMenhGia_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDanhSachMenhGia.EditIndex = e.NewEditIndex;
            HienThiGridview();
        }

        protected void grDanhSachMenhGia_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDanhSachMenhGia.Rows[e.RowIndex];
            int id = int.Parse(grDanhSachMenhGia.DataKeys[e.RowIndex].Value.ToString());
            TextBox mg = row.Cells[1].Controls[0] as TextBox;
            string ten = mg.Text;
            bool up = mgdao.CapNhat(id, ten);
            if (up == true)
            {
                e.Cancel = true;
                grDanhSachMenhGia.EditIndex = -1;
                HienThiGridview();
            }
        }
    }
}