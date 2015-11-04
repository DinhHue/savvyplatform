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
    public partial class reportILA : System.Web.UI.Page
    {
        private ClaimDAO claimDao = new ClaimDAO();
        private static String mClaimID = "";
        private DaiLyDAO dailyDao = new DaiLyDAO();
        public bool isLock = false;
        KhachHangDAO kh = new KhachHangDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["claimID"] != null)
            //        mClaimID = Request.QueryString["claimID"];
            if (!IsPostBack)
            {
                if (Session["ThamChieu"] != null)
                {
                    string idclaim = Session["ThamChieu"].ToString();
                    mClaimID = idclaim;

                    string done = dailyDao.KiemTraTinhTrang(mClaimID, "ILA");
                    if (done != null && done.ToLower() == "yes")
                    {
                        isLock = true;
                    }


                    loadData(mClaimID);
                    loadDanhMucThietHai(mClaimID);
                }
            }
        }
        void loadckLHTT(int idck)
        {
            if (idck == 1)
            { ck1.Checked = true; }
            if (idck == 2)
            { ck2.Checked = true; }
            if (idck == 3)
            { ck3.Checked = true; }
            if (idck == 4)
            { ck4.Checked = true; }
            if (idck == 5)
            { ck5.Checked = true; }
            if (idck == 6)
            { ck6.Checked = true; }
            if (idck == 7)
            { ck7.Checked = true; }
            if (idck == 8)
            { ck8.Checked = true; }
            if (idck == 9)
            { ck9.Checked = true; }
            if (idck == 10)
            { ck10.Checked = true; }

        }
        protected void loadData(String claimID)
        {
            loadSIGNPre(claimID);
            loadSIGNCheck(claimID);
            loadGDV();
            DataRow row = claimDao.LayInFoReportILA(claimID);
          
            if (row != null)
            {
                //lblNgayGiamDinh.Text = "Ngày " + DateTime.Now.ToString("dd/MM/yyyy") ;
                string ngaybaocao = row["ILADATE"].ToString();
                if (ngaybaocao != "")
                {
                    lblILADATE.Text = ngaybaocao;
                    txtILADATE.Text = ngaybaocao;
                }
                else
                    lblILADATE.Text = "dd/mm/yyy.";

                lblTenClaim.Text = "ILA_" + row["TenClaim"].ToString();
                string nguoiILA = row["ILAGDV"].ToString();
                if (nguoiILA != "")
                {
                    lblILAGDV.Text = nguoiILA;
                    txtILAGDV.Text = nguoiILA;
                }
                else
                    lblILAGDV.Text=row["FullName"].ToString();
                lblTenNhaBH.Text = row["TenNhaBH"].ToString();

                lblPolicyNO.Text = row["PolicyNo"].ToString();
                txtPolicyNO.Text = lblPolicyNO.Text;

                lblTenDonVi.Text = row["TenDonVi"].ToString();
                lblEffective.Text= row["Effective"].ToString();
                txtEffective.Text = lblEffective.Text;

                lblTenKhachHang.Text  = row["TenKhachHang"].ToString();
                txtTenKhachHang.Text = row["TenKhachHang"].ToString();

                lblFax.Text    = row["Fax"].ToString();
                txtFax.Text = row["Fax"].ToString();

                lblDiaChi.Text  = row["DiaChi"].ToString();
                txtDiaChi.Text = row["DiaChi"].ToString();

                lblTenNguoiDaiDien.Text = row["TenNguoiDaiDien"].ToString();
                txtTenNguoiDaiDien.Text = row["TenNguoiDaiDien"].ToString();

                lblDienThoai.Text   = row["DienThoai"].ToString();
                txtDienThoai.Text = row["DienThoai"].ToString();
                lblEmail.Text = row["Email"].ToString();
                txtEmail.Text = row["Email"].ToString();
                lblPremises.Text = row["Premises"].ToString();
                txtPremises.Text = lblPremises.Text;

                lblDOL.Text            = row["DOL"].ToString();
                txtDOL.Text = lblDOL.Text;
                int i = int.Parse(row["ID_LoaiHinhTonThat"].ToString());
                loadckLHTT(i);
                lblGhiChuLoaiHinhTonThat.Text = row["GhiChuLoaiHinhTonThat"].ToString();
                txtGhiChuLoaiHinhTonThat.Text = lblGhiChuLoaiHinhTonThat.Text;

                lblDienBienTonThat.Text = row["DienBienTonThat"].ToString();
                txtDienBienTonThat.Text = lblDienBienTonThat.Text;
                if (row["ThongBaoCQCN"].ToString().Trim().ToUpper() == "YES")
                    checkBoxThongBao.Checked = true;
                else
                    checkBoxThongBao.Checked = false;

                lblGhiChuTBCQCN.Text = row["GhiChuTBCQCN"].ToString();
                txtGhiChuTBCQCN.Text = lblGhiChuTBCQCN.Text;

                lblPhamViTonThat.Text  = row["PhamViTonThat"].ToString();
                txtPhamViTonThat.Text = lblPhamViTonThat.Text;
                lblDuPhongTonThat.Text = row["DuPhongTonThat"].ToString();
                txtDuPhongTonThat.Text = lblDuPhongTonThat.Text;

                lblPhuLucDinhKem.Text = row["PhuLucDinhKem"].ToString();
                txtPhuLucDinhKem.Text = lblPhuLucDinhKem.Text;

                lblTenClaim1.Text = "ILA_" + row["TenClaim"].ToString();

                lblDePhongVaKhuyenCaoILA.Text = row["DePhongVaKhuyenCaoILA"].ToString();
                txtDePhongVaKhuyenCaoILA.Text = lblDePhongVaKhuyenCaoILA.Text;

                lblYKienGDV.Text = row["YKienGDV"].ToString();
                txtYKienGDV.Text = lblYKienGDV.Text;

                String decription = "Công tác giám định hiện trường kết thúc lúc [XXX]. Các bước tiếp theo trong tiến trình thu thập thông tin / đánh giá tổn thất và xác định trách nhiệm của Hợp đồng bảo hiểm sẽ được chúng tôi liên tục cập nhật để Quý Công ty Bảo hiểm nắm bắt thông tin xử lý thuận tiện nhất. ";
                String decriptionEn = "Following completion of our preliminary site survey dated [XXXX] as above stated, our further reports shall follow with updated progress in respect of the requested information obtained, damage assessment and available loss adjustment for Insurers’ convenient review and consideration.";
                String gioKhaoSat   = row["GioKhaoSatHienTruong"].ToString();
                String giokhaosatEN = row["GioKhaoSatHienTruongEN"].ToString();
                decription = decription.Replace("[XXX]", gioKhaoSat);
                decriptionEn = decriptionEn.Replace("[XXXX]", giokhaosatEN);

                lblDescriptionGioKhaoSat.Text = decription;
                lblDescriptionGioKhaoSatEN.Text = decriptionEn;
                
            }
            
        }
        void loadSIGNPre(string claimID)
        {
            DataRow row = claimDao.InfoSignatureILAPre(claimID);
            if (row != null)
            {
                lblID_GDVILA.Text = row[0].ToString();
                lblChucVuNguoiBC.Text = row[1].ToString();
              
            }
        }
        void loadSIGNCheck(string claimID)
        {
            DataRow row = claimDao.InfoSignatureILACheck(claimID);
            if (row != null)
            {
                
                lblID_GDVCheckILA.Text = row[0].ToString();
                lblChucvuNguoiCheck.Text = row[1].ToString();
            }
        }
        void loadGDV()
        {
            drID_GDVILA.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVILA.DataTextField = "TenGDV";
            drID_GDVILA.DataValueField = "ID_GDV";
            drID_GDVILA.DataBind();
            drID_GDVCheckILA.DataSource = gdv.DanhSachGiamDinhVien();
            drID_GDVCheckILA.DataTextField = "TenGDV";
            drID_GDVCheckILA.DataValueField = "ID_GDV";
            drID_GDVCheckILA.DataBind();
        }
        private void loadDanhMucThietHai(String claimID)
        {
            DanhMucThietHaiDAO danhMucThietHaiDAO = new DanhMucThietHaiDAO();
            DataTable dataSource = danhMucThietHaiDAO.DanhSachDanhMucThietHaiTheoClaim(claimID);
            int dem = dataSource.Rows.Count;
            bool kt = false;
            for (int i = 0; i < dem; i++)
            {
                DataRow dr = dataSource.Rows[i];
                string text = dr["YKienGDV"].ToString();
                if (text != "" && text!=null)
                    kt = true;
            }
            if (kt == true)
            {              
                gvYKienYCo.DataSource = dataSource;
                gvYKienYCo.DataBind();
            }
            gvDanhMucThietHai.DataSource = dataSource;
            gvDanhMucThietHai.DataBind();
        }
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void btnUpdateGDV_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "";

                bool up = claimDao.UpdatePrepareILA(mClaimID, id);
                if (up == true)
                {
                    loadSIGNPre(mClaimID);

                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + mClaimID + ".";
                SaveLogTracking(maGDV, noidung, mClaimID);


                Response.Redirect(Request.RawUrl + "#" + key);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error', 'Error update data');</script>");
            }
        }
        protected void btnPrepareILA_Click(object sender, EventArgs e)
        {
            
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                Response.Write("<script> alert('Please login again!');</script>");

            }
            else
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                    id = Session["ThamChieu"].ToString();
                else
                    Response.Write("<script> alert('Come back home page and select Claim No again!');</script>");
                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                bool up = claimDao.UpdatePrepareILA(id, idgdv);
                if (up == true)
                {
                    loadSIGNPre(id);
                   
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }

        protected void btnCheckILA_Click(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                Response.Write("<script> alert('Please login again!');</script>");

            }
            else
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                    id = Session["ThamChieu"].ToString();
                else
                    Response.Write("<script> alert('Come back home page and select Claim No again!');</script>");
                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                bool up = claimDao.UpdateCheckILA(id, idgdv);
                if (up == true)
                {
                    
                    loadSIGNCheck(id);
                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
            }
        }
       
        protected void checkBoxThongBao_CheckedChanged(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string id = "";
                if (Session["ThamChieu"] != null)
                {
                    id = Session["ThamChieu"].ToString();

                    if (checkBoxThongBao.Checked == true)
                    {
                        string stt = "Yes";
                        bool up = claimDao.UpdateTBCQCN(id, stt);
                        if (up == true)
                            loadData(id);
                    }
                    else
                    {
                        string stt = "No";
                        bool up = claimDao.UpdateTBCQCN(id, stt);
                        if (up == true)
                            loadData(id);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = "";

                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                claimDao.updateClaimField(mClaimID, key, value);
                //sm.sendNoiDungClaim("Report_Update", TenGDV(), value,key, claimID);
                //sm.UpdateClaim("Report_Update", TenGDV(), value, key, claimID);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + claimID + ".";
                SaveLogTracking(maGDV, noidung, mClaimID);


                Response.Redirect(Request.RawUrl + "#" + key);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error', 'Error update data');</script>");
            }
        }

        protected void btnUpdateKhachHang_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();

                int maKH = (int)kh.LayMaKHClaim(mClaimID);
                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                TextBox txtValue = (TextBox)FindControl("txt" + key);
                string value = txtValue.Text;
                string title = "";

                if (value.Contains("'"))
                {
                    value = value.Replace("'", "&#39;");
                }
                kh.UpdateKhachHang(maKH, key, value);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + mClaimID + ".";
                SaveLogTracking(maGDV, noidung, mClaimID);
                Response.Redirect(Request.RawUrl + "#" + key);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error', 'Error update data');</script>");
            }
        }
        protected void btnUpdateGDVCheck_Click(object sender, EventArgs e)
        {
            try
            {
                mClaimID = Session["ThamChieu"].ToString();
                //int claimID = int.Parse(mClaimID);

                Button btn = (Button)sender;
                string key = btn.Attributes["key"];

                DropDownList drValue = (DropDownList)FindControl("dr" + key);
                int id = int.Parse(drValue.SelectedValue.ToString());
                string title = "";

                bool up = claimDao.UpdateCheckILA(mClaimID, id);
                if (up == true)
                {
                    loadSIGNCheck(mClaimID);

                }
                else
                    Response.Write("<script> alert('Update preparer error!');</script>");
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                GiamDinhVienDAO gdv = new GiamDinhVienDAO();
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited " + title + " of " + mClaimID + ".";
                SaveLogTracking(maGDV, noidung, mClaimID);


                Response.Redirect(Request.RawUrl + "#" + key);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error', 'Error update data');</script>");
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