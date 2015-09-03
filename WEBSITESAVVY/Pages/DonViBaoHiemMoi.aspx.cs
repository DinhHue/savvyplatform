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
    public partial class NhaBaoHiemMoi : System.Web.UI.Page
    {
        void load_DropList()
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    //Nha bao hiem
                    loadDVNBH();
                }
            }
        }
        void loadDVNBH()
        {
            NhaBHDAO nbhdao = new NhaBHDAO();
            drCTYTong.DataSource = nbhdao.DSCongTyTong();
            drCTYTong.DataTextField = "TenNhaBH";
            drCTYTong.DataValueField = "ID_NhaBH";
            drCTYTong.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load_DropList();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            DonViDTO dvdto = new DonViDTO();
            DonViBHDAO dvdao = new DonViBHDAO();
            try
            {
                 bool kq = dvdao.KiemTraMaHoa(txtMaHoa.Text);
                 if (kq == true)
                     txtThongBaoLoiMaHoa.Text = "Đã tồn tại mã hóa cho đơn vị khác !";
                 else
                 {
                     dvdto.MaHoa = txtMaHoa.Text.Trim();
                     dvdto.TenDonVi = txtTendonvi.Text.Trim();
                     dvdto.Id_NhaBH = int.Parse(drCTYTong.SelectedItem.Value.ToString());
                     dvdto.DiaChi = txtDiaChi.Text.Trim();
                     dvdto.DienThoai = txtDienThoai.Text.Trim();
                     dvdto.Fax = txtFax.Text.Trim();
                     dvdto.WebSite = txtWebsite.Text.Trim();
                     dvdto.MaSoThue = txtMaSoThue.Text;
                     //dvdto.MaNguoiDaiDien = int.Parse(drNguoiDaiDien.SelectedItem.Value.ToString());
                     dvdao.DonViMoi(dvdto);
                     txtThongBaoLoiMaHoa.Text = "";
                     //txtThemThanhCong.Text = "Succed!";
                     //Response.Redirect("~/pages/Claim.aspx");
                     Response.Write("<script>alert('Succeed!');</script>");
                     loadDVNBH();
                 }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

       
    }
}