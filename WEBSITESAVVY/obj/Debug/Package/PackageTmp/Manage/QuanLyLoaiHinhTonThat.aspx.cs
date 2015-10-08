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
    public partial class QuanLyLoaiHinhTonThat : System.Web.UI.Page
    {
        LoaiHinhTonThatDAO lhdao = new LoaiHinhTonThatDAO();
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
                    loadDS();
                }
            }
        }
        void loadDS()
        {
            grDSLoaiHinhTT.DataSource = lhdao.DSLoaiHinhTT();
            grDSLoaiHinhTT.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = txtLoaiTonThat.Text;
            if (ten != "")
            {
                lhdao.Them(ten);
                loadDS();
            }
            else
                lblThongBao.Text = "Fail";
        }

        protected void grDSLoaiHinhTT_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSLoaiHinhTT.EditIndex = -1;
            loadDS();
        }

        protected void grDSLoaiHinhTT_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(grDSLoaiHinhTT.DataKeys[e.RowIndex].Value.ToString());
            bool kq= lhdao.Xoa(ma);
            if(kq==true)
                loadDS();
        }

        protected void grDSLoaiHinhTT_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDSLoaiHinhTT.Rows[e.RowIndex];
            TextBox txtloai = row.Cells[1].Controls[0] as TextBox;
            int ma = Int32.Parse(grDSLoaiHinhTT.DataKeys[e.RowIndex].Value.ToString());
            string loaihinh = txtloai.Text;
            bool kq = lhdao.CapNhat(ma, loaihinh);
            if (kq == true)
            {
               
                e.Cancel = true;
                grDSLoaiHinhTT.EditIndex = -1;
                loadDS();
            }
        }

        protected void grDSLoaiHinhTT_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSLoaiHinhTT.EditIndex = e.NewEditIndex;
            loadDS();
        }
        
    }
}