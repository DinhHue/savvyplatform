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
        void loadGDV()
        {
            drID_GDVIR.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVIR.DataTextField = "TenGDV";
            drID_GDVIR.DataValueField = "ID_GDV";
            drID_GDVIR.DataBind();
            drID_GDVIRCheck.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVIRCheck.DataTextField = "TenGDV";
            drID_GDVIRCheck.DataValueField = "ID_GDV";
            drID_GDVIRCheck.DataBind();
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
                lblTenClaim.Text = "IR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;
                string ngayIR = row["IRDate"].ToString();
                if (ngayIR != "")
                {
                    txtIRDate.Text = ngayIR;
                    lblIRDate.Text = "Ngày " + ngayIR;                   
                }
                else
                    lblIRDate.Text = "Ngày dd/mm/yyyy.";
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
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse(row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                //lblBaoCaoTruoc.Text = row["BaoCaoTruoc"].ToString();
                lblILADATE.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                string ngaysobo = row["PRDate"].ToString();
                if (ngaysobo != "")
                {
                    lblPRDARE.Text = "Báo cáo sơ bộ ngày" + row["PRDate"].ToString();
                }
                else
                    lblPRDARE.Text = "";

                string brif = row["BriefReport"].ToString();
                if (brif != "")
                    lblBrief.Text = brif;
                else
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
                string duphongILA = row["DuPhongTonThat"].ToString();
                string duphongPR = row["DuPhongTonThatPR"].ToString();
                string duphongIR = row["DuPhongTonThatIR"].ToString(); 
                if(duphongIR!="")
                {
                    lblDuPhongTonThatIR.Text = duphongIR;
                    txtDuPhongTonThatIR.Text = duphongIR;
                }
                if (duphongIR == "" && duphongPR != "")
                {
                    lblDuPhongTonThatIR.Text = duphongPR;
                    txtDuPhongTonThatIR.Text = duphongPR;
                }
                if (duphongIR == "" && duphongPR == "")
                {
                    lblDuPhongTonThatIR.Text = duphongILA;
                    txtDuPhongTonThatIR.Text = duphongILA;
                }
                lblTamUngBoiThuong.Text  = row["TamUngBoiThuong"].ToString();
                //load nội dung
                string khaiquatmau = rowmau["ExecutiveSummaryHIR"].ToString();
                string quatrinhmau = rowmau["QuaTrinhXuLyKhieuNaiK"].ToString();
                string tiendomau = rowmau["AdjustmentIR"].ToString();
                string giatrithuhoimau = rowmau["GiaTriThuHoiHIR"].ToString();
                string duphongmau = rowmau["CapNhatDuPhongI"].ToString();
                string tamungmau = rowmau["TamUngBoithuongTextIR"].ToString();

                string khaiquat = row["ExecutiveSummaryIR"].ToString();
                if (khaiquat != "")
                {
                    lblExecutiveSummaryIR.Text = khaiquat;
                    txtExecutiveSummaryIR.Text = lblExecutiveSummaryIR.Text;
                }
                else
                {
                    lblExecutiveSummaryIR.Text = khaiquatmau;
                    txtExecutiveSummaryIR.Text = lblExecutiveSummaryIR.Text;
                }
                string quatrinh = row["K"].ToString();
                if (quatrinh != "")
                {
                    lblK.Text = quatrinh;
                    txtK.Text = lblK.Text;
                }
                else {
                    lblK.Text = quatrinhmau;
                    txtK.Text = lblK.Text;
                }
                string tiendo = row["AdjustmentIR"].ToString();
                if (tiendo != "")
                {
                    lblAdjustmentIR.Text = tiendo;
                    txtAdjustmentIR.Text = lblAdjustmentIR.Text;
                }
                else
                {
                    lblAdjustmentIR.Text = tiendomau;
                    txtAdjustmentIR.Text = lblAdjustmentIR.Text;
                }
                string giatrithuhoi = row["GiaTriThuHoiHIR"].ToString();
                if (giatrithuhoi != "")
                {
                    lblGiaTriThuHoiHIR.Text = giatrithuhoi;
                    txtGiaTriThuHoiHIR.Text = lblGiaTriThuHoiHIR.Text;
                }
                else
                {
                    lblGiaTriThuHoiHIR.Text = giatrithuhoimau;
                    txtGiaTriThuHoiHIR.Text = lblGiaTriThuHoiHIR.Text;
                }
                string duphong = row["I"].ToString();
                if (duphong != "")
                {
                    lblI.Text = duphong;
                    txtI.Text = lblI.Text;
                }
                else
                {
                    lblI.Text = duphongmau;
                    txtI.Text = lblI.Text;
                }
                string tamung = row["TamUngBoithuongTextIR"].ToString();
                if (tamung != "")
                {
                    lblTamUngBoithuongTextIR.Text = tamung;
                    txtTamUngBoithuongTextIR.Text = lblTamUngBoithuongTextIR.Text;
                }
                else
                {
                    lblTamUngBoithuongTextIR.Text = tamungmau;
                    txtTamUngBoithuongTextIR.Text = lblTamUngBoithuongTextIR.Text;
                }
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
                string titlekey = btn.Attributes["title"];
                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = titlekey;

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
                string title = "IR'signature preparer";
                bool up = claimDao.UpdatePrepareIR(mClaimID, id);
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
                string title = "IR'signature checker";

                bool up = claimDao.UpdateCheckIR(mClaimID, id);
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
            DataRow row = claimDao.InfoSignatureIRPre(claimID);
            if (row != null)
            {
                lblID_GDVIR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureIRCheck(claimID);
            if (row != null)
            {

                lblID_GDVIRCheck.Text = row[0].ToString();
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