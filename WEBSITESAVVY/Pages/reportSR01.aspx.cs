using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.Util;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Web.UI.HtmlControls;
namespace WEBSITESAVVY.Pages
{
    public partial class reportSR01 : System.Web.UI.Page
    {
        private ClaimDAO claimDao = new ClaimDAO();
        private static String mClaimID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["claimID"] != null)
            //        mClaimID = Request.QueryString["claimID"];
            if (Session["ThamChieu"] != null)
            {
                string idclaim = Session["ThamChieu"].ToString();
                mClaimID = idclaim;
                loadData(mClaimID);
                loadDanhMucThietHai(mClaimID);
                //idClaim.Text = idclaim;
            }
        }
        void loadckLHTT(int idck)
        {
            if (idck == 1)
            { ck1.Checked = true; }
            if (idck == 2)
            { ck2.Checked = true; }
            if (idck == 3)
            { ck3.Checked = true; }
            if (idck == 4)
            { ck4.Checked = true; }
            if (idck == 5)
            { ck5.Checked = true; }
            if (idck == 6)
            { ck6.Checked = true; }
            if (idck == 7)
            { ck7.Checked = true; }
            if (idck == 8)
            { ck8.Checked = true; }
            if (idck == 9)
            { ck9.Checked = true; }
            if (idck == 10)
            { ck10.Checked = true; }
          
        }
        void loadSIGNPre(string claimID)
        {
            //DataRow row = claimDao.InfoSignatureILAPre(claimID);
            //if (row != null)
            //{
            //    lblNguoiBaoCao.Text = row[0].ToString();
            //    lblChucVuNguoiBC.Text = row[1].ToString();

            //}
        }
        void loadSIGNCheck(string claimID)
        {
            //DataRow row = claimDao.InfoSignatureILACheck(claimID);
            //if (row != null)
            //{

            //    lblNguoiCheckBC.Text = row[0].ToString();
            //    lblChucvuNguoiCheck.Text = row[1].ToString();
            //}
        }
        protected void loadData(String claimID)
        {
            DataRow row = claimDao.LayInFoReportILA(claimID);
            loadSIGNCheck(claimID);
            loadSIGNPre(claimID);
            if (row != null)
            {
                //lblNgayGiamDinh.Text = "Ngày " + DateTime.Now.ToString("dd/MM/yyyy");
               
                lblNgayGiamDinh.Text = row["NgayBatDauGiamDinh"].ToString();
                lblTenClaim.Text = "SR01_" + row["TenClaim"].ToString();
                lblGiamDinhVien.Text = row["FullName"].ToString();

                lblTenNhaBH.Text = row["TenNhaBH"].ToString();
                lblPolicyNO.Text = row["PolicyNo"].ToString();

                lblTenDonVi.Text = row["TenDonVi"].ToString();
                lblEffective.Text = row["Effective"].ToString();

                lblInsured.Text = row["TenKhachHang"].ToString();
                lblFaxNo.Text = row["Fax"].ToString();

                lblAddress.Text = row["DiaChi"].ToString();

                lblNguoiLienHe.Text = row["TenNguoiDaiDien"].ToString();
                lblDienThoai.Text = row["DienThoai"].ToString();
                lblEmail.Text = row["Email"].ToString();

                lblDiaDiemTonThat.Text = row["Premises"].ToString();
                lblDOL.Text = row["DOL"].ToString();
                int i=int.Parse(row["ID_LoaiHinhTonThat"].ToString());
                loadckLHTT(i);
                lblGhiChuLoaiHinhTonThat.Text = row["GhiChuLoaiHinhTonThat"].ToString();

                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                if (row["ThongBaoCQCN"].ToString().Trim().ToUpper() == "YES")
                    checkBoxThongBao.Checked = true;
                else
                    checkBoxThongBao.Checked = false;
                lblGhiChuThem.Text = row["GhiChuTBCQCN"].ToString();

                lblPhamViTonThat.Text = row["PhamViTonThat"].ToString();
                lblDuPhongTonThat.Text = row["DuPhongTonThat"].ToString();

                lblTenClaim1.Text = "SR01_" + row["TenClaim"].ToString();
                lblDePhongKhuyenCao.Text = row["DePhongVaKhuyenCao"].ToString();
                YkienGDV.Text = row["YKienGDVSR01"].ToString();
                String decription = "Công tác giám định hiện trường kết thúc lúc [XXX]. Các bước tiếp theo trong tiến trình thu thập thông tin / đánh giá tổn thất và xác định trách nhiệm của Hợp đồng bảo hiểm sẽ được chúng tôi liên tục cập nhật để Quý Công ty Bảo hiểm nắm bắt thông tin xử lý thuận tiện nhất. ";
                String decriptionEn = "Following completion of our preliminary site survey dated [XXXX] as above stated, our further reports shall follow with updated progress in respect of the requested information obtained, damage assessment and available loss adjustment for Insurers’ convenient review and consideration.";
                String gioKhaoSat = row["GioKhaoSatHienTruong"].ToString();
                String giokhaosatEN = row["GioKhaoSatHienTruongEN"].ToString();
                decription = decription.Replace("[XXX]", gioKhaoSat);
                decriptionEn = decriptionEn.Replace("[XXXX]", giokhaosatEN);

                lblDescriptionGioKhaoSat.Text = decription;
                lblDescriptionGioKhaoSatEN.Text = decriptionEn;
            }
        }

        private void loadDanhMucThietHai(String claimID)
        {
            DanhMucThietHaiDAO danhMucThietHaiDAO = new DanhMucThietHaiDAO();
            DataTable dataSource = danhMucThietHaiDAO.DanhSachDanhMucThietHaiTheoClaim(claimID);
            int dem = dataSource.Rows.Count;
            bool kt = false;
            for (int i = 0; i < dem; i++)
            {
                DataRow dr = dataSource.Rows[i];
                string text = dr["YKienGDV"].ToString();
                if (text != "" && text != null)
                    kt = true;
            }
            if (kt == true)
            {
                gvYKienYCo.DataSource = dataSource;
                gvYKienYCo.DataBind();
            }
            gvDanhMucThietHai.DataSource = dataSource;
            gvDanhMucThietHai.DataBind();
        }

        protected void checkBoxThongBao_CheckedChanged(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                {
                    id = Session["ThamChieu"].ToString();

                    if (!checkBoxThongBao.Checked)
                    {
                        string stt = "Yes";
                        bool up = claimDao.UpdateTBCQCN(id, stt);
                        if (up == true)
                            loadData(id);
                    }
                    else
                    {
                        string stt = "No";
                        bool up = claimDao.UpdateTBCQCN(id, stt);
                        if (up == true)
                            loadData(id);
                    }
                }
            }
        }

       
    }
}