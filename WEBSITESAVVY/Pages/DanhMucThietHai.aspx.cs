using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
using System.Data;
using System.IO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.Pages
{
    public partial class DanhMucThietHai : System.Web.UI.Page
    {
        DanhMucThietHaiDAO dmdao = new DanhMucThietHaiDAO();
        DanhMucThietHaiDTO dmdto ;
        string thamchieu = null;
        ClaimDAO cl = new ClaimDAO();
        string mathamchieu=null;
        HangMucDAO hm = new HangMucDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck != null)
            {
                if (Session["ThamChieu"] == null)
                {
                    Response.Redirect("~/Pages/Home.aspx");
                }
                if (Session["ThamChieu"] != null)
                {
                    thamchieu = Session["ThamChieu"].ToString();
                    mathamchieu = thamchieu;
                }
                
            }
            loadHangMuc();
            if (!this.IsPostBack)
            {
                //thamchieu = "1203";
                lbllblGridview.Text = "";
                loadDanhSach(mathamchieu);
                lblThongBaoNhomHangMuc.Text = "";
                lblThongBao.Text = "";
                lblThamChieu.Text = mathamchieu;
            }
        }
        void loadHangMuc()
        {
            drHangMucTaiSan.DataSource = hm.DanhSachHangMuc();
            drHangMucTaiSan.DataTextField = "TenHangMuc";
            drHangMucTaiSan.DataValueField = "ID_HangMuc";
            drHangMucTaiSan.DataBind();
        }
        void loadDanhSach(string mtc)
        {
            DataTable dt = dmdao.DanhSachDanhMucThietHaiTheoClaim(mtc);
            if (dt.Rows.Count > 0)
            {
                gvDanhSachHangMucThietHai.DataSource = dt;
                gvDanhSachHangMucThietHai.DataBind();
            }
            else
                lbllblGridview.Text = "Property's Item is Empty!";
        }
        protected void gvDanhSachHangMucThietHai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvDanhSachHangMucThietHai_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma=int.Parse(gvDanhSachHangMucThietHai.DataKeys[e.RowIndex].Value.ToString());
            bool kq = dmdao.XoaDanhMucThietHai(ma);
            if (kq == true)
                loadDanhSach(mathamchieu);
        }

        protected void gvDanhSachHangMucThietHai_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDanhSachHangMucThietHai.PageIndex = e.NewPageIndex;
            loadDanhSach(mathamchieu);
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            dmdto = new DanhMucThietHaiDTO();
            dmdto.MaClaim = mathamchieu;
            int mahangmuc = int.Parse(drHangMucTaiSan.SelectedItem.Value.ToString());
            if (mahangmuc != 0)
            {
                dmdto.MaHangMuc = mahangmuc;

                string trangthai = txtTrangThai.Text;
                if (trangthai == "")
                    trangthai = "";

                if (ckTinhTrang.Checked == true)
                {
                    dmdto.TinhTrang = "Yes";
                    dmdto.ThietHaiHoanToan = trangthai;
                    dmdto.TrangThai = "";
                }
                else
                {
                    dmdto.TinhTrang = "No";
                    dmdto.ThietHaiHoanToan = "";
                    dmdto.TrangThai = trangthai;
                }
                string ykien = txtYKienGDV.Text;
                if (ykien != "")
                    dmdto.YKienGDV = ykien;
                else
                    dmdto.YKienGDV = "";
                bool kq = dmdao.ThemDanhMucThietHai(dmdto);
                if (kq == true)
                {
                    //Response.Write("<script> alert ('Update succeed!');</script>");
                    loadDanhSach(mathamchieu);
                    txtTrangThai.Text = "";
                    txtYKienGDV.Text = "";
                    ckTinhTrang.Checked = false;
                }

                else
                    Response.Write("<script> alert ('Fail!');</script>");
            }
            else
                Response.Write("<script>alert('Chưa chọn hạng mục tài sản !');</script>");
        }

        protected void gvDanhSachHangMucThietHai_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhSachHangMucThietHai.EditIndex = e.NewEditIndex;
            loadDanhSach(mathamchieu);
        }

        protected void gvDanhSachHangMucThietHai_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhSachHangMucThietHai.EditIndex = -1;
            loadDanhSach(mathamchieu);
        }

        protected void gvDanhSachHangMucThietHai_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dmdto= new DanhMucThietHaiDTO();
            GridViewRow row= gvDanhSachHangMucThietHai.Rows[e.RowIndex];
            //TextBox txtnhomhangmuc=row.Cells[0].Controls[0] as TextBox;
            TextBox trangthai = row.Cells[1].Controls[0] as TextBox;
            TextBox tinhtrang = row.Cells[2].Controls[0] as TextBox;
           // CheckBox cktinhtrangthiethai = row.Cells[2].Controls[0] as CheckBox;
            TextBox ykien = row.Cells[3].Controls[0] as TextBox;
            int mahangmuc= int.Parse(gvDanhSachHangMucThietHai.DataKeys[e.RowIndex].Value.ToString());
            dmdto.Ma=mahangmuc;
            //string mathamchieu=cl.LayMaTheoTen(thamchieu);
            dmdto.MaClaim=mathamchieu;            
            //dmdto.TenHangMuc= txtnhomhangmuc.Text;
            dmdto.TrangThai=trangthai.Text;
            //if (ckTinhTrang.Checked == true)
            //    dmdto.TinhTrang = "Yes";
            //else
            //    dmdto.TinhTrang = "No";
            dmdto.TinhTrang = tinhtrang.Text; ;
            dmdto.YKienGDV = ykien.Text;
            bool kq= dmdao.CapNhatDanhMucThietHai(dmdto);
            if( kq==true)
            {
                e.Cancel=true;
                gvDanhSachHangMucThietHai.EditIndex=-1;
                loadDanhSach(mathamchieu);
            }
            else
                Response.Write("<script>alert('Fail!');</script>");
        }

        protected void btnHoanTat_Click(object sender, EventArgs e)
        {
            string mcl = null;
            if (Session["ThamChieu"] != null)
            {
                mcl = Session["ThamChieu"].ToString();
                mathamchieu = thamchieu;
            }
            else
            {
                mcl = Request.QueryString["IDClaim"];
            }
            //string mcl = Request.QueryString["IDClaim"];
            Response.Redirect("~/Pages/SiteSurveyRecordView.aspx?IDClaim=" + mcl);
            ClaimDAO cldao = new ClaimDAO();
            // quay tro lại trang form
            //string ma = cldao.LayMaTheoTen(thamchieu);
            //Response.Redirect("~Pages/InformationForm.aspx?Reference=" + mcl);
        }
    }
}