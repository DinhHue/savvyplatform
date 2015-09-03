using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class XuLyQuiTrinh : System.Web.UI.Page
    {
        int manguoidung = 1;
        QuiTrinhDTO qtdto = new QuiTrinhDTO();
        QuiTrinhDAO qtdao = new QuiTrinhDAO();
        private int ma = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
                Response.Redirect("~/Pages/Login.aspx");
            else
            {
                lblThongBao.Text = "";
                txtNgayDang.Text = DateTime.Today.ToString();
                if (Session["IDQUITRINH"] != null)
                {

                    ma = int.Parse(Session["IDQUITRINH"].ToString());
                    if (ma > 0)
                    {
                        qtdto = qtdao.Lay(ma);
                        txtNgayDang.Text = qtdto.NgayDang.ToString();
                        txtTieuDe.Text = qtdto.TieuDe.ToString();
                        txtTomTat.Text = qtdto.TomTat.ToString();
                        ckNoiDung.Text = qtdto.NoiDung.ToString();
                    }
                }
            }
        }

        protected void btnBaiVietMoi_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTieuDe.Text != null)
                {
                    qtdto.TieuDe = txtTieuDe.Text;
                    qtdto.TomTat = txtTomTat.Text;
                    qtdto.NoiDung = ckNoiDung.Text;
                    qtdto.NgayDang = DateTime.Parse(txtNgayDang.Text);
                    qtdto.MaNguoiDang = manguoidung;
                    bool kq = qtdao.ThemMoi(qtdto);
                    if (kq == true)
                        Response.Redirect("~/Pages/QuanLyQuiTrinh.aspx");
                    else
                        lblThongBao.Text = "Fail!";
                }
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }
    }
}