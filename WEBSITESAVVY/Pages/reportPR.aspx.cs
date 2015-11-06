using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Text;
using System.IO;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Pages
{
    public partial class reportPR : System.Web.UI.Page
    {
        public static string mClaimID ="";
        private ClaimDAO claimDao = new ClaimDAO();
        private DaiLyDAO dailyDao = new DaiLyDAO();
        public static string claimName = "";

        public bool isLock = false;
        KhachHangDAO kh = new KhachHangDAO();
        SendMailDAO sm = new SendMailDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ThamChieu"] != null)
            {
                if (!IsPostBack)
                {
                    mClaimID = Session["ThamChieu"].ToString();
                    string done = dailyDao.KiemTraTinhTrang(mClaimID, "PR");
                    if (done != null && done.ToLower() == "yes")
                    {
                        isLock = true;
                    }
                    loadData();
                    ClaimDAO dao = new ClaimDAO();
                    claimName = dao.getClaimField(mClaimID, "TenClaim").ToString();
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
                lblTenClaim.Text = "PR_" + row["TenClaim"].ToString();
                //lblTenClaim1.Text = lblTenClaim.Text;

                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                string ngayPR =  row["PRDate"].ToString();
                if (ngayPR != "")
                {
                    lblPRDate.Text = "Ngày " + ngayPR;
                    txtPRDate.Text = ngayPR;
                }
                else
                    lblPRDate.Text = "Ngày dd/mm/yyyy.";
                string tc = row["RefKH"].ToString(); 
                if(tc!="")
                {
                    lblRefKH.Text = tc;
                    txtRefKH.Text = tc;
                }
                else
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
                lblDateILA.Text = "Báo cáo đầu tiên ngày: " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse( row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                lblBrief.Text = row["Brief"].ToString();
                //lblBrief1.Text = lblBrief.Text;

                lblPolicyNo.Text = row["PolicyNo"].ToString();
                lblTenKH.Text = row["TenKhachHang"].ToString();
                lblDiaChiKH.Text = row["DiaChi"].ToString();
                lblLinhVucKinhDoanh.Text = row["LinhVucKinhDoanh"].ToString();
                lblPremises.Text = row["Premises"].ToString();
                txtPremises.Text = lblPremises.Text;

                lblDOL.Text = row["DOL"].ToString();
                txtDOL.Text = lblDOL.Text;

                lblSortCause.Text = row["SortCause"].ToString();
                txtSortCause.Text = lblSortCause.Text;

                lblPhamViTonThat.Text = row["PhamViTonThat"].ToString();
                txtPhamViTonThat.Text = lblPhamViTonThat.Text;

                lblNamePolicy.Text = row["NamePolicy"].ToString();
                txtNamePolicy.Text = lblNamePolicy.Text;

                lblSumInSured.Text = row["SumInSured"].ToString();
                txtSumInSured.Text = lblSumInSured.Text;
                lblEffective.Text = row["Effective"].ToString();
                txtEffective.Text = lblEffective.Text;
                lblMucMienThuong.Text = row["MucMienThuong"].ToString();
                txtMucMienThuong.Text = lblMucMienThuong.Text;
                lblTamUngBoiThuongPR.Text = row["TamUngBoiThuongPR"].ToString();
                txtTamUngBoiThuongPR.Text = row["TamUngBoiThuongPR"].ToString();
                lblDKBS.Text = row["DKBS"].ToString();
                txtDKBS.Text = lblDKBS.Text;

                if (row["KhieuNai"].ToString() != null && row["KhieuNai"].ToString().Trim() != "")
                {
                    lblKhieuNai.Text = row["KhieuNai"].ToString();
                    txtKhieuNai.Text = lblKhieuNai.Text;
                }
                else
                    lblKhieuNai.Text = "(Đang cập nhật)";
                string duphongILA = row["DuPhongTonThat"].ToString();

                if (row["DuPhongTonThatPR"].ToString() != "")
                {
                    lblDuPhongTonThatPR.Text = row["DuPhongTonThatPR"].ToString(); ;
                    txtDuPhongTonThatPR.Text = lblDuPhongTonThatPR.Text;
                }
                else
                {
                    lblDuPhongTonThatPR.Text = duphongILA;
                    txtDuPhongTonThatPR.Text = lblDuPhongTonThatPR.Text;
                }

                //load nội dung
                lblGioiThieu.Text = row["GioiThieu"].ToString();
                txtGioiThieu.Text = lblGioiThieu.Text;
                lblA1.Text = row["A1"].ToString();
                txtA1.Text = lblA1.Text;
                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                txtDienBienTonThat.Text = lblDienBienTonThat.Text;
                lblC3.Text = row["C3"].ToString();
                txtC3.Text = lblC3.Text;
                lblD1.Text = row["D1"].ToString();
                txtD1.Text = lblD1.Text; 
                lblE1.Text = row["E1"].ToString();
                txtE1.Text = lblE1.Text;
                lblG.Text = row["G"].ToString();
                txtG.Text = lblG.Text;
                lblH.Text = row["H"].ToString();
                txtH.Text = lblH.Text;
                lblI.Text = row["I"].ToString();
                txtI.Text = lblI.Text;
                lblTheQuyenTruyDoi.Text = row["TheQuyenTruyDoi"].ToString();
                txtTheQuyenTruyDoi.Text = row["TheQuyenTruyDoi"].ToString();
                lblTamUngBoiThuongText.Text = row["TamUngBoiThuongText"].ToString();
                txtTamUngBoiThuongText.Text = lblTamUngBoiThuongText.Text;
                //lblTT.Text = "<p>  Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi" +
                //            "quan tâm theo dõi và sẽ định kỳ báo cáo để Nhà Bảo Hiểm nắm rõ.</p>" +
                //            "<p>  Nếu Quý Công ty Bảo hiểm có bất kỳ câu hỏi hoặc yêu cầu nào khác liên quan đến công tác" +
                //            "giám định vụ tổn thất này, xin vui lòng liên lạc với chúng tôi để được hỗ trợ tốt nhất.</p>";
            }
            else
            {
                Response.Write("alert('Error!');");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

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

        protected void btnUpdateKhachHang_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();

                int maKH = (int)kh.LayMaKHClaim(mClaimID);
                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = "";

                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                kh.UpdateKhachHang(maKH, key, value);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + mClaimID + ".";
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
            DataRow row = claimDao.InfoSignaturePRPre(claimID);
            if (row != null)
            {
                lblNguoiBaoCao.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignaturePRCheck(claimID);
            if (row != null)
            {

                lblNguoiCheckBC.Text = row[0].ToString();
                lblChucvuNguoiCheck.Text = row[1].ToString();
                loadSIGNDirector();
            }
        }
        void loadSIGNDirector()
        {
            DataRow row = claimDao.InfoSignatureDirector();
            if (row != null)
            {

                lblNguoiPheDuyet.Text = row[0].ToString();
                lblChucvuNguoiPheDuyet.Text = row[1].ToString();
            }
        }
        protected void btnPreparePR_Click(object sender, EventArgs e)
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
                bool up = claimDao.UpdatePreparePR(id, idgdv);
                if (up == true)
                {

                    loadSIGNPre(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

        protected void btnCheckILA_Click(object sender, EventArgs e)
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
                bool up = claimDao.UpdateCheckPR(id, idgdv);
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