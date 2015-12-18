using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using WEBSITESAVVY.DAO;
using System.Configuration;
using System.Data.SqlClient;

using System.Text;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.Util;
using System.Threading;
using System.Collections;

namespace WEBSITESAVVY.Pages
{
    public partial class ListAssessmentWorkSheet : System.Web.UI.Page
    {
        static string mClaimID = "";
        LossListDAO ld = new LossListDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    string id= Request.Cookies["MaGDV"].Value;

                    BindGrid(mClaimID);
                }
            }
        }
        
        [System.Web.Services.WebMethod]
        public static bool UpdateRowIndex(String str)
        {
            try
            {
                //Thread.Sleep(4000);

                LossListDAO dao = new LossListDAO();
                IDictionary<int,int> myDic = new Dictionary<int, int>();

                String[] strData = str.Split(',');
                for (int i = 0; i < strData.Length; i++)
                {
                    String[]strObj = strData[i].Split(':');
                    myDic.Add(int.Parse(strObj[0].Trim()), int.Parse(strObj[1].Trim()));
                }

                dao.UpdateRowIndex(myDic);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        
        protected void btnNewType_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeItemWorkSheet.aspx");
        }

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewItemWorkSheet.aspx");
        }


        protected void BindGrid(String claimID)
        {
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
                //Headerow 2
                GridViewRow HeaderRow2 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();
                HeaderCell2.Text = "1";
                HeaderRow2.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "2";
                HeaderRow2.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "3";
                HeaderRow2.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "4";
                HeaderRow2.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "5";
                HeaderRow2.Cells.Add(HeaderCell2);

                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(0, HeaderRow2);


                GridViewRow HeaderRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "No. <br/>(stt)";
                HeaderCell.Width = 30;
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "DESCRIPTION<br/> (Diễn giải)";
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Q.TY<br/>(Số lượng)";
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "UNIT.<br/>(ĐVT)";
                HeaderRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "L.A's Remark<br/>(GDV ghi chú)";
                HeaderRow.Cells.Add(HeaderCell);


                gvLoaiHangMucDetails.Controls[0].Controls.AddAt(1, HeaderRow);


                HeaderRow.Attributes.Add("class", "header nodrop nodrag");
                HeaderRow2.Attributes.Add("class", "header nodrop nodrag");
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {

            /* Verifies that the control is rendered */

        }

  
        //private void ExportToExcel(string strFileName, GridView gv)
        //{
        //    Response.ClearContent();
        //    Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
        //    Response.ContentType = "application/ms-excel";
        //    Response.ContentEncoding = Encoding.Unicode;
        //    Response.BinaryWrite(Encoding.Unicode.GetPreamble());
        //    Response.Charset = "";
        //    //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
        //    //sets font
        //    Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
        //    System.IO.StringWriter sw = new System.IO.StringWriter();
        //    HtmlTextWriter htw = new HtmlTextWriter(sw);
        //    gv.RenderControl(htw);
        //    Response.Write(sw.ToString());
        //    Response.End();


        //}      
        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=SR02_DamageAssessment.xls");
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvLoaiHangMucDetails.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }

    }
}