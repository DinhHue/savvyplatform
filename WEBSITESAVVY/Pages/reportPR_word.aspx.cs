using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Text;
using System.IO;

namespace WEBSITESAVVY.Pages
{
    public partial class reportPR_word : System.Web.UI.Page
    {
        public static string mClaimID ="";
        private ClaimDAO claimDao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (mClaimID.Trim() != "")
            {
                loadData();
                LoadSIG(mClaimID);
                exportToWord();
            }
            else
            {
                Response.Write("<javascript>alert('Error!');<javascript>");
            }
        }
        void LoadSIG(string claimID)
        {
            DataRow row = claimDao.InfoSignaturePRPre(claimID);
            if (row != null)
            {
                lblID_GDVPR.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
                lblDienThoaiPre.Text = row[2].ToString();
                lblEmailPre.Text = row[3].ToString();

            }

            DataRow row1 = claimDao.InfoSignaturePRCheck(claimID);
            if (row1 != null)
            {

                lblID_GDVCheckPR.Text = row1[0].ToString();
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
                lblTenClaim.Text = "PR_" + row["TenClaim"].ToString();
                
                string ngayPR = "Ngày " + row["PRDate"].ToString();
                if (ngayPR != "")
                {
                   lblNgayMoPR.Text = ngayPR;                   
                }
                else
                    lblNgayMoPR.Text = "Ngày dd/mm/yyy.";
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
                lblDateILA.Text = "Báo cáo đầu tiên ngày " + row["ILADATE"].ToString();
           
                string brif = row["BriefReport"].ToString();
                if (brif != "")
                    lblBrief.Text = brif;
                else
                    lblBrief.Text = row["Brief"].ToString();
                //lblBrief1.Text = lblBrief.Text;

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
                lblTamUngBoiThuongPR.Text = row["TamUngBoiThuongPR"].ToString();
                lblDKBX.Text = row["DKBS"].ToString();
                if (row["KhieuNai"].ToString() != null && row["KhieuNai"].ToString().Trim() != "")
                    lblKhieuNai.Text = row["KhieuNai"].ToString();
                else
                    lblKhieuNai.Text = "(Đang cập nhật)";
                lblDuPhongBoiThuong.Text = row["DuPhongBoiThuong"].ToString();

                //load nội dung
                lblGioiThieu.Text = row["GioiThieu"].ToString();
                lblA1.Text = row["A1"].ToString();
                string dienbienmau = row["DienBienTonThat"].ToString();
                string dienbien = row["C1"].ToString();
                if (dienbien != "")
                    lblC1.Text = dienbien;
                else
                    lblC1.Text = dienbienmau;
                lblC3.Text = row["C3"].ToString();
                lblD1.Text = row["D1"].ToString();
                lblE1.Text = row["E1"].ToString();
                lblG.Text = row["G"].ToString();
                lblH.Text = row["H"].ToString();
                lblI.Text = row["I"].ToString();
                lblTheQuyenTruyDoi.Text = row["TheQuyenTruyDoi"].ToString();
                lblTamUngBoiThuongText.Text=row["TamUngBoiThuongText"].ToString();
                //lblTT.Text = "<p>  Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi" +
                //            "quan tâm theo dõi và sẽ định kỳ báo cáo để Nhà Bảo Hiểm nắm rõ.</p>" +
                //            "<p>  Nếu Quý Công ty Bảo hiểm có bất kỳ câu hỏi hoặc yêu cầu nào khác liên quan đến công tác" +
                //            "giám định vụ tổn thất này, xin vui lòng liên lạc với chúng tôi để được hỗ trợ tốt nhất.</p>";

                MucLucDTO mucLucDTO = MucLucDAO.getMucLuc(mClaimID, "PR");
                if (mucLucDTO != null)
                {
                    if (mucLucDTO.getKey("NguoiDuocBaoHiem") == false)
                    {                        
                        panelMucLucGioiThieu.Visible = false;
                        MucLuc_GioiThieu.Visible = false;
                    }
                    if (mucLucDTO.getKey("GioiThieuChung") == false)
                    {
                        panelMucLucA1.Visible = false;
                        MucLuc_A1.Visible = false;
                    }
                    if (mucLucDTO.getKey("DienBien") == false)
                    {
                        panelMucLucDienBienTonThat.Visible = false;
                        MucLuc_C1.Visible = false;
                    }
                    if (mucLucDTO.getKey("NguyenNhan") == false)
                    {
                        panelMucLucC3.Visible = false;
                        MucLuc_C3.Visible = false;
                    }
                    if (mucLucDTO.getKey("PhamViBaoHiem") == false)
                    {
                        panelMucLucE1.Visible = false;
                        MucLuc_E1.Visible = false;
                    }
                    if (mucLucDTO.getKey("PhamViVaMucDoThietHai") == false)
                    {
                        panelMucLucD1.Visible = false;
                        MucLuc_D1.Visible = false;
                    }
                    if (mucLucDTO.getKey("DonBaoHiemKhac") == false)
                    {
                        panelMucLucG.Visible = false;
                        MucLuc_G.Visible = false;
                    }
                    if (mucLucDTO.getKey("GiaTriThuHoi") == false)
                    {
                        panelMucLucH.Visible = false;
                        MucLuc_H.Visible = false;
                    }
                    if (mucLucDTO.getKey("TheQuyenTruyDoiBenThuBa") == false)
                    {
                        panelMucLucTheQuyenTruyDoi.Visible = false;
                        MucLuc_TheQuyenTruyDoi.Visible = false;
                    }
                    if (mucLucDTO.getKey("DuPhongBoiThuong") == false)
                    {
                        panelMucLucI.Visible = false;
                        MucLuc_I.Visible = false;
                    }
                    if (mucLucDTO.getKey("BaoCaoTiepTheo") == false)
                    {
                        panelMucLucTT.Visible = false;
                        MucLuc_TT.Visible = false;
                    }
                    if (mucLucDTO.getKey("TamUngBoiThuongText") == false)
                    {
                        panelMucLucTamUngBoiThuongText.Visible = false;
                        MucLuc_TamUngBoiThuongText.Visible = false;
                    }
                }
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

        private void exportToWord()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/doc";
            Response.AddHeader("Content-Disposition", "attachment; filename=ExportPR.doc");
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