using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Security.Cryptography;
using System.Data;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient; 
namespace WEBSITESAVVY.Pages
{
    public partial class newclaimpop : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        ClaimDTO clm = new ClaimDTO();
        TaiSanDAO tsdao = new TaiSanDAO();
        TaiSanDTO tsdto = new TaiSanDTO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        LoaiHinhTonThatDAO lhtt = new LoaiHinhTonThatDAO();
        KhachHangDTO khdto = new KhachHangDTO();
        KhachHangDAO khdao = new KhachHangDAO();
        DonViBHDAO dvdao = new DonViBHDAO();
        string tenthamchieu;
        string claim;
        SendMailDAO sm = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            drSubsidiary.Attributes.Add("required", "required");
            txtInsurerd.Attributes.Add("required", "required");
            txtTypePolicy.Attributes.Add("required", "required");


            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    load_DropList();
                    lblThongBao.Text = "";
                    int manbh = int.Parse(drInsurer.SelectedItem.Value.ToString());
                    load_DonViBaoHiem(manbh);
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
                drTypeofloss.DataSource = lhtt.DSLoaiHinhTT();
                drTypeofloss.DataValueField = "ID_LoaiHinhTonThat";
                drTypeofloss.DataTextField = "LoaiHinhTonThat";
                drTypeofloss.DataBind();
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
            DonViBHDAO dvbhdao = new DonViBHDAO();
            int maNhaBH = int.Parse(drInsurer.SelectedItem.Value.ToString());
            if (maNhaBH != 0)
            {
                //load_DonViBaoHiem(maNhaBH);
                drSubsidiary.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
                drSubsidiary.DataValueField = "ID_DonVi";
                drSubsidiary.DataTextField = "TenDonVi";
                drSubsidiary.DataBind();
            }

        }
        private void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        protected void btnCreatnew_Click(object sender, EventArgs e)
        {
            try
            {
                string mcl = txtMaClaim.Text;
                int madv = int.Parse(drSubsidiary.SelectedItem.Value.ToString());
                int maGDV = int.Parse(drSurveyor.SelectedItem.Value.ToString());
                int idloaihtt = int.Parse(drTypeofloss.SelectedItem.Value.ToString());
                clm.Follower = drSurveyor.SelectedItem.ToString();
                if (madv != 0 && maGDV != 0 && idloaihtt != 0)
                {
                    string mahoaDV = dvdao.LayMaHoa(madv);
                    string matenGDV = gdv.LayMaTen(maGDV);
                    string tendonvi = drSubsidiary.SelectedItem.Text;
                    string tengdv = drSurveyor.SelectedItem.Text;
                    int maKH = khdao.LayMaKH();
                    // them khach hang moi
                    khdto.MaKhachHang = maKH;
                    string tenKH = txtInsurerd.Text;
                    if (tenKH != "")
                        khdto.TenKhachHang = tenKH;
                    else
                        Response.Write("<script>alert('Name of insured can not empty!!');</script>");
                    khdto.TenNguoiDaiDien = "";
                    khdto.Email = "";
                    khdto.DienThoai = "";
                    khdto.Fax = "";
                    khdto.DiaChi = "";
                    khdto.MaDonViBH = madv;
                    bool themKH = khdao.KhachHangMoi(khdto);
                    if (themKH == true)// hop le thi them claim
                    {
                        clm.MaClaim = mcl;
                        clm.TenClaim = mcl + mahoaDV + "-" + drTypePolicy.SelectedItem.Value + "-" + txtTypePolicy.Text;
                        clm.MaDonVi = (int)madv;
                        clm.MaGDV1 = (int)maGDV;
                        clm.MaKhachHang = maKH;
                        if (idloaihtt != 0)
                            clm.MaloaiHinhTonThat = (int)idloaihtt;
                        else
                            Response.Write("<script>alert('Please select Type of Loss!');</script>");
                        string ghichu = txtGhiChu.Text;
                        if (ghichu != "")
                            clm.GhiChu = ghichu;
                        else
                            clm.GhiChu = "";
                        string ngaychidinh = txtAssignedDate.Text;
                        if (ngaychidinh != "")
                            clm.AssignedDate = ngaychidinh;
                        else
                            clm.AssignedDate = "";
                        string tp = txtTypePolicy.Text;
                        if (tp == "")
                            Response.Write("<script>alert('Type Police can not empty!');</script>");
                        else
                        {
                            clm.TypePolicy = tp;
                            bool themclaim = cldao.InsertShort(clm);
                            if (themclaim == true)
                            {
                                
                                //sm.SendNewClaim(clm, khdto, tendonvi, tengdv);                                
                                Session["IDClaim"] = mcl;
                                Session["ThamChieu"] = mcl;
                                int GDVThem = int.Parse(Request.Cookies["MaGDV"].Value);
                                string noidung = gdv.LayTenTheoMa(GDVThem) + " created new claim no. " + mcl + ".";
                                SaveLogTracking(GDVThem, noidung, mcl);
                                ClearInputs(Page.Controls);
                                //Response.Redirect("~/Pages/TypeItemWorkSheet.aspx");
                                //lblThongBao.Text = "Insert successful!";
                                Response.Write("<script>window.parent.location = '../Pages/Layout.aspx'</script>");
                            }
                        }
                    }
                }
                else
                    lblThongBao.Text = "Please choose item in dropdonwlist!";
            }
            catch (SqlException ex)
            {
                lblThongBao.Text = ex.Message;
            }
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
    }
}