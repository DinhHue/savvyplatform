using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.Util;
using System.Net.Json;

namespace WEBSITESAVVY.Messages
{
    public partial class MucLuc : System.Web.UI.Page
    {

        public static string mClaimID = "";
        public static string mClaimType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];
            if (Request.QueryString["report"] != null)
                mClaimType = Request.QueryString["report"];

            if (!IsPostBack)
            {
                if (mClaimID != "")
                {
                    LoadMucLuc();
                }
            }
        }

        protected void LoadMucLuc()
        {

            MucLucDTO mucLucDTO = MucLucDAO.getMucLuc(mClaimID, mClaimType);

            if (mClaimType == "PR")
            {
                panel_PR.Visible = true;

                if (mucLucDTO != null)
                {
                    ckbPR_GioiThieuChung.Checked = mucLucDTO.getKey("GioiThieuChung");
                    ckbPR_NguoiDuocBaoHiem.Checked = mucLucDTO.getKey("NguoiDuocBaoHiem");
                    ckbPR_DienBien.Checked = mucLucDTO.getKey("DienBien");
                    ckbPR_NguyenNhan.Checked = mucLucDTO.getKey("NguyenNhan");
                    ckbPR_PhamViBaoHiem.Checked = mucLucDTO.getKey("PhamViBaoHiem");
                    ckbPR_PhamViVaMucDoThietHai.Checked = mucLucDTO.getKey("PhamViVaMucDoThietHai");
                    ckbPR_DonBaoHiemKhac.Checked = mucLucDTO.getKey("DonBaoHiemKhac");
                    ckbPR_GiaTriThuHoi.Checked = mucLucDTO.getKey("GiaTriThuHoi");
                    ckbPR_TheQuyenTruyDoiBenThuBa.Checked = mucLucDTO.getKey("TheQuyenTruyDoiBenThuBa");
                    ckbPR_DuPhongBoiThuong.Checked = mucLucDTO.getKey("DuPhongBoiThuong");
                    ckbPR_TamUngBoiThuongText.Checked = mucLucDTO.getKey("TamUngBoiThuongText");
                    ckbPR_BaoCaoTiepTheo.Checked = mucLucDTO.getKey("BaoCaoTiepTheo");
                    
                }

            }
            else if (mClaimType == "IR")
            {

            }
        }

        protected void update_Click(object sender, EventArgs e)
        {

            if (mClaimType == "PR")
            {

                JSonObject jsonValue = new JSonObject();
                jsonValue.Put("GioiThieuChung", ckbPR_GioiThieuChung.Checked.ToString());
                jsonValue.Put("NguoiDuocBaoHiem", ckbPR_NguoiDuocBaoHiem.Checked.ToString());
                jsonValue.Put("DienBien", ckbPR_DienBien.Checked.ToString());
                jsonValue.Put("NguyenNhan", ckbPR_NguyenNhan.Checked.ToString());
                jsonValue.Put("PhamViBaoHiem", ckbPR_PhamViBaoHiem.Checked.ToString());
                jsonValue.Put("PhamViVaMucDoThietHai", ckbPR_PhamViVaMucDoThietHai.Checked.ToString());
                jsonValue.Put("DonBaoHiemKhac", ckbPR_DonBaoHiemKhac.Checked.ToString());
                jsonValue.Put("GiaTriThuHoi", ckbPR_GiaTriThuHoi.Checked.ToString());
                jsonValue.Put("TheQuyenTruyDoiBenThuBa", ckbPR_TheQuyenTruyDoiBenThuBa.Checked.ToString());
                jsonValue.Put("DuPhongBoiThuong", ckbPR_DuPhongBoiThuong.Checked.ToString());
                jsonValue.Put("TamUngBoiThuongText", ckbPR_TamUngBoiThuongText.Checked.ToString());
                jsonValue.Put("BaoCaoTiepTheo", ckbPR_BaoCaoTiepTheo.Checked.ToString());
                

                MucLucDTO mucLucDTO = MucLucDAO.getMucLuc(mClaimID, mClaimType);
                if (mucLucDTO == null)
                {
                    mucLucDTO = new MucLucDTO();
                    mucLucDTO.ID_Claim = mClaimID;
                    mucLucDTO.ClaimType = mClaimType;
                    mucLucDTO.JsonValue = jsonValue.ToString();

                    MucLucDAO.Insert(mucLucDTO);
                }
                else
                {
                    mucLucDTO.JsonValue = jsonValue.ToString();
                    MucLucDAO.Update(mucLucDTO);
                }

                Response.Write("<script> window.parent.closeAllDialog(); </script>");
                Response.Write("<script> window.parent.reloaData(); </script>");

            }
        }

    }
}