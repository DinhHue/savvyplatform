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
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;
namespace WEBSITESAVVY.Pages
{
    public partial class XemWeeklyReport : System.Web.UI.Page
    {
        WeeklyReportDAO wrdao = new WeeklyReportDAO();
        WeeklyReportDTO wrdto = new WeeklyReportDTO();
        ClaimDAO cldao = new ClaimDAO();
        string thamchieu = null;
        //DiaryDAO drao = new DiaryDAO();
        TimeSheetDAO tsdao = new TimeSheetDAO();
        LoaiDRDAO ldr = new LoaiDRDAO();
        DRDAO dr = new DRDAO();
        static string ClaimID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    thamchieu = Request.QueryString["viewthamchieu"];
                    lblThongBaoTS.Visible = false;
                    string matc = cldao.LayMaTheoTen(thamchieu);
                    ClaimID = matc;
                    loadLoaiDR(ClaimID);
                    if (thamchieu != null)
                    {
                        chitietwr(thamchieu);
                        loadTimeSheet(matc);
                        Session["ThamChieu"] = matc;
                    }
                    else
                    {
                        thamchieu = Session["ThamChieu"].ToString();
                        string matc1 = cldao.LayMaTheoTen(thamchieu);
                        Session["ThamChieu"] = matc1;
                        chitietwr(thamchieu);
                        loadTimeSheet(matc1);
                    }
                }
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
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
            bool ktts = tsdao.KiemTraTimeSheetTonTai(mathamchieu);
            float gio = 0;
            if (ktts == true)
            {
                gio = tsdao.TongThoiLuongPhatSinhTheoCliam(mathamchieu);
            }
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[0].ToString();
                lblNDBH.Text = dr[1].ToString();
                //lblNgayTonThat.Text = dr[2].ToString();
                lblGDV.Text = dr[3].ToString();
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
                lblEmailGDV.Text= dr[11].ToString();
                lblEmailNguoiLienHe.Text= dr[12].ToString();
                lblsoHDBH.Text= dr[13].ToString();
                lblHieuLuc.Text= dr[14].ToString();              
                lblDienThoaiGDV.Text= dr[15].ToString();
                lblDienThoaiDaiDien.Text= dr[16].ToString();               
                //lblDiachiCTy.Text= dr[17].ToString();
            }
        }
        protected void btnXemDS_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Pages/ListWeeklyReport.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", String.Format("<script>window.open('{0}');</script>", "../Pages/ListWeeklyReport.aspx"));
        }
        decimal tongtime = 0;

        protected void btnIn_Click(object sender, EventArgs e)
        {
            //Session["ThamChieu"] = lblThamChieu.Text;
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", String.Format("<script>window.open('{0}');</script>", "../Pages/ViewWR.aspx?viewthamchieu=" + lblThamChieu.Text));
          
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
      
        //protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        tongtime += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ThoiLuongPhatSinh"));

        //    }
        //    else
        //        if (e.Row.RowType == DataControlRowType.Footer)
        //        {
        //            e.Row.Cells[0].Text = "Tổng/Totals";

        //            e.Row.Cells[3].Text = tongtime.ToString("c");
        //            e.Row.Cells[3].HorizontalAlign = e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
        //            e.Row.Font.Bold = true;
        //        }
        //}
    }
}