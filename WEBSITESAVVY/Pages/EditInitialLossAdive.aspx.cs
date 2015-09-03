using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
using System.Data;
using System.IO;
using System.Data.SqlClient;
namespace WEBSITESAVVY.Pages
{
    public partial class EditInitialLossAdive : System.Web.UI.Page
    {
        string thamchieu = null;
        ClaimDAO cl = new ClaimDAO();
        string mathamchieu = null;
        HangMucDAO hm = new HangMucDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //else
            //{
            //    mathamchieu = Request.QueryString["IDClaim"];
            //}
           
            if (!this.IsPostBack)
            {
                if (Session["ThamChieu"] == null)
                {
                    Response.Redirect("~/Pages/Home.aspx");
                }
                if (Session["ThamChieu"] != null)
                {
                    thamchieu = Session["ThamChieu"].ToString();                   
                    string ten = cl.TenClaim(thamchieu);
                    lblThamChieu.Text = ten;
                    loadInfo(thamchieu);
                    loadCK();
                }               
                
            }
        }
        void loadCK()
        {
            ckExtentofloss.config.toolbar = new object[]
            {
                 new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
                new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
                new object[] { "Styles", "Format", "Font", "FontSize" },
            };
            ckDePhongTonThatVaKhuyenCao.config.toolbar = new object[]
            {
                 new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
                new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
                new object[] { "Styles", "Format", "Font", "FontSize" },
            };
            ckYKienGDV.config.toolbar = new object[]
            {
                 new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
                new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
                new object[] { "Styles", "Format", "Font", "FontSize" },
            };
            ckDienBienTonThat.config.toolbar = new object[]
            {
                 new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
                new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
                new object[] { "Styles", "Format", "Font", "FontSize" },
            };
        }
        void loadInfo(string id)
        {
            DataTable dt = new DataTable();
            dt = cl.loadInfoBCDT(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[1].ToString();
                txtTenNguoiLienHe.Text = dr[2].ToString();
                txtDienThoai.Text = dr[3].ToString();
                txtEmail.Text = dr[4].ToString();
                ckDienBienTonThat.Text = dr[5].ToString();
                ckExtentofloss.Text = dr[6].ToString();
                txtintitialreserve.Text = dr[7].ToString();
                ckDePhongTonThatVaKhuyenCao.Text = dr[8].ToString();
                ckYKienGDV.Text = dr[9].ToString();
                lblIDKH.Text = dr[10].ToString();
            }
        }
        protected void btnCreatnew_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string id = cl.LayMaTheoTen(lblThamChieu.Text);
                string dienbien = ckDienBienTonThat.Text;
                string phamvi = ckExtentofloss.Text;
                string duphong = txtintitialreserve.Text;
                string dephong = ckDePhongTonThatVaKhuyenCao.Text;
                string ykien = ckYKienGDV.Text;
                string tendd = txtTenNguoiLienHe.Text;
                string dienT = txtDienThoai.Text;
                string email = txtEmail.Text;
                int makh = int.Parse(lblIDKH.Text);
                KhachHangDAO kh = new KhachHangDAO();
                bool upkh=kh.CapNhatDaiDien(makh, tendd, dienT, email);
                bool up = cl.CapNhatBCDT(id, dienbien, phamvi, duphong, dephong, ykien);
                if (up == true && upkh==true)
                {
                    Session["ThamChieu"] = id;
                    Response.Redirect("~/Pages/reportILA.aspx");
                }
                else
                    Response.Write("<script>alert('Error!');</script>");
            }
        }
    }
}