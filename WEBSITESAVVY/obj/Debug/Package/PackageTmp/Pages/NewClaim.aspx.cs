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
    public partial class NewClaim : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                //if (Session["GDV"] != null)
                {
                    load_DropList();
                    lblThongBao.Text = "";
                    //txtAssignedDate.Text = DateTime.Today.ToShortDateString;
                    int manbh = int.Parse(drInsurer.SelectedItem.Value.ToString());
                    //txtTimeComplete.Text = DateTime.Today.ToShortDateString();
                    load_DonViBaoHiem(manbh);
                    //loadCK();
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
        //void loadCK()
        //{
            
        //    ckDePhongTonThatVaKhuyenCao.config.toolbar = new object[]
        //    {
        //         new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
        //        new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
        //        new object[] { "Styles", "Format", "Font", "FontSize" },
        //    };
        //    ckYKienGDV.config.toolbar = new object[]
        //    {
        //         new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
        //        new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
        //        new object[] { "Styles", "Format", "Font", "FontSize" },
        //    };
        //    ckDienBienTonThat.config.toolbar = new object[]
        //    {
        //         new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
        //        new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
        //        new object[] { "Styles", "Format", "Font", "FontSize" },
        //    };
        //}
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
                if (madv != 0 && maGDV != 0 && idloaihtt!=0 )
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
                        clm.TenClaim = mcl + mahoaDV + "-"+ drTypePolicy.SelectedItem.Value+ "-" + txtTypePolicy.Text;
                        clm.MaDonVi = (int)madv;
                        clm.MaGDV1 = (int)maGDV;
                        //string nguoichidinh = txtHandler.Text;
                        //if (nguoichidinh != "")
                        //    clm.NguoiPhuTrach = nguoichidinh;
                        //else
                        //    clm.NguoiPhuTrach = "";
                        clm.MaKhachHang = maKH;
                        //string sohd = txtPolicyNo.Text;
                        //if (sohd != "")
                        //    clm.PolicyNo = sohd;
                        //else
                        //    clm.PolicyNo = "";
                        //string hieuluc = txtEffective.Text;
                        //if (hieuluc != "")
                        //    clm.Effective = hieuluc;
                        //else
                        //    clm.Effective = "";

                        if (idloaihtt != 0)
                            clm.MaloaiHinhTonThat = (int)idloaihtt;
                        else
                            Response.Write("<script>alert('Please select Type of Loss!');</script>");
                        string ghichu = txtGhiChu.Text;
                        if (ghichu != "")
                            clm.GhiChu = ghichu;
                        else
                            clm.GhiChu = "";
                       //string date = txtDateofloss.Text;
                       //if (date != "")
                       //    clm.Dol = date;
                       //else
                       //    clm.Dol = "";
                       //string diadiemtt = txtPresmises.Text;
                       //if (diadiemtt != "")
                       //    clm.Premises = diadiemtt;
                       //else
                       //    clm.Premises = "";
                        string ngaychidinh = txtAssignedDate.Text;
                        if (ngaychidinh != "")
                            clm.AssignedDate = ngaychidinh;
                        else
                            clm.AssignedDate = "";
                        #region Oldcode
                        
                        //string dienbientonthat = ckDienBienTonThat.Text;
                        //if (dienbientonthat != "")
                        //    clm.DienBienTonThat1 = dienbientonthat;
                        //else
                        //    clm.DienBienTonThat1 = "";
                        //string thongbaocqcn = "";
                        //if (ckYes.Checked == true)
                        //{
                        //    thongbaocqcn = "Yes";
                        //    clm.ThongBaoCQCN1=thongbaocqcn;
                        //    //ckNo.Checked = false;
                        //}                        
                        //if (ckNo.Checked == true)
                        //{
                        //    thongbaocqcn = "No";
                        //    clm.ThongBaoCQCN1=thongbaocqcn;
                        //    //ckYes.Checked = false;
                        //}
                        //if (ckNo.Checked == false && ckYes.Checked == false)
                        //    clm.ThongBaoCQCN1 = "No";
                         
                        //string ghichutbcqcn = txtFurthernotes.Text;
                        //if (ghichutbcqcn != "")
                        //    clm.GhiChuTBCQCN = ghichutbcqcn;
                        //else
                        //    clm.GhiChuTBCQCN = "";
                        //string phamvitonthat = ckExtentofloss.Text;
                        //if (phamvitonthat != "")
                        //    clm.PhamViTonThat = phamvitonthat;
                        //else
                        //    clm.PhamViTonThat = "";
                        //string duphong = txtintitialreserve.Text;
                        //if (duphong != "")
                        //    clm.DuPhongTonThat = duphong;
                        //else
                        //    clm.DuPhongTonThat = "";
                        //string phuluc = txtappendixattached.Text;
                        //if (phuluc != "")
                        //    clm.PhuLucDinhKem1 = phuluc;
                        //else
                        //    clm.PhuLucDinhKem1 = "";
                        //string dephongvakhuyencao = ckDePhongTonThatVaKhuyenCao.Text;
                        //if (dephongvakhuyencao != "")
                        //    clm.DePhongVaKhuyenCao = dephongvakhuyencao;
                        //else
                        //    clm.DePhongVaKhuyenCao = "";
                        //string ykien = ckYKienGDV.Text;
                        //if (ykien != "")
                        //    clm.YKienGDV = ykien;
                        //else
                        //    clm.YKienGDV = "";
                        //clm.GioKhaoSatHienTruong = txtTimeComplete.Text;
                        #endregion
                        string tp = txtTypePolicy.Text;
                        if (tp == "")
                            Response.Write("<script>alert('Type Police can not empty!');</script>");
                        else
                        {
                            clm.TypePolicy = tp;
                            bool themclaim = cldao.InsertShort(clm);
                            if (themclaim == true)
                            {
                                ClearInputs(Page.Controls);
                                sm.SendNewClaim(clm, khdto, tendonvi, tengdv);
                                //Response.Redirect(Request.Url.PathAndQuery, true);// làm sạch textbox
                                Session["IDClaim"] = mcl;
                                Response.Redirect("~/Pages/TypeItemWorkSheet.aspx");
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

    }
}