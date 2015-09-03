using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient; 
namespace WEBSITESAVVY.Pages
{
    public partial class CreateNewClaim : System.Web.UI.Page
    {
        ClaimDTO cldto = new ClaimDTO();
        ClaimDAO cldao = new ClaimDAO();
        TaiSanDAO tsdao = new TaiSanDAO();
        TaiSanDTO tsdto = new TaiSanDTO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        LoaiHinhTonThatDAO lhtt = new LoaiHinhTonThatDAO();
        KhachHangDTO khdto = new KhachHangDTO();
        KhachHangDAO khdao = new KhachHangDAO();
        DonViBHDAO dvdao = new DonViBHDAO();
        string tenthamchieu;
        string claim;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                 HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)                
                {
                    load_DropList();
                    lblThongBao.Text = "";
                    lblThongBaoLoi.Text = "";
                    #region Old_Code Not use anymore
                    //int maNhaBH = int.Parse(drInsurer.SelectedItem.Value.ToString());
                    //load_DonViBaoHiem(maNhaBH);
                    //tenthamchieu = Session["ThamChieu"].ToString();
                    //claim = Request.QueryString["Claim"];
                    //if (claim == "No")
                    //    //btnCapNhat.Visible = false;
                    //else
                    //    if (tenthamchieu != null)
                    //    {
                    //        //loadBCDTCapNhat(tenthamchieu);
                    //        //btnThem.Visible = false;
                    //    }

                    //load_SLGDV(); 
                    #endregion
                }
                else
                    Response.Redirect("~/Pages/Login.aspx");
            }
            string ma = cldao.LayMa();
            txtMaClaim.Text = ma;
        }
        void load_DropList()
        {
            if (!this.IsPostBack)
            {
                // Giam dinh vien
                DataTable dt = gdv.DanhSachGiamDinhVien();
                drSurveyor.DataSource = dt;
                drSurveyor.DataValueField = "ID_GDV";
                drSurveyor.DataTextField = "TenGDV";
                drSurveyor.DataBind();

                // nha bao hiem
                NhaBHDAO nbhdao = new NhaBHDAO();
                drInsurer.DataSource = nbhdao.DSCongTyTong();
                drInsurer.DataValueField = "ID_NhaBH";
                drInsurer.DataTextField = "TenNhaBH";
                drInsurer.DataBind();

                // loai hinh ton that
                drTypeofLoss.DataSource = lhtt.DSLoaiHinhTT();
                drTypeofLoss.DataValueField = "ID_LoaiHinhTonThat";
                drTypeofLoss.DataTextField = "LoaiHinhTonThat";
                drTypeofLoss.DataBind();
            }
        }
        void load_DonViBaoHiem(int maNhaBH)
        {
            DonViBHDAO dvbhdao = new DonViBHDAO();
            drSubsidiary.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
            drSubsidiary.DataValueField = "ID_DonVi";
            drSubsidiary.DataTextField = "TenDonVi";
            drSubsidiary.DataBind();

        }
        protected void drInsurer_SelectedIndexChanged(object sender, EventArgs e)
        {
                //if (this.IsPostBack)
                //{
                DonViBHDAO dvbhdao = new DonViBHDAO();
                int maNhaBH = int.Parse(drInsurer.SelectedItem.Value.ToString());
                if (maNhaBH != 0)
                {
                    DataTable ds = new DataTable();
                    ds = dvbhdao.DSDonViBaoHiem(maNhaBH);
                    drSubsidiary.DataSource = ds;
                    drSubsidiary.DataValueField = "ID_DonVi";
                    drSubsidiary.DataTextField = "TenDonVi";
                    drSubsidiary.DataBind();
                }
            //}
        }

        protected void btnCreateNew_Click(object sender, EventArgs e)
        {

        }
    }
}