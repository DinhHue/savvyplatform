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
    public partial class reportIR_word : System.Web.UI.Page
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
            DataRow row = claimDao.InfoSignatureIRPre(claimID);
            if (row != null)
            {
                lblID_GDVIR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }

            DataRow row1 = claimDao.InfoSignatureIRCheck(claimID);
            if (row1 != null)
            {

                lblID_GDVIRCheck.Text = row1[0].ToString();
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
                lblTenClaim.Text = "IR_" + row["TenClaim"].ToString();
                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();   
                string ngayIR = "Ngày " + row["IRDate"].ToString();
                if (ngayIR != "")
                {
                    lblIRDate.Text = ngayIR;
                  
                }
                else
                    lblIRDate.Text = "Ngày dd/mm/yyy.";
                string tc = row["RefKH"].ToString();
                if (tc != "")
                {
                    lblRefKH.Text = tc;
                
                }
                else
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
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse(row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                //lblBaoCaoTruoc.Text = row["BaoCaoTruoc"].ToString();
                lblILADATE.Text = "Báo cáo đầu tiên ngày: " + row["ILADATE"].ToString();
                lblPRDARE.Text = "Báo cáo sơ bộ: " + row["PRDate"].ToString();
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
                lblDuPhongBoiThuong.Text = row["DuPhongBoiThuong"].ToString();
                lblTamUngBoiThuong.Text = row["TamUngBoiThuong"].ToString();
                //load nội dung
                lblExecutiveSummaryIR.Text = row["ExecutiveSummaryIR"].ToString();
                lblK.Text = row["K"].ToString();
                lblAdjustmentIR.Text = row["AdjustmentIR"].ToString();
                lblH.Text = row["GiaTriThuHoiHIR"].ToString();
                lblI.Text = row["I"].ToString();
                lblTamUngBoiThuongText.Text = row["TamUngBoiThuongTextIR"].ToString();
                //lblTT.Text = "<p>Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và cập nhật ngay khi có thông tin mới nhất để phục vụ cho công tác quản lý bồi thường của Nhà Bảo Hiểm.</p>";
                //lblTT.Text += "<p>Nếu Quý Công ty Bảo hiểm có câu hỏi hoặc bất kỳ yêu cầu nào khác sau khi xem báo cáo này, xin vui lòng thông tin cho chúng tôi để được đáp ứng thỏa đáng.</p>";

            }
        }

        private void exportToWord()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/doc";
            Response.AddHeader("Content-Disposition", "attachment; filename=ExportIR.doc");
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