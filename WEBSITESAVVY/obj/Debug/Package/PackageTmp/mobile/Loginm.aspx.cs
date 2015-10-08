using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Security;
using System.Security.Cryptography;
namespace WEBSITESAVVY.mobile
{
    public partial class Loginm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["GDV"] != null)
                Response.Redirect("~/mobile/Homem.aspx");
        }
          protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string user = txtTenDangNhap.Text;
            string mk = txtMatKhau.Text;
            mk = GetMD5Hash(mk);
            GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
            bool ss = gdvdao.SoSanhPassword(mk, user);
            if (ss == true)
            {
                DataTable dtgdv = gdvdao.KiemTraDangNhap(user, mk);
                string tengdv;
                if (dtgdv.Rows.Count > 0)
                {

                    DataRow dr = dtgdv.Rows[0];
                    tengdv = dr[1].ToString();
                    Session["GDV"] = tengdv;
                    Session["MaGDV"] = dr[0].ToString();
                    Session["ChucVu"] = dr[2].ToString();
                    Response.Redirect("~/mobile/Homem.aspx");

                }
                
            }
            else
            {
                lblThongBao.Text = "Sai tên đăng nhập hoặc mật khẩu.";
            }
        }

        protected string GetMD5Hash(string input)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            string password = s.ToString();
            return password;
        }
    
    }
}