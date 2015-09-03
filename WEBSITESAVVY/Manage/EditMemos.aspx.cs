using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Manage
{
    public partial class EditMemos : System.Web.UI.Page
    {
        QuiTrinhDAO qtdao = new QuiTrinhDAO();
        QuiTrinhDTO qtdto = new QuiTrinhDTO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    if (Session["IDQT"] != null)
                    {
                        int id = int.Parse(Session["IDQT"].ToString());
                        qtdto = qtdao.Lay(id);
                        txtTieuDe.Text = qtdto.TieuDe;
                        txtTomTat.Text = qtdto.TomTat;
                        ckNoiDung.Text = qtdto.NoiDung;
                        lblID.Text = id.ToString();
                    }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                qtdto = new QuiTrinhDTO();
                qtdto.TieuDe = txtTieuDe.Text;
                qtdto.TomTat = txtTomTat.Text;
                qtdto.NoiDung = ckNoiDung.Text;
                qtdto.MaQuiTrinh = int.Parse(lblID.Text);
                qtdto.MaNguoiDang = int.Parse(Request.Cookies["MaGDV"].Value);
                bool up = qtdao.CapNhat(qtdto);
                if (up == true)
                    Response.Redirect("~/Manage/QuanLyMeMo.aspx");
            }
        }
       
    }
}