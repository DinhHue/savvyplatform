using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class reportFR : System.Web.UI.Page
    {
        public static string mClaimID = "";
        private ClaimDAO claimDao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ThamChieu"] != null)
            {
                mClaimID = Session["ThamChieu"].ToString();
                loadData();
            }
        }

        public void loadData()
        {
            DataRow row = claimDao.LayInFoReportNormal(mClaimID);
            if (row != null)
            {
                lblTenClaim.Text = "FR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;
                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();
                lblNgayMoPR.Text = row["FRDate"].ToString();
                lblRefKH.Text = "Chưa thông báo";
                lblTenNhaBH.Text = row["TenNhaBH"].ToString();
                lblTenDonVi.Text = row["TenDonVi"].ToString();
                lblDiaChiNBH.Text = row["DiaChiDV"].ToString();

                int idDonVi = int.Parse(row["ID_DonVI"].ToString());
                DaiDienDAO daidienDAO = new DaiDienDAO();
                DataTable dt = daidienDAO.DSNguoiDaiDien(idDonVi);
                if (dt.Rows.Count > 0)
                {
                    DataRow dtRow = dt.Rows[0];

                    lblKinhGui.Text = dtRow["TenNguoiDaiDien"].ToString() + " - " /* + dtRow["ChucVu"].ToString() + " - " */ + dtRow["PhongBan"].ToString();
                }
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse(row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                //lblBaoCaoTruoc.Text = row["BaoCaoTruocFR"].ToString();
                lblILADATE.Text = "Báo cáo đầu tiên ngày: " + row["ILADATE"].ToString();
                lblPRDARE.Text = "Báo cáo sơ bộ: " + row["PRDate"].ToString();
                lblIRDATE.Text = "Báo cáo tiếp theo: " + row["IRDate"].ToString();
                lblBrief.Text = row["Brief"].ToString();
                lblBrief1.Text = lblBrief.Text;
                lblPolicyNo.Text = row["PolicyNo"].ToString();
                lblTenKH.Text = row["TenKhachHang"].ToString();
                lblDiaChiKH.Text = row["DiaChi"].ToString();
                lblLinhVucKinhDoanh.Text = row["LinhVucKinhDoanh"].ToString();
                lblPremises.Text = row["Premises"].ToString();
                lblDOL.Text     = row["DOL"].ToString();
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


                lbTonThatHopLy.Text = row["ThietHaiHopLy"].ToString();
                lblTonThatHopLe.Text = row["TonThatHopLe"].ToString();
                lblTruGiaTriThuHoi.Text = row["TruGiaTriThuHoi"].ToString();
                lblTamUngBoiThuong.Text  = row["TamUngBoiThuong"].ToString();
                lblTruMienThuong.Text   = row["TruMienThuong"].ToString();
                lblBoiThuong.Text = row["BoiThuong"].ToString();


                //load nội dung
                lblExecutiveSummaryFR.Text = row["ExecutiveSummaryFR"].ToString();
                lblK.Text = row["K"].ToString();
                lblC3FR.Text = row["C3FR"].ToString();
                lblE2.Text = row["E2"].ToString();
                lblB1.Text = row["B1"].ToString();
                lblH.Text = row["H"].ToString();
                lblB2.Text = row["B2"].ToString();
                lblConclution.Text = row["Conclution"].ToString();
            }
        }
    }
}