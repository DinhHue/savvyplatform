using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
using System.Net.Mail;
using System.Net;
namespace WEBSITESAVVY.DAO
{
    public class SendMailDAO 
    {
        public string SendNewClaim(ClaimDTO cl, KhachHangDTO kh, string dv, string tengdv)
        {
            string body = "Thông tin vụ mới " + cl.TenClaim + "\n";
            body+="<br/>1.  Tham chiếu SAVVY: "+cl.TenClaim;
            body+="<br/>2.  Giám định viên thụ lý: "+tengdv;
            body+="<br/>3.  Đơn vị bảo hiểm: "+ dv;
            body+="<br/>4.  Người được bảo hiểm: "+kh.TenKhachHang;
            body+="<br/>5.  Ngày chỉ định: "+ cl.AssignedDate;
            body += "<br/>";
            body += "<br/>Thông tin sẽ được cập nhật sau khi Giám định viên đi công tác hiện trường hoặc thông tin được cung cấp từ nhà bảo hiểm!";
            string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinh(sto, body, "New Claim "+cl.TenClaim+" - "+ kh.TenKhachHang,"New Claim");
            

        }
        public string CapNhatInfoBasic(ClaimDTO cl, KhachHangDTO kh)
        {
            string body = "Thông báo cập nhật ! " + "\n";
            body += "<br/>1.  Reference: " + cl.TenClaim;
            body += "<br/>2.	Policy number: " + cl.PolicyNo;
            body += "<br/>3.	Địa điểm tốn thất: " + cl.Premises;
            body += "<br/>4.	Người được bảo hiểm: " + kh.TenKhachHang;
            body += "<br/>5.	Địa chỉ: " + kh.DiaChi;
            body += "<br/>6.	Người liên hệ: " + kh.TenNguoiDaiDien;
            body += "<br/>7.	Email: " + kh.Email;
            body += "<br/>8.	Phone: " + kh.DienThoai;
            body += "<br/>9.	Fax: " + kh.Fax;           
            body += "<br/>10.	Effective: " + cl.Effective;
            body += "<br/>11.	Date of loss: " + cl.Dol;
            string sto = "savvyadjus@gmail.com";
            //string sto = "hoalyli@gmail.com";
            return KiemTraMailChinh(sto, body, "Update Basic Information of Claim " + cl.MaClaim, "Claim_CoverInfor");
        }
        public string CapNhatInfoBasicPR(ClaimDTO cl, KhachHangDTO kh)
        {
            string body = "Thông báo cập nhật thông tin chung : PR_" + cl.TenClaim + "\n";
            body += "<br/>1.    Previous report: " + cl.ILADATE;
            body += "<br/>2.	Policy number: " + cl.PolicyNo;
            body += "<br/>3.	Date of loss: " + cl.Dol;
            body += "<br/>4.	Cause of loss: " + cl.SortCause;
            body += "<br/>5.	Extend of loss: " + cl.PhamViTonThat;
            body += "<br/>6.	Name policy: " + cl.NamePolicy;
            body += "<br/>7.	Sum insured: " + cl.SumInsured;
            body += "<br/>8.	Effective: " + cl.Effective;
            body += "<br/>9.	Deductible: " + cl.MucMienThuong;
            body += "<br/>10.	Extension Clause: " + cl.DKBS;
            body += "<br/>11.	Insured's claim: " + cl.KhieuNai;
            body += "<br/>12.	Interim reserve: " + cl.DuPhongBoiThuong;
            body += "<br/>13.	Trade: " + kh.LinhVucKinhDoanh;
            string sto = "savvyadjus@gmail.com";
            //string sto = "hoalyli@gmail.com";
            return KiemTraMailChinh(sto, body, "Update Basic Information of Claim " + cl.MaClaim, "Claim_CoverInfor");
        }
        public string CapNhatInfoBasicFR(ClaimDTO cl)
        {
            string body = "Thông báo cập nhật thông tin chung : FR_" + cl.TenClaim + "\n";
            body += "<br/>1.    Previous report: " + cl.BaoCaoTruocFR;
            body += "<br/>2.	Accept loss amount: " + cl.ThietHaiHopLy;
            body += "<br/>3.	Coverablle amount: " + cl.TonThatHopLe;
            body += "<br/>4.	Less savalge: " + cl.TruGiaTriThuHoi;
            body += "<br/>5.	Interim payment: " + cl.TamUngBoiThuong;
            body += "<br/>6.	Les deductible: " + cl.TruMienThuong;
            body += "<br/>7.	Proposed settlemt: " + cl.BoiThuong;            
            string sto = "savvyadjus@gmail.com";
            //string sto = "hoalyli@gmail.com";
            return KiemTraMailChinh(sto, body, "Update Basic Information of Claim " + cl.MaClaim, "Claim_CoverInfor");
        }
        #region KiemTramailchinh
        public string KiemTraMailChinh(string sTo, string sBody, string subject, string namemail)
        {
            string to = sTo;
            string from = "admin@savvyadjusters.com";//mail của web
            //string from = "savvyadjus@gmail.com";
            //string subject = "Thông báo từ web Savvy ";
            string body = sBody;
            string sFileName = string.Empty;
            string server = "webmail.savvyadjusters.com";//string server = "smtp.gmail.com";
            string port = "25";//string port = "587";//465 587
            string user = from;
            string pass = "SA@ADMIN_HD";//pass của mail ở trên AsZx0808
            String[] addr = to.Split(',');
            System.Net.Mail.SmtpClient smtp = new SmtpClient();
            System.Net.Mail.MailMessage msg = new MailMessage();
            msg.IsBodyHtml = true;
            smtp.Port = Int32.Parse(port);
            smtp.EnableSsl = false;//chứng thực việc gửi mail - true
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            //smtp.Host = "smtp.gmail.com";//Sử dụng SMTP của gmail 
            smtp.Host = server;
            smtp.Credentials = new NetworkCredential(user, pass);//user name , password cua mail gui
            string thongbao = "";
            try
            {
                if (from.Length > 0 && to.Length > 0 && subject.Length > 0 && body.Length >= 0)
                {
                    System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");//kiem tra tinh hop le cua mail
                    msg.From = new MailAddress(from, namemail, System.Text.Encoding.UTF8);
                    Byte i;
                    for (i = 0; i < addr.Length; i++)
                    {
                        bool result = regex.IsMatch(addr[i]);
                        if (result == false)
                        {
                            //lblError.Visible = true;
                            //lblError.Text = "Địa chỉ email nhận:" + sTo + " không hợp lệ.";
                            //Response.Write("<script> alert ('Mail Nhan" + sTo + "ko hop le!');</script>");
                            thongbao = "Error send mail or wrong mail!";
                        }
                        else
                        {
                            msg.To.Add(addr[i]);
                            msg.Subject = subject;
                            msg.Body = body;                           
                            msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                            msg.ReplyTo = new MailAddress(addr[i]);
                            smtp.Send(msg);
                            //Response.Flush();
                            thongbao = "oke";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                thongbao = ex.Message;
            }
            return thongbao;
        }
        public string KiemTraMailChinhCC(string sTo, string sBody, string subject, string namemail, string mailcc)
        {
            string to = sTo;
            string from = "admin@savvyadjusters.com";//mail của web
            //string from = "savvyadjus@gmail.com";
            //string subject = "Thông báo từ web Savvy ";
            string body = sBody;
            string sFileName = string.Empty;
            string server = "webmail.savvyadjusters.com";//string server = "smtp.gmail.com";
            string port = "25";//string port = "587";//465 587
            string user = from;
            string pass = "SA@ADMIN_HD";//pass của mail ở trên AsZx0808
            String[] addr = to.Split(',');
            System.Net.Mail.SmtpClient smtp = new SmtpClient();
            System.Net.Mail.MailMessage msg = new MailMessage();
            msg.IsBodyHtml = true;
            smtp.Port = Int32.Parse(port);
            smtp.EnableSsl = false;//chứng thực việc gửi mail - true
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            //smtp.Host = "smtp.gmail.com";//Sử dụng SMTP của gmail 
            smtp.Host = server;
            smtp.Credentials = new NetworkCredential(user, pass);//user name , password cua mail gui
            string thongbao = "";
            try
            {
                if (from.Length > 0 && to.Length > 0 && subject.Length > 0 && body.Length >= 0)
                {
                    System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");//kiem tra tinh hop le cua mail
                    msg.From = new MailAddress(from, namemail, System.Text.Encoding.UTF8);
                    Byte i;
                    for (i = 0; i < addr.Length; i++)
                    {
                        bool result = regex.IsMatch(addr[i]);
                        if (result == false)
                        {
                            //lblError.Visible = true;
                            //lblError.Text = "Địa chỉ email nhận:" + sTo + " không hợp lệ.";
                            //Response.Write("<script> alert ('Mail Nhan" + sTo + "ko hop le!');</script>");
                            thongbao = "Error send mail or wrong mail!";
                        }
                        else
                        {
                            msg.To.Add(addr[i]);
                            msg.Subject = subject;
                            msg.Body = body;
                            msg.CC.Add(mailcc);
                            msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                            msg.ReplyTo = new MailAddress(addr[i]);
                            smtp.Send(msg);
                            //Response.Flush();
                            thongbao = "oke";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                thongbao = ex.Message;
            }
            return thongbao;
        } 
        #endregion
        public string sendNoiDungClaim(string namemail,string tengdv, string text, string parthead, string mathamchieu)
        {
            string body = "<p>Thông báo cập nhật claim!<p>";
            body += "<br/> Vào lúc "+DateTime.Now+" Giám định viên "+ tengdv+" Cập nhật nội dung của phần "+parthead+";";
            body += "<br/> Nội dung như sau :";
            body += "<br/>";
            body += "<br/> "+text ;
            //string sto = "sa.team@savvyadjusters.vn";
            string sto = "savvyadjus@gmail.com";
            //string master = "savvyadjus@gmail.com";
            //string master = "admin@savvyadjusters.com";
            
            //KiemTraMailChinh(master, body, "Thông báo cập nhật vụ " + mathamchieu,namemail);
            return KiemTraMailChinhCC(sto, body, "Thông báo cập nhật vụ " + mathamchieu, namemail,"huedinh@savvyadjusters.vn");
        }
      
        public string ThongBaoClaimHandlingSummary(string namemail,string ten,string email, string noidung,string mathamchieu, string brief)
        {
            string body = "Bạn được "+ten+" nhắc đến trong cập nhật Claim handling summary của "+mathamchieu+" - "+ brief;
            body += "<br/>";
            body += "<br/> Nội dung như sau :";
            body += "<br/>";
            body += "<br/> " + noidung;
            body += "<br/>";
           
           //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinhCC(email, body, "Thông báo cập nhật Claim Handling Summary " + mathamchieu, namemail, "savvyadjus@gmail.com");
        }
        public string ThongBaoThaoLuan(string namemail,string ten, string email, string noidung, string mathamchieu, string brief)
        {
            string body = "Bạn được " + ten + " nhắc đến trong Thảo luận của vụ " + mathamchieu + " - " + brief;
            body += "<br/>";
            body += "<br/> Nội dung như sau :";
            body += "<br/>";
            body += "<br/> " + noidung;
            body += "<br/>";

            //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinhCC(email, body, "Thông báo cập nhật Claim Handling Summary " + mathamchieu, namemail, "savvyadjus@gmail.com");
        }
        public string ThongBaoMemos(string namemail,string ten, string email, string noidung, string brief)
        {
            string body = ten + " muốn bạn đọc memos: " + brief;
            body += "<br/>";
            body += "<br/> Nội dung như sau :";
            body += "<br/>";
            body += "<br/> " + noidung;
            body += "<br/>";

            //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinh(email, body, "Memos_" + brief, namemail);
        }
        
        public string ThongBaoTask(string namemail,string ten, string email, string noidung, string brief, string deadline)
        {
            string body = "Dear Partner,";
            body += "<br/>";
            body += "<br/>";
            body += "<br/>";
            body += ten + " Muốn bạn hỗ trợ vụ: " + brief;
            body += "<br/>";
            body += "<br/> Cụ thể như sau :";
            body += "<br/>";
            body += "<br/> " +"***" +noidung+"***";
            body += "<br/>";
            body += "<br/> Hạn hoàn thành vào: " + deadline;
            body += "<br/>";
            body += "<br/> Nêu không thể thực hiện hoặc hoàn thành kịp Deadline, bạn vui lòng liên hệ sớm " + ten+" để được hổ trợ kịp thời";
            body += "<br/>";
            body += "<br/>";
            body += "<br/> Cheers, ";

            //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinh(email, body, "Task to do " + brief, namemail);
        }
        public string BoTask(string namemail, string ten, string email, string brief, string noidung)
        {
            string body = "Dear Partner,";
            body += "<br/>";
            body += "<br/>";
            body += "<br/>";
            body += ten + " need another LA to support case: " + brief+" - "+noidung+", so you don't need interest more, Thank for help!";
            body += "<br/>";
            body += "<br/>";
            body += "<br/> Cheers, ";

            //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinh(email, body, "Task to do " + brief, namemail);
        }
        public string CapNhatTask(string namemail, string ten, string email, string brief, string noidung, DateTime deadline)
        {
            string body = "Dear Partner,";
            body += "<br/>";
            body += "<br/>";
            body += "<br/>";
            body += ten + " đã cập nhật lại task đã giao cho bạn: " + brief + " với nội dung: " + noidung + " với hạn hoàn thành vào ngày : "+ deadline.ToShortDateString();
            body += "<br/>";
            body += "<br/>";
            body += "<br/> Cheers, ";

            //string sto = "savvyadjus@gmail.com";
            return KiemTraMailChinh(email, body, "Task to do " + brief, namemail);
        }
        public string khoiPhucMatKhau(string namemail,string email, string link)
        {
            string body = "Bạn vừa yêu cầu khôi phục lại mật khẩu!";
            body += "<br/> Vui lòng theo đường link bên dưới và cập nhật lại mật khẩu mới.";
            body += "<br/>" + link;
            string sto = email;
            return KiemTraMailChinh(sto, body, "Thay đổi mật khẩu", namemail);
        }
        public void QuickSendMail(string namemail,string tomail, string body, string title)
        {
            
            SmtpClient smtpClient = new SmtpClient(namemail, 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("admin@savvyadjusters.com", "SA@ADMIN_HD");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            //MailMessage mail = new MailMessage();

            MailMessage mail = new MailMessage("savvyadjus@gmail.com", tomail, title, body);
            SmtpClient SMTPServer = new SmtpClient("127.0.0.1");
            try
            {
                SMTPServer.Send(mail);
                mail.From = new MailAddress("admin@savvyadjusters.com", namemail);
                mail.To.Add(new MailAddress("savvyadjus@gmail.com"));
                mail.To.Add(new MailAddress(tomail));
                //mail.CC.Add(new MailAddress("sonpham@savvyadjusters.vn"));
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                
            }
        }
        void Checkbeforesendmail(string SendTo, string body, string tieude, string mailcc)
        {
            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            SmtpClient client = new SmtpClient("webmail.savvyadjusters.com", 25);
            client.EnableSsl = true;

            MailAddress from = new MailAddress("admin@savvyadjusters.com", "Task-to-do");

            MailAddress to = new MailAddress(SendTo, "LA");

            MailMessage message = new MailMessage(from, to);

            message.Body = body;

            message.Subject = tieude;
            message.CC.Add(mailcc);
            //NetworkCredential myCreds = new NetworkCredential("savvyadjus@gmail.com", "AsZx0808", "");
            client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            client.Credentials = new NetworkCredential("admin@savvyadjusters.com", "SA@ADMIN_HD");
            //client.Credentials = myCreds;
            client.Timeout = 20000;
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
        public string Send_Email(String SendFrom, string SendTo, string Subject, string Body, string cc)
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
                    Checkbeforesendmail(SendTo, Body, Subject, cc);
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

        public string Send_Email_Task(string SendTo, string Subject, string Body, string cc)
        {
            try
            {
                return KiemTraMailChinhCC(SendTo, Body, Subject, "Task-to-do", cc);
            }
            catch
            {
                return "";
            }
        }
        public string TaskComplete(string namemail, string ten,string email, string noidung, string mavu)
        {
            string body = "Dear " + ten + ",";
            body += "<br/>";
            body += "<br/>";
            body += "<br/> Your task of Case  " + mavu +" was completed.";
            body += "<br/>";
            body += "<br/> Content: " + noidung + ".";
            body += "<br/>";
            body += "<br/> You can check the result your task.";
            body += "<br/>";
            body += "<br/>";
            body += "<br/>Cheers,";
            return KiemTraMailChinh(email, body, "Task to do " + mavu, namemail);
        }

    }
}