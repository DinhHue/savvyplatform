using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.Util;

namespace WEBSITESAVVY.Pages
{
    public partial class reportClaim : System.Web.UI.Page
    {
        static string mClaimID = "";

        //private ClaimDTO mClaim;

        private ClaimDAO claimDao = new ClaimDAO();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (!IsPostBack)
            {
                BindGrid(mClaimID);
            }
        }

        protected void BindGrid(String claimID)
        {
            DataRow row = claimDao.LayInFoReport(claimID);
            if (row != null)
            {
                lblSoThamChieu.Text  = row["TenClaim"].ToString();
                lblNgayGiamDinh.Text = row["GioKhaoSatHienTruong"].ToString();

                //table ref
                lblPolicyNo.Text            = row["PolicyNo"].ToString();
                lblNgayTonThat.Text         = row["Dol"].ToString();
                lblNgayGiamDinhDauTien.Text = row["GioKhaoSatHienTruong"].ToString();
                lblDuPhongTonThat.Text      = row["DuPhongTonThat"].ToString();

                lblNguoiKhieuNai.Text       = row["TenKhachHang"].ToString();

                lblNhaBaoHiem.Text = row["TenDonVi"].ToString();
                lblGiamDinhVien.Text = row["TenGDV"].ToString();
            }
            //mClaim = claimDao.LayInFo(claimID);

            DataTable dt = LoaiHangMucDAO.GetListInLostList(claimID);
            gvLoaiHangMucDetails.DataSource = dt;
            gvLoaiHangMucDetails.DataBind();

        }

        protected void gvgvLoaiHangMucDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblLoaiHangMucID = (Label)e.Row.FindControl("lblLoaiHangMucID");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = SAVVYUtil.getRoman(e.Row.RowIndex + 1);

                string strLoaiHangMucID = lblLoaiHangMucID.Text;
                DataTable dt = LossListDAO.SelectClaimDetail(mClaimID, int.Parse(strLoaiHangMucID));

                Repeater RepeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                RepeaterChild.DataSource = dt;
                RepeaterChild.DataBind();
            }
        }


        protected void gvLoaiHangMucDetails_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Headerow number
                GridViewRow HeaderRowNumber = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCellNumber = new TableCell();
                HeaderCellNumber.Text = "1";
                HeaderRowNumber.Cells.Add(HeaderCellNumber);

                HeaderCellNumber = new TableCell();
                HeaderCellNumber.Text = "2";
                HeaderRowNumber.Cells.Add(HeaderCellNumber);

                HeaderCellNumber = new TableCell();
                HeaderCellNumber.Text = "3";
                HeaderRowNumber.Cells.Add(HeaderCellNumber);

                HeaderCellNumber = new TableCell();
                HeaderCellNumber.Text = "4";
                HeaderRowNumber.Cells.Add(HeaderCellNumber);

                HeaderCellNumber = new TableCell();
                HeaderCellNumber.Text = "5";
                HeaderRowNumber.Cells.Add(HeaderCellNumber);

                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(0, HeaderRowNumber);


                GridViewRow HeaderRowTitle = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCellTitle = new TableCell();
                HeaderCellTitle.Text = "No. <br/>(stt)";
                HeaderCellTitle.Width = 30;
                HeaderRowTitle.Cells.Add(HeaderCellTitle);

                HeaderCellTitle = new TableCell();
                HeaderCellTitle.Text = "DESCRIPTION<br/> (Diễn giải)";
                HeaderRowTitle.Cells.Add(HeaderCellTitle);

                HeaderCellTitle = new TableCell();
                HeaderCellTitle.Text = "Q.TY<br/>(Số lượng)";
                HeaderRowTitle.Cells.Add(HeaderCellTitle);

                HeaderCellTitle = new TableCell();
                HeaderCellTitle.Text = "UNIT.<br/>(ĐVT)";
                HeaderRowTitle.Cells.Add(HeaderCellTitle);

                HeaderCellTitle = new TableCell();
                HeaderCellTitle.Text = "L.A's Remark<br/>(GDV ghi chú)";
                HeaderRowTitle.Cells.Add(HeaderCellTitle);


                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(1, HeaderRowTitle);


                HeaderRowTitle.Attributes.Add("class", "header");
                HeaderRowNumber.Attributes.Add("class", "header_number");
            }
        }


        

        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }
    }
}