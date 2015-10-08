using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.IO;
using System.Text;
namespace WEBSITESAVVY.Pages
{
    public partial class ViewWR : System.Web.UI.Page
    {
        WeeklyReportDAO wrdao = new WeeklyReportDAO();
        WeeklyReportDTO wrdto = new WeeklyReportDTO();
        ClaimDAO cldao = new ClaimDAO();
        string thamchieu = null;
        DiaryDAO drao = new DiaryDAO();
        TimeSheetDAO tsdao = new TimeSheetDAO();
        LoaiDRDAO ldr = new LoaiDRDAO();
        DRDAO dr = new DRDAO();
        static string ClaimID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                thamchieu = Request.QueryString["viewthamchieu"];
                lblThongBaoTS.Visible = false;                   
                if (thamchieu != null)
                {
                    string matc = cldao.LayMaTheoTen(thamchieu);
                    ClaimID = matc;
                    chitietwr(thamchieu);
                    loadTimeSheet(matc);
                    loadLoaiDR(matc);
                }
                else
                {
                    thamchieu = Session["ThamChieu"].ToString();
                    ClaimID = thamchieu;
                    string tenclaim = cldao.TenClaim(thamchieu);
                    chitietwr(tenclaim);
                    loadTimeSheet(thamchieu);
                    loadLoaiDR(thamchieu);
                }
            }
        }
        void loadTimeSheet(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = tsdao.TimeSheetTheoThamChieu(maclaim);
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
                gvDSTimeSheet.Attributes.Add("bodercolor", "#EBEBEB");
            }
            else
            {
                lblThongBaoTS.Text = "Chưa có TimeSheet!";
                lblThongBaoTS.Visible = true;
            }

        }
        void chitietwr(string thamchieu)
        {
            DataTable dt = new DataTable();
            dt = wrdao.ViewWR(thamchieu);
            string mathamchieu = cldao.LayMaTheoTen(thamchieu);
            //float gio = drao.TongThoiLuongPhatSinh(mathamchieu);
            
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[0].ToString();
                lblNDBH.Text = dr[1].ToString();
                //lblNgayTonThat.Text = dr[2].ToString();
                lblGDV.Text = dr[3].ToString();
                float gio = float.Parse(dr[4].ToString());
                if (gio != null)
                    lblThoiLuongPhatSinh.Text = gio.ToString();
                else
                    lblThoiLuongPhatSinh.Text = "0";
                lblDuPhongTonThat.Text = dr[5].ToString();
                lblVuViec.Text = dr[6].ToString();
                lblTienTrinhVaVuongMac.Text = dr[7].ToString();
                lblDeXuatGDV.Text = dr[8].ToString();
                lblDiaChi.Text = dr[9].ToString();
                lblDaiDienNDBH.Text = dr[10].ToString();
                lblEmailGDV.Text = dr[11].ToString();
                lblEmailNguoiLienHe.Text = dr[12].ToString();
                lblsoHDBH.Text = dr[13].ToString();
                lblHieuLuc.Text = dr[14].ToString();
                lblDienThoaiGDV.Text = dr[15].ToString();
                lblDienThoaiDaiDien.Text = dr[16].ToString();
                //lblDiachiCTy.Text = dr[17].ToString();
            }
        }
        protected void btnIn_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
            "attachment;filename=WeeklyReport.doc");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Session["ctrl"] = Panel1;
            Panel1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnXemDS_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/WeeklyReportDanhSach.aspx");
        }
        decimal tongtime = 0;
        protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.Attributes["style"] = "border-color: #c3cecc";
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongtime += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TimeIssue"));
               
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Tổng/Totals";

                    e.Row.Cells[5].Text = tongtime.ToString();
                    e.Row.Cells[5].HorizontalAlign = e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                }
        }
        protected void loadLoaiDR(string idclaim)
        {
            gvDRList.DataSource = ldr.DanhSachLoaiClaim(idclaim);
            gvDRList.DataBind();
        }
        protected void gvDRList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No.";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "ITEMS DOCS / HẠNG MỤC HỒ SƠ";
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "STATUS / TÌNH TRẠNG";
                HeaderRow.Cells.Add(HeaderCell);

                gvDRList.Controls[0].Controls.AddAt(0, HeaderRow);


                HeaderRow.Attributes.Add("class", "header");
            }
        }

        protected String getRoman(int number)
        {
            String[] riman = { "M", "XM", "CM", "D", "XD", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
            int[] arab = { 1000, 990, 900, 500, 490, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
            StringBuilder result = new StringBuilder();
            int i = 0;
            while (number > 0 || arab.Length == (i - 1))
            {
                while ((number - arab[i]) >= 0)
                {
                    number -= arab[i];
                    result.Append(riman[i]);
                }
                i++;
            }

            return result.ToString();
        }

        protected void gvDRList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if (e.Row.RowType == DataControlRowType.DataRow)
             {
                 Label lblmaLoaiDR = (Label)e.Row.FindControl("lblmaLoaiDR");
                 Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                 lblSTT.Text = getRoman(e.Row.RowIndex + 1);

                 string maloaiDR = lblmaLoaiDR.Text;
                 DataTable dt = dr.ItemlistDR(ClaimID, int.Parse(maloaiDR));
                 Repeater repeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                 repeaterChild.DataSource = dt;
                 repeaterChild.DataBind();
             }
        }

    }
}