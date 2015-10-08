using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace WEBSITESAVVY.Manage
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    LoadGR();
            }

        }
        InvoiceDAO inv = new InvoiceDAO();
        void LoadGR()
        {
            //int year = DateTime.Now.Year;
            DataTable dt = inv.SelectYear( DateTime.Now.Year);
            if (dt.Rows.Count > 0)
            {
                grDSInvoice.DataSource = dt;
                grDSInvoice.DataBind();
            }
        }
        private void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            InvoiceDTO invdto = new InvoiceDTO();
            invdto.MaClaim = txtClaimNo.Text;
            invdto.NoInvoice = txtInvoiceNo.Text;
            invdto.GrandTotal = float.Parse(txtTotal.Text);
            invdto.DateIssue = DateTime.Parse(txtDateIssue.Text);
            bool kq = inv.Insert(invdto);
            if (kq == true)
            {
                LoadGR();
                ClearInputs(Page.Controls);
            }
        }
        double tBVAT = 0;
        double vAT = 0;
        double tt = 0;
        protected void grDSInvoice_RowDataBound(object sender, GridViewRowEventArgs e)
        {           
     
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tBVAT += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "BVAT"));
                vAT += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "VAT"));
                tt+=Convert.ToDouble(DataBinder.Eval(e.Row.DataItem,"GrandTotal"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    e.Row.Cells[5].Text = string.Format("{0:###,###}", tBVAT);
                    e.Row.Cells[6].Text = string.Format("{0:###,###}", vAT);
                    e.Row.Cells[7].Text = string.Format("{0:###,###}", tt);
                    e.Row.Cells[5].HorizontalAlign = e.Row.Cells[6].HorizontalAlign = e.Row.Cells[7].HorizontalAlign= HorizontalAlign.Right;
                    
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
              
        }
        }

        protected void grDSInvoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grDSInvoice.SelectedRow;
            if (row != null)
            {
                int mainv = int.Parse(row.Cells[0].Text);
                bool up = inv.UpdatePaid(mainv);
                LoadGR();
            }
        }

        protected void grDSInvoice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(grDSInvoice.DataKeys[e.RowIndex].Value.ToString());
            bool kq = inv.Delete(ma);
            if(kq==true)
                LoadGR();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnXuatExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=ListInvoice.xls");
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            grDSInvoice.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
       
    }
}