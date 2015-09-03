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
    public partial class NewTimeSheetOtherLA : System.Web.UI.Page
    {

        TimeSheetDTO tsdto = new TimeSheetDTO();
        TimeSheetDAO tsdao = new TimeSheetDAO();
        CongTacTimeSheetDAO ctdao = new CongTacTimeSheetDAO();
        DiaryDAO dr = new DiaryDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        WeeklyReportDAO wr = new WeeklyReportDAO();
        ClaimDAO cl = new ClaimDAO();
        SendMailDAO sm = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                //if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                //gvDSTimeSheet.Visible = false;
                loadTheLoai();
                loadGDV();
            }
        }
        void loadTheLoai()
        {
            drDienGiai.DataSource = ctdao.DanhSachCongTac();
            drDienGiai.DataValueField = "Ma";
            drDienGiai.DataTextField = "CongTac";
            drDienGiai.DataBind();
        }
        void loadGDV()
        {
            drGDV.DataSource = gdv.DanhSachGiamDinhVien();
            drGDV.DataTextField = "TenGDV";
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataBind();
         

        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                TimeSheetDTO tsdto = new TimeSheetDTO();

                int maGDV = int.Parse(drGDV.SelectedItem.Value.ToString());
                tsdto.MaGDV = maGDV;

                string maclaim = txtThamChieu.Text;
                bool kt = cl.KiemTraThamChieu(maclaim);
                float h=0;
                if (txtSoGio.Text != "" && float.TryParse(txtSoGio.Text, out h))
                {
                    string diengiai = txtDienGiaiChiTiet.Text;
                    if (diengiai != "")
                        tsdto.DienGiai = diengiai;
                    else
                        tsdto.DienGiai = "";
                    string extr = txtEtraFee.Text;
                    if (extr != "")
                        tsdto.ExtraFee = extr;
                    else
                        tsdto.ExtraFee = "";
                    if (kt == true)
                    {
                        tsdto.ThamChieu = maclaim;
                        tsdto.Ngay = txtNgay.Text;
                        tsdto.IdCongTacTimeSheet = drDienGiai.SelectedItem.Value.ToString();
                       
                        tsdto.ThoiLuongPhatSinh = float.Parse(txtSoGio.Text);
                        tsdto.GioThuc = DateTime.Now;
                     
                        bool them = tsdao.ThemTimeSheet(tsdto);
                        if (them == true)
                        {
                            string noidung = gdv.LayTenTheoMa(maGDV) + " created timesheet of case " + txtThamChieu.Text + " .";
                            SaveLogTracking(maGDV, noidung, txtThamChieu.Text);
                            float time = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            wr.CapNhatGioTichLuy(maclaim, time);

                            float gio = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            bool updw = wr.CapNhatGioTichLuy(maclaim, gio);

                            Response.Write("<script>alert('Đã thêm!');</script>");
                            #region KiemTra_GuiMail
                            // float gio = tsdao.TongThoiLuongPhatSinhTheoCliam(maclaim);
                            //bool updw = wr.CapNhatGioTichLuy(maclaim, gio);
                            #region BodysendLA
                            string tenGDVDuoccapnhat = gdv.LayTenTheoMa(maGDV);
                            int matengdv = int.Parse(Request.Cookies["MaGDV"].Value);
                            string tengdv = gdv.LayTenTheoMa(matengdv);
                            string loaidiengiai = drDienGiai.SelectedItem.ToString();
                            string bodyGDV = "Xin chào   " + tengdv;
                            bodyGDV += "<br/> Bạn vừa cập nhật TimeSheet mới cho " + tenGDVDuoccapnhat + ". <br/> Thông tin TimeSheet:<br/>";
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
                            bodyGiamDoc += "<br/>" + tengdv + " vừa cập nhật TimeSheet mới cho " + tenGDVDuoccapnhat + ". <br/> Thông tin Timesheet :<br/>";
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
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tenGDVDuoccapnhat + "</td>";
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
                            //int idgdv = int.Parse(Session["MaGDV"].ToString());
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
                            sm.KiemTraMailChinhCC(sTo, bodyGDV, "Timesheet Notification", "Timesheet", "savvyadjus@gmail.com");                            
                            #endregion
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
    }
}