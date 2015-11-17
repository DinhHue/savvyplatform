using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;
namespace WEBSITESAVVY.Pages
{
    public partial class ClaimType : System.Web.UI.Page
    {
        ClaimDAO claimDao = new ClaimDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        void loadData()
        {
            DataRow dr = claimDao.selectClaimMau(1);
            if (dr != null)
            {
                //PR
                lblGioiThieuChungA1.Text = dr["GioiThieuChungA1"].ToString();
                txtGioiThieuChungA1.Text = dr["GioiThieuChungA1"].ToString();
                lblGioiThieuNDBH.Text = dr["GioiThieuNDBH"].ToString();
                txtGioiThieuNDBH.Text = dr["GioiThieuNDBH"].ToString();
                lblDienBienTonThat.Text = dr["DienBienTonThat"].ToString();
                txtDienBienTonThat.Text = dr["DienBienTonThat"].ToString();
                lblNguyenNhanC3.Text = dr["NguyenNhanC3"].ToString();
                txtNguyenNhanC3.Text = dr["NguyenNhanC3"].ToString();
                lblPhamViBaoHiemE1PR.Text = dr["PhamViBaoHiemE1PR"].ToString();
                txtPhamViBaoHiemE1PR.Text = dr["PhamViBaoHiemE1PR"].ToString();
                lblPhamViMucDoThietHaiD1.Text = dr["PhamViMucDoThietHaiD1"].ToString();
                txtPhamViMucDoThietHaiD1.Text = dr["PhamViMucDoThietHaiD1"].ToString();
                lblDonBaoHiemKhacG.Text = dr["DonBaoHiemKhacG"].ToString();
                txtDonBaoHiemKhacG.Text = dr["DonBaoHiemKhacG"].ToString();
                lblGiaTriThuHoiH.Text = dr["GiaTriThuHoiH"].ToString();
                txtGiaTriThuHoiH.Text = dr["GiaTriThuHoiH"].ToString();
                lblTheQuyenTruyDoi.Text = dr["TheQuyenTruyDoi"].ToString();
                txtTheQuyenTruyDoi.Text = dr["TheQuyenTruyDoi"].ToString();
                lblDuPhongBoiThuong.Text = dr["DuPhongBoiThuong"].ToString();
                txtDuPhongBoiThuong.Text = dr["DuPhongBoiThuong"].ToString();
                lblTamUngBoiThuongText.Text = dr["TamUngBoiThuongText"].ToString();
                txtTamUngBoiThuongText.Text = dr["TamUngBoiThuongText"].ToString();
                //IR
                lblExecutiveSummaryHIR.Text = dr["ExecutiveSummaryHIR"].ToString();
                txtExecutiveSummaryHIR.Text = dr["ExecutiveSummaryHIR"].ToString();
                lblQuaTrinhXuLyKhieuNaiK.Text = dr["QuaTrinhXuLyKhieuNaiK"].ToString();
                txtQuaTrinhXuLyKhieuNaiK.Text = dr["QuaTrinhXuLyKhieuNaiK"].ToString();
                lblAdjustmentIR.Text = dr["AdjustmentIR"].ToString();
                txtAdjustmentIR.Text = dr["AdjustmentIR"].ToString();
                lblGiaTriThuHoiHIR.Text = dr["GiaTriThuHoiHIR"].ToString();
                txtGiaTriThuHoiHIR.Text = dr["GiaTriThuHoiHIR"].ToString();
                lblCapNhatDuPhongI.Text = dr["CapNhatDuPhongI"].ToString();
                txtCapNhatDuPhongI.Text = dr["CapNhatDuPhongI"].ToString();
                lblTamUngBoiThuongTextIR.Text = dr["TamUngBoithuongTextIR"].ToString();
                txtTamUngBoithuongTextIR.Text = dr["TamUngBoithuongTextIR"].ToString();
                //FR
                lblExecutiveSummaryFR.Text = dr["ExecutiveSummaryFR"].ToString();
                txtExecutiveSummaryFR.Text = dr["ExecutiveSummaryFR"].ToString();
                lblQuaTrinhXuLyKhieuNaiKFR.Text = dr["QuaTrinhXuLyKhieuNaiKFR"].ToString();
                txtQuaTrinhXuLyKhieuNaiKFR.Text = dr["QuaTrinhXuLyKhieuNaiKFR"].ToString();
                lblNguyenNhanC3FR.Text = dr["NguyenNhanC3FR"].ToString();
                txtNguyenNhanC3FR.Text = dr["NguyenNhanC3FR"].ToString();
                lblPhamViBaoHiemE2FR.Text = dr["PhamViBaoHiemE2FR"].ToString();
                txtPhamViBaoHiemE2FR.Text = dr["PhamViBaoHiemE2FR"].ToString();
                lblYeuCauBoiThuongB1.Text = dr["YeuCauBoiThuongB1"].ToString();
                txtYeuCauBoiThuongB1.Text = dr["YeuCauBoiThuongB1"].ToString();
                lblGiaTriThuHoiHFR.Text = dr["GiaTriThuHoiHFR"].ToString();
                txtGiaTriThuHoiHFR.Text = dr["GiaTriThuHoiHFR"].ToString();
                lblDeXuatChungCuocB2.Text = dr["DeXuatChungCuocB2"].ToString();
                txtDeXuatChungCuocB2.Text = dr["DeXuatChungCuocB2"].ToString();
                lblKetLuanFR.Text = dr["KetLuanFR"].ToString();
                txtKetLuanFR.Text = dr["KetLuanFR"].ToString();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                //string type = "PD";
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = "";

                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                claimDao.updateClaimMauField(1, key, value);
                //sm.sendNoiDungClaim("Report_Update", TenGDV(), value,key, claimID);
                //sm.UpdateClaim("Report_Update", TenGDV(), value, key, claimID);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + "Mẫu Report PR thể loại PD" + ".";
                SaveLogTracking(maGDV, noidung, "Mẫu report");


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