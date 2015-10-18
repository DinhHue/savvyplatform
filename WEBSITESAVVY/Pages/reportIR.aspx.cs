using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;


namespace WEBSITESAVVY.Pages
{
    public partial class reportIR : System.Web.UI.Page
    {
        public static string mClaimID = "";
        private ClaimDAO claimDao = new ClaimDAO();
        private DaiLyDAO dailyDao = new DaiLyDAO();

        public bool isLock = false;

        SendMailDAO sm = new SendMailDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ThamChieu"] != null)
            {
                mClaimID = Session["ThamChieu"].ToString();


                if (!IsPostBack)
                {
                    string done = dailyDao.KiemTraTinhTrang(mClaimID, "IR");
                    if (done != null && done.ToLower() == "yes")
                    {
                        isLock = true;
                    }
                    loadData();
                }
            }
        }

        public void loadData()
        {
            DataRow row = claimDao.LayInFoReportNormal(mClaimID);
            loadSIGNPre(mClaimID);
            loadSIGNCheck(mClaimID);
            if (row != null)
            {
                lblTenClaim.Text = "IR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;
                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();   
                lblNgayMoPR.Text = row["IRDate"].ToString();
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
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse(row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                //lblBaoCaoTruoc.Text = row["BaoCaoTruoc"].ToString();
                lblILADATE.Text = "Báo cáo đầu tiên ngày: " + row["ILADATE"].ToString();
                lblPRDARE.Text = "Báo cáo sơ bộ: " + row["PRDate"].ToString();
              
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
                lblDuPhongBoiThuong.Text = row["DuPhongBoiThuong"].ToString();
                lblTamUngBoiThuong.Text  = row["TamUngBoiThuong"].ToString();
                //load nội dung
                lblExecutiveSummaryIR.Text = row["ExecutiveSummaryIR"].ToString();
                txtExecutiveSummaryIR.Text = lblExecutiveSummaryIR.Text;
                lblK.Text = row["K"].ToString();
                txtK.Text = lblK.Text;
                lblAdjustmentIR.Text = row["AdjustmentIR"].ToString();
                txtAdjustmentIR.Text = lblAdjustmentIR.Text;
                lblH.Text = row["H"].ToString();
                txtH.Text = lblH.Text;
                lblI.Text = row["I"].ToString();
                txtI.Text = lblI.Text;
                lblTamUngBoiThuongText.Text = row["TamUngBoiThuongText"].ToString();
                txtTamUngBoiThuongText.Text = lblTamUngBoiThuongText.Text;
                //lblTT.Text = "<p>Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và cập nhật ngay khi có thông tin mới nhất để phục vụ cho công tác quản lý bồi thường của Nhà Bảo Hiểm.</p>";
                //lblTT.Text += "<p>Nếu Quý Công ty Bảo hiểm có câu hỏi hoặc bất kỳ yêu cầu nào khác sau khi xem báo cáo này, xin vui lòng thông tin cho chúng tôi để được đáp ứng thỏa đáng.</p>";
                  
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
        void loadSIGNPre(string claimID)
        {
            DataRow row = claimDao.InfoSignatureIRPre(claimID);
            if (row != null)
            {
                lblNguoiBaoCao.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();

            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureIRCheck(claimID);
            if (row != null)
            {

                lblNguoiCheckBC.Text = row[0].ToString();
                lblChucvuNguoiCheck.Text = row[1].ToString();
            }
        }
        protected void btnPrepareIR_Click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                Response.Write("<script> alert('Please login again!');</script>");

            }
            else
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                    id = Session["ThamChieu"].ToString();
                else
                    Response.Write("<script> alert('Come back home page and select Claim No again!');</script>");
                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                bool up = claimDao.UpdatePrepareIR(id, idgdv);
                if (up == true)
                {

                    loadSIGNPre(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

        protected void btnCheckIR_Click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                Response.Write("<script> alert('Please login again!');</script>");

            }
            else
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                    id = Session["ThamChieu"].ToString();
                else
                    Response.Write("<script> alert('Come back home page and select Claim No again!');</script>");
                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                bool up = claimDao.UpdateCheckIR(id, idgdv);
                if (up == true)
                {

                    loadSIGNCheck(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

    }
}