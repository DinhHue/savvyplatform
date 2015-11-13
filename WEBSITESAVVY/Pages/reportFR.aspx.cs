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
    public partial class reportFR : System.Web.UI.Page
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
                    string done = dailyDao.KiemTraTinhTrang(mClaimID, "FR");
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
            DataRow rowmau = claimDao.selectClaimMau(1);
            loadSIGNPre(mClaimID);
            loadSIGNCheck(mClaimID);
            loadGDV();
            if (row != null)
            {
                lblTenClaim.Text = "FR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;
                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();
                string ngayIR = row["FRDate"].ToString();
                if (ngayIR != "")
                {
                    lblFRDate.Text = "Ngày " + ngayIR;
                    txtFRDate.Text = ngayIR;
                }
                else
                    lblFRDate.Text = "Ngày dd/mm/yyyy.";
                string tc = row["RefKH"].ToString();
                if (tc != "")
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
                string nguoidaidien = row["PhuTrachNBH"].ToString();
                if (nguoidaidien != "")
                {
                    lblPhuTrachNBH.Text = nguoidaidien;
                    txtPhuTrachNBH.Text = lblPhuTrachNBH.Text;
                }
                else
                {
                    DataTable dt = daidienDAO.DSNguoiDaiDien(idDonVi);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dtRow = dt.Rows[0];
                        lblPhuTrachNBH.Text = dtRow["TenNguoiDaiDien"].ToString() + " - " /* + dtRow["ChucVu"].ToString() + " - " */ + dtRow["PhongBan"].ToString();
                        txtPhuTrachNBH.Text = lblPhuTrachNBH.Text;
                    }
                }
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse(row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                //lblBaoCaoTruoc.Text = row["BaoCaoTruocFR"].ToString();
                lblILADATE.Text = "Báo cáo đầu tiên: " + row["ILADATE"].ToString();
                string ngaysobo = row["PRDate"].ToString();
                if (ngaysobo != "")
                {
                    lblPRDARE.Text = "Báo cáo sơ bộ: " + row["PRDate"].ToString();
                }
                else
                    lblPRDARE.Text = "";
                string ngaytieptheo = row["IRDate"].ToString();
                if (ngaytieptheo != "")
                    lblIRDATE.Text = "Báo cáo tiếp theo: " + row["IRDate"].ToString();
                else
                    lblIRDATE.Text = "";
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
                lblNamePolicy.Text = row["NamePolicy"].ToString();

                lblSumInSured.Text = row["SumInSured"].ToString();
                lblEffective.Text = row["Effective"].ToString();
                lblMucMienThuong.Text = row["MucMienThuong"].ToString();

                lblDKBS.Text = row["DKBS"].ToString();
                txtDKBS.Text = lblDKBS.Text;
                if (row["KhieuNai"].ToString() != null && row["KhieuNai"].ToString().Trim() != "")
                    lblKhieuNai.Text = row["KhieuNai"].ToString();
                else
                    lblKhieuNai.Text = "(Đang cập nhật)";


                lblThietHaiHopLy.Text = row["ThietHaiHopLy"].ToString();
                lblTonThatHopLe.Text = row["TonThatHopLe"].ToString();
                lblTruGiaTriThuHoi.Text = row["TruGiaTriThuHoi"].ToString();
                lblTamUngBoiThuong.Text  = row["TamUngBoiThuong"].ToString();
                lblTruMienThuong.Text   = row["TruMienThuong"].ToString();
                lblBoiThuong.Text = row["BoiThuong"].ToString();


                //load nội dung
                string tomtatmau = rowmau["ExecutiveSummaryFR"].ToString();                
                string quatrinhmau = rowmau["QuaTrinhXuLyKhieuNaiKFR"].ToString();                
                string nguyennhanmau = rowmau["NguyenNhanC3FR"].ToString();
                string phamvimau = rowmau["PhamViBaoHiemE2FR"].ToString();
                string yeucaubtmau = rowmau["YeuCauBoiThuongB1"].ToString();
                string giatrithuhoimau = rowmau["GiaTriThuHoiHFR"].ToString();
                string dexuatmau = rowmau["DeXuatChungCuocB2"].ToString();
                string ketluanmau = rowmau["KetLuanFR"].ToString();

                string tomtat = row["ExecutiveSummaryFR"].ToString();
                if (tomtat != "")
                {
                    lblExecutiveSummaryFR.Text = tomtat;
                    txtExecutiveSummaryFR.Text = lblExecutiveSummaryFR.Text;
                }
                else
                {
                    lblExecutiveSummaryFR.Text = tomtatmau;
                    txtExecutiveSummaryFR.Text = lblExecutiveSummaryFR.Text;
                }
                string quatrinh = row["K"].ToString();
                if (quatrinh != "")
                {
                    lblK.Text = quatrinh;
                    txtK.Text = lblK.Text;
                }
                else
                {
                    lblK.Text = quatrinhmau;
                    txtK.Text = lblK.Text;
                }
                string nguyennhan = row["C3FR"].ToString();
                if (nguyennhan != "")
                {
                    lblC3FR.Text = nguyennhan;
                    txtC3FR.Text = lblC3FR.Text;
                }
                else
                {
                    lblC3FR.Text = nguyennhanmau;
                    txtC3FR.Text = lblC3FR.Text;
                }
                string phamvibaohiem = row["E2"].ToString();
                if (phamvibaohiem != "")
                {
                    lblE2.Text = phamvibaohiem;
                    txtE2.Text = lblE2.Text;
                }
                else
                {
                    lblE2.Text = phamvimau;
                    txtE2.Text = lblE2.Text;
                }
                string yeucaubt = row["B1"].ToString();
                if (yeucaubt != "")
                {
                    lblB1.Text = yeucaubt;
                    txtB1.Text = lblB1.Text;
                }
                else
                {
                    lblB1.Text = yeucaubtmau;
                    txtB1.Text = lblB1.Text;
                }
                string giatrithuhoi = row["GiaTriThuHoiHFR"].ToString();
                if (giatrithuhoi != "")
                {
                    lblGiaTriThuHoiHFR.Text = giatrithuhoi;
                    txtGiaTriThuHoiHFR.Text = lblGiaTriThuHoiHFR.Text;
                }
                else {lblGiaTriThuHoiHFR.Text = giatrithuhoimau;
                    txtGiaTriThuHoiHFR.Text = lblGiaTriThuHoiHFR.Text;
                }
                string dexuat = row["B2"].ToString();
                if (dexuat != "")
                {
                    lblB2.Text = dexuat;
                    txtB2.Text = lblB2.Text;
                }
                else
                {
                    lblB2.Text = dexuatmau;
                    txtB2.Text = lblB2.Text;
                }
                string ketluan = row["Conclution"].ToString();
                if (ketluan != "")
                {
                    lblConclution.Text = ketluan;
                    txtConclution.Text = lblConclution.Text;
                }
                else
                {
                    lblConclution.Text = ketluanmau;
                    txtConclution.Text = lblConclution.Text;
                }
            }
        }
        void loadGDV()
        {
            drID_GDVFR.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVFR.DataTextField = "TenGDV";
            drID_GDVFR.DataValueField = "ID_GDV";
            drID_GDVFR.DataBind();
            drID_GDVCheckFR.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVCheckFR.DataTextField = "TenGDV";
            drID_GDVCheckFR.DataValueField = "ID_GDV";
            drID_GDVCheckFR.DataBind();
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

        protected void btnUpdateGDV_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "";
                bool up = claimDao.UpdatePrepareFR(mClaimID, id);
                if (up == true)
                {
                    loadSIGNPre(mClaimID);

                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
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
        protected void btnUpdateGDVCheck_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "";

                bool up = claimDao.UpdateCheckFR(mClaimID, id);
                if (up == true)
                {
                    loadSIGNCheck(mClaimID);

                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
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
            DataRow row = claimDao.InfoSignatureFRPre(claimID);
            if (row != null)
            {
                lblID_GDVFR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();
            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureFRCheck(claimID);
            if (row != null)
            {
                lblID_GDVCheckFR.Text = row[0].ToString();
                lblChucvuNguoiCheck.Text = row[1].ToString();
                lblDienThoaiCheck.Text = row[2].ToString();
                lblEmailCheck.Text = row[3].ToString();
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
                lblDienThoaiPheduyet.Text = row[2].ToString();
                lblEmailPheduyet.Text = row[3].ToString();
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
                bool up = claimDao.UpdatePrepareFR(id, idgdv);
                if (up == true)
                {

                    loadSIGNPre(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

        protected void btnCheckPR_Click(object sender, EventArgs e)
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
                bool up = claimDao.UpdateCheckFR(id, idgdv);
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