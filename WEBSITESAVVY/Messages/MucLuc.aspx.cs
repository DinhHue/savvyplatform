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

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["ThamChieu"] != null)
                {
                    ViewState["ID_Claim"]  = Session["ThamChieu"].ToString();
                    ViewState["ClaimType"] = Request.QueryString["report"].ToString();

                    LoadMucLuc();
                }
            }
        }

        protected void LoadMucLuc()
        {
            string ClaimType = ViewState["ClaimType"].ToString();
            string ID_Claim = ViewState["ID_Claim"].ToString();

            MucLucDTO mucLucDTO = MucLucDAO.getMucLuc(ID_Claim, ClaimType);

            if (ClaimType == "PR")
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
                    ckbPR_BaoCaoTiepTheo.Checked = mucLucDTO.getKey("BaoCaoTiepTheo");
                }

            }
            else if(ClaimType == "IR")
            {

            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string ClaimType = ViewState["ClaimType"].ToString();
            string ID_Claim = ViewState["ID_Claim"].ToString();

            if (ClaimType == "PR")
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
                jsonValue.Put("BaoCaoTiepTheo", ckbPR_BaoCaoTiepTheo.Checked.ToString());

                MucLucDTO mucLucDTO = MucLucDAO.getMucLuc(ID_Claim, ClaimType);
                if (mucLucDTO == null)
                {
                    mucLucDTO = new MucLucDTO();
                    mucLucDTO.ID_Claim = ID_Claim;
                    mucLucDTO.ClaimType = ClaimType;
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