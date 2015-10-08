using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class Diary : System.Web.UI.Page
    {
        DiaryDAO drdao = new DiaryDAO();
        DiaryDTO drdto = new DiaryDTO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    loadGDV();
                    lblThongBao.Visible = false;
                    loadDiaryAll();
                    HideLable();
                }
            }
        }
        void HideLable()
        {
            lblNgayTonThat.Visible = false;
            lblNgayYeuCauGiamDinh.Visible = false;
            lblNguoiDuocBaoHiem.Visible = false;
            lblThamChieu.Visible = false;
            Insured.Visible = false;
            DOL.Visible = false;
            Case_reference.Visible = false;
            Assiged.Visible = false;
        }
        void OnLabel()
        {
            lblNgayTonThat.Visible = true;
            lblNgayYeuCauGiamDinh.Visible = true;
            lblNguoiDuocBaoHiem.Visible = true;
            lblThamChieu.Visible = true;
            Insured.Visible = true;
            DOL.Visible = true;
            Case_reference.Visible = true;
            Assiged.Visible = true;
        }
        void loadThongTinClaim(string thamchieu)
        {
            DataTable dt= new DataTable();
            dt = drdao.ThongTinCLaim_Diary(thamchieu);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[0].ToString();
                lblNgayTonThat.Text = dr[1].ToString();
                lblNguoiDuocBaoHiem.Text = dr[2].ToString();
                string ngayYCGD=dr[3].ToString();
                if (ngayYCGD != "")
                    lblNgayYeuCauGiamDinh.Text = ngayYCGD;
                else
                    lblNgayYeuCauGiamDinh.Text = "Chưa cập nhật;";
            }
        }
        void loadGDV()
        {
            DataTable dt = gdv.DanhSachGiamDinhVien();
            drGDV.DataSource = dt;
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataTextField = "TenGDV";
            drGDV.DataBind();
        }
        void loadDiaryTheoThamChieu(string tc)
        {
            DataTable dt = new DataTable();
            dt = drdao.DSDiaryTheoThamChieu(tc);
            if (dt.Rows.Count > 0)
            {
                gvDSDiary.DataSource = dt;
                gvDSDiary.DataBind();
                gvDSDiary.Visible = true;
                lblThongBao.Visible = false;
            }
            else
            { 
                gvDSDiary.Visible = false;
                lblThongBao.Text = "Hiện tại chưa có Dairy nào của "+tc+" này!";
                lblThongBao.Visible = true;
            }
        }
        void loadDiaryAll()
        {
            DataTable dt = new DataTable();
            dt = drdao.DSDiaryDangThucHien();
            if (dt.Rows.Count > 0)
            {
                gvDSDiary.DataSource = dt;
                gvDSDiary.DataBind();
                gvDSDiary.Visible = true;
                lblThongBao.Visible = false;
            }
            else
            {
                gvDSDiary.Visible = false;
                lblThongBao.Text = "Hiện tại chưa có Dairy nào !";
                lblThongBao.Visible = true;
            }
        }
        void loadDiaryTheoGDV(int magdv)
        {
            DataTable dt = new DataTable();
            dt = drdao.DSDiaryTheoGDV(magdv);
            if (dt.Rows.Count > 0)
            {
                gvDSDiary.DataSource = dt;
                gvDSDiary.DataBind();
                gvDSDiary.Visible = true;
                lblThongBao.Visible = false;
            }
            else
            {
                gvDSDiary.Visible = false;
                lblThongBao.Text = "Hiện tại chưa cập nhật Dairy nào !";
                lblThongBao.Visible = true;
            }
        }
        void loadDiaryThamChieuTheoGDV(string thamchieu, int magdv)
        {
            DataTable dt = new DataTable();
            dt = drdao.DSDiaryTheoGDV_ThamChieu(thamchieu,magdv);
            if (dt.Rows.Count > 0)
            {
                gvDSDiary.DataSource = dt;
                gvDSDiary.DataBind();
                gvDSDiary.Visible = true;
                lblThongBao.Visible = false;
            }
            else
            {
                gvDSDiary.Visible = false;
                lblThongBao.Text = "Không có diary !";
                lblThongBao.Visible = true;
            }
        }
        protected void btnXemDiary_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string tc = txtThamChieu.Text;

                int magdv = int.Parse(drGDV.SelectedValue.ToString());
                if (tc != "" && magdv == 0)
                {
                    loadDiaryTheoThamChieu(tc);
                    loadThongTinClaim(tc);
                    OnLabel();
                }
                if (tc == "" && magdv != 0)
                {
                    loadDiaryTheoGDV(magdv);
                    HideLable();
                }
                if (tc != "" && magdv != 0)
                {
                    loadDiaryThamChieuTheoGDV(tc, magdv);
                    loadThongTinClaim(tc);
                    OnLabel();
                }
            }
        }

        protected void gvDSDiary_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDSDiary.PageIndex = e.NewPageIndex;
            loadDiaryAll();
        }

        protected void gvDSDiary_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSDiary.EditIndex = e.NewEditIndex;
            loadDiaryAll();
            //int key = int.Parse(((GridView)sender).Rows[0].Cells[0].Text);
            //string diary = ((GridView)sender).Rows[0].Cells[0].Text;
        }

        protected void gvDSDiary_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSDiary.EditIndex = -1;
            loadDiaryAll();
        }

        protected void gvDSDiary_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSDiary.Rows[e.RowIndex];
            //drdto = new DiaryDTO();
            int madiary = Int32.Parse(gvDSDiary.DataKeys[e.RowIndex].Value.ToString());
            //drdto.MaDiary = madiary;
            //TextBox thamchieu = row.Cells[1].Controls[0] as TextBox;
            //drdto.MaClaim = thamchieu.Text;
            //TextBox ngay = row.Cells[2].Controls[0] as TextBox;
            //drdto.Ngay = DateTime.Parse(ngay.Text);
            //TextBox diengiai = row.Cells[3].Controls[0] as TextBox;
            //drdto.DienGiai = diengiai.Text;
            //TextBox sogio = row.Cells[4].Controls[0] as TextBox;
            //drdto.SoGio = float.Parse(sogio.Text);
            //TextBox batdau = row.Cells[5].Controls[0] as TextBox;
            //drdto.NgayGioBatDau = DateTime.Parse(batdau.Text);
            //TextBox ketthuc = row.Cells[6].Controls[0] as TextBox;
            //drdto.NgayGioKetThuc = DateTime.Parse(ketthuc.Text);
            
            TextBox ketqua = row.Cells[7].Controls[0] as TextBox;
            string result=ketqua.Text;
            if (result == null)            
               result = "Will be update late!";           
            bool cn = drdao.updateResult(madiary,result);
            if (cn == true)
            {
                e.Cancel = true;
                gvDSDiary.EditIndex = -1;
                loadDiaryAll();
            }
        }

        

    }
}