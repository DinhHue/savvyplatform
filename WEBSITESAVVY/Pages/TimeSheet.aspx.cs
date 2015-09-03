using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
//using System.Net.Mail;
//using System.Net;\
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace WEBSITESAVVY
{
    public partial class TimeSheet : System.Web.UI.Page
    {
        //CongTacTimeSheetDAO ctdao = new CongTacTimeSheetDAO();
        //DiaryDAO dr = new DiaryDAO();
        WeeklyReportDAO wrdao = new WeeklyReportDAO();
        ClaimDAO cl = new ClaimDAO();
        string magdv = null;
        string thamchieu;
        TimeSheetDAO tsdao = new TimeSheetDAO();
        CongTacTimeSheetDAO ctdao = new CongTacTimeSheetDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                lblThongBaoDS.Visible = false;
                //if (Session["MaGDV"] == null)
                //    Response.Redirect("~/Pages/Login.aspx");
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    //magdv = Session["MaGDV"].ToString();
                    //loadTSPending();
                    //magdv = Request.Cookies["MaGDV"].ToString();
                    magdv = Request.Cookies["MaGDV"].Value;
                    loadGDV();
                    

                    //Load data

                    string maclaim = "";
                    if(Request.QueryString["maclaim"] != null)
                        maclaim = Request.QueryString["maclaim"];

                    int idgdv = 0;
                    if (Request.QueryString["idgdv"] != null)
                        idgdv = int.Parse( Request.QueryString["idgdv"]);

                    txtMaClaim.Text = maclaim;
                    drGDV.SelectedValue = idgdv.ToString();

                    if (maclaim != "" && idgdv == 0)
                    {
                        LoadTSTheoThamchieu(maclaim);
                    }
                    if (idgdv != 0 && maclaim == "")
                        loadTSTheoGDV(idgdv);
                    if (idgdv != 0 && maclaim != "")
                        loadTSTheoGDVClaim(idgdv, maclaim);        
                }
            }
        }
        void loadTSPending()
        {
            gvDSTimeSheet.DataSource = tsdao.DanhSachTimeSheetAll();
            gvDSTimeSheet.DataBind();
        }
        void loadGDV()
        {
            GiamDinhVienDAO gdv = new GiamDinhVienDAO();
            DataTable dt = gdv.DanhSachGiamDinhVien();
            drGDV.DataSource = dt;
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataTextField = "TenGDV";
            drGDV.DataBind();
        }
        void loadTSDate(string date)
        {
            gvDSTimeSheet.DataSource = tsdao.TimesheetDate(date);
            gvDSTimeSheet.DataBind();
          
         
        }
        void loadTSCaseDate(string date, string id)
        {
            gvDSTimeSheet.DataSource = tsdao.TimesheetCaseDate(date, id);
            gvDSTimeSheet.DataBind();
          
        }
        void loadTSGDVDate(string date, int maLA)
        {
            gvDSTimeSheet.DataSource = tsdao.TimeSheetGDVDate(date, maLA);
            gvDSTimeSheet.DataBind();
           
        }
        void loadTSGDVDATECASE(string id, int gdv, string date)
         {
             gvDSTimeSheet.DataSource = tsdao.TSGDVDateClaim(date, gdv, id);
             gvDSTimeSheet.DataBind();
           
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {

            string ma = txtMaClaim.Text;
            string ngay = txtDate.Text;
            int maLA = int.Parse(drGDV.SelectedItem.Value.ToString());
            if (ngay == "" && ma == "" && maLA != 0)
            {
                loadTSTheoGDV(maLA);
            }
            if (ngay == "" && ma != "" && maLA == 0)
            {
                //txtMaClaim.Text = ma;
                LoadTSTheoThamchieu(ma);
            }
            if (ngay != "" && ma == "" && maLA == 0)
            {
                loadTSDate(ngay);
            }
            if (ngay != "" && ma != "" && maLA == 0)
            {
                loadTSCaseDate(ngay, ma);
            }
            if (ngay != "" & ma == "" && maLA != 0)
            {
                loadTSGDVDate(ngay, maLA);
            }
            if (ngay == "" && ma != "" && maLA != 0)
            {
                loadTSTheoGDVClaim(maLA, ma);
            }
            if (ngay != "" && ma != "" && maLA != 0)
            {
                loadTSGDVDATECASE(ma, maLA, ngay);
            }
            ////tablethem.Visible = false;
            //int idgdv = int.Parse(drGDV.SelectedItem.Value.ToString());            
            //string maclaim = txtMaClaim.Text;
            //if (maclaim != "" && idgdv==0)
            //{
            //    LoadTSTheoThamchieu(maclaim);
            //}
            //if (idgdv != 0 && maclaim=="")
            //    loadTSTheoGDV(idgdv);
            //if (idgdv != 0 && maclaim != "")
            //    loadTSTheoGDVClaim(idgdv, maclaim);
            
        }
        void LoadTSTheoThamchieu(string thamchieu)
        {
            //int idgdv = int.Parse(Session["MaGDV"].ToString());
            DataTable dt = new DataTable();
            dt = tsdao.TimeSheetTheoThamChieu(thamchieu);
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
                lblThongBaoDS.Visible = false;
            }
            else
            {
                //lblThongBaoDS.Text = "Chưa có cập nhật Diary của " + thamchieu + " này!";
                //lblThongBaoDS.Visible = true;
                Response.Write("<script>alert('Empty Timesheet!');</script>");
            }

        }
        void loadTSTheoGDV(int magdv)
        {
           // int mgdv = int.Parse(drGDV.SelectedItem.Value.ToString());
            DataTable dt = new DataTable();
            if (magdv != 0)
            {
                dt = tsdao.TimeSheetTheoMaGDV(magdv);
                if (dt.Rows.Count > 0)
                {
                    gvDSTimeSheet.DataSource = dt;
                    gvDSTimeSheet.DataBind();
                }
                else
                    Response.Write("<script>alert('Empty Timesheet!');</script>");
            }
        }
        void loadTSTheoGDVClaim(int magdv, string maclaim)
        {
            DataTable dt = new DataTable();
            dt = tsdao.TimesheetTheoGDVClaim(magdv, maclaim);
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
            }
            else
                Response.Write("<script>alert('Empty Timesheet!');</script>");
        }
        protected void LoadDSGDV()
        {

            int idgdv = int.Parse(Session["MaGDV"].ToString());
            DataTable dt = new DataTable();
            //dt = dr.DSTimeSheetTheoGDV(idgdv);
            if (dt.Rows.Count > 0)
            {
                gvDSTimeSheet.DataSource = dt;
                gvDSTimeSheet.DataBind();
                lblThongBaoDS.Visible = false;
            }
            else
            {
                lblThongBaoDS.Visible = true;
                lblThongBaoDS.Text = "Chưa cập nhật Diary!";
            }
        }
        protected void btnXem_Click(object sender, EventArgs e)
        {
            //LoadDSGDV();
            //txtMaClaim.Text = "";
            //tablethem.Visible = false;
            loadTSPending();
        }

        #region Xem_sau
        //protected void btnThem_Click(object sender, EventArgs e)
        //{
        //    string maclaim = txtMaThamChieu.Text;
        //    string thamchieu = cl.TenClaim(txtMaThamChieu.Text);
        //    if (thamchieu != null)
        //    {
        //        ctdto.MaGDV = int.Parse(Session["MaGDV"].ToString());
        //        ctdto.ThamChieu = thamchieu;
        //        ctdto.DienGiai = txtDienGiai.Text;
        //        ctdto.Ngay = txtNgay.Text;
        //        ctdto.ThoiLuongPhatSinh = float.Parse(txtPhatSinh.Text);
        //        ctdto.IdCongTacTimeSheet = drtype.SelectedValue.ToString();
        //        TimeSheetDAO tsdao = new TimeSheetDAO();
        //        bool kq = tsdao.ThemTimeSheet(ctdto);


        //        if (kq == true)
        //        {
        //            LoadTSCungVu(thamchieu);
        //            //them.Visible = false;
        //            danhsach.Visible = true;
        //            sua.Visible = false;
        //            string tengdv = Session["GDV"].ToString();
        //            #region BodysendLA
        //            string bodyGDV = "Xin chào   " + tengdv;
        //            bodyGDV += "<br/> Bạn vừa thêm 1 timesheet mới. <br/> Thông tin timesheet:<br/>";
        //            bodyGDV += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
        //                         " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                         " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
        //                        " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
        //            bodyGDV += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

        //            //bodyGDV += "<th width='10%'>Giám định viên</th>";
        //            bodyGDV += "<th width='10%'>Tham chiếu</th>";
        //            bodyGDV += "<th width='10%'>Type</th>";
        //            bodyGDV += "<th width='10%'>Ngày</th>";
        //            bodyGDV += "<th width='10%'>Thời lượng phát sinh</th>";
        //            bodyGDV += "<th width='10%'>Diễn giải</th>";
        //            bodyGDV += "</tr>";

        //            bodyGDV += "<tr style='text-align:center'>";
        //            //bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //            //" border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
        //            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtMaThamChieu.Text + "</td>";
        //            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + drtype.SelectedValue.ToString() + "</td>";
        //            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtNgay.Text + "</td>";
        //            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtPhatSinh.Text + "</td>";
        //            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtDienGiai.Text + "</td>";
        //            bodyGDV += "</tr>";
        //            bodyGDV += "</table>";
        //            #endregion
        //            #region BodyMailGiamDoc
        //            //timesheet gui giam doc
        //            string bodyGiamDoc = "Thông báo! ";
        //            bodyGiamDoc += "<br/>" + tengdv + " vừa thêm 1 timesheet mới. <br/> Thông tin timesheet:<br/>";
        //            bodyGiamDoc += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
        //                         " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                         " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
        //                        " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
        //            bodyGiamDoc += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

        //            bodyGiamDoc += "<th width='10%'>Giám định viên</th>";
        //            bodyGiamDoc += "<th width='10%'>Tham chiếu</th>";
        //            bodyGiamDoc += "<th width='10%'>Type</th>";
        //            bodyGiamDoc += "<th width='10%'>Ngày</th>";
        //            bodyGiamDoc += "<th width='10%'>Thời lượng phát sinh</th>";
        //            bodyGiamDoc += "<th width='10%'>Diễn giải</th>";
        //            bodyGiamDoc += "</tr>";

        //            bodyGiamDoc += "<tr style='text-align:center'>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtMaThamChieu.Text + "</td>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + drtype.SelectedValue.ToString() + "</td>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtNgay.Text + "</td>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtPhatSinh.Text + "</td>";
        //            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtDienGiai.Text + "</td>";
        //            bodyGiamDoc += "</tr>";
        //            bodyGiamDoc += "</table>";
        //            #endregion
        //            GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        //            DataTable dt = new DataTable();
        //            string sTo = "";
        //            int magdv = int.Parse(Session["MaGDV"].ToString());
        //            dt = gdvdao.GiamDinhVienTheoMa(magdv);
        //            if (dt.Rows.Count > 0)
        //            {
        //                DataRow dr = dt.Rows[0];
        //                sTo = dr[3].ToString();
        //            }

        //            sendMail(sTo, bodyGDV);
        //            sendMail("hoalyli@gmail.com", bodyGiamDoc);

        //            lblThongBao.Text = "Đã send mail!!";
        //            float time = tsdao.ThoiLuongPhatSinhTheoCliam(thamchieu);
        //            bool ktw = wrdao.KiemTraWR(maclaim);
        //            if (ktw == true)
        //            {
        //                wrdao.CapNhatGioTichLuy(maclaim, time);
        //            }
        //            loadform();

        //        }
        //        else
        //            lblThongBao.Text = "Fail!";
        //    }
        //}
        //void loadform()
        //{
        //    txtMaThamChieu.Text = "";
        //    txtDienGiai.Text = "";
        //    txtPhatSinh.Text = "";

        //}
        //public void sendMail(string sTo, string sBody)
        //{
        //    string to = sTo;
        //    string from = "hoalyli@gmail.com";//mail của web
        //    string subject = "Thông báo từ web Savvy ";
        //    string body = sBody;
        //    string sFileName = string.Empty;
        //    string server = "smtp.gmail.com";
        //    string port = "587";//465 587
        //    string user = from;
        //    string pass = "dinhthihue";//pass của mail ở trên
        //    String[] addr = to.Split(',');
        //    System.Net.Mail.SmtpClient smtp = new SmtpClient();
        //    System.Net.Mail.MailMessage msg = new MailMessage();
        //    msg.IsBodyHtml = true;
        //    smtp.Port = Int32.Parse(port);
        //    smtp.EnableSsl = true;//chứng thực việc gửi mail
        //    //smtp.Host = "smtp.gmail.com";//Sử dụng SMTP của gmail 
        //    smtp.Host = server;
        //    smtp.Credentials = new NetworkCredential(user, pass);//user name , password cua mail gui
        //    try
        //    {
        //        if (from.Length > 0 && to.Length > 0 && subject.Length > 0 && body.Length >= 0)
        //        {
        //            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");//kiem tra tinh hop le cua mail
        //            msg.From = new MailAddress(from, "Savvy App", System.Text.Encoding.UTF8);
        //            Byte i;
        //            for (i = 0; i < addr.Length; i++)
        //            {
        //                bool result = regex.IsMatch(addr[i]);
        //                if (result == false)
        //                {
        //                    //lblError.Visible = true;
        //                    //lblError.Text = "Địa chỉ email nhận:" + sTo + " không hợp lệ.";
        //                    //Response.Write("<script> alert ('Mail Nhan" + sTo + "ko hop le!');</script>");
        //                    lblThongBao.Text = "Error send mail or wrong mail!";
        //                }
        //                else
        //                {
        //                    msg.To.Add(addr[i]);
        //                    msg.Subject = subject;
        //                    msg.Body = body;
        //                    msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
        //                    msg.ReplyTo = new MailAddress(addr[i]);
        //                    smtp.Send(msg);
        //                    //Response.Flush();
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblThongBao.Text = ex.Message;
        //    }
        //}
        //protected void btnSua_Click(object sender, EventArgs e)
        //{
        //    ctdto.ID = int.Parse(txtId.Text);
        //    ctdto.ThamChieu = txtThamChieuS.Text;
        //    ctdto.IdCongTacTimeSheet = drType1.SelectedValue.ToString();
        //    ctdto.Ngay = txtNgayS.Text;
        //    ctdto.DienGiai = txtDienGiaiS.Text;
        //    ctdto.ThoiLuongPhatSinh = float.Parse(txtPhatSinhS.Text);
        //    TimeSheetDAO tsdao = new TimeSheetDAO();
        //    tsdao.SuaTimeSheet(ctdto);
        //    sua.Visible = false;
        //    LoadDS();
        //    string tengdv = Session["GDV"].ToString();
        //    string body = "Xin chào   " + tengdv;
        //    body += "<br/> Bạn vừa cập nhật một timesheet. <br/> Thông tin timesheet:<br/>";
        //    body += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
        //                 " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //                 " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
        //                " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
        //    body += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

        //    body += "<th width='10%'>Giám định viên</th>";
        //    body += "<th width='10%'>Tham chiếu/<br />passport</th>";
        //    body += "<th width='10%'>Type</th>";
        //    body += "<th width='10%'>Ngày</th>";
        //    body += "<th width='10%'>Thời lượng phát sinh</th>";
        //    body += "<th width='10%'>Diễn giải</th>";
        //    body += "</tr>";

        //    body += "<tr style='text-align:center'>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtThamChieuS.Text + "</td>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + drType1.SelectedValue.ToString() + "</td>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtNgayS.Text + "</td>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtPhatSinhS.Text + "</td>";
        //    body += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
        //        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + txtDienGiaiS.Text + "</td>";
        //    body += "</tr>";
        //    body += "</table>";

        //    int idgdv = int.Parse(Session["MaGDV"].ToString());
        //    GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        //    DataTable dt = new DataTable();
        //    string sTo = "";
        //    dt = gdvdao.GiamDinhVienTheoMa(idgdv);
        //    if (dt.Rows.Count > 0)
        //    {
        //        DataRow dr = dt.Rows[0];
        //        sTo = dr[3].ToString();
        //    }

        //    sendMail(sTo, body);
        //    Response.Write("<script> alert ('Đã gửi thông tin đến mail của bạn');</script>");
        //    LoadDS();
        //}

        //protected void gvDSTimeSheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvDSTimeSheet.PageIndex = e.NewPageIndex;
        //    LoadDSGDV();
        //} 
        #endregion
        double tongtime = 0;
        double timeissue = 0;
  
        protected void gvDSTimeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tongtime += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThoiLuongPhatSinh"));
                timeissue += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "TimeIssue"));

                e.Row.Attributes.Add("id_timesheet", DataBinder.Eval(e.Row.DataItem, "ID_TimeSheet").ToString());
                e.Row.Attributes.Add("id_thamchieu", DataBinder.Eval(e.Row.DataItem, "ThamChieu").ToString());
                //e.Row.Attributes.Add("id_gdv", DataBinder.Eval(e.Row.DataItem, "ID_GDV").ToString());
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";

                    e.Row.Cells[6].Text = tongtime.ToString();
                    e.Row.Cells[7].Text = timeissue.ToString();
                    e.Row.Cells[6].HorizontalAlign = e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }

        }
        ClaimDAO cldao = new ClaimDAO();
        private void ExportToExcel(string strFileName, GridView gv)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gv.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();


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
            gvDSTimeSheet.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        
        public static void WriteAttachment(string FileName, string FileType, string content) 
        { 
            HttpResponse Response = System.Web.HttpContext.Current.Response; Response.ClearHeaders(); 
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName); 
            Response.ContentType = FileType; Response.Write(content); 
            Response.End(); 
        }

        protected void btnSummaryTS_Click(object sender, EventArgs e)
        {
            string id = txtMaClaim.Text;
            Session["IDclaim"] = id;
            Response.Write("<script>window.parent.location = '../Pages/timesheetsummary.aspx'</script>");
        }
        GiamDinhVienDAO gdvdao= new GiamDinhVienDAO();
        protected void gvDSTimeSheet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (this.IsPostBack)
            {//string ma = lblID_Claim.Text;
                DataTable dt = new DataTable();
                int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                dt = gdvdao.CheckManager(magdv);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    int cv = int.Parse(dr[0].ToString());
                    if (cv != 2)
                    {
                        Response.Write("<script> alert('Sorry, You haven't permission to delete timesheet!');</script>");
                    }
                    else
                    {
                        int mats = int.Parse(gvDSTimeSheet.DataKeys[e.RowIndex].Value.ToString());
                        bool up = tsdao.XoaTimeSheet(mats);
                        if (up == true)
                        {
                            int idgdv = int.Parse(drGDV.SelectedItem.Value.ToString());
                            string maclaim = txtMaClaim.Text;
                            if (maclaim != "" && idgdv == 0)
                            {
                                LoadTSTheoThamchieu(maclaim);
                            }
                            if (idgdv != 0 && maclaim == "")
                                loadTSTheoGDV(idgdv);
                            if (idgdv != 0 && maclaim != "")
                                loadTSTheoGDVClaim(idgdv, maclaim);
                        }
                        else
                            Response.Write("<script> alert('Delete faile!');</script>");
                    }
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static bool UpdateRowIndex(String str)
        {
            try
            {
                //Thread.Sleep(4000);

                TimeSheetDAO dao = new TimeSheetDAO();
                IDictionary<int, String> myDic = new Dictionary<int, String>();

                String[] strData = str.Split(',');
                for (int i = 0; i < strData.Length; i++)
                {
                    String[] strObj = strData[i].Split(':');
                    myDic.Add(int.Parse(strObj[0].Trim()), strObj[1].Trim());
                }

                dao.UpdateRowIndex(myDic);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

       
     
    }
}