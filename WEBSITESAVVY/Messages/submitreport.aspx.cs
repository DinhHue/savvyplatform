using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Messages
{
    public partial class submitreport : System.Web.UI.Page
    {
        DAILYDTO dldto = new DAILYDTO();
        GiamDinhVienDAO gdv= new GiamDinhVienDAO();
        ClaimDAO cl= new ClaimDAO();
        SendMailDAO sendmail = new SendMailDAO();
        DaiLyDAO dldao = new DaiLyDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["ThamChieu"].ToString() != null)
                {
                    loadGDV();
                    string id = Session["ThamChieu"].ToString();
                    loadTB(id);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('"+ex.Message+"');</script>");
            }
        }
         void loadGDV()
        {
            if (!this.IsPostBack)
            {
                drDSGDV.DataSource = gdv.DanhSachGiamDinhVien();
                drDSGDV.DataTextField = "TenGDV";
                drDSGDV.DataValueField = "ID_GDV";
                drDSGDV.DataBind();
              
            }
        }
         void loadTB(string id)
         {
             if (dldao.LayThongBao("SR01", id) != null)
             {
                 DataRow dr = dldao.LayThongBao("SR01", id);
                 txtThongBao.Text = dr["DienGiai"].ToString();
                 txtNgay.Text = dr["Ngay"].ToString();
                 lblGDV.Text = dr["TenGDV"].ToString();
             }
         }
        string GetName()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            return gdv.LayMaTen(maGDV);
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
             if (Session["ThamChieu"] != null && Request.Cookies["MaGDV"] !=null)
            {
                string idclaim = Session["ThamChieu"].ToString();
                int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                dldto.MaGDV = magdv;
                dldto.MaClaim = idclaim;               
                string diengiai = txtNoiDung.Text;
                if (diengiai == "")
                    Response.Write("<script>alert('Chưa nhập diễn giải công việc!');<script/>");
                else
                {
                    dldto.DienGiai = diengiai;
                    dldto.Rate = 1;
                    dldto.Lev = 1;
                    dldto.Ngay = DateTime.Parse(DateTime.Now.ToShortDateString());
                    dldto.Deadline = DateTime.Parse(DateTime.Now.ToShortDateString());
                    dldto.Report = "SR01";
                    int gdvnhan = int.Parse(drDSGDV.SelectedItem.Value.ToString());
                    if (gdvnhan != 0)
                    {

                        string ten = GetName();
                        string user = gdv.LayUsername(gdvnhan);
                        dldto.MaGDVNhan = gdvnhan;
                        string email = gdv.LayEmail(user);

                        string brief = idclaim + " - " + cl.Laybrif(idclaim);
                        string deadtime = DateTime.Now.ToShortDateString();
                        string bodyCC = "Dear " + drDSGDV.SelectedItem.ToString();
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += ten + " gửi bạn một tin nhắn có nội dung như sau: ";
                        bodyCC += "<br/>";
                        bodyCC += "<< " + diengiai + " >>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "Nếu có trở ngại gì vui lòng feedback ở platform hoặc gặp trực tiếp " + ten + " nhé!<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/> Have a nice day.";
                        bool them = dldao.ThongBaoCheck(dldto);
                        if (them == true)
                        {
                            sendmail.Send_Email_Task(email, "Task-to-do " + brief, bodyCC, "huedinh@savvyadjusters.vn");
                            Response.Write("<script>parent.closeDialog();</script>");
                           
                        }
                    }
                }
            }
        }
    }
}