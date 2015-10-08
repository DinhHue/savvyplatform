using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class TienDoXuLy : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        TienDoXyLyDTO tddto ;
        TienDoXuLyDAO tddao = new TienDoXuLyDAO();
        string mathamchieu;
        TienDoXyLyDTO tdcn = new TienDoXyLyDTO();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
                Response.Redirect("~/Pages/Login.aspx");
            if (Session["ThamChieu"] == null)
            {
                Response.Redirect("~/Pages/Home.aspx");
            }
            else
            {
                string thamchieu = Session["ThamChieu"].ToString();               
                lblThamChieu.Text = thamchieu;
                mathamchieu = cldao.LayMa(thamchieu);
                loadDS(mathamchieu);
                
            }
        }
        void loadDS(string mtc)
        {
            DataTable dt = new DataTable();
            dt = tddao.DanhSachTienDoXuLy(mathamchieu);
            if (dt.Rows.Count > 0)
            {
                gvDanhSachTienDo.DataSource = dt;
                gvDanhSachTienDo.DataBind();
              
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            tddto = new TienDoXyLyDTO();
           
            tddto.MaClaim = mathamchieu;
            //int stt = tddao.SoLuongTienDoXuLy(mathamchieu) + 1;
            //tddto.Stt = stt;
            tddto.TinhTrang = txtTinhTrang.Text.Trim();
            tddto.HoSoYeuCau = txtHoSoYeuCau.Text.Trim();
            tddto.PhuongAnDeXuat = txtPhuongAnDeXuat.Text.Trim();
            bool kq = tddao.ThemTienDoXyLy(tddto);
            if (kq == true)            
            {
                loadDS(mathamchieu);
                ClearInputs(Page.Controls);
            }
            else
                Response.Write("<script> alert ('Lỗi!');</script>");
        }


        protected void gvDanhSachTienDo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDanhSachTienDo.PageIndex = e.NewPageIndex;
            loadDS(mathamchieu);
        }

        protected void gvDanhSachTienDo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int matiendo = int.Parse(gvDanhSachTienDo.DataKeys[e.RowIndex].Value.ToString());
            bool kq = tddao.XoaTienDoXuLy(mathamchieu, matiendo);
            if (kq == true)
                loadDS(mathamchieu);

        }

        protected void gvDanhSachTienDo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhSachTienDo.EditIndex = -1;
            loadDS(mathamchieu);
        }
        int matiendo = 0;
        private void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        protected void gvDanhSachTienDo_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDanhSachTienDo.SelectedRow;
            
            if (row != null)
            {
                string temp = row.Cells[0].Text;
                matiendo = int.Parse(temp.ToString());
            }
            tddto = new TienDoXyLyDTO();
            tddto = tddao.Lay1TienDoXuLy(mathamchieu, matiendo);
            //tdcn = new TienDoXyLyDTO();
            //tdcn.MaClaim = mathamchieu;
            //tdcn.MaTienDo = matiendo;
            lblSoThuTu.Text = matiendo.ToString();
            txtHoSoYeuCau.Text = tddto.HoSoYeuCau;
            txtTinhTrang.Text = tddto.TinhTrang;
            txtPhuongAnDeXuat.Text = tddto.PhuongAnDeXuat;
        }

        protected void btnCapNhatLai_Click(object sender, EventArgs e)
        {
            tdcn.MaClaim = mathamchieu;
            tdcn.MaTienDo = int.Parse(lblSoThuTu.Text);
            tdcn.HoSoYeuCau = txtHoSoYeuCau.Text;
            tdcn.TinhTrang = txtTinhTrang.Text;
            tdcn.PhuongAnDeXuat = txtPhuongAnDeXuat.Text;
            bool kq = tddao.CapNhatTienDoXuLy(tdcn);
            if (kq == true)
            //Response.Write("<script> alert ('Thành công!');</script>");
            {
                loadDS(mathamchieu);
                ClearInputs(Page.Controls);
            }
            else
                Response.Write("<script> alert ('Lỗi!');</script>");
        }

    }
}