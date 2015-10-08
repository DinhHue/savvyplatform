using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyDiary : System.Web.UI.Page
    {
        DiaryDAO drdao = new DiaryDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        ClaimDAO cl= new ClaimDAO();
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
                    loadDiaryAll();
                }
            }
        }
        void loadGDV()
        {
            DataTable dt = gdv.DanhSachGiamDinhVien();
            drGDV.DataSource = dt;
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataTextField = "TenGDV";
            drGDV.DataBind();
            
            drGDV0.DataSource = dt;
            drGDV0.DataValueField = "ID_GDV";
            drGDV0.DataTextField = "TenGDV";
            drGDV0.DataBind();
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
               
            }
            else
            {
                gvDSDiary.Visible = false;
               
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
            }
            else
            {
                gvDSDiary.Visible = false;
                
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
                
            }
            else
            {
                gvDSDiary.Visible = false;
                
            }
        }
        void loadDiaryThamChieuTheoGDV(string thamchieu, int magdv)
        {
            DataTable dt = new DataTable();
            dt = drdao.DSDiaryTheoGDV_ThamChieu(thamchieu, magdv);
            if (dt.Rows.Count > 0)
            {
                gvDSDiary.DataSource = dt;
                gvDSDiary.DataBind();
                gvDSDiary.Visible = true;               
            }
            else
            {
                gvDSDiary.Visible = false;
               
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            DiaryDTO drdto = new DiaryDTO();
            DiaryDAO drdao = new DiaryDAO();
            string maclaim = txtThamChieu.Text;
            bool kt = cl.KiemTraThamChieu(maclaim);
            //string maGDV = Session["MaGDV"].ToString();
            //string tengdv = Session["GDV"].ToString();
            int maGDV = int.Parse(drGDV0.SelectedValue.ToString());
            if (maGDV != null)
            {
                if (kt == true)
                    drdto.MaClaim = maclaim;
                else
                {
                    lbllThongBao.Text = "Chưa có claim này";
                    lbllThongBao.Visible = true;
                }
                drdto.MaGDV = maGDV;
                drdto.NgayThuc = DateTime.Now;
                drdto.Ngay =DateTime.Parse(txtNgay.Text);
                drdto.DienGiai = txtDienGiai.Text.Trim();
                drdto.SoGio = float.Parse(txtSoGio.Text);
                drdto.NgayGioBatDau = DateTime.Parse(txtNgayBatDau.Text);
                drdto.NgayGioKetThuc = DateTime.Parse(txtNgayKetThuc.Text);
                drdto.KetQua = txtKetQuaGhiNhan.Text.Trim();
                bool them = drdao.DiaryMoi(drdto);
                if (them == true)
                {
                     Response.Write("<script>alert('Đã thêm!');</script>");
                }
                else
                {
                    lblThongBaoThem.Visible = true;
                    lblThongBaoThem.Text = "Have something wrong here!";
                }
            }
            else
                Response.Redirect("~/Pages/Longin.aspx");
        }

        protected void btnXemDiary_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string tc = txtThamChieu0.Text;

                int magdv = int.Parse(drGDV.SelectedValue.ToString());
                if (tc != "" && magdv == 0)
                {
                    loadDiaryTheoThamChieu(tc);
                   
                }
                if (tc == "" && magdv != 0)
                {
                    loadDiaryTheoGDV(magdv);
                    
                }
                if (tc != "" && magdv != 0)
                {
                    loadDiaryThamChieuTheoGDV(tc, magdv);
                   
                }
            }
        }

        protected void gvDSDiary_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDSDiary.PageIndex = e.NewPageIndex;           
            loadDiaryAll();
        }

        protected void gvDSDiary_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvDSDiary.DataKeys[e.RowIndex].Value.ToString());
            drdao.XoaDiary(ma);
            loadDiaryAll();
        }

        protected void gvDSDiary_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSDiary.EditIndex = e.NewEditIndex;
            loadDiaryAll();
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
            TextBox maclaim = row.Cells[1].Controls[0] as TextBox;
            TextBox diengiai = row.Cells[3].Controls[0] as TextBox;
            TextBox ts = row.Cells[4].Controls[0] as TextBox;
            TextBox date = row.Cells[5].Controls[0] as TextBox;
            TextBox start = row.Cells[6].Controls[0] as TextBox;
            TextBox end = row.Cells[7].Controls[0] as TextBox;
            TextBox re = row.Cells[8].Controls[0] as TextBox;
            int ma = int.Parse(gvDSDiary.DataKeys[e.RowIndex].Value.ToString());
            DiaryDTO dr = new DiaryDTO();
            dr.MaDiary = ma;
            dr.MaClaim = maclaim.Text;
            dr.DienGiai = diengiai.Text;
            dr.SoGio = int.Parse(ts.Text);
            dr.Ngay = DateTime.Parse(date.Text);
            dr.NgayGioBatDau = DateTime.Parse(start.Text);
            dr.NgayGioKetThuc = DateTime.Parse(end.Text);
            dr.KetQua = re.Text;
            bool up = drdao.CapNhatDiary(dr);
            if (up == true)
            {
                e.Cancel = true;
                gvDSDiary.EditIndex = -1;
                loadDiaryAll();
            }

        }

    }
}