using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Text;
using WEBSITESAVVY.Util;
using System.Threading;
using System.Collections;
namespace WEBSITESAVVY.Pages
{
    public partial class detailincome : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        InvoiceDAO inv = new InvoiceDAO();
        TimeSheetDAO ts = new TimeSheetDAO();
        IncomeDAO idao = new IncomeDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        int magdv = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    magdv = int.Parse(Request.Cookies["MaGDV"].Value);

                    DataTable dt = new DataTable();
                    dt = gdvdao.CheckManager(magdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        int cv = int.Parse(dr[0].ToString());
                        if (cv != 2)
                        {
                            Response.Write("<script>alert('You can't access!');</script>");
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đ
                        }
                        else
                        {
                            loadDSInvoice();
                            
                            if (Session["ThamChieu"] != null)
                            {
                                string thamchieu = Session["ThamChieu"].ToString();
                                dt = idao.DSIncomeClaim(thamchieu);
                                gvDSincome.DataSource = dt;
                                gvDSincome.DataBind();
                            }
                        }
                    }

                }
            }
        }
        void loadDSInvoice()
        {
            DataTable dt = inv.SelectYear(DateTime.Now.Year);
            drDSClaim.DataSource = dt;
            drDSClaim.DataTextField = "ID_Claim";
            drDSClaim.DataValueField = "ID_Invoice";
            drDSClaim.DataBind();
        }
        protected void btnView_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string thamchieu = drDSClaim.SelectedItem.Text.ToString();
            if (int.Parse(drDSClaim.SelectedValue.ToString()) != 0)
            {
                dt = idao.DSIncomeClaim(thamchieu);
                gvDSincome.DataSource = dt;
                gvDSincome.DataBind();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }
        protected void gvDSincome_RowDataBoun(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string thamchieu="";
                if(Session["ThamChieu"]!=null)
                    thamchieu=Session["ThamChieu"].ToString();
                else
                {
                     if (int.Parse(drDSClaim.SelectedValue.ToString()) != 0)
                         thamchieu= drDSClaim.SelectedItem.Text;
                }
                Label lblID_GDV = (Label)e.Row.FindControl("lblID_GDV");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = SAVVYUtil.getRoman(e.Row.RowIndex + 1);
                int magdv = int.Parse(lblID_GDV.Text);
               // string thamchieu = drDSClaim.SelectedItem.Text;
               // string thamchieu = Session["ThamChieu"].ToString();
                DataTable dt = idao.TimesheetIncomeGDVDetail(thamchieu, magdv);
                Repeater RepeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                RepeaterChild.DataSource = dt;
                RepeaterChild.DataBind();

            }
        }

        protected void gvDSincome_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No.";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Update Date";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Date";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 80;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Description";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 300;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Time-spent";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 50;
                HeaderCell = new TableCell();
                HeaderCell.Text = "Rate";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 100;
               
                HeaderCell = new TableCell();
                HeaderCell.Text = "Cyber Income";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Real Income";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 100;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Remark";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 80;
              
                gvDSincome.Controls[0].Controls.AddAt(0, HeaderRow);
                HeaderRow.Attributes.Add("class", "header nodrop nodrag");
                //HeaderRow2.Attributes.Add("class", "header nodrop nodrag");
            }
        
        }
      
        protected void btnExport_Click(object sender, EventArgs e)
        {
            //string thamchieu = "";
            //if (Session["ThamChieu"] != null)
            //    thamchieu = Session["ThamChieu"].ToString();
            //else
            //{
            //    if (int.Parse(drDSClaim.SelectedValue.ToString()) != 0)
            //        thamchieu = drDSClaim.SelectedItem.Text;
            //}
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=Income.xls");
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvDSincome.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }
}