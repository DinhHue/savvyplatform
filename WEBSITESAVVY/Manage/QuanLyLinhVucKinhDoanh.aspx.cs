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
    public partial class QuanLyLinhVucKinhDoanh : System.Web.UI.Page
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
            LinhVucKinhDoanhDAO lvdao = new LinhVucKinhDoanhDAO();
            gvDSLinhVuc.DataSource = lvdao.DSLinhVucKinhDoanh();
            gvDSLinhVuc.DataBind();


        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            LinhVucKinhDoanhDAO lvdao = new LinhVucKinhDoanhDAO();
            string ten = txtLinhVuc.Text;
            lvdao.ThemLinhVuc(ten);
            HienThiDanhSach();
            txtLinhVuc.Text = "";
        }

        protected void gvDSLinhVuc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSLinhVuc.EditIndex = -1;
            HienThiDanhSach();
        }

        protected void gvDSLinhVuc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LinhVucKinhDoanhDAO lvdao = new LinhVucKinhDoanhDAO();
            int autoid = int.Parse(gvDSLinhVuc.DataKeys[e.RowIndex].Value.ToString());
            lvdao.XoaLinhVuc(autoid);
            HienThiDanhSach();
        }

        protected void gvDSLinhVuc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSLinhVuc.EditIndex = e.NewEditIndex;
            HienThiDanhSach();
        }

        protected void gvDSLinhVuc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSLinhVuc.Rows[e.RowIndex];

            TextBox txt2nd_column = row.Cells[1].Controls[0] as TextBox;


            int a = Int32.Parse(gvDSLinhVuc.DataKeys[e.RowIndex].Value.ToString());
            string b = txt2nd_column.Text;


            LinhVucKinhDoanhDAO lvdao = new LinhVucKinhDoanhDAO();
            lvdao.SuaLinhVuc(a, b);

            e.Cancel = true;
            gvDSLinhVuc.EditIndex = -1;
            HienThiDanhSach();
        }
    }
}