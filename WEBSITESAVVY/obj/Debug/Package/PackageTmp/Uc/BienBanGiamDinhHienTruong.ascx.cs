using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
namespace WEBSITESAVVY.Uc
{
    public partial class BienBanGiamDinhHienTruong : System.Web.UI.UserControl
    {
        ClaimDAO cldao = new ClaimDAO();
        ClaimDTO cldto = new ClaimDTO();
        TaiSanDAO tsdao = new TaiSanDAO();
        TaiSanDTO tsdto = new TaiSanDTO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                load_DropList();
                int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                load_DonViBaoHiem(maNhaBH);
                load_SLGDV();
            }
            string ma = cldao.LayMa();
            txtMaClaim.Text = ma;
        }
        void load_DropList()
        {
            if (!this.IsPostBack)
            {
                // Giam dinh vien
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                DataTable dt = gdv.DanhSachGiamDinhVien();
                drGDV1.DataSource = dt;
                drGDV1.DataValueField = "ID_GDV";
                drGDV1.DataTextField = "TenGDV";
                drGDV1.DataBind();

                drGDV2.DataSource = dt;
                drGDV2.DataValueField = "ID_GDV";
                drGDV2.DataTextField = "TenGDV";
                drGDV2.DataBind();

                drGDV3.DataSource = dt;
                drGDV3.DataValueField = "ID_GDV";
                drGDV3.DataTextField = "TenGDV";
                drGDV3.DataBind();

                // nha bao hiem
                NhaBHDAO nbhdao = new NhaBHDAO();
                drNBH.DataSource = nbhdao.DSCongTyTong();
                drNBH.DataValueField = "ID_NhaBH";
                drNBH.DataTextField = "TenNhaBH";
                drNBH.DataBind();

                // khach hang
                KhachHangDAO khdao = new KhachHangDAO();
                drKH.DataSource = khdao.DSNguoiDuocBaoHiem();
                drKH.DataValueField = "ID_KhachHang";
                drKH.DataTextField = "TenKhachHang";
                drKH.DataBind();

                // loai hinh ton that
                LoaiHinhTonThatDAO lhTTdao = new LoaiHinhTonThatDAO();
                drLoaiHinhTonThat.DataSource = lhTTdao.DSLoaiHinhTT();
                drLoaiHinhTonThat.DataValueField = "ID_LoaiHinhTonThat";
                drLoaiHinhTonThat.DataTextField = "LoaiHinhTonThat";
                drLoaiHinhTonThat.DataBind();
                // giai doan thuc hien
                GiaiDoanDAO gddao = new GiaiDoanDAO();

            }
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
         void load_SLGDV()
        {
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 1)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = false;
                drGDV2.Visible = false;
                lbGDV3.Visible = false;
                drGDV3.Visible = false;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 2)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = false;
                drGDV3.Visible = false;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 3)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = true;
                drGDV3.Visible = true;
                lbGDV4.Visible = false;
                drGDV4.Visible = false;
            }
            if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 4)
            {
                lbGDV1.Visible = true;
                drGDV1.Visible = true;
                lbGDV2.Visible = true;
                drGDV2.Visible = true;
                lbGDV3.Visible = true;
                drGDV3.Visible = true;
                lbGDV4.Visible = true;
                drGDV4.Visible = true;
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {

        }

        protected void drSoLuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_SLGDV();
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

        protected void drDVBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            KhachHangDAO kh = new KhachHangDAO();
            int ma = int.Parse(drDVBH.SelectedValue);
            drKH.DataSource = kh.DSNguoiDBHTheoDonVi(ma);
            drKH.DataValueField = "ID_KhachHang";
            drKH.DataTextField = "TenKhachHang";
            drKH.DataBind();
        }

    }
}