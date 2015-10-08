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
    public partial class BasicFR : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        KhachHangDAO kh = new KhachHangDAO();
        SendMailDAO sm = new SendMailDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    string id = Session["ThamChieu"].ToString();
                    if (id != "")
                        LoadInfo(id);
                    else
                        Response.Write("<script></script>");
                }
            }
        }
        void LoadInfo(string id)
        {
            DataRow dr = dr = cl.GetInfoPRIRFR(id);
            if (dr != null)
            {
                txtTenClaim.Text = dr["TenClaim"].ToString();
                txtDateFR.Text = dr["BaoCaoTruocFR"].ToString();
                txtKhieuNai.Text=dr["KhieuNai"].ToString();
                txtTonThatHopLy.Text = dr["ThietHaiHopLy"].ToString();
                txtThuocPhamViBH.Text = dr["TonThatHopLe"].ToString();
                txtTruGiaTriThuHoi.Text = dr["TruGiaTriThuHoi"].ToString();
                txtTamUngBT.Text = dr["TamUngBoiThuong"].ToString();
                txtTruMucMienThuong.Text=dr["TruMienThuong"].ToString();
                txtDeXuatBoiThuong.Text = dr["BoiThuong"].ToString();
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
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ClaimDTO cldto = new ClaimDTO();
            cldto.MaClaim=Session["ThamChieu"].ToString();
            cldto.TenClaim = txtTenClaim.Text;
            string fr = txtDateFR.Text.Trim();
            if (fr != "")
                cldto.BaoCaoTruocFR = fr;
            else
                cldto.BaoCaoTruocFR = "";
            string thiethaihoply = txtTonThatHopLy.Text;
            if (thiethaihoply != "")
                cldto.ThietHaiHopLy = thiethaihoply;
            else
                cldto.ThietHaiHopLy = "";
            string tonthathople = txtThuocPhamViBH.Text;
            if (tonthathople != "")
                cldto.TonThatHopLe = tonthathople;
            else
                cldto.TonThatHopLe = "";
            string gtthuhoi = txtTruGiaTriThuHoi.Text;
            if (gtthuhoi != "")
                cldto.TruGiaTriThuHoi = gtthuhoi;
            else
                cldto.TruGiaTriThuHoi = "";
            string trumienthuong = txtTruMucMienThuong.Text;
            if (trumienthuong != "")
                cldto.TruMienThuong = trumienthuong;
            else
                cldto.TruMienThuong = "";
            string tamung = txtTamUngBT.Text;
            if (tamung != "")
                cldto.TamUngBoiThuong = tamung;
            else
                cldto.TamUngBoiThuong = "Không tạm ứng";
            string boithuong = txtDeXuatBoiThuong.Text;
            if (boithuong != "")
                cldto.BoiThuong = boithuong;
            else
                cldto.BoiThuong = "";
            bool up = cl.UpdateInfoFR(cldto);
            if (up == true)
            {
                sm.CapNhatInfoBasicFR(cldto);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited cover final report of case " + txtTenClaim.Text + " .";
                SaveLogTracking(maGDV, noidung, txtTenClaim.Text);
                Response.Write("<script>parent.closeDialog();</script>");
                Response.Write("<script>parent.reloaData();</script>");
            }
            else
            {
                sm.CapNhatInfoBasicFR(cldto);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " falied to edit cover final report of case " + txtTenClaim.Text + " .";
                SaveLogTracking(maGDV, noidung, txtTenClaim.Text);
                Response.Write("<script> alert('Error Update!');</script>");
            }
        }
    }
}