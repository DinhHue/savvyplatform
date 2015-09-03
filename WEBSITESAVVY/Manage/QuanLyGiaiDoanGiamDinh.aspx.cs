using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyGiaiDoanGiamDinh : System.Web.UI.Page
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
            GiaiDoanDAO gddao = new GiaiDoanDAO();
            gvDSGiaiDoan.DataSource = gddao.DSGiaiDoan();
            gvDSGiaiDoan.DataBind();


        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            GiaiDoanDAO gddao = new GiaiDoanDAO();
            string ten = txtTenGiaiDoan.Text;
            gddao.ThemGiaiDoan(ten);
            HienThiDanhSach();
            txtTenGiaiDoan.Text = "";
        }

        protected void gvDSGiaiDoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSGiaiDoan.EditIndex = -1;
            HienThiDanhSach();
        }

        protected void gvDSGiaiDoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GiaiDoanDAO gddao = new GiaiDoanDAO();
            int autoid = int.Parse(gvDSGiaiDoan.DataKeys[e.RowIndex].Value.ToString());
            gddao.XoaGiaiDoan(autoid);
            HienThiDanhSach();
        }

        protected void gvDSGiaiDoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSGiaiDoan.EditIndex = e.NewEditIndex;
            HienThiDanhSach();
        }

        protected void gvDSGiaiDoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSGiaiDoan.Rows[e.RowIndex];

            TextBox txt2nd_column = row.Cells[1].Controls[0] as TextBox;


            int a = Int32.Parse(gvDSGiaiDoan.DataKeys[e.RowIndex].Value.ToString());
            string b = txt2nd_column.Text;


            GiaiDoanDAO gddao = new GiaiDoanDAO();
            gddao.SuaGiaiDoan(a, b);

            e.Cancel = true;
            gvDSGiaiDoan.EditIndex = -1;
            HienThiDanhSach();
        }
    }
}