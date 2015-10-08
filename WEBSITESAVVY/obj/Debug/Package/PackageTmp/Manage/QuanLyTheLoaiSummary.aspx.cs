using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Collections;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyTheLoaiSummary : System.Web.UI.Page
    {
        TheLoaiSumDAO tldao = new TheLoaiSumDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                try
                {
                    lblThongBao.Text = "";
                    loadGR();
                }
                catch (Exception ex)
                {
                    lblThongBao.Text = ex.Message;
                }
            }
        }
        void loadGR()
        {
            grDSTheLoai.DataSource = tldao.DanhSach();
            grDSTheLoai.DataBind();
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenTheLoai.Text != "")
                {
                    bool them = tldao.Them(txtTenTheLoai.Text.Trim());
                    if (them == true)
                        loadGR();
                    else
                        lblThongBao.Text = "Fail!";
                }
                else
                    lblThongBao.Text = "Vui lòng nhập tên thể loại!";
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }

        protected void grDSTheLoai_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDSTheLoai.Rows[e.RowIndex];
            TextBox text = row.Cells[1].Controls[0] as TextBox;
            int ma = Int32.Parse(grDSTheLoai.DataKeys[e.RowIndex].Value.ToString());
            string tenmoi = text.Text;
            TheLoaiSumDAO tldao = new TheLoaiSumDAO();
            bool kq= tldao.CapNhat(ma, tenmoi);
            if (kq == true)
            {
                e.Cancel = true;
                grDSTheLoai.EditIndex = -1;
                loadGR();
            }
            else
                lblThongBao.Text = "Fail!";
        }

        protected void grDSTheLoai_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSTheLoai.EditIndex = e.NewEditIndex;
            loadGR();
        }

        protected void grDSTheLoai_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSTheLoai.EditIndex = -1;
            loadGR();
        }

        protected void grDSTheLoai_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TheLoaiSumDAO tlsumdao = new TheLoaiSumDAO();
            int ma=int.Parse(grDSTheLoai.DataKeys[e.RowIndex].Value.ToString());
            tlsumdao.Xoa(ma);
            loadGR();
        }

       
    }
}