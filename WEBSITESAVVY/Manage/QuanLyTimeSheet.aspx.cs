using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;
using WEBSITESAVVY.DTO;
using System.Text;

namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyTimeSheet : System.Web.UI.Page
    {
        TimeSheetDTO tsdto = new TimeSheetDTO();
        TimeSheetDAO tsdao = new TimeSheetDAO();
        CongTacTimeSheetDAO ctdao = new CongTacTimeSheetDAO();
        DiaryDAO dr = new DiaryDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        WeeklyReportDAO wr = new WeeklyReportDAO();
        ClaimDAO cl = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    gvDSTimeSheet.Visible = false;
                    loadTheLoai();
                    loadGDV();
                }
            }
        }
        void loadTheLoai()
        {
            drDienGiai.DataSource = ctdao.DanhSachCongTac();
            drDienGiai.DataValueField = "Ma";
            drDienGiai.DataTextField = "CongTac";
            drDienGiai.DataBind();
            drType.DataSource = ctdao.DanhSachCongTac();
            drType.DataValueField = "Ma";
            drType.DataTextField = "CongTac";
            drType.DataBind();
        }
        void loadGDV()
        {
            drGDV.DataSource = gdv.DanhSachGiamDinhVien();
            drGDV.DataTextField = "TenGDV"; 
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataBind();
            drGDV0.DataSource = gdv.DanhSachGiamDinhVien();
            drGDV0.DataTextField = "TenGDV";
            drGDV0.DataValueField = "ID_GDV";
            drGDV0.DataBind();

        }
        protected void btnTim_Click(object sender, EventArgs e)
        {
            int magdv = int.Parse(drGDV0.SelectedItem.Value.ToString());
            //GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
            //DataTable dtgdv = gdvdao.MaGiamDinhVienTheoTen(tengdv);
            //int idgdv = 0;
            //if (dtgdv.Rows.Count > 0)
            //{
            //    DataRow dr = dtgdv.Rows[0];
            //    idgdv = int.Parse(dr[0].ToString());
            //}
            ClaimDAO cdao = new ClaimDAO();
            string matc= txtMaThamChieuT.Text;
            string thamchieu = cdao.TenClaim(matc);

            //DataTable dtc = cdao.ClaimTheoTen(thamchieu);
           
                if (matc!="" )
                {
                    bool kt = cl.KiemTraThamChieu(matc);
                    if (kt == true)
                    {
                        loadDSTimeSheet(magdv, matc);
                        gvDSTimeSheet.Visible = true;
                    }
                }
                //if (matc == "")
                //{
                //    LoadTSTheoThamchieu(matc);
                //}
                if (matc == "")
                {
                    loadTheoGDV(magdv);
                }
                //if (dtgdv.Rows.Count == 0)
                //{
                //    loadTheoThamChieu(matc);
                //}
                
            
            
        }
        
        protected void gvDSTimeSheet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TimeSheetDAO tsdao = new TimeSheetDAO();
            int autoid = int.Parse(gvDSTimeSheet.DataKeys[e.RowIndex].Value.ToString());
            tsdao.XoaTimeSheet(autoid);
            gvDSTimeSheet.Visible = false;
        }

        protected void gvDSTimeSheet_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSTimeSheet.SelectedRow;
            int maS = 0;
            if (row != null)
            {
                string temp = row.Cells[0].Text;
                maS = int.Parse(temp.ToString());
            }
           
            DataTable dt = new DataTable();
            dt = tsdao.TimeSheetTheoMa(maS);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                txtMaS.Text = dr[0].ToString();
                txtGDVS.Text = dr[1].ToString();
                txtThamChieuS.Text = dr[2].ToString();
                txtNgayS.Text = dr[3].ToString();
                drType.Text = dr[4].ToString();
                txtDienGiaiS.Text = dr[5].ToString();
                txtPhatSinhS.Text = dr[6].ToString();

            }
            sua.Visible = true;
            //loadDrDS();
        }
        protected void loadDSTimeSheet(int idgdv, string thamchieu)
        {
            ClaimDAO cdao = new ClaimDAO();
            DataTable dt2 = new DataTable();
            //dt = cdao.ClaimTheoTen(thamchieu);
            //DataRow dr = dt.Rows[0];
            //string maclaim = dr[0].ToString();
            TimeSheetDAO tsdao = new TimeSheetDAO();
            dt2 = tsdao.DSTimeSheet(idgdv, thamchieu);
            gvDSTimeSheet.DataSource = dt2;
            gvDSTimeSheet.DataBind();
            if (dt2.Rows.Count > 0)
            {
                gvDSTimeSheet.Visible = true;
                //ddlFile.Visible = true;
                //btnSave.Visible = true;
            }
            else
            {
                //ddlFile.Visible = false;
                //btnSave.Visible = false;
            }
        }
        void LoadTSTheoThamchieu(string thamchieu)
        {
            int idgdv = int.Parse(Session["MaGDV"].ToString());
            DataTable dt = new DataTable();
            dt = dr.DSTimeSheetTheoGDV_ThamChieu(idgdv, thamchieu);
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
                
            }
            else
            {               
                Response.Write("<script>alert('Chưa có cập nhật Diary của '" + thamchieu + "' này!');</script>");
            }

        }
        protected void loadTheoGDV(int idgdv)
        {
            
            DataTable dt = new DataTable();
            dt = tsdao.TimeSheetTheoMaGDV(idgdv);
            gvDSTimeSheet.DataSource = dt;
            gvDSTimeSheet.DataBind();
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.Visible = true;
                //ddlFile.Visible = true;
                //btnSave.Visible = true;
            }
            else
            {
                //ddlFile.Visible = false;
                //btnSave.Visible = false;
            }
        }
        protected void loadTheoThamChieu(string thamchieu)
        {
            ClaimDAO cdao = new ClaimDAO();
            DataTable dt2 = new DataTable();
          
            dt2 = tsdao.TimeSheetTheoThamChieu(thamchieu);
            gvDSTimeSheet.DataSource = dt2;
            gvDSTimeSheet.DataBind();
            if (dt2.Rows.Count > 0)
            {
                gvDSTimeSheet.Visible = true;
                //ddlFile.Visible = true;
                //btnSave.Visible = true;
            }
            else
            {
                //ddlFile.Visible = false;
                //btnSave.Visible = false;
            }
        }
        //void loadDrDS()
        //{
        //    //drType.DataSource = ctdao.DanhSachCongTac();
        //    //drType.DataTextField = "CongTac";
        //    //drType.DataValueField = "ID";
        //    //drType.DataBind();
        //    drType.DataSource = ctdao.DanhSachCongTac();
        //    drType.DataTextField = "CongTac";
        //    drType.DataValueField = "ID";
        //    drType.DataBind();
        //}
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            tsdto.ID = int.Parse(txtMaS.Text);
            tsdto.ThamChieu = txtThamChieuS.Text;
            tsdto.Ngay = txtNgayS.Text;
            tsdto.IdCongTacTimeSheet = drType.SelectedValue;
            tsdto.DienGiai = txtDienGiaiS.Text;
            tsdto.ThoiLuongPhatSinh = float.Parse(txtPhatSinhS.Text);
            string dg = txtDienGiaiS.Text;
            float ps = float.Parse(txtPhatSinhS.Text);          
            tsdao.SuaTimeSheet(tsdto);
            loadTheoThamChieu(txtThamChieuS.Text);
            sua.Visible = false;
            gvDSTimeSheet.Visible = false;
        }

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    if (ddlFile.SelectedValue == "Excel")
        //    {
        //        HtmlForm form = new HtmlForm();
        //        string attachment = "attachment; filename=aaa.xls";
        //        Response.ClearContent();
        //        Response.AddHeader("content-disposition", attachment);
        //        Response.ContentType = "application/ms-excel";
        //        Response.Charset = "";
        //        Response.ContentEncoding = System.Text.Encoding.Unicode;
        //        Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
        //        StringWriter stw = new StringWriter();
        //        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        //        gvDSTimeSheet.Columns[7].Visible = false;
        //        gvDSTimeSheet.Columns[8].Visible = false;
        //        form.Controls.Add(gvDSTimeSheet);
        //        this.Controls.Add(form);
        //        form.RenderControl(htextw);
        //        Response.Write(stw.ToString());
        //        Response.End();
        //    }
        //    if (ddlFile.SelectedValue == "Word")
        //    {

        //        Response.AddHeader("content-disposition", "attachment;filename=Export.doc");
        //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //        Response.ContentType = "application/vnd.word";
        //        Response.ClearContent();
        //        Response.Charset = "";
        //        Response.ContentEncoding = System.Text.Encoding.Unicode;
        //        Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
        //        StringWriter stringWrite = new StringWriter();

        //        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);


        //        HtmlForm frm = new HtmlForm();
        //        gvDSTimeSheet.Columns[7].Visible = false;
        //        gvDSTimeSheet.Columns[8].Visible = false;
        //        gvDSTimeSheet.Parent.Controls.Add(frm);
        //        frm.Attributes["runat"] = "server";
        //        frm.Controls.Add(gvDSTimeSheet);
        //        frm.RenderControl(htmlWrite);


        //        Response.Write(stringWrite.ToString());
        //        Response.End();
        //    }
        //}

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                TimeSheetDTO tsdto = new TimeSheetDTO();
                
                int maGDV = int.Parse(drGDV.SelectedItem.Value.ToString());
                tsdto.MaGDV = maGDV;
                
                string maclaim = txtThamChieu.Text;
                bool kt = cl.KiemTraThamChieu(maclaim);
                string diengiai;
                if (kt == true)
                {
                    tsdto.ThamChieu = maclaim;
                    tsdto.Ngay = txtNgay.Text;
                    tsdto.IdCongTacTimeSheet = drDienGiai.SelectedItem.Value.ToString();
                    diengiai = drDienGiai.SelectedItem.ToString();
                    tsdto.ThoiLuongPhatSinh = float.Parse(txtSoGio.Text);
                    bool them = tsdao.ThemTimeSheet(tsdto);
                    if (them == true)
                    {
                        float time = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                        wr.CapNhatGioTichLuy(maclaim, time);
                       
                        float gio = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                        bool updw = wr.CapNhatGioTichLuy(maclaim, gio);                      
                        
                        Response.Write("<script>alert('Đã thêm!');</script>");
                    }
                }
            }
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            gvDSTimeSheet0.DataSource = tsdao.DanhSachTimeSheetAll();
            gvDSTimeSheet0.DataBind();
        }

        protected void btnXuatExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=Timesheet.xls");
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvDSTimeSheet0.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        double tongtime = 0;
        protected void gvDSTimeSheet0_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongtime += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThoiLuongPhatSinh"));

            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    e.Row.Cells[6].Text = tongtime.ToString();
                    e.Row.Cells[6].HorizontalAlign = e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }

        //protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //}

        //protected void gvDSTimeSheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{

        //}
    }
}