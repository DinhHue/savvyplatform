using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
namespace WEBSITESAVVY.Pages
{
    public partial class Summary : System.Web.UI.Page
    {
        SummaryDAO sdao = new SummaryDAO();
        ClaimDAO clda = new ClaimDAO();
        TheLoaiSumDAO tldao = new TheLoaiSumDAO();
        SummaryDetailDAO sddao = new SummaryDetailDAO();
        SummarydetailDTO sddto = new SummarydetailDTO();
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    lblSoLuong.Visible = false;
                    //load lable
                    load_TextBox("Bulding");
                    lblthongbaohangmuc.Text = "";
                    lblThongbaothem.Text = "";
                    lblThamChieu.Text = "";
                    loadTheLoaiSum();
                    load_TextBox("Building");
                }
            }

        }
        //void loadGrid(string loai, int id)
        //{
        //    DataTable dt = new DataTable();
        //    if (loai == "Building")
        //    {
        //        dt = sddao.DanhSachBuilding(id);
        //        grDSSum.DataSource = dt;
        //        grDSSum.DataBind();
               

        //    }
        //    if (loai == "Stock")
        //    {
        //        dt = sddao.DanhSachStock(id);
        //        grDSSum.DataSource = dt;
        //        grDSSum.DataBind();
               


        //    }
        //    if (loai == "Machinery")
        //    {
        //        dt = sddao.DanhSachMachinery(id);
        //        grDSSum.DataSource = dt;
        //        grDSSum.DataBind();
                

        //    }
        //    if (loai == "Other")
        //    {
        //        dt = sddao.DanhSachOther(id);
        //        grDSSum.DataSource = dt;
        //        grDSSum.DataBind();
                

        //    }
        //}
        void loadTheLoaiSum()
        {
            drTheLoaiSum.DataSource = tldao.DanhSach();
            drTheLoaiSum.DataValueField = "ID_TheLoaiSum";
            drTheLoaiSum.DataTextField = "TheLoai";
            drTheLoaiSum.DataBind();
            drTheLoaiSum1.DataSource = tldao.DanhSach();
            drTheLoaiSum1.DataValueField = "ID_TheLoaiSum";
            drTheLoaiSum1.DataTextField = "TheLoai";
            drTheLoaiSum1.DataBind();
        }
        void load_TextBox(string loai)
        { 
            
            if (loai == "Building")
            {

                lblNguyenGia.Visible = true;
                txtNguyenGia.Visible = true;
                txtGiaTriConLai.Visible = true;
                lblGiaTriConLai.Visible = true;
                lblChiPhiKhoiPhuc.Text = "Chi phí khôi phục :";
                lblChiPhiKhoiPhuc.Visible = true;                
                txtChiPhiKhoiPhuc.Visible = true;
                lblSoLuong.Visible = false;
                txtSoLuong.Visible = false;

                lblDonGia.Visible = false;
                txtDonGia.Visible = false;
                lblMucBoiThuong.Visible = false;
                txtMucBoiThuong.Visible = false;
                lblPhamVi.Visible = false;
                txtPhamVi.Visible = false;
                lblBaoGia.Visible = false;
                txtBaoGia.Visible = false;
                lblDeXuatHopLy.Visible = false;
                txtDeXuatHopLy.Visible = false;
            }
            if (loai == "Stock")
            {
                lblSoTienBaoHiem.Visible = true;
                txtSoTienBH.Visible = true;
                lblSoLuong.Visible = true;
                txtSoLuong.Visible = true;
                lblDonGia.Visible = true;
                txtDonGia.Visible = true;

                lblNguyenGia.Visible = false;
                txtNguyenGia.Visible = false;
                txtGiaTriConLai.Visible = false;
                lblGiaTriConLai.Visible = false;
                lblChiPhiKhoiPhuc.Visible = false;
                txtChiPhiKhoiPhuc.Visible = false;
                lblSoTienBoiThuong.Visible = false;
                txtSoTienBoiThuong.Visible = false;
                lblMucBoiThuong.Visible = false;
                txtMucBoiThuong.Visible = false;
                lblPhamVi.Visible = false;
                txtPhamVi.Visible = false;
                lblBaoGia.Visible = false;
                txtBaoGia.Visible = false;
                lblDeXuatHopLy.Visible = false;
                txtDeXuatHopLy.Visible = false;
                
            }
            if (loai == "Machinery")
            {


                lblNguyenGia.Visible = true;
                txtNguyenGia.Visible = true;
                txtGiaTriConLai.Visible = true;
                lblGiaTriConLai.Visible = true;                       
                lblChiPhiKhoiPhuc.Text = "Chi phí thay thế: ";
                lblChiPhiKhoiPhuc.Visible = true;
                txtChiPhiKhoiPhuc.Visible = true;
                lblSoLuong.Visible = false;
                txtSoLuong.Visible = false;
                lblDonGia.Visible = false;
                txtDonGia.Visible = false;
                lblMucBoiThuong.Visible = false;
                txtMucBoiThuong.Visible = false;
                lblPhamVi.Visible = false;
                txtPhamVi.Visible = false;
                lblBaoGia.Visible = false;
                txtBaoGia.Visible = false;
                lblDeXuatHopLy.Visible = false;
                txtDeXuatHopLy.Visible = false;
                txtDonGia.Visible = false;
                lblDonGia.Visible = false;   
            }
            if (loai == "Other")
            {
                lblMucBoiThuong.Visible = true;
                txtMucBoiThuong.Visible = true;
                lblPhamVi.Visible = true;
                txtPhamVi.Visible = true;
                lblBaoGia.Visible = true;
                txtBaoGia.Visible = true;
                lblDeXuatHopLy.Visible = true;
                txtDeXuatHopLy.Visible = true;
                txtSoTienBoiThuong.Visible = false;
                lblSoTienBoiThuong.Visible = false;
                lblSoTienBaoHiem.Visible = false;
                txtSoTienBH.Visible = false;
                lblNguyenGia.Visible = false;
                txtNguyenGia.Visible = false;
                lblGiaTriConLai.Visible = false;
                txtGiaTriConLai.Visible = false;
                lblChiPhiKhoiPhuc.Visible = false;
                txtChiPhiKhoiPhuc.Visible = false;
                txtSoLuong.Visible = false;
                lblSoLuong.Visible = false;
                txtDonGia.Visible = false;
                lblDonGia.Visible = false;
            }            
        
        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            try {
                string tc=txtThamChieu.Text.Trim();
                bool kt = clda.KiemTraThamChieu(tc);
                if (kt == true)
                {
                    bool kttcsu = sdao.KiemTraClaim(txtThamChieu.Text);
                    if (kttcsu == false)
                    {
                        string mathamchieu = clda.LayMa(tc);
                        sdao.Them(mathamchieu);
                        
                    }
                    lblThamChieu.Text = tc;
                }
                else
                    lblThamChieu.Text = "Tham chiếu này chưa có ở Claim!";
                
            }
            catch(Exception ex)
            { lblThamChieu.Text = ex.Message; }
        }

        protected void btnThemSum_Click(object sender, EventArgs e)
        {
            try
            {
                 id = sdao.MaSum(lblThamChieu.Text);
                 string loai=drTheLoaiSum.SelectedItem.ToString();
                 sddto.MaSummary = id;
                if (loai == "Building" )
                {
                   
                    sddto.MaTheLoai = 2;
                    if (txtHangMuc.Text != "")
                        sddto.TenHangMuc = txtHangMuc.Text;
                    else
                        lblthongbaohangmuc.Text = "Chưa nhập hạng mục!";
                    if (txtGTKhieuNai.Text != "")
                        sddto.GiaTriKhieuNai = float.Parse(txtGTKhieuNai.Text);
                    else
                        sddto.GiaTriKhieuNai = 0;
                    //if (txtSoTienBH.Text != "")
                    //    sddto.SoTienBaoHiem = float.Parse(txtSoTienBH.Text);
                    //else
                    //    sddto.SoTienBaoHiem = 0;
                    //if (txtNguyenGia.Text != "")
                    //    sddto.NguyenGia = float.Parse(txtNguyenGia.Text);
                    //else
                    //    sddto.NguyenGia = 0;
                    //if (txtGiaTriConLai.Text != "") 
                    //    sddto.GiaTriConLai = float.Parse(txtGiaTriConLai.Text);
                    //else
                    //    sddto.GiaTriConLai=0;
                    //if (txtChiPhiKhoiPhuc.Text != "")
                    //    sddto.ChiPhiKhoiPhuc = float.Parse(txtChiPhiKhoiPhuc.Text);
                    //else
                    //    sddto.ChiPhiKhoiPhuc = 0;
                    //if (txtSoTienBoiThuong.Text != "")
                    //    sddto.SoTienBoiThuong = float.Parse(txtSoTienBoiThuong.Text);
                    //else
                    //    sddto.SoTienBoiThuong = 0;
                    if (txtGhiChu.Text != "")
                        sddto.GhiChu = txtGhiChu.Text;
                    else
                        sddto.GhiChu = "";
                    bool kq= sddao.Them_Building(sddto);
                    if (kq == true)
                        lblThongbaothem.Text = "Đã thêm hạng mục " + txtHangMuc.Text;
                    else
                        lblThongbaothem.Text = "Fail!";
                }
                if (loai=="Machinery")
                {
                   
                    sddto.MaTheLoai = 4;
                    sddto.TenHangMuc = txtHangMuc.Text;

                    if (txtGTKhieuNai.Text != "")
                        sddto.GiaTriKhieuNai = float.Parse(txtGTKhieuNai.Text);
                    else
                        sddto.GiaTriKhieuNai = 0;
                    //if (txtSoTienBH.Text != "")
                    //    sddto.SoTienBaoHiem = float.Parse(txtSoTienBH.Text);
                    //else
                    //    sddto.SoTienBaoHiem = 0;
                    //if (txtNguyenGia.Text != "")
                    //    sddto.NguyenGia = float.Parse(txtNguyenGia.Text);
                    //else
                    //    sddto.NguyenGia = 0;
                    //if (txtGiaTriConLai.Text != "")
                    //    sddto.GiaTriConLai = float.Parse(txtGiaTriConLai.Text);
                    //else
                    //    sddto.GiaTriConLai = 0;
                    //if (txtChiPhiKhoiPhuc.Text != "")
                    //    sddto.ChiPhiKhoiPhuc = float.Parse(txtChiPhiKhoiPhuc.Text);
                    //else
                    //    sddto.ChiPhiKhoiPhuc = 0;
                    //if (txtSoTienBoiThuong.Text != "")
                    //    sddto.SoTienBoiThuong = float.Parse(txtSoTienBoiThuong.Text);
                    //else
                    //    sddto.SoTienBoiThuong = 0;
                    //if (txtGhiChu.Text != "")
                    //    sddto.GhiChu = txtGhiChu.Text;
                    //else
                    //    sddto.GhiChu = "";
                    bool kq= sddao.ThemMaChinery(sddto);
                    if (kq == true)
                        lblThongbaothem.Text = "Đã thêm hạng mục " + txtHangMuc.Text;
                    else
                        lblThongbaothem.Text = "Fail!";
                }
                if (loai == "Stock")
                {
                   
                    sddto.MaTheLoai = 3;
                    sddto.TenHangMuc = txtHangMuc.Text;
                    if (txtGTKhieuNai.Text != "")
                        sddto.GiaTriKhieuNai = float.Parse(txtGTKhieuNai.Text);
                    else
                        sddto.GiaTriKhieuNai = 0;
                    //if (txtSoTienBH.Text != "")
                    //    sddto.SoTienBaoHiem = float.Parse(txtSoTienBH.Text);
                    //else
                    //    sddto.SoTienBaoHiem = 0;
                    //if (txtSoLuong.Text != "")
                    //    sddto.SoLuong = int.Parse(txtSoLuong.Text);
                    //else
                    //    sddto.SoLuong = 1;
                    //if (txtDonGia.Text != "")
                    //    sddto.DonGia = float.Parse(txtDonGia.Text);
                    //else
                    //    sddto.DonGia = 0;

                    if (txtGhiChu.Text != "")
                        sddto.GhiChu = txtGhiChu.Text;
                    else
                        sddto.GhiChu = "";
                    bool kq= sddao.ThemStock(sddto);
                    if (kq == true)
                        lblThongbaothem.Text = "Đã thêm hạng mục " + txtHangMuc.Text;
                    else
                        lblThongbaothem.Text = "Fail!";
                }
                if (loai == "Other")
                {
                    sddto.MaTheLoai = 5;
                    sddto.TenHangMuc = txtHangMuc.Text;
                    if (txtGTKhieuNai.Text != "")
                        sddto.GiaTriKhieuNai = float.Parse(txtGTKhieuNai.Text);
                    else
                        sddto.GiaTriKhieuNai = 0;
                    //if (txtMucBoiThuong.Text != "")
                    //    sddto.MucBoiThuong = float.Parse(txtMucBoiThuong.Text);
                    //else
                    //    sddto.MucBoiThuong = 0;
                    //if (txtPhamVi.Text != "")
                    //    sddto.PhamViTonThat = float.Parse(txtPhamVi.Text);
                    //else
                    //    sddto.PhamViTonThat = 0;
                    //if (txtBaoGia.Text != "")
                    //    sddto.BaoGia = float.Parse(txtBaoGia.Text);
                    //else
                    //    sddto.BaoGia = 0;
                    //if (txtDeXuatHopLy.Text != "")
                    //    sddto.DeXuatHopLy = float.Parse(txtDeXuatHopLy.Text);
                    //else
                    //    sddto.DeXuatHopLy = 0;
                    if (txtGhiChu.Text != "")
                        sddto.GhiChu = txtGhiChu.Text;
                    else
                        sddto.GhiChu = "";
                    bool kq = sddao.ThemOther(sddto);
                    if (kq == true)
                        lblThongbaothem.Text = "Đã thêm hạng mục " + txtHangMuc.Text;
                    else
                        lblThongbaothem.Text = "Fail!";
                }
                txtHangMuc.Text = "";
                txtGTKhieuNai.Text = "";
                txtSoTienBH.Text = "";
                txtNguyenGia.Text = "";
                txtGiaTriConLai.Text = "";
                txtChiPhiKhoiPhuc.Text = "";
                txtSoTienBoiThuong.Text = "";
                txtDonGia.Text = "";
                txtSoLuong.Text = "";
                txtMucBoiThuong.Text = "";
                txtPhamVi.Text = "";
                txtBaoGia.Text = "";
                txtDeXuatHopLy.Text = "";
            }
            catch (Exception ex)
            {
                lblThongbaothem.Text = ex.Message;
            }
        }

        protected void drTheLoaiSum_SelectedIndexChanged(object sender, EventArgs e)
        {
            string loai = drTheLoaiSum.SelectedItem.ToString();
            load_TextBox(loai);
           
            //loadGrid(loai, id);
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            int id = sdao.MaSum(txtThamChieuView.Text);
            string loai = drTheLoaiSum1.SelectedItem.ToString();
            //loadGrid(loai, id);
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
          
            HtmlForm form = new HtmlForm();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
             "attachment;filename=GridViewExport.xls");
            Response.ContentType = "application/ms-excel";
            Response.Charset = "utf-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Times New Roman;'>");
            HttpContext.Current.Response.Write("<BR><BR><BR>");            
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);            
            form.Controls.Add(grDSSum);
            this.Controls.Add(form);
            form.RenderControl(hw);   
            Response.Write(sw.ToString());            
            Response.End();                

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //Xác nhận điều khiển HtmlForm tại thời gian chạy ASP.NET
        }

        protected void btnWord_Click(object sender, EventArgs e)
        {
            
            HtmlForm form = new HtmlForm();
            //Response.Clear();
            //Response.Buffer = true;
            Response.AddHeader("content-disposition",
             "attachment;filename=GridViewExport.doc");
            Response.ContentType = "application/ms-word";
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            //set font
            HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
            HttpContext.Current.Response.Write("<BR><BR><BR>");
            //Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble());
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            
            // Bỏ phân trang - Nếu chỉ muỗn Export Trang hiện hành thì chọn =true
            form.Controls.Add(grDSSum);
            this.Controls.Add(form);
            form.RenderControl(hw);
            //grDSSum.RenderControl(hw);
            //Thay đổi Style
            hw.WriteLine("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            Response.Write(sw.ToString());
            //Response.Flush();
            Response.End();      
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                string thamchieu = txtThamChieu.Text;
                bool kq = clda.KiemTraThamChieu(thamchieu);
                bool tt = sdao.KiemTraClaim(thamchieu);
                if (kq == true && tt == true)
                {
                    grDSSumTong.DataSource = sdao.TongThietHai(thamchieu);
                    grDSSumTong.DataBind();
                }
                else
                    lblThamChieu.Text = "Tham chiếu không tồn tại hoặc chưa có Summary!";
            }
            catch (Exception ex)
            {
                lblThamChieu.Text = ex.Message;
            }
        }
       
    }
}