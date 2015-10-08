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
using WEBSITESAVVY.Util;
using System.Threading;
using System.Collections;

namespace WEBSITESAVVY.Manage
{
    public partial class income : System.Web.UI.Page
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
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó

                        }
                        else
                        {
                          
                            loadGDVAll();
                        }
                    }
                  
                }
            }
        }
      
              
        void loadGDVAll()
        {
            DataTable dt = new DataTable();
            dt = idao.DSIncomeWorking();
            gvDSincome.DataSource = dt;
            gvDSincome.DataBind();
        }

        protected void gvDSincome_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblID_GDV = (Label)e.Row.FindControl("lblID_GDV");
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                lblSTT.Text = SAVVYUtil.getRoman(e.Row.RowIndex + 1);
                int magdv=int.Parse(lblID_GDV.Text);
                int year = DateTime.Now.Year;
                DataTable dt = idao.DSIncomeGDV(year, magdv);

                Repeater RepeaterChild = (Repeater)e.Row.FindControl("repeaterChild");
                RepeaterChild.DataSource = dt;
                RepeaterChild.DataBind();

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }
        protected void gvDSincome_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Headerow 2
               // GridViewRow HeaderRow2 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No.";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Case Name";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 300;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Issue Fee";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Real Fee";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;
                HeaderCell = new TableCell();
                HeaderCell.Text = "Rate";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 30;
               
                HeaderCell = new TableCell();
                HeaderCell.Text = "Real Income";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;
                HeaderCell = new TableCell();
                HeaderCell.Text = "Cyber Income";
                HeaderRow.Cells.Add(HeaderCell);
                HeaderCell.Width = 150;
                gvDSincome.Controls[0].Controls.AddAt(0, HeaderRow);
                HeaderRow.Attributes.Add("class", "header nodrop nodrag");
                //HeaderRow2.Attributes.Add("class", "header nodrop nodrag");
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
           
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=IncomeAll.xls");
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