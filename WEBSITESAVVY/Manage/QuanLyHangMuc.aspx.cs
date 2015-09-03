using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyHangMuc : System.Web.UI.Page
    {
        HangMucDAO hm = new HangMucDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    loadHangMuc();
                    int ma = hm.MaMax() + 1;
                    txtMa.Text = ma.ToString();
                }
            }
        }
        void loadHangMuc()
        {
            gvDSHangMuc.DataSource = hm.DanhSachHangMuc();
            gvDSHangMuc.DataBind();
        }
        protected void gvDSHangMuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSHangMuc.EditIndex = -1;
            loadHangMuc();
        }

        protected void gvDSHangMuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSHangMuc.Rows[e.RowIndex];
            TextBox txtten= row.Cells[1].Controls[0] as TextBox;
            int ma = int.Parse(gvDSHangMuc.DataKeys[e.RowIndex].Value.ToString());
            bool ud = hm.CapNhat(ma, txtten.Text);
            if (ud == true)
            {
                e.Cancel = true;
                gvDSHangMuc.EditIndex = -1;
                loadHangMuc();
            }
            else
                Response.Write("<script>alert('Fail!');</script>");
        }

        protected void gvDSHangMuc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvDSHangMuc.DataKeys[e.RowIndex].Value.ToString());
            bool kq = hm.Xoa(ma);
            if (kq == true)
                loadHangMuc();
        }

        protected void gvDSHangMuc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSHangMuc.EditIndex = e.NewEditIndex;
            loadHangMuc();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(txtMa.Text);
            bool them = hm.ThemMoi(ma, txtTenHangMuc.Text);
            if (them == true)
            {
                txtMa.Text = (hm.MaMax() + 1).ToString();
                txtTenHangMuc.Text = "";
                loadHangMuc();
            }
            else
                Response.Write("<script>alert('Fail!');</script>");
        }

    }
}