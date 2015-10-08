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
    public partial class basicinforPR : System.Web.UI.Page
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
                    string id = "";
                    if (Session["ThamChieu"] != null)
                        id = Session["ThamChieu"].ToString();
                    if (id != "")
                        LoadInfo(id);
                    else
                        Response.Write("<script></script>");
                }
            }
        }
        protected void LoadInfo(string id)
        {
            DataRow dr = dr = cl.GetInfoPRIRFR(id);            
            if (dr != null)
            {
                txtTenClaim.Text = dr["TenClaim"].ToString();
                //txtDateILA.Text = DateTime.Parse(dr["ILADATE"].ToString()).ToString("dd/MM/yyyy");
                txtDateILA.Text = dr["ILADATE"].ToString();
                txtPolicyNo.Text = dr["PolicyNo"].ToString();
                txtTenKhachHang.Text = dr["TenKhachHang"].ToString();
                txtDiachi.Text = dr["DiaChi"].ToString();
                txtTrade.Text = dr["LinhVucKinhDoanh"].ToString();
                txtDOL.Text = dr["DOL"].ToString();
                txtCauseloss.Text = dr["SortCause"].ToString();
                txtExtendofloss.Text = dr["PhamViTonThat"].ToString();
                txtTypepolicy.Text=dr["NamePolicy"].ToString();
                txtSuminsured.Text = dr["SumInsured"].ToString();
                txtperiod.Text = dr["Effective"].ToString();
                txtDeductible.Text = dr["MucMienThuong"].ToString();
                txtExtensionclaise.Text=dr["DKBS"].ToString();
                txtKhieuNai.Text = dr["KhieuNai"].ToString();
                txtInterimreserve.Text=dr["DuPhongBoiThuong"].ToString();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ClaimDTO cldto = new ClaimDTO();
            KhachHangDTO khdto = new KhachHangDTO();
            string id=Session["ThamChieu"].ToString();
            if (id != "")
            {
                cldto.MaClaim = id;
                cldto.TenClaim = txtTenClaim.Text;
                string iladate = txtDateILA.Text.Trim();
                if (iladate != "")
                    cldto.ILADATE = iladate;
                else
                    cldto.ILADATE = "";
                string nameP = txtPolicyNo.Text.Trim();
                if (nameP != "")
                    cldto.PolicyNo = nameP;
                else
                    cldto.PolicyNo = "";
                string dol = txtDOL.Text.Trim();
                if (dol != "")
                    cldto.Dol = dol;
                else
                    cldto.Dol = "";
                string cause = txtCauseloss.Text.Trim();
                if (cause != "")
                    cldto.SortCause = cause;
                else
                    cldto.SortCause = "";
                string pvtt = txtExtendofloss.Text.Trim();
                if (pvtt != "")
                    cldto.PhamViTonThat = pvtt;
                else
                    cldto.PhamViTonThat = "";
                string nametypo = txtTypepolicy.Text.Trim();
                if (nametypo != "")
                    cldto.NamePolicy = nametypo;
                else
                    cldto.NamePolicy = "";
                string sumI = txtSuminsured.Text.Trim();
                if (sumI != "")
                    cldto.SumInsured = sumI;
                else
                    cldto.SumInsured = "";
                string gd = txtperiod.Text.Trim();
                if (gd != "")
                    cldto.Effective = gd;
                else
                    cldto.Effective = "";
                string mmt = txtDeductible.Text.Trim();
                if (mmt != "")
                    cldto.MucMienThuong = mmt;
                else
                    cldto.MucMienThuong = "";
                string dkbs = txtExtensionclaise.Text.Trim();
                if (dkbs != "")
                    cldto.DKBS = dkbs;
                else
                    cldto.DKBS = "";
                string kn = txtKhieuNai.Text.Trim();
                if (kn != "")
                    cldto.KhieuNai = kn;
                else
                    cldto.KhieuNai = "";
                string dpbt = txtInterimreserve.Text;
                if (dpbt!="")
                    cldto.DuPhongBoiThuong = dpbt;
                else
                    cldto.DuPhongBoiThuong = "";
                int maKH = cl.ClaimMaKH(id);
                if (maKH != 0)
                    khdto.MaKhachHang = maKH;
                khdto.LinhVucKinhDoanh = txtTrade.Text.Trim();
                bool up = cl.UpdateInfoPRIRFR(cldto, khdto);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                if (up == true)
                {
                    sm.CapNhatInfoBasicPR(cldto, khdto);
                    sm.CapNhatInfoBasicFR(cldto);

                    string noidung = gdv.LayTenTheoMa(maGDV) + " edited cover preliminary report of case " + id + " .";
                    SaveLogTracking(maGDV, noidung, id);
                    Response.Write("<script>parent.closeDialog();</script>");
                    Response.Write("<script>parent.reloaData();</script>");
                }
                else
                {
                    string noidung = gdv.LayTenTheoMa(maGDV) + " faild to edit cover preliminary report of case " + id + " .";
                    SaveLogTracking(maGDV, noidung, id);
                    Response.Write("<script> alert('Error Update!');</script>");
                }
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