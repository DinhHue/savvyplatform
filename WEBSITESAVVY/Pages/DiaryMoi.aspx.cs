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
using System.Net.Mail;
using System.Net;
namespace WEBSITESAVVY.Pages
{
    public partial class DiaryMoi : System.Web.UI.Page
    {
        DiaryDTO tsdto;
        DiaryDAO drdao = new DiaryDAO();
        ClaimDAO cl = new ClaimDAO();
        WeeklyReportDAO wr = new WeeklyReportDAO();
        SendMailDAO smdao = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string tenGDV = Session["GDV"].ToString();
            lbllThongBao.Visible = false;
            lblThongBaoThem.Visible = false;
            //txtNgayBatDau.Text = DateTime.Today.Date.ToShortDateString();
            //txtNgay.Text = DateTime.Today.Date.ToShortDateString();
            //txtNgayKetThuc.Text = DateTime.Today.Date.ToShortDateString();
            if (tenGDV == null)
            {
                lblGiamDinhVien.Text = "GĐV chưa đăng nhập!";
            }
            else
                lblGiamDinhVien.Text = tenGDV;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            tsdto = new DiaryDTO();
            string maclaim = txtThamChieu.Text;
            bool kt = cl.KiemTraThamChieu(maclaim);
            int maGDV = int.Parse(Session["MaGDV"].ToString());
            string tengdv = Session["GDV"].ToString();
            if (maGDV != null)
            {
                if (kt == true)
                {
                    tsdto.MaClaim = maclaim;
                    tsdto.MaGDV = maGDV;
                    tsdto.NgayThuc = DateTime.Now;
                    tsdto.Ngay = DateTime.Parse(txtNgay.Text);
                    tsdto.DienGiai = txtDienGiai.Text.Trim();
                    tsdto.SoGio = float.Parse(txtSoGio.Text);
                    tsdto.NgayGioBatDau = DateTime.Parse(txtNgayBatDau.Text);
                    tsdto.NgayGioKetThuc = DateTime.Parse(txtNgayKetThuc.Text);
                    tsdto.KetQua = txtKetQuaGhiNhan.Text.Trim();
                    bool them = drdao.DiaryMoi(tsdto);
                    if (them == true)
                    {
                        #region KiemTra_GuiMail
                        float gio = drdao.TongThoiLuongPhatSinh(maclaim);
                        bool updw = wr.CapNhatGioTichLuy(maclaim, gio);
                        #region BodysendLA
                        string bodyGDV = "Xin chào   " + tengdv;
                        bodyGDV += "<br/> Bạn vừa cập nhật Diary mới. <br/> Thông tin Diary:<br/>";
                        bodyGDV += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
                                     " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                     " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
                                    " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
                        bodyGDV += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

                        //bodyGDV += "<th width='10%'>Giám định viên</th>";
                        bodyGDV += "<th width='10%'>Tham chiếu</th>";
                        bodyGDV += "<th width='10%'>Ngày</th>";
                        bodyGDV += "<th width='30%'>Diễn giải</th>";
                        bodyGDV += "<th width='10%'>Số giờ</th>";
                        bodyGDV += "<th width='10%'>Start</th>";
                        bodyGDV += "<th width='10%'>Ended</th>";
                        bodyGDV += "<th width='30%'>Kết quả</th>";
                        bodyGDV += "</tr>";

                        bodyGDV += "<tr style='text-align:center'>";
                        //bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                        //" border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.MaClaim + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.Ngay + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.DienGiai + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.SoGio + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.NgayGioBatDau + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                          " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.NgayGioKetThuc + "</td>";
                        bodyGDV += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                          " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.KetQua + "</td>";
                        bodyGDV += "</tr>";
                        bodyGDV += "</table>";
                        #endregion
                        #region BodyMailGiamDoc
                        //timesheet gui giam doc
                        string bodyGiamDoc = "Thông báo! ";
                        bodyGiamDoc += "<br/>" + tengdv + " vừa cập nhật Dairy mới. <br/> Thông tin Diary:<br/>";
                        bodyGiamDoc += "<table  width='100%' align='center' style='border-bottom-color:#CCC; border-bottom-style:solid; border-bottom-width:1px; " +
                                     " border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                                     " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;" +
                                    " border-right-color:#CCC; border-right-style:solid; border-right-width:1px;'>";
                        bodyGiamDoc += "<tr style='background-color: #040; color:#FFF; font-weight:bold;'>";

                        bodyGiamDoc += "<th width='20%'>GĐV</th>";
                        bodyGiamDoc += "<th width='10%'>Tham chiếu</th>";
                        bodyGiamDoc += "<th width='10%'>Ngày Thực</th>";
                        bodyGiamDoc += "<th width='10%'>Ngày</th>";
                        bodyGiamDoc += "<th width='30%'>Diễn giải</th>";
                        bodyGiamDoc += "<th width='10%'>Số giờ</th>";
                        bodyGiamDoc += "<th width='10%'>Start</th>";
                        bodyGiamDoc += "<th width='10%'>Ended</th>";
                        bodyGiamDoc += "<th width='30%'>Kết quả</th>";
                        bodyGiamDoc += "</tr>";

                        bodyGiamDoc += "<tr style='text-align:center'>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                        " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tengdv + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                           " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.MaClaim + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                           " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.NgayThuc + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.Ngay + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.DienGiai + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.SoGio + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                            " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.NgayGioBatDau + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                          " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.NgayGioKetThuc + "</td>";
                        bodyGiamDoc += "<td style ='border-top-color:#CCC; border-top-style:solid; border-top-width:1px;" +
                          " border-left-color:#CCC; border-left-style:solid; border-left-width:1px;'>" + tsdto.KetQua + "</td>";
                        bodyGiamDoc += "</tr>";
                        bodyGiamDoc += "</table>";
                        #endregion
                        string sTo = "";
                        int idgdv = int.Parse(Session["MaGDV"].ToString());
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
                        //ktmgiamdoc = smdao.KiemTraMailChinh("Timesheet","hoalyli@gmail.com", bodyGiamDoc, "Thông báo Diary của tháng " + month);
                        ktmgdv = smdao.KiemTraMailChinh("New_Claim",sTo, bodyGDV, "Thông báo cập nhật Diary");
                        if (updw == true && ktmgdv != "")
                        {
                            //Response.Redirect("~/Pages/DiaRy.aspx");
                            Response.Write("<script>alert('Updated!');</script>");
                            Response.Redirect(Request.Url.PathAndQuery, true);
                        }
                        #endregion
                        Response.Write("<script>alert('Đã thêm!');</script>");
                    }
                    else
                    {
                        lblThongBaoThem.Visible = true;
                        lblThongBaoThem.Text = "Have something wrong here!";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Mã Claim không hợp lệ!');</script>");
                    lbllThongBao.Visible = true;
                }
                
            }
            else
                Response.Redirect("~/Pages/Longin.aspx");
        }             

    }
}