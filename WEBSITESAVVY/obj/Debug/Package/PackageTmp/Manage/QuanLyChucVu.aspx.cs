using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyChucVu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiDanhSach();

            }
        }
        protected void HienThiDanhSach()
        {
            ChucVuDAO cvdao = new ChucVuDAO();
            gvDSChucVu.DataSource = cvdao.DSChucVu();
            gvDSChucVu.DataBind();

        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            ChucVuDAO cvdao = new ChucVuDAO();
            string ten = txtTenChucVu.Text;
            cvdao.ThemChucVu(ten);
            HienThiDanhSach();
            txtTenChucVu.Text = "";
        }

        protected void gvDSChucVu_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ChucVuDAO cvdao = new ChucVuDAO();
            int autoid = int.Parse(gvDSChucVu.DataKeys[e.RowIndex].Value.ToString());
            cvdao.XoaChucVu(autoid);
            HienThiDanhSach();
        }

        protected void gvDSChucVu_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSChucVu.EditIndex = e.NewEditIndex;
            HienThiDanhSach();
        }

        protected void gvDSChucVu_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSChucVu.Rows[e.RowIndex];

            TextBox txt2nd_column = row.Cells[1].Controls[0] as TextBox;


            int a = Int32.Parse(gvDSChucVu.DataKeys[e.RowIndex].Value.ToString());
            string b = txt2nd_column.Text;


            ChucVuDAO cvdao = new ChucVuDAO();
            cvdao.SuaChucVu(a, b);

            e.Cancel = true;
            gvDSChucVu.EditIndex = -1;
            HienThiDanhSach();
        }

        protected void gvDSChucVu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSChucVu.EditIndex = -1;
            HienThiDanhSach();
        }
    }
}