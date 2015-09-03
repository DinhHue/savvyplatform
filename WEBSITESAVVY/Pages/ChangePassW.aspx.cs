using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Security.Cryptography;

namespace WEBSITESAVVY.Pages
{
    public partial class ChangePassW : System.Web.UI.Page
    {
        GiamDinhVienDAO gd = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtOldpass.Attributes.Add("required", "required");
            txtnewpass.Attributes.Add("required", "required");
            txtrepeatpass.Attributes.Add("required", "required");
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
                oldpass = Util.SAVVYUtil.GetMD5Hash(oldpass);
                newpass = Util.SAVVYUtil.GetMD5Hash(newpass);
                bool kt = gd.KiemTraMatKhau(id, oldpass);
                if (kt == true)
                {
                    bool td = gd.ThayDoiMatKhau(id, oldpass, newpass);
                    if (td == true)
                    //Response.Redirect("~/Pages/Home.aspx");
                    {
                         
                        string noidung = gd.LayTenTheoMa(id) + " reset password.";
                        SaveLogTracking(id, noidung, "");
                        Response.Write("<script> window.parent.closeDialog(); </script>");
                    }
                }
                else
                    Response.Write("<script>alert('Không nhập đúng mật khẩu cũ!');</script>");
            }
        }
    }
}