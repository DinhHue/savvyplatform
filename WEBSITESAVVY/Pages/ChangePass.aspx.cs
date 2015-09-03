using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Security;
using System.Security.Cryptography;
namespace WEBSITESAVVY.Pages
{
    public partial class ChangePass : System.Web.UI.Page
    {
        GiamDinhVienDAO gd = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                //if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                
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
        
        protected void btnchange_Click(object sender, EventArgs e)
        {
            string oldpass = txtOldpass.Text;
            string newpass = txtnewpass.Text;
            string rpass = txtrepeatpass.Text;
            //int id= int.Parse(Session["MaGDV"].ToString());
            int id = int.Parse(Request.Cookies["MaGDV"].Value);
            if (newpass != rpass)
                Response.Write("<script>alert('Nhắc lại mật khẩu chưa đúng!');</script>");
            else
            {                
                oldpass = GetMD5Hash(oldpass);
                newpass = GetMD5Hash(newpass);

                bool kt = gd.KiemTraMatKhau(id, oldpass);
                if (kt == true)
                {
                    bool td = gd.ThayDoiMatKhau(id, oldpass, newpass);
                    if (td == true)
                    {
                        string noidung = gd.LayTenTheoMa(id) + " changed password success.";
                        SaveLogTracking(id, noidung, "");
                        Response.Redirect("~/Pages/Home.aspx");
                    }
                }
                else
                {
                    string noidung = gd.LayTenTheoMa(id) + " failed to change password.";
                    SaveLogTracking(id, noidung, "");
                    Response.Write("<script>alert('Không nhập đúng mật khẩu cũ!');</script>");
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