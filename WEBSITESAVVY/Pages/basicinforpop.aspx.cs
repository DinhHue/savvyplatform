using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using System.Data.SqlClient;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class basicinforpop : System.Web.UI.Page
    {
        string mClaimID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            drDonvi.Attributes.Add("required", "required");
            if (!this.IsPostBack)
            {
                if (mClaimID != "")
                {
                    drNBH.Visible = false;
                    drDonvi.Visible = false;
                    LoadInfor(mClaimID);
                    drloaihinhtonthat.Visible = false;
                    //LoadDRNBH();
                    //int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
                    //loadDRDV(ma);
                    btnChangeInsurer.Visible = true;
                    btnCancel.Visible = false;
                    btnchangLHTT.Visible = true;
                    btncanclelhtt.Visible = false;
                    txttenloaihinhtt.Visible = true;
                    
                }
                else
                {
                    LoadDRNBH();
                    int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
                    loadDRDV(ma);
                }
            }
           
        }
        void LoadDRNBH()
        {
            if (this.IsPostBack)
            {
                NhaBHDAO nbh = new NhaBHDAO();

                drNBH.DataSource = nbh.DSCongTyTong();
                drNBH.DataTextField = "TenNhaBH";
                drNBH.DataValueField = "ID_NhaBH";
                drNBH.DataBind();
            }
        }
        void loadDRDV(int ma)
        {
            DonViBHDAO dv = new DonViBHDAO();
            drDonvi.DataSource = dv.DSDonViBaoHiem(ma);
            drDonvi.DataValueField = "ID_DonVi";
            drDonvi.DataTextField = "TenDonVi";
            drDonvi.DataBind();
        }
        void LoaidLHTT()
        {
            drloaihinhtonthat.DataSource = lhtt.DSLoaiHinhTT();
            drloaihinhtonthat.DataValueField = "ID_LoaiHinhTonThat";
            drloaihinhtonthat.DataTextField = "LoaiHinhTonThat";
            drloaihinhtonthat.DataBind();
        }
        int maLHTT = 0;
        void LoadInfor(string maclaim)
        {
            ClaimDAO cl= new ClaimDAO();
            DataTable dt = new DataTable();
            dt = cl.GetBasicInfor(maclaim);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                txtNBH.Text = dr[2].ToString();
                txtDonVi.Text=dr[3].ToString();
                txtTenKhachHang.Text=dr[4].ToString();
                txtDiaChi.Text=dr[5].ToString();
                txtNguoiDaiDien.Text=dr[6].ToString();
                txtPhone.Text=dr[7].ToString();
                txtFax.Text=dr[8].ToString();
                txtEmail.Text=dr[9].ToString();
                txtKinhDoanh.Text=dr[10].ToString();
                txtPolicyNo.Text=dr[11].ToString();
                txtPeriodfrom.Text=dr[12].ToString();
                txtPremises.Text=dr[13].ToString();
                txtDateofloss.Text=dr[14].ToString();
                txttenloaihinhtt.Text=dr["LoaiHinhTonThat"].ToString();
                maLHTT=int.Parse(dr["ID_LoaiHinhTonThat"].ToString());
            }
        }
        ClaimDTO cldto = new ClaimDTO();
        KhachHangDTO khdto = new KhachHangDTO();
        ClaimDAO cl = new ClaimDAO();
        KhachHangDAO kh = new KhachHangDAO();
        SendMailDAO sm = new SendMailDAO();
        LoaiHinhTonThatDAO lhtt = new LoaiHinhTonThatDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        void UpdateLHTT(string idclaim, int idlhtt)
        {
           
                cl.UpdateLHTT(idclaim, idlhtt);

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           //maclaim=Session["ThamChieu"].ToString();
           cldto.MaClaim = mClaimID;
           string policy = txtPolicyNo.Text.Trim();
           if (policy != "")
               cldto.PolicyNo = policy;
           else
               cldto.PolicyNo = "";
           string hieuluc = txtPeriodfrom.Text.Trim();
           if (hieuluc != "")
               cldto.Effective = hieuluc;
           else
               cldto.Effective = "";
           string ddtt = txtPremises.Text.Trim();
           if (ddtt != "")
               cldto.Premises = ddtt;
           else
               cldto.Premises = "";
           string dol = txtDateofloss.Text.Trim();
           if (dol != "")
               cldto.Dol = dol;
           else
               cldto.Dol = "";
           int maKH = cl.ClaimMaKH(mClaimID);
           if (maKH != 0)
               khdto.MaKhachHang = maKH;
           else
               Response.Write("<script> alert('Error ID Insured!');</script>");
           string tenkh = txtTenKhachHang.Text.Trim();
           if (tenkh != "")
               khdto.TenKhachHang = tenkh;
           else
               khdto.TenKhachHang = "";
           string diachi = txtDiaChi.Text.Trim();
           if (diachi != "")
               khdto.DiaChi = diachi;
           else
               khdto.DiaChi = "";
           string trade = txtKinhDoanh.Text.Trim();
           if (trade != "")
               khdto.LinhVucKinhDoanh = trade;
           else
               khdto.LinhVucKinhDoanh = "";
           string daidien = txtNguoiDaiDien.Text.Trim();
           if (daidien != "")
               khdto.TenNguoiDaiDien = daidien;
           else
               khdto.TenNguoiDaiDien = "";
           string dienthoai = txtPhone.Text.Trim();
           if (dienthoai != "")
               khdto.DienThoai = dienthoai;
           else
               khdto.DienThoai = "";
           string fax = txtFax.Text.Trim();
           if (fax != "")
               khdto.Fax = fax;
           else
               khdto.Fax = "";
           string email = txtEmail.Text.Trim();
           if (email != "")
               khdto.Email = email;
           else
               khdto.Email = "";
           bool up = false;
           if(drloaihinhtonthat.Visible==true)
           {
                int idlhtt= int.Parse(drloaihinhtonthat.SelectedItem.Value.ToString());
                UpdateLHTT(mClaimID, idlhtt);
           }
           if (btnChangeInsurer.Visible == true)
               up = cl.UpdateBasicInforNotInsurer(cldto);
           else
           {
               cldto.MaDonVi=int.Parse(drDonvi.SelectedItem.Value.ToString());
               up = cl.UpdateBasicInforInsure(cldto);
           }
            bool upkh = kh.UpdateKHBasic(khdto);
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);   
            if (up == true && upkh == true)
            {
                sm.CapNhatInfoBasicFR(cldto);

                string noidung = gdv.LayTenTheoMa(maGDV) + " edited cover site survey report of case " + mClaimID + " .";
                SaveLogTracking(maGDV, noidung, mClaimID);

                Response.Write("<script>window.parent.location = '../Pages/Layout.aspx?id=" + mClaimID + "'</script>");
                sm.CapNhatInfoBasic(cldto, khdto);
            }
            if (up == true && upkh == false)
            {

                string noidung = gdv.LayTenTheoMa(maGDV) + " failed to edit Insured of site survey report of case " + mClaimID + " .";
                SaveLogTracking(maGDV, noidung, mClaimID);
                Response.Write("<script> alert('Error Update Isured!');</script>");
            }
            if (up == false && upkh == true)
                Response.Write("<script> alert('Error ID Claim Infor!');</script>");
            if (up == false && upkh == false)
            {
                string noidung = gdv.LayTenTheoMa(maGDV) + " failed to edit cover site survey report of case " + mClaimID + " .";
                SaveLogTracking(maGDV, noidung, mClaimID);
                Response.Write("<script> alert('Error Update!');</script>");
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
        protected void btnChangeInsurer_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                btnCancel.Visible = true;
                btnChangeInsurer.Visible = false;
                drNBH.Visible = true;
                drDonvi.Visible = true;
                txtNBH.Visible = false;
                txtDonVi.Visible = false;                
                LoadDRNBH();
                int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
                loadDRDV(ma);
                //btnChangeInsurer.Text = "Cancel";
            }
        }

        protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                DonViBHDAO dv = new DonViBHDAO();
                int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
                if (ma != 0)
                {
                    drDonvi.DataSource = dv.DSDonViBaoHiem(ma);
                    drDonvi.DataValueField = "ID_DonVi";
                    drDonvi.DataTextField = "TenDonVi";
                    drDonvi.DataBind();
                }
            }
            
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnChangeInsurer.Visible = true;
            btnCancel.Visible = false;
            drNBH.Visible = false;
            drDonvi.Visible = false;
            txtNBH.Visible = true;
            txtDonVi.Visible = true;
        }

        protected void btnchangLHTT_Click(object sender, EventArgs e)
        {
            btnchangLHTT.Visible = false;
            btncanclelhtt.Visible = true;
            drloaihinhtonthat.Visible = true;
            LoaidLHTT();
            txttenloaihinhtt.Visible = false;
        }

        protected void btncanclelhtt_Click(object sender, EventArgs e)
        {
            btnchangLHTT.Visible = true;
            btncanclelhtt.Visible = false;
            drloaihinhtonthat.Visible = false;
            LoaidLHTT();
            txttenloaihinhtt.Visible = true;
        }
    }
}