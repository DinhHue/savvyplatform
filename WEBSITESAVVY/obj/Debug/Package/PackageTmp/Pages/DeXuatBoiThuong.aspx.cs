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
    public partial class DeXuatBoiThuong : System.Web.UI.Page
    {
        DeXuatBoiThuongDAO dxdao = new DeXuatBoiThuongDAO();
        DeXuatBoiThuongDTO dxdto;
        ClaimDAO cldao = new ClaimDAO();
       
        decimal tongkhieunai = 0;
        decimal tongdexuat = 0;
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["GDV"] == null)
            {
                Response.Redirect("~/Pages/Login.aspx");
            }
            if (Session["ThamChieu"] == null)
            {
                Response.Redirect("~/Pages/Home.aspx");
            }
            else
            {
                string thamchieu = Session["ThamChieu"].ToString();                
               // mathamchieu = cldao.LayMaTheoTen(thamchieu);
                if (!this.IsPostBack)
                {
                    loadDSDeXuat(thamchieu);
                    lblThamChieu.Text = thamchieu;
                }
            }

            
        }
        void loadDSDeXuat(string idclaim)
        {
            DataTable dt = new DataTable();
            dt = dxdao.DanhSachDeXuat(idclaim);
            if (dt.Rows.Count > 0)
            {
                gvDanhSachTienDo.DataSource = dt;
                gvDanhSachTienDo.DataBind();
            }
        }
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
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            
            dxdto = new DeXuatBoiThuongDTO();
            //string thamchieu = Session["ThamChieu"].ToString();
            //mathamchieu = cldao.LayMaTheoTen(thamchieu);
            string thamchieu= lblThamChieu.Text;
            dxdto.MaClain =thamchieu;
            //int stt = dxdao.SoThuTu(mathamchieu) + 1;
            //dxdto.Stt = stt;
            dxdto.DienGiai = txtDienGiai.Text ;
            dxdto.GiaTriKhieuNai = float.Parse(txtGiaTriKhieuNai.Text);
            dxdto.DeXuatTinhToan = float.Parse(txtDeXuatTinhToan.Text);
            bool kq = dxdao.ThemDeXuatBoiThuong(dxdto);
            if (kq == true)
            {
                ClearInputs(Page.Controls);
                loadDSDeXuat(thamchieu);
            }
            else
                Response.Write("<script> alert('Fail!');</script>");
        }

        protected void gvDanhSachTienDo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDanhSachTienDo.PageIndex = e.NewPageIndex;
            string mathamchieu = lblThamChieu.Text;
            loadDSDeXuat(mathamchieu);
        }
        //float Tong=0;
        //void TongGiaTri(string giatri)
        //{
        //    Tong += float.Parse(giatri);
                
        //}
        protected void gvDanhSachTienDo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mathamchieu = lblThamChieu.Text;
            int madexuat= int.Parse(gvDanhSachTienDo.DataKeys[e.RowIndex].Value.ToString());
            bool kq = dxdao.XoaDeXuatTinhToan(mathamchieu, madexuat);
            if (kq == true)
                loadDSDeXuat(mathamchieu);
        }
       
       
        protected void gvDanhSachTienDo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongkhieunai += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                tongdexuat += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Tổng/Totals";
                    //e.Row.Cells[2].Text = tongkhieunai.ToString("n4");
                    //e.Row.Cells[3].Text = tongdexuat.ToString("n4");
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", tongkhieunai);
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", tongdexuat);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[3].HorizontalAlign =  HorizontalAlign.Right;
                    e.Row.Font.Bold = true;
                }
        }

        protected void gvDanhSachTienDo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string mathamchieu = lblThamChieu.Text;
            gvDanhSachTienDo.EditIndex = e.NewEditIndex;
            loadDSDeXuat(mathamchieu);
        }

        protected void gvDanhSachTienDo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            string mathamchieu = lblThamChieu.Text;
            gvDanhSachTienDo.EditIndex = -1;
            loadDSDeXuat(mathamchieu);
        }

        protected void gvDanhSachTienDo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dxdto = new DeXuatBoiThuongDTO();
            string mathamchieu = lblThamChieu.Text;
            GridViewRow row = gvDanhSachTienDo.Rows[e.RowIndex];
            TextBox textdiengia = row.Cells[1].Controls[0] as TextBox;
            TextBox textkhieunai = row.Cells[2].Controls[0] as TextBox;
            TextBox textdexuat= row.Cells[3].Controls[0] as TextBox;
            int iddexuat= int.Parse(gvDanhSachTienDo.DataKeys[e.RowIndex].Value.ToString());
            dxdto.MaClain = mathamchieu;
            dxdto.IdDeXuatBoiThuong = iddexuat;
            dxdto.DienGiai = textdiengia.Text;
            dxdto.GiaTriKhieuNai = float.Parse(textkhieunai.Text);
            dxdto.DeXuatTinhToan = float.Parse(textdexuat.Text);
            bool kq = dxdao.CapNhatDeXuatTinhToan(dxdto);
            if (kq == true)
            {
                e.Cancel = true;
                gvDanhSachTienDo.EditIndex = -1;
                loadDSDeXuat(mathamchieu);
            }
            else
                Response.Write("<script>alert('Fail!');</script>");
        }
     
    }
}