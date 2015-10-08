using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class AdjustTimesheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                gvDSTimeSheet.Visible = false;
                gvDSTimeSheetDate.Visible = false;
                gvTimesheetCaseDate.Visible = false;
                grTSGDVDate.Visible = false;
                lblID_Claim.Visible = false;
                grTSGDVCase.Visible = false;
                grTSGDVDateCase.Visible = false;
                drGDV.DataSource = gdv.DanhSachGiamDinhVien();
                drGDV.DataTextField = "TenGDV";
                drGDV.DataValueField = "ID_GDV";
                drGDV.DataBind();
            }
        }
        TimeSheetDAO ts = new TimeSheetDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        
        void LoadDSTS(string ma)
        {
            
            gvDSTimeSheet.DataSource = ts.TimeSheetTheoThamChieu(ma);
            gvDSTimeSheet.DataBind();
            gvDSTimeSheet.Visible = true;
            gvDSTimeSheetDate.Visible = false;
            gvTimesheetCaseDate.Visible = false;
            grTSGDVDate.Visible = false;
            lblID_Claim.Visible = true;
            grTSGDVCase.Visible = false;
            grTSGDVDateCase.Visible = false;
        }
        void loadTSDate(string dateto, string datefrom)
        {
            gvDSTimeSheetDate.DataSource = ts.TimesheetDate(dateto, datefrom);
            gvDSTimeSheetDate.DataBind();
            gvDSTimeSheet.Visible = false;
            gvDSTimeSheetDate.Visible = true;
            gvTimesheetCaseDate.Visible = false;
            grTSGDVDate.Visible = false;
            lblID_Claim.Visible = false;
            grTSGDVCase.Visible = false;
            grTSGDVDateCase.Visible = false;
        }
        void loadTSCaseDate(string date, string id)
        {
            //gvTimesheetCaseDate.DataSource = ts.TimesheetCaseDate(date, id);
            //gvTimesheetCaseDate.DataBind();
            gvDSTimeSheet.Visible = false;
            gvDSTimeSheetDate.Visible = false;
            gvTimesheetCaseDate.Visible = true;
            grTSGDVDate.Visible = false;
            lblID_Claim.Visible = false;
            grTSGDVCase.Visible = false;
            grTSGDVDateCase.Visible = false;
        }
        void loadTSGDVDate(string date, int maLA)
        {
            //grTSGDVDate.DataSource = ts.TimeSheetGDVDate(date, maLA);
            //grTSGDVDate.DataBind();
            gvDSTimeSheet.Visible = false;
            gvDSTimeSheetDate.Visible = false;
            gvTimesheetCaseDate.Visible = false;
            grTSGDVDate.Visible = true;
            lblID_Claim.Visible = false;
            grTSGDVCase.Visible = false;
            grTSGDVDateCase.Visible = false;
        }
        void loadTSGDVCASE(string id, int gdv)
        {
            grTSGDVCase.DataSource = ts.TimesheetGDVCase(id, gdv);
            grTSGDVCase.DataBind();
            grTSGDVCase.Visible = true;
            gvDSTimeSheet.Visible = false;
            gvDSTimeSheetDate.Visible = false;
            gvTimesheetCaseDate.Visible = false;
            grTSGDVDate.Visible = false;
            lblID_Claim.Visible = false;
            grTSGDVDateCase.Visible = false;
        }
        void loadTSGDVDATECASE(string id, int gdv, string date)
        {
            //grTSGDVDateCase.DataSource = ts.TSGDVDateClaim(date, gdv, id);
            //grTSGDVDateCase.DataBind();
            gvDSTimeSheet.Visible = false;
            gvDSTimeSheetDate.Visible = false;
            gvTimesheetCaseDate.Visible = false;
            grTSGDVDate.Visible = false;
            lblID_Claim.Visible = false;
            grTSGDVCase.Visible = false;
            grTSGDVDateCase.Visible = true;
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {
            string ma = txtMaClaim.Text;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            if (ngay == "" && ma != "" && maLA==0)
            {
                lblID_Claim.Text = ma;
                LoadDSTS(ma);
            }
            if (ngay != "" && ma == "" && maLA == 0)
            {
               // loadTSDate(ngay);
            }
            if (ngay != "" && ma != "" && maLA == 0)
            {
                loadTSCaseDate(ngay, ma);
            }
            if(ngay!="" & ma=="" && maLA!=0)
            {
                loadTSGDVDate(ngay, maLA);
            }
            if (ngay == "" && ma != "" && maLA != 0)
            {
                loadTSGDVCASE(ma, maLA);
            }
            if (ngay != "" && ma != "" && maLA != 0)
            {
                loadTSGDVDATECASE(ma, maLA, ngay);
            }
        }
        double tongtime = 0;
        double timeissue = 0;
        protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongtime += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThoiLuongPhatSinh"));
                timeissue+=Convert.ToDouble(DataBinder.Eval(e.Row.DataItem,"TimeIssue"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    e.Row.Cells[5].Text = tongtime.ToString();
                    e.Row.Cells[5].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    e.Row.Cells[6].Text = timeissue.ToString();
                    e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Center;
                }
        }

        protected void gvDSTimeSheet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSTimeSheet.EditIndex = -1;
            string ma = lblID_Claim.Text;
            LoadDSTS(ma);
        }

        protected void gvDSTimeSheet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSTimeSheet.EditIndex = e.NewEditIndex;
            string ma = lblID_Claim.Text;
            LoadDSTS(ma);
        }

        protected void gvDSTimeSheet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = gvDSTimeSheet.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[4].Controls[0] as TextBox;
            TextBox txttime = row.Cells[6].Controls[0] as TextBox;
            TextBox txtda = row.Cells[2].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(gvDSTimeSheet.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei,da);
            if (kq == true)
            {
                e.Cancel = true;
                gvDSTimeSheet.EditIndex = -1;
                LoadDSTS(ma);
            }
           
        }
        protected void gvDSTimeSheet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ma = lblID_Claim.Text;
            int mats = int.Parse(gvDSTimeSheet.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(mats);
            LoadDSTS(ma);
        }

        protected void gvDSTimeSheetDate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ngay = txtDate.Text;
            int IDTS = int.Parse(gvDSTimeSheetDate.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(IDTS);
            //loadTSDate(ngay);
        }

        protected void gvDSTimeSheetDate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSTimeSheetDate.EditIndex = -1;
            //loadTSDate(txtDate.Text);
        }

        protected void gvDSTimeSheetDate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSTimeSheetDate.EditIndex = e.NewEditIndex;
           // loadTSDate(txtDate.Text);
        }

        protected void gvDSTimeSheetDate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = gvDSTimeSheetDate.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[5].Controls[0] as TextBox;
            TextBox txttime = row.Cells[7].Controls[0] as TextBox;
            TextBox txtda = row.Cells[3].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(gvDSTimeSheetDate.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei,da);
            if (kq == true)
            {
                e.Cancel = true;
                gvDSTimeSheetDate.EditIndex = -1;
                //loadTSDate(txtDate.Text);
            }
        }

        protected void gvTimesheetCaseDate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ngay = txtDate.Text;
            string ma = txtMaClaim.Text;
            int idts = int.Parse(gvTimesheetCaseDate.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(idts);
            loadTSCaseDate(ngay, ma);
        }

        protected void gvTimesheetCaseDate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvTimesheetCaseDate.EditIndex = -1;
            loadTSCaseDate(txtDate.Text, txtMaClaim.Text);
        }

        protected void gvTimesheetCaseDate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTimesheetCaseDate.EditIndex = e.NewEditIndex;
            loadTSCaseDate(txtDate.Text, txtMaClaim.Text);
        }

        protected void gvTimesheetCaseDate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = gvTimesheetCaseDate.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[5].Controls[0] as TextBox;
            TextBox txttime = row.Cells[7].Controls[0] as TextBox;
            TextBox txtda = row.Cells[3].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(gvTimesheetCaseDate.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei,da);
            if (kq == true)
            {
                e.Cancel = true;
                gvTimesheetCaseDate.EditIndex = -1;
                loadTSCaseDate(txtDate.Text, txtMaClaim.Text);
            }
        }

        protected void grTSGDVDate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            int idts = int.Parse(grTSGDVDate.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(idts);
            loadTSGDVDate(ngay, maLA);
            
        }

        protected void grTSGDVDate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grTSGDVDate.EditIndex = -1;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            loadTSGDVDate(ngay, maLA);
        }

        protected void grTSGDVDate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grTSGDVDate.EditIndex = e.NewEditIndex;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            loadTSGDVDate(ngay, maLA);
        }

        protected void grTSGDVDate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = grTSGDVDate.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[5].Controls[0] as TextBox;
            TextBox txttime = row.Cells[7].Controls[0] as TextBox;
            TextBox txtda = row.Cells[3].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(grTSGDVDate.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei,da);
            if (kq == true)
            {
                e.Cancel = true;
                string ngay = txtDate.Text;
                grTSGDVDate.EditIndex = -1;
                int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
                loadTSGDVDate(ngay, maLA);
            }
        }

        protected void grTSGDVCase_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grTSGDVCase.EditIndex = -1;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            string ma = txtMaClaim.Text;
            loadTSGDVCASE(ma, maLA);
        }

        protected void grTSGDVCase_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            int idts = int.Parse(grTSGDVCase.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(idts);
            string ma = txtMaClaim.Text;
            loadTSGDVCASE(ma, maLA);
        }

        protected void grTSGDVCase_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grTSGDVCase.EditIndex = e.NewEditIndex;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            string ma = txtMaClaim.Text;
            loadTSGDVCASE(ma, maLA);
        }

        protected void grTSGDVCase_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = grTSGDVCase.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[5].Controls[0] as TextBox;
            TextBox txttime = row.Cells[7].Controls[0] as TextBox;
            TextBox txtda = row.Cells[3].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(grTSGDVCase.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei, da);
            if (kq == true)
            {
                e.Cancel = true;
                string ngay = txtDate.Text;
                grTSGDVCase.EditIndex = -1;
                int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
                string ma1 = txtMaClaim.Text;
                loadTSGDVCASE(ma1, maLA);
            }
        }

        protected void grTSGDVDateCase_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grTSGDVDateCase.EditIndex = -1;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            string ma = txtMaClaim.Text;
            loadTSGDVDATECASE(ma, maLA, ngay);
        }

        protected void grTSGDVDateCase_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            int idts = int.Parse(grTSGDVDateCase.DataKeys[e.RowIndex].Value.ToString());
            ts.XoaTimeSheet(idts);
            string ma = txtMaClaim.Text;
            loadTSGDVDATECASE(ma, maLA, ngay);
        }

        protected void grTSGDVDateCase_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grTSGDVDateCase.EditIndex = e.NewEditIndex;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            string ma = txtMaClaim.Text;
            loadTSGDVDATECASE(ma, maLA, ngay);
        }

        protected void grTSGDVDateCase_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string ma = lblID_Claim.Text;
            GridViewRow row = grTSGDVDateCase.Rows[e.RowIndex];

            TextBox txtdiengiai = row.Cells[5].Controls[0] as TextBox;
            TextBox txttime = row.Cells[7].Controls[0] as TextBox;
            TextBox txtda = row.Cells[3].Controls[0] as TextBox;
            int matimesheet = Int32.Parse(grTSGDVDateCase.DataKeys[e.RowIndex].Value.ToString());
            string diengiai = txtdiengiai.Text;
            float timei = float.Parse(txttime.Text);
            string da = txtda.Text;
            bool kq = ts.CapNhatTimeIssue(matimesheet, diengiai, timei, da);
            if (kq == true)
            {
                e.Cancel = true;
                string ngay = txtDate.Text;
                grTSGDVDateCase.EditIndex = -1;
                int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
                string ma1 = txtMaClaim.Text;
                loadTSGDVDATECASE(ma, maLA, ngay);
            }
        }
    }
}