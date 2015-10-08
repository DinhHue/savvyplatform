using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class WeeklyReport : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        WeeklyReportDAO wrdao = new WeeklyReportDAO();
        ClaimDAO cldao = new ClaimDAO();
        WeeklyReportDTO wrdto = new WeeklyReportDTO();
        CongTacTimeSheetDAO ts = new CongTacTimeSheetDAO();
       // DiaryDAO drdao = new DiaryDAO();
        int maWR = 0;
        TimeSheetDAO tsdao = new TimeSheetDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //loadDSGDV();
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    load_CK();

                    if (Session["MaWR"] != null)
                    {
                        maWR = (int)Session["MaWR"];
                        LoadWRChiTiet(maWR);
                        Session["MaWR"] = null;
                        //string maclaim = Session["ThamChieu"].ToString();
                        lblThamChieu.Visible = true;
                        txtThamChieu.Visible = false;
                        
                    }
                    else
                    {
                        maWR = int.Parse(Request.QueryString["updateid"]);
                        lblThamChieu.Visible = false;
                        txtThamChieu.Visible = true;                        
                        if (maWR != 0)
                        {
                            string maclaim = Session["ThamChieu"].ToString();
                            LoadWRChiTiet(maWR);                           
                        }
                        else
                        {
                            //loadDSGDV();
                            lblThongBao.Text = "";
                        }
                    }
                }
            }
        }
        void LoadWRChiTiet(int ma)
        {
            DataTable dt= new DataTable();
            dt= wrdao.ChiTiet(ma);
            DataRow dr = dt.Rows[0];
            lblThamChieu.Text = dr[1].ToString();
            //drGDV.DataValueField = wrdto.MaGDV.ToString();
            bool ktts = tsdao.KiemTraTimeSheetTonTai(lblThamChieu.Text);
            float gio=0;
            if(ktts==true)
                gio = tsdao.TongThoiLuongPhatSinhTheoCliam(lblThamChieu.Text);
            //txtGioTichLuy.Text = gio.ToString();
            ckDeXuatGiamDinh.Text = dr[6].ToString();
            //txtDuPhongTonThat.Text = dr[3].ToString();
        }
        void load_CK()
        {
             ckDeXuatGiamDinh.config.toolbar = new object[] { 
             new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
                //new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
                new object[] { "Styles", "Format", "Font", "FontSize" },
            };
        }
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                    string maclaim = "";
                    if (lblThamChieu.Text != "")
                        maclaim = lblThamChieu.Text;
                    if (txtThamChieu.Text != "")
                        maclaim = txtThamChieu.Text;
                    bool kq = wrdao.KiemTraWR(maclaim);
                    bool kt = tsdao.KiemTraTimeSheetTonTai(maclaim);   
                    if (kq == false)//chua co weekly report
                    {
                        //them moi wr                       
                        maclaim = txtThamChieu.Text;
                        wrdto.MaClaim = maclaim;
                        //wrdto.MaGDV = int.Parse(drGDV.SelectedValue);
                        if (kt == true)
                        {
                            float gio = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            wrdto.GioTichLuy = gio;
                        }
                        else
                            wrdto.GioTichLuy = (float)0;
                        
                        string dexuatgiamdinh = ckDeXuatGiamDinh.Text;
                        if (dexuatgiamdinh != "")
                            wrdto.DeXuatGiamDinh = dexuatgiamdinh;
                        else
                            wrdto.DeXuatGiamDinh = "";

                        bool kqt = wrdao.Them(wrdto);
                        if (kqt == true)
                        {
                            string thamchieu = cldao.TenClaim(maclaim);
                            Session["ThamChieu"] = thamchieu;
                            Response.Redirect("~/Pages/XemWeeklyReport.aspx?viewthamchieu=" + thamchieu);
                        }
                    }
                    else
                    {
                        //cap nhat wr                         
                        wrdto = new WeeklyReportDTO();
                        wrdto.Ma = wrdao.LayMa(maclaim);
                        //wrdto.DuPhongTonThat = txtDuPhongTonThat.Text.Trim();
                        wrdto.DeXuatGiamDinh = ckDeXuatGiamDinh.Text.Trim();
                        //wrdto.GioTichLuy = float.Parse(txtGioTichLuy.Text);
                        bool kqcn = wrdao.CapNhat(wrdto);
                        if (kqcn == true)
                        {
                            string tc = cldao.TenClaim(maclaim);
                            Session["ThamChieu"] = tc;
                            Response.Redirect("~/Pages/XemWeeklyReport.aspx?viewthamchieu=" + tc);
                            //Response.RedirectLocation("~/Pages/ViewWR.aspx");                                
                        }
                    }
                    //}
                    //else
                    //    lblThongBao.Text = "Sai tham chiếu.";
                //}
                //else
                //    lblThongBao.Text = "Chưa nhập tham chiếu.";

            }
        }

        protected void txtThamChieu_TextChanged(object sender, EventArgs e)
        {

        }
       
        protected void btnXemDS_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/ListWeeklyReport.aspx");
        }
        
           
    }
}