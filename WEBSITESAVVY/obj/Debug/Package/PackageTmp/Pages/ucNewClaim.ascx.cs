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
    public partial class ucNewClaim : System.Web.UI.UserControl
    {
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
        //void load_SLGDV(int )
        //{
        //    if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 1)
        //    {
        //        lbGDV1.Visible = true;
        //        drGDV1.Visible = true;
        //    }
        //    if (int.Parse(drSoLuong.SelectedItem.Value.ToString()) == 2)
        //    {
        //        lbGDV1.Visible = true;
        //        drGDV1.Visible = true;
        //        lbGDV2.Visible = true;
        //        drGDV2.Visible = true;
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                load_DropList();
                int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                load_DonViBaoHiem(maNhaBH);

                //load_SLGDV();
            }
        }
    }
}