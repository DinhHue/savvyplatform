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
    public partial class checkedreport : System.Web.UI.Page
    {
        DAILYDTO dldto = new DAILYDTO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        ClaimDAO cl = new ClaimDAO();
        SendMailDAO sendmail = new SendMailDAO();
        DaiLyDAO dldao = new DaiLyDAO();

        public static string report = "";
        private static String mClaimID = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["claimID"] != null)
                    mClaimID = Request.QueryString["claimID"];
                if (Request.QueryString["report"] != null)
                    report = Request.QueryString["report"].ToString();

                if (!IsPostBack)
                {
                    if (mClaimID != "")
                    {
                        loadGDV();
                        string id = mClaimID;
                        string tt = LayTinhTrang(id, report);

                        if (tt == "No")
                            loadTB(id, report);
                        if (tt == "Yes")
                            loadMessage(id, report);
                        if (tt == null)
                        {
                            panelchecked.Visible = false;
                            panelthongbao.Visible = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert(' Error: " + ex.Message + "');</script>");
            }
        }
        void loadTB(string id, string report)
        {
            if (dldao.LayThongBao(report, id) != null)
            {
                DataRow dr = dldao.LayThongBao(report, id);
                txtThongBao.Text = dr["DienGiai"].ToString();
                txtNgay.Text = dr["Ngay"].ToString();
                lblGDV.Text = dr["TenGDV"].ToString();
                panelSubmit.Visible = true;
                panelthongbao.Visible = true;
                panelchecked.Visible = false;
            }
        }
        string LayTinhTrang(string id, string report)
        {
            string tt = dldao.LayTinhTrang(id, report);
            if (tt != null)
                return tt;
            return null;
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
        string GetName()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            return gdv.LayMaTen(maGDV);
        }
        void loadMessage(string idclaim, string report)
        {
            DataRow dr = dldao.SelectMessageReport(idclaim, report);
            if (dr != null)
            {
                txtThongBao.Text = dr["DienGiai"].ToString();
                lblYKien.Text = dr["YKien"].ToString();
                txtngayxong.Text=dr["DateDone"].ToString();
                txtNgay.Text = dr["Ngay"].ToString();
                panelSubmit.Visible = false;               
                panelthongbao.Visible = true;
                panelchecked.Visible = true;
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
        protected void btnSend_Click(object sender, EventArgs e)
        {

            if (Request.Cookies["MaGDV"] != null)
            {
                string idclaim = mClaimID;
                int magdv = int.Parse(Request.Cookies["MaGDV"].Value);

                string diengiai = txtNoiDung.Text;
                if (diengiai == "")
                    Response.Write("<script>alert('Chưa nhập diễn giải công việc!');<script/>");
                else
                {
                   
                    int gdvnhan = int.Parse(drDSGDV.SelectedItem.Value.ToString());
                    if (gdvnhan != 0)
                    {

                        string ten = GetName();
                        string user = gdv.LayUsername(gdvnhan);
                        dldto.MaGDVNhan = gdvnhan;
                        string email = gdv.LayEmail(user);
                        diengiai = drDSGDV.SelectedItem.ToString()+": "+txtNoiDung.Text;
                        string brief = idclaim + " - " + cl.Laybrif(idclaim);
                        DateTime ngayxong = DateTime.Now;
                        string bodyCC = "Dear " + drDSGDV.SelectedItem.ToString();
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += ten + " gửi bạn một tin nhắn có nội dung như sau: ";
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "<< " + diengiai + " >>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "Nếu có trở ngại gì vui lòng feedback ở platform hoặc gặp trực tiếp " + ten + " nhé!<br/>";
                        bodyCC += "<br/>";
                        bodyCC += "<br/> Have a nice day.";
                        bool them = dldao.CheckedReport(idclaim, report ,diengiai,ngayxong);
                        if (them == true)
                        {
                            sendmail.Send_Email_Task(email, "Task-to-do " + brief, bodyCC, "huedinh@savvyadjusters.vn");
                            SaveLogTracking(magdv, gdv.LayTenTheoMa(magdv)+ " gửi tin nhắn cho "+ ten+" đã kiểm tra " + report, idclaim);
                            Response.Write("<script>parent.closeAllDialog();</script>");
                            Response.Write("<script>parent.reloaData();</script>");
                            
                        }
                    }
                }
            }
        }
    }
}
