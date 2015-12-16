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
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (mClaimID != "")
            {
                //mClaimID = Session["ThamChieu"].ToString();
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
        void loadGDV()
        {
            drID_GDVFFR.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVFFR.DataTextField = "TenGDV";
            drID_GDVFFR.DataValueField = "ID_GDV";
            drID_GDVFFR.DataBind();
            drID_GDVCheckFFR.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVCheckFFR.DataTextField = "TenGDV";
            drID_GDVCheckFFR.DataValueField = "ID_GDV";
            drID_GDVCheckFFR.DataBind();
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
                lblTenClaim.Text = "FFR_" + row["TenClaim"].ToString();
                lblTenClaim1.Text = lblTenClaim.Text;

                //lblNgayMoPR.Text = row["NgayBatDauGiamDinh"].ToString();
                //lblNgayMoPR.Text = "Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
                //lblRefKH.Text    = row["RefKH"].ToString();  
                string ngayIR = row["FFRDate"].ToString();
                if (ngayIR != "")
                {
                    lblFFRDate.Text = "Ngày " + ngayIR;
                    txtFFRDate.Text = ngayIR;
                }
                else
                    lblFFRDate.Text = "Ngày dd/mm/yyyy.";
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
                lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblILADATE.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
                //lblDateILA.Text = "Báo cáo đầu tiên ngày " + DateTime.Parse( row["ILADATE"].ToString()).ToString("dd/MM/yyyy");
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
                lblDOL.Text = row["DOL"].ToString();
                lblSortCause.Text = row["SortCause"].ToString();
                lblPhamViTonThat.Text = row["PhamViTonThat"].ToString();
                lblNamePolicy.Text = row["NamePolicy"].ToString();

                lblSumInSured.Text = row["SumInSured"].ToString();
                lblEffective.Text = row["Effective"].ToString();
                lblMucMienThuong.Text = row["MucMienThuong"].ToString();

                lblDKBX.Text = row["DKBS"].ToString();
                if (row["KhieuNai"].ToString() != null && row["KhieuNai"].ToString().Trim() != "")
                    lblKhieuNai.Text = row["KhieuNai"].ToString();
                else
                    lblKhieuNai.Text = "(Đang cập nhật)";
                lblThietHaiHopLy.Text = row["ThietHaiHopLy"].ToString();
                lblTonThatHopLe.Text = row["TonThatHopLe"].ToString();
                lblTruGiaTriThuHoi.Text=row["TruGiaTriThuHoi"].ToString();
                lblTruMucMienThuong.Text=row["TruMienThuong"].ToString();
                lblBoiThuong.Text = row["BoiThuong"].ToString();
                //load nội dung
                string tomtatmau = rowmau["ExecutiveSummaryFR"].ToString();
                string NDBHmau = rowmau["GioiThieuNDBH"].ToString();
                string quatrinhmau = rowmau["QuaTrinhXuLyKhieuNaiK"].ToString();
                string dienbienmau = rowmau["DienBienTonThat"].ToString();
                string nguyennhanmau = rowmau["NguyenNhanC3FR"].ToString();
                string phamvimau = rowmau["PhamViBaoHiemE2FR"].ToString();
                string phammucdomau = rowmau["PhamViMucDoThietHaiD1"].ToString();
                string yeucaubtmau = rowmau["YeuCauBoiThuongB1"].ToString();
                string donbhkhacmau = rowmau["DonBaoHiemKhacG"].ToString();
                string giatrithuhoimau = rowmau["GiaTriThuHoiH"].ToString();
                string dexuatmau = rowmau["DeXuatChungCuocB2"].ToString();
                string ketluanmau = rowmau["KetLuanFR"].ToString();

                string gioithieuNDBH = row["GioiThieu"].ToString();
                if (gioithieuNDBH != "")
                {
                    lblGioiThieu.Text = gioithieuNDBH;
                    txtGioiThieu.Text = lblGioiThieu.Text;
                }
                else
                {
                    lblGioiThieu.Text = NDBHmau;
                    txtGioiThieu.Text = lblGioiThieu.Text;
                }

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

                string dienbien = row["DienBienTonThat"].ToString();
                if (dienbien != "")
                {
                    lblDienBienTonThat.Text = dienbien;
                    txtDienBienTonThat.Text = lblDienBienTonThat.Text;
                }
                else
                {
                    lblDienBienTonThat.Text = dienbienmau;
                    txtDienBienTonThat.Text = lblDienBienTonThat.Text;
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

                string phamvi = row["D1"].ToString();
                if (phamvi != "")
                {
                    lblD1.Text = phamvi;
                    txtD1.Text = lblD1.Text;
                }
                else
                {
                    lblD1.Text = phammucdomau;
                    txtD1.Text = lblD1.Text;
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

                string dbhkhac = row["G"].ToString();
                if (dbhkhac != "")
                {
                    lblG.Text = dbhkhac;
                    txtG.Text = lblG.Text;
                }
                else
                {
                    lblG.Text = donbhkhacmau;
                    txtG.Text = lblG.Text;
                }

                string giatrithuhoi = row["H"].ToString();
                if (giatrithuhoi != "")
                {
                    lblH.Text = giatrithuhoi;
                    txtH.Text = lblH.Text;
                }
                else
                {
                    lblH.Text = giatrithuhoimau;
                    txtH.Text = lblH.Text;
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                //mClaimID = Session["ThamChieu"].ToString();
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
                //mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "FFR'signature preparer";
                bool up = claimDao.UpdatePrepareFFR(mClaimID, id);
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
                //mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "FFR'signature checker";

                bool up = claimDao.UpdateCheckFFR(mClaimID, id);
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
            DataRow row = claimDao.InfoSignatureFFRPre(claimID);
            if (row != null)
            {
                lblID_GDVFFR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureFFRCheck(claimID);
            if (row != null)
            {

                lblID_GDVCheckFFR.Text = row[0].ToString();
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
        protected void btnPrepareFFR_Click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                Response.Write("<script> alert('Please login again!');</script>");

            }
            else
            {
                string id = mClaimID;
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
                string id = mClaimID;
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