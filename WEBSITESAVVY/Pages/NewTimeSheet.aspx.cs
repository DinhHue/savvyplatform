using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
namespace WEBSITESAVVY.Pages
{
    public partial class NewTimeSheet : System.Web.UI.Page
    {
        
        ClaimDAO cl = new ClaimDAO();
        WeeklyReportDAO wr = new WeeklyReportDAO();
        SendMailDAO smdao = new SendMailDAO();
        CongTacTimeSheetDAO cttsdao = new CongTacTimeSheetDAO();
        TimeSheetDAO tsdao = new TimeSheetDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                 HttpCookie ck = Request.Cookies["MaGDV"];
                 if (ck != null)
                 {                
                //if (Session["GDV"] != null)
                //{
                    //string tenGDV = Session["GDV"].ToString();
                    string tenGDV=gdvdao.LayTenTheoMa(int.Parse(Request.Cookies["MaGDV"].Value));
                    lbllThongBao.Visible = false;
                    lblThongBaoThem.Visible = false;
                    //txtNgay.Text = DateTime.Today.Date.ToShortDateString();                
                    lblGiamDinhVien.Text = tenGDV;
                    loadTheLoai();
                }
                else
                    Response.Redirect("~/Pages/Longin.aspx");
            }
        }
        void loadTheLoai()
        {
            drDienGiai.DataSource = cttsdao.DanhSachCongTac();
            drDienGiai.DataValueField = "Ma";
            drDienGiai.DataTextField = "CongTac";
            drDienGiai.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                TimeSheetDTO tsdto = new TimeSheetDTO();
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                tsdto.MaGDV = maGDV;
                string tengdv = lblGiamDinhVien.Text;
                string maclaim = txtThamChieu.Text;
                bool kt = cl.KiemTraThamChieu(maclaim);
                float h=0;
                if(txtSoGio.Text!=""&& float.TryParse(txtSoGio.Text, out h))
                {
                         string diengiai = txtDienGiaiChiTiet.Text; ;
                   // string diengiaidetail = txtDienGiaiChiTiet.Text;
                    string loaidiengiai = "";
                    if (diengiai != "")
                        tsdto.DienGiai = diengiai;
                    else
                        tsdto.DienGiai = "";
                    if (kt == true)
                    {
                        tsdto.ThamChieu = maclaim;
                        tsdto.Ngay = txtNgay.Text;
                        tsdto.IdCongTacTimeSheet = drDienGiai.SelectedItem.Value.ToString();
                        loaidiengiai = drDienGiai.SelectedItem.ToString();
                        tsdto.ThoiLuongPhatSinh = float.Parse(txtSoGio.Text);
                        tsdto.GioThuc = DateTime.Now;
                        bool them = tsdao.ThemTimeSheet(tsdto);
                        if (them == true)
                        {
                            float time = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            wr.CapNhatGioTichLuy(maclaim, time);
                            //int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                            string noidung = gdv.LayTenTheoMa(maGDV) + " created a timesheet of case " + txtThamChieu.Text + " .";
                            SaveLogTracking(maGDV, noidung, txtThamChieu.Text);
                            #region KiemTra_GuiMail
                            float gio = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            bool updw = wr.CapNhatGioTichLuy(maclaim, gio);
                            #region BodysendLA
                            string bodyGDV = "Xin chào   " + tengdv;
                            bodyGDV += "<br/> Bạn vừa cập nhật TimeSheet mới. <br/> Thông tin TimeSheet:<br/>";
                            bodyGDV += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
                                         " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                         " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
                                        " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
                            bodyGDV += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

                            //bodyGDV += "<th width='10%'>Giám định viên</th>";
                            bodyGDV += "<th width='10%'>Tham chiếu</th>";
                            bodyGDV += "<th width='10%'>Ngày</th>";
                            bodyGDV += "<th width='25%'>Diễn giải</th>";
                            bodyGDV += "<th width='25%'>Chi tiết</th>";
                            bodyGDV += "<th width='10%'>Số giờ</th>";

                            bodyGDV += "</tr>";
                            bodyGDV += "<tr style='text-align:center'>";

                            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.ThamChieu + "</td>";
                            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.Ngay + "</td>";
                            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + loaidiengiai + "</td>";
                            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                              " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + diengiai + "</td>";
                            bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.ThoiLuongPhatSinh + "</td>";

                            bodyGDV += "</tr>";
                            bodyGDV += "</table>";
                            #endregion
                            #region BodyMailGiamDoc
                            //timesheet gui giam doc
                            string bodyGiamDoc = "Thông báo! ";
                            bodyGiamDoc += "<br/>" + tengdv + " vừa cập nhật TimeSheet mới. <br/> Thông tin Timesheet :<br/>";
                            bodyGiamDoc += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
                                         " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                         " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
                                        " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
                            bodyGiamDoc += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

                            bodyGiamDoc += "<th width='20%'>LA</th>";
                            bodyGiamDoc += "<th width='10%'>Reference</th>";
                            bodyGiamDoc += "<th width='10%'>Date Update</th>";
                            bodyGiamDoc += "<th width='10%'>Date</th>";
                            bodyGiamDoc += "<th width='30%'>Description</th>";
                            bodyGiamDoc += "<th width='10%'>Time-Spent</th>";

                            bodyGiamDoc += "</tr>";

                            bodyGiamDoc += "<tr style='text-align:center'>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                               " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.ThamChieu + "</td>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                               " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.GioThuc + "</td>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.Ngay + "</td>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + diengiai + "</td>";
                            bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.ThoiLuongPhatSinh + "</td>";
                            bodyGiamDoc += "</tr>";
                            bodyGiamDoc += "</table>";
                            #endregion
                            string sTo = "";
                            int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                            GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
                            DataTable dt = new DataTable();

                            dt = gdvdao.GiamDinhVienTheoMa(idgdv);
                            if (dt.Rows.Count > 0)
                            {
                                DataRow dr = dt.Rows[0];
                                sTo = dr[3].ToString();
                            }
                            string ktmgdv = "", ktmgiamdoc = "";
                            int month = int.Parse(DateTime.Now.Month.ToString());
                            //ktmgiamdoc = smdao.KiemTraMailChinh("savvyadjus@gmail.com", bodyGiamDoc, "Thông báo TimeSheet của tháng " + month);
                            //ktmgiamdoc = smdao.KiemTraMailChinh("sonpham@savvyadjusters.vn", bodyGiamDoc, "Thông báo TimeSheet của tháng " + month);
                            //ktmgdv = smdao.KiemTraMailChinh(sTo, bodyGDV, "Thông báo cập nhật TimeSheet");
                            Send_Email("savvyadjus@gmail.com", sTo, "Thông báo timesheet mới", bodyGiamDoc, "savvyadjus@gmail.com,hoalyli@gmail.com");
                            //if (updw == true && ktmgdv != "" && ktmgiamdoc != "")
                            //{
                            //    //Response.Redirect("~/Pages/DiaRy.aspx");
                            //    //Response.Write("<script>alert('Updated!');</script>");
                            //    Response.Redirect(Request.Url.PathAndQuery, true);
                            //}
                            #endregion
                            //Response.Write("<script>alert('Đã thêm!');</script>");
                        }
                    } 
                }
                else
                    Response.Write("<script>alert('Nhập sai định dạng giờ lẻ!');</script>");
            }

        }
        void SaveLogTracking(int maGDV, string noidung, string maclaim)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = maGDV;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = maclaim;
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
        #region Testmailwithattach
        //public string Send_Email_With_BCC_Attachment(string SendTo, string SendBCC, string SendFrom, string Subject, string Body, string AttachmentPath)
        //{
        //    try
        //    {
        //        System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
        //        string from = SendFrom;
        //        string to = SendTo; //Danh sách email được ngăn cách nhau bởi dấu “;” 
        //        string subject = Subject;
        //        string body = Body;
        //        string bcc = SendBCC;
        //        bool result = true;
        //        String[] ALL_EMAILS = to.Split(';');
        //        foreach (string emailaddress in ALL_EMAILS)
        //        {
        //            result = regex.IsMatch(emailaddress);
        //            if (result == false)
        //            {
        //                return "Địa chỉ email không hợp lệ.";
        //            }
        //        }
        //        if (result == true)
        //        {
        //            try
        //            {
        //                MailMessage em = new MailMessage(from, to, subject, body);
        //                Attachment attach = new Attachment(AttachmentPath);
        //                em.Attachments.Add(attach);
        //                em.Bcc.Add(bcc);

        //                System.Net.Mail.SmtpClient smtp = new SmtpClient();
        //                smtp.Host = "smtp.gmail.com";//Ví dụ xử dụng SMTP của gmail 
        //                smtp.Send(em);

        //                return "";
        //            }
        //            catch (Exception ex)
        //            {
        //                return ex.Message;
        //            }
        //        }
        //        else
        //        {
        //            return "";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}  
        #endregion
        void Checkbeforesendmail(string SendTo,string body, string tieude, string mailcc)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

            client.EnableSsl = true;

            MailAddress from = new MailAddress("savvyadjus@gmail.com", "Timesheet");

            MailAddress to = new MailAddress(SendTo, "LA");

            MailMessage message = new MailMessage(from, to);

            message.Body = body;

            message.Subject = tieude;
            message.CC.Add(mailcc);
            NetworkCredential myCreds = new NetworkCredential("savvyadjus@gmail.com", "AsZx0808", "");

            client.Credentials = myCreds;
            message.IsBodyHtml = true; 
            try
            {

                client.Send(message);

            }
            catch (Exception ex)
            {

                //txtResult.Text += "Exception is:" + ex.ToString();

            }
        }
        public string Send_Email(String SendFrom,string SendTo, string Subject, string Body, string cc) 
       {  
           try 
           {
               
               System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");                  
               bool result = regex.IsMatch(SendTo); 
               if (result == false) 
               { 
                   return "Địa chỉ email không hợp lệ."; 
               } 
               else 
               {
                   Checkbeforesendmail(SendTo,Body,Subject,cc);
                   //System.Net.Mail.SmtpClient smtp = new SmtpClient(); 
                   //System.Net.Mail.MailMessage msg = new MailMessage(SendFrom,SendTo,Subject,Body); 
                   //msg.IsBodyHtml = true; 
                   //smtp.Host = "smtp.gmail.com";//Sử dụng SMTP của gmail 
                   //smtp.Send(msg); 
                   return "Email đã được gửi đến: " + SendTo + "."; 
               } 
           } 
           catch 
           {
               return ""; 
           } 
       }  
    }
}