using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Security;
using System.Security.Cryptography;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck != null)
                Response.Redirect("~/Pages/Home.aspx");
            //if (Session["GDV"] != null)
            //    Response.Redirect("~/Pages/Home.aspx");          
            
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string user = txtTenDangNhap.Text;
            string mk = txtMatKhau.Text;
            mk = Util.SAVVYUtil.GetMD5Hash(mk);
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

                    int ID_GDV = int.Parse(dr[0].ToString());
                    SaveLogTracking(ID_GDV, tengdv + " signed in.");
                    Session["GDV"] = tengdv;
                    Session["MaGDV"] = ID_GDV;
                    Session["ChucVu"] = dr[2].ToString();
                    HttpCookie ck = new HttpCookie("MaGDV");
                    ck.Value = ID_GDV.ToString();
                    ck.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(ck);
                    Response.Redirect("~/Pages/Home.aspx");
                    
                }
                
            }
            else
            {
                lblThongBao.Text = "Sai tên đăng nhập hoặc mật khẩu.";
            }
        }
        void SaveLogTracking(int magdv,string noidung)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = magdv;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = "";
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
    }
}
