using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;
namespace WEBSITESAVVY.Pages
{
    public partial class timesheetsummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    if (Session["IDclaim"] != null)
                    {
                        string thamchieu = Session["IDclaim"].ToString();
                        load(thamchieu);
                        LoadI(thamchieu);
                    }
                }
            }
        }
        TimeSheetDAO ts = new TimeSheetDAO();
        void load(string thamchieu)
        {
            DataTable dt = ts.Timesheetsummary(thamchieu);
            if (dt != null)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
            }
        }
       
        void LoadI(string idclaim)
        {
            DataRow dr = ts.TSSummaryInfo(idclaim);
            if (dr != null)
            {
                lblTenClaim.Text = dr["TenClaim"].ToString() + " - " + dr["Brief"].ToString() ;
                lblNgayChiDinh.Text = dr["AssignedDate"].ToString();
                lblInsured.Text=dr["TenKhachHang"].ToString();
            }
            else
                Response.Write("<script>alert('There didn't time-sheet!');</script>");
        }
        double tongtien = 0;
        double timeissue = 0;
        protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongtien += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThanhTien"));
                timeissue += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TimeIssue"));

            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    e.Row.Cells[6].Text = tongtien.ToString("#,###");
                    e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Cells[3].Text = timeissue.ToString();
                    e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                    
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnXuatExcel_Click(object sender, EventArgs e)
        {
            string thamchieu = Session["IDclaim"].ToString();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=Timesheetsummary.xls");
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvDSTimeSheet.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }      
    }
}