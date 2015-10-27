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
    public partial class reportFFR : System.Web.UI.Page
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
                if(!IsPostBack)
                {
                    string done = dailyDao.KiemTraTinhTrang(mClaimID, "FFR");
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
                lblTenClaim.Text = "FFR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;

                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();  
                lblNgayMoPR.Text = row["FFRDate"].ToString();
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
                //lblILADATE.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse( row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                lblBrief.Text = row["Brief"].ToString();
                lblBrief1.Text = lblBrief.Text;

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
                lblTruGiaTriThuHoi.Text=row["TruGiaTriThuHoi"].ToString();
                lblTruMucMienThuong.Text=row["TruMienThuong"].ToString();
                lblBoiThuong.Text = row["BoiThuong"].ToString();
                //load nội dung

                lblGioiThieu.Text = row["GioiThieu"].ToString();
                txtGioiThieu.Text = lblGioiThieu.Text;

                lblExecutiveSummaryFR.Text = row["ExecutiveSummaryFR"].ToString();
                txtExecutiveSummaryFR.Text = lblExecutiveSummaryFR.Text;

                lblK.Text = row["K"].ToString();
                txtK.Text = lblK.Text;

                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                txtDienBienTonThat.Text = lblDienBienTonThat.Text;

                lblC3FR.Text = row["C3FR"].ToString();
                txtC3FR.Text = lblC3FR.Text;

                lblE2.Text = row["E2"].ToString();
                txtE2.Text = lblE2.Text;

                lblD1.Text = row["D1"].ToString();
                txtD1.Text = lblD1.Text;

                lblB1.Text = row["B1"].ToString();
                txtB1.Text = lblB1.Text;

                lblG.Text = row["G"].ToString();
                txtG.Text = lblG.Text;

                lblH.Text = row["H"].ToString();
                txtH.Text = lblH.Text;

                lblB2.Text = row["B2"].ToString();
                txtB2.Text = lblB2.Text;

                lblConclution.Text = row["Conclution"].ToString();
                txtConclution.Text = lblConclution.Text;
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
            DataRow row = claimDao.InfoSignatureFFRPre(claimID);
            if (row != null)
            {
                lblNguoiBaoCao.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();

            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureFFRCheck(claimID);
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
        protected void btnPrepareFFR_Click(object sender, EventArgs e)
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
                bool up = claimDao.UpdatePrepareFFR(id, idgdv);
                if (up == true)
                {

                    loadSIGNPre(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

        protected void btnCheckFFR_Click(object sender, EventArgs e)
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
                bool up = claimDao.UpdateCheckFFR(id, idgdv);
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