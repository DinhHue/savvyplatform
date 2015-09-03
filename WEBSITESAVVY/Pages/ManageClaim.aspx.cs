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
    public partial class ManageClaim : System.Web.UI.Page
    {
        DataTable dt;
        ClaimDAO cl = new ClaimDAO();
        ChiTietThietHaiDAO ct = new ChiTietThietHaiDAO();
        string mathamchieu;
        decimal tongkhieunai = 0;
        decimal tongdexuat = 0;
        int malv1 = 0;
        int malv2 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    mathamchieu = Request.QueryString["ThamChieu"];
                    string thamchieu = Request.QueryString["Claim"];
                    if (thamchieu != null)
                    {
                        loadClaim(thamchieu);
                        string maclaim = cl.LayMaTheoTen(thamchieu);
                        LoadTienDoXuLy(maclaim);
                        loadDeXuatBoiThuong(maclaim);
                        KiemMaLinhVuc(maclaim);
                    }
                    else
                    {
                        thamchieu = cl.TenClaim(mathamchieu);
                        loadClaim(thamchieu);
                        LoadTienDoXuLy(mathamchieu);
                        loadDeXuatBoiThuong(mathamchieu);
                        KiemMaLinhVuc(mathamchieu);
                    }
                }
                
            }
            
        }
        void KiemMaLinhVuc(string macl)
        {
            DataTable dt = new DataTable();
            dt = ct.LayMaLinhVucTonThat(macl);
            int temp = 0;
            int temp1 = 0;
            if (dt.Rows.Count == 1)
            {
                DataRow dr = dt.Rows[0];
                temp = int.Parse(dr[0].ToString());
                if (temp == 2 || temp == 3)
                {
                    loadChiTietThietHai2(macl, temp);
                }
                else
                    loadChiTietThietHai1(macl, temp);
            }
            else
                if (dt.Rows.Count == 2)
                {
                    DataRow dr1 = dt.Rows[0];
                    DataRow dr2 = dt.Rows[1];
                    temp = int.Parse(dr1[0].ToString());
                    if (temp == 2 || temp == 3)
                    {
                        malv2 = temp;
                        loadChiTietThietHai2(macl, malv2);
                    }
                    else
                    {
                        malv1 = temp;
                        loadChiTietThietHai1(macl, malv1);
                    }
                    temp1 = int.Parse(dr2[0].ToString());
                    if (temp1 == 2 || temp1 == 3)
                    {
                        malv2 = temp1;
                        loadChiTietThietHai2(macl, malv2);
                    }
                    else
                    {
                        malv1 = temp1;
                        loadChiTietThietHai1(macl, malv1);
                    }

                }
        }
        void LoadTienDoXuLy(string matc)
        {
            TienDoXuLyDAO td = new TienDoXuLyDAO();
            dt = new DataTable();
            dt = td.DanhSachTienDoXuLy(matc);
            gvDSTienDoXuLy.DataSource = dt;
            gvDSTienDoXuLy.DataBind();
        }
        void loadDeXuatBoiThuong(string matc)
        {
            DeXuatBoiThuongDAO dx = new DeXuatBoiThuongDAO();
            dt = new DataTable();
            dt = dx.DanhSachDeXuat(matc);
            gvDeXuatBoiThuong.DataSource = dt;
            gvDeXuatBoiThuong.DataBind();
        }
        void loadClaim(string thamchieu)
        {
            dt = new DataTable();
            dt = cl.TomTat(thamchieu);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[0].ToString();
                lblGDV1.Text = dr[1].ToString();
                lblDonVi.Text = dr[2].ToString();
                lblNDBH.Text = dr[3].ToString();
                lblDiaChi.Text = dr[4].ToString();
                lblNguoiLienHe.Text = dr[5].ToString();
                lblSoHDBH.Text = dr[6].ToString();
                lblHieuLuc.Text = dr[7].ToString();
                lblFax.Text = dr[8].ToString();
                lblSoDienThoai.Text = dr[9].ToString();
                lblEmail.Text = dr[10].ToString();
                lblDiaDiemTT.Text = dr[11].ToString();
                lblLoaiHinhTonThat.Text = dr[12].ToString();
                lblNgayTonThat.Text = dr[13].ToString();
                lblDienBienTonThat.Text = dr[14].ToString();
                lblThongBaoCQChucNang.Text = dr[15].ToString();
                lblNguyenNhanTT.Text = dr[16].ToString();
                lblPhamViBH.Text = dr[17].ToString();
                lblDienBienKhieuNai.Text = dr[18].ToString();
                lblMoTaPhamViThietHai.Text = dr[19].ToString();
                lblGiaTriDeXuat.Text = dr[20].ToString();
                lblGiaTriThuHoi.Text = dr[21].ToString();
                lblKetLuan.Text = dr[22].ToString();
            }
        }
        void loadChiTietThietHai1(string macl, int malinhvuc)
        {
            DataTable dt = new DataTable();
            dt = ct.DanhSachChiTietThietHai1(macl, malinhvuc);
            gvDanhSachChiTietThietHai1.DataSource = dt;
            gvDanhSachChiTietThietHai1.DataBind();
        }
        void loadChiTietThietHai2(string macl, int malinhvuc)
        {
            DataTable dt = new DataTable();
            dt = ct.DanhSachChiTietThietHai2(macl, malinhvuc);
            gvDanhSachChiTietThietHai2.DataSource = dt;
            gvDanhSachChiTietThietHai2.DataBind();
        }
        protected void gvDeXuatBoiThuong_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDeXuatBoiThuong.PageIndex = e.NewPageIndex;
            loadDeXuatBoiThuong(mathamchieu);
        }

        protected void gvDeXuatBoiThuong_RowDataBound(object sender, GridViewRowEventArgs e)
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
                    e.Row.Cells[2].Text = tongkhieunai.ToString("c");
                    e.Row.Cells[3].Text = tongdexuat.ToString("c");
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Font.Bold = true;
                }
        }

        protected void gvDanhSachChiTietThietHai1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDanhSachChiTietThietHai1.PageIndex = e.NewPageIndex;
            loadChiTietThietHai1(mathamchieu, malv1);
        }

        protected void gvDanhSachChiTietThietHai2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDanhSachChiTietThietHai2.PageIndex = e.NewPageIndex;
            loadChiTietThietHai2(mathamchieu, malv2);
        }
    }
}