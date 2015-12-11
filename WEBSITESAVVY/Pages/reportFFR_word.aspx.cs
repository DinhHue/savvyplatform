using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Text;

namespace WEBSITESAVVY.Pages
{
    public partial class reportFFR_word : System.Web.UI.Page
    {
        public static string mClaimID = "";
        private ClaimDAO claimDao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ThamChieu"] != null)
            {
                mClaimID = Session["ThamChieu"].ToString();
                loadData();
                LoadSIG(mClaimID);
                exportToWord();
                
            }
        }
        void LoadSIG(string claimID)
        {
            DataRow row = claimDao.InfoSignatureFFRPre(claimID);
            if (row != null)
            {
                lblID_GDVFFR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }

            DataRow row1 = claimDao.InfoSignatureFFRCheck(claimID);
            if (row1 != null)
            {

                lblID_GDVCheckFFR.Text = row1[0].ToString();
                lblChucvuNguoiCheck.Text = row1[1].ToString();
                lblDienThoaiCheck.Text = row1[2].ToString();
                lblEmailCheck.Text = row1[3].ToString();
            }

            DataRow row2 = claimDao.InfoSignatureDirector();
            if (row2 != null)
            {

                lblNguoiPheDuyet.Text = row2[0].ToString();
                lblChucvuNguoiPheDuyet.Text = row2[1].ToString();
                lblDienThoaiPheduyet.Text = row2[2].ToString();
                lblEmailPheduyet.Text = row2[3].ToString();
            }

        }
        public void loadData()
        {
            DataRow row = claimDao.LayInFoReportNormal(mClaimID);
            if (row != null)
            {
                lblTenClaim.Text = "FFR_" + row["TenClaim"].ToString();

                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();   
                lblNgayMoPR.Text = "Ngày "+row["FFRDate"].ToString();
                lblRefKH.Text = "Chưa thông báo";
                lblTenNhaBH.Text = row["TenNhaBH"].ToString();
                lblTenDonVi.Text = row["TenDonVi"].ToString();
                lblDiaChiNBH.Text = row["DiaChiDV"].ToString();

                int idDonVi = int.Parse(row["ID_DonVI"].ToString());
                DaiDienDAO daidienDAO = new DaiDienDAO();
                string nguoidaidien = row["PhuTrachNBH"].ToString();
                if (nguoidaidien != "")
                {
                    lblPhuTrachNBH.Text = nguoidaidien;
                  
                }
                else
                {
                    DataTable dt = daidienDAO.DSNguoiDaiDien(idDonVi);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dtRow = dt.Rows[0];
                        lblPhuTrachNBH.Text = dtRow["TenNguoiDaiDien"].ToString() + " - " /* + dtRow["ChucVu"].ToString() + " - " */ + dtRow["PhongBan"].ToString();
                       
                    }
                }
                lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse( row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                string brif = row["BriefReport"].ToString();
                if (brif != "")
                    lblBrief.Text = brif;
                else
                    lblBrief.Text = row["Brief"].ToString();
                lblPolicyNo.Text = row["PolicyNo"].ToString();
                lblTenKH.Text = row["TenKhachHang"].ToString();
                lblDiaChiKH.Text = row["DiaChi"].ToString();
                lblLinhVucKinhDoanh.Text = row["LinhVucKinhDoanh"].ToString();
                lblPremises.Text = row["Premises"].ToString();
                lblDOL.Text = row["DOL"].ToString();
                lblSortCause.Text = row["SortCause"].ToString();
                lblPhamViTonThat.Text = row["PhamViTonThat"].ToString();
                lblNamPolicy.Text = row["NamePolicy"].ToString();

                lblSumInSured.Text = row["SumInSured"].ToString();
                lblEffective.Text = row["Effective"].ToString();
                lblMucMienThuong.Text = row["MucMienThuong"].ToString();

                lblDKBX.Text = row["DKBS"].ToString();
                if (row["KhieuNai"].ToString() != null && row["KhieuNai"].ToString().Trim() != "")
                    lblKhieuNai.Text = row["KhieuNai"].ToString();
                else
                    lblKhieuNai.Text = "(Đang cập nhật)";
                lblThietHaiHopLy.Text = row["ThietHaiHopLy"].ToString();
                lblTonThatHopLy.Text = row["TonThatHopLe"].ToString();
                lblTruGiaTriThuHoi.Text = row["TruGiaTriThuHoi"].ToString();
                lblTruMucMienThuong.Text = row["TruMienThuong"].ToString();
                lblBoiThuong.Text = row["BoiThuong"].ToString();
                //load nội dung

                lblGioiThieu.Text = row["GioiThieu"].ToString();
                lblExecutiveSummaryFR.Text = row["ExecutiveSummaryFR"].ToString();
                lblK.Text = row["K"].ToString();
                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                lblC3.Text = row["C3FR"].ToString();
                lblE2.Text = row["E2"].ToString();
                lblD1.Text = row["D1"].ToString();
                lblB1.Text = row["B1"].ToString();
                lblG.Text = row["G"].ToString();
                lblH.Text = row["H"].ToString();
                lblB2.Text = row["B2"].ToString();
                lblConclution.Text = row["Conclution"].ToString();
            }
        }

        private void exportToWord()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/doc";
            Response.AddHeader("Content-Disposition", "attachment; filename=ExportFFR.doc");
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());

            Response.Charset = "";
            EnableViewState = false;
            System.IO.StringWriter writer = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter html = new System.Web.UI.HtmlTextWriter(writer);

            body.RenderControl(html);

            Response.Write(writer);
            Response.Flush();
            Response.End();
        }
    }
}