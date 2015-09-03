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
    public partial class ChiTietNguoiDaiDien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                //if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    load_NhaBaoHiem();
                    KhachHangDAO khdao = new KhachHangDAO();
                    int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                    load_DonViBaoHiem(maNhaBH);

                  
                }
            }
        }
        void load_NhaBaoHiem()
        {
            NhaBHDAO nbhdao = new NhaBHDAO();
            drNBH.DataSource = nbhdao.DSCongTyTong();
            drNBH.DataValueField = "ID_NhaBH";
            drNBH.DataTextField = "TenNhaBH";
            drNBH.DataBind();
        }
        void load_DonViBaoHiem(int maNhaBH)
        {
            if (!this.IsPostBack)
            {

                DonViBHDAO dvbhdao = new DonViBHDAO();
                drDVBH.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
                drDVBH.DataValueField = "ID_DonVi";
                drDVBH.DataTextField = "TenDonVi";
                drDVBH.DataBind();
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            KhachHangDAO khdao = new KhachHangDAO();
            KhachHangDTO khdto = new KhachHangDTO();
            try
            {
                khdto.TenKhachHang = txtTenKH.Text.Trim();
                khdto.TenNguoiDaiDien = txtNguoiDaiDien.Text.Trim();
                khdto.Fax = txtFax.Text.Trim();
                khdto.Email = txtEmail.Text.Trim();
                khdto.DienThoai = txtDienThoai.Text.Trim();
                khdto.ChucVu = txtChucVu.Text.Trim();
                khdto.DiaChi = txtDiaChi.Text.Trim();
                khdto.MaLoaiKhachHang = 1;
                khdto.LinhVucKinhDoanh = txtLinhVucKinhDoanh.Text;
                //khdto.MaLVKD = int.Parse(drLVKD.SelectedValue);
                khdto.MaDonViBH = int.Parse(drDVBH.SelectedValue);
                khdao.KhachHangMoi(khdto);
               // Response.Redirect("~/Pages/DonViBaoHiemMoi.aspx");
                Response.Redirect(Request.UrlReferrer.ToString()); 
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DonViBHDAO dvbhdao = new DonViBHDAO();
            int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
            drDVBH.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
            drDVBH.DataValueField = "ID_DonVi";
            drDVBH.DataTextField = "TenDonVi";
            drDVBH.DataBind();
        }

        
    }
}