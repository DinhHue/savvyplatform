﻿using System;
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
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class reportSR01 : System.Web.UI.Page
    {
        private ClaimDAO claimDao = new ClaimDAO();
        private static String mClaimID = "";
        public bool isLock = false;
        CHUKYDAO ck = new CHUKYDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["claimID"] != null)
            //        mClaimID = Request.QueryString["claimID"];
            if (!IsPostBack)
            {
                if (Session["ThamChieu"] != null)
                {
                    string idclaim = Session["ThamChieu"].ToString();
                    mClaimID = idclaim;
                    loadData(mClaimID);
                    loadDanhMucThietHai(mClaimID);
                    LoadChuKy(mClaimID);
                    //idClaim.Text = idclaim;
                }
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
                txtPolicyNO.Text = lblPolicyNO.Text;

                lblTenDonVi.Text = row["TenDonVi"].ToString();
                lblEffective.Text = row["Effective"].ToString();
                txtEffective.Text = lblEffective.Text;

                lblInsured.Text = row["TenKhachHang"].ToString();
                lblFaxNo.Text = row["Fax"].ToString();

                lblAddress.Text = row["DiaChi"].ToString();

                lblNguoiLienHe.Text = row["TenNguoiDaiDien"].ToString();
                lblDienThoai.Text = row["DienThoai"].ToString();
                lblEmail.Text = row["Email"].ToString();

                lblPremises.Text = row["Premises"].ToString();
                txtPremises.Text = lblPremises.Text;


                lblDOL.Text = row["DOL"].ToString();
                txtDOL.Text = lblDOL.Text;

                int i=int.Parse(row["ID_LoaiHinhTonThat"].ToString());
                loadckLHTT(i);
                lblGhiChuLoaiHinhTonThat.Text = row["GhiChuLoaiHinhTonThat"].ToString();

                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                txtDienBienTonThat.Text = lblDienBienTonThat.Text;

                if (row["ThongBaoCQCN"].ToString().Trim().ToUpper() == "YES")
                    checkBoxThongBao.Checked = true;
                else
                    checkBoxThongBao.Checked = false;

                lblGhiChuTBCQCN.Text = row["GhiChuTBCQCN"].ToString();
                txtGhiChuTBCQCN.Text = lblGhiChuTBCQCN.Text;

                lblPhamViTonThat.Text = row["PhamViTonThat"].ToString();
                txtPhamViTonThat.Text = lblPhamViTonThat.Text;

                lblDuPhongTonThat.Text = row["DuPhongTonThat"].ToString();
                txtDuPhongTonThat.Text = lblDuPhongTonThat.Text;

                lblTenClaim1.Text = "SR01_" + row["TenClaim"].ToString();

                lblDePhongVaKhuyenCao.Text = row["DePhongVaKhuyenCao"].ToString();
                txtDePhongVaKhuyenCao.Text = lblDePhongVaKhuyenCao.Text;


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

        void LoadChuKy(string idclaim)
        {
            DataRow dr = ck.SelectChuKy(idclaim);
            if (dr != null)
            {
                DaiDien1.Text = dr["DaiDien1"].ToString();
                DaiDien2.Text = dr["DaiDien2"].ToString();
                DaiDien3.Text = dr["DaiDien3"].ToString();
                DaiDien4.Text = dr["DaiDien4"].ToString();
                TenDaiDien1.Text = dr["TenDaiDien1"].ToString();
                TenDaiDien2.Text = dr["TenDaiDien2"].ToString();
                TenDaiDien3.Text = dr["TenDaiDien3"].ToString();
                TenDaiDien4.Text = dr["TenDaiDien4"].ToString();
                ChucVuDaiDien1.Text = dr["ChucVuDaiDien1"].ToString();
                ChucVuDaiDien2.Text = dr["ChucVuDaiDien2"].ToString();
                ChucVuDaiDien3.Text = dr["ChucVuDaiDien3"].ToString();
                ChucVuDaiDien4.Text = dr["ChucVuDaiDien4"].ToString();
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = "";

                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                claimDao.updateClaimField(mClaimID, key, value);
                //sm.sendNoiDungClaim("Report_Update", TenGDV(), value,key, claimID);
                //sm.UpdateClaim("Report_Update", TenGDV(), value, key, claimID);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + claimID + ".";
                SaveLogTracking(maGDV, noidung, mClaimID);


                Response.Redirect(Request.RawUrl + "#" + key);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error', 'Error update data');</script>");
            }
        }


        void SaveLogTracking(int maGDV, string noidung, string maclaim)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = maGDV;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = maclaim;
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }

       
    }
}