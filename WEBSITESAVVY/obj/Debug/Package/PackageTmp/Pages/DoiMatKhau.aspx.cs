using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Security.Cryptography;
namespace WEBSITESAVVY.Pages
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                int magdv = int.Parse(Request.QueryString["ID"]);
                if (magdv != 0)
                    lblID.Text = magdv.ToString();
            }
        }
        public string GetMD5Hash(string input)
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
        protected void btnKhoiPhucMatKhau_Click(object sender, EventArgs e)
        {
            GiamDinhVienDAO gdv = new GiamDinhVienDAO();
            string pas1 = txtpass1.Text;
            string pas2 = txtpass2.Text;
            int id= int.Parse(lblID.Text);
            if (pas1 == pas2)
            {
                string pasmd5 = GetMD5Hash(pas1);
                bool doi = gdv.DoiMatKhau(id, pasmd5);
                if (doi == true)
                    Response.Redirect("~/Pages/Login.aspx");
            }
            else
                Response.Write("<script>alert('Mật khẩu nhập lại không đúng!');</script>");
        }
    }
}