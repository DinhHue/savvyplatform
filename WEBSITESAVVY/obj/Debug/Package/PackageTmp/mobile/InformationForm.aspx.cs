using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
namespace WEBSITESAVVY.mobile
{
    public partial class InformationForm : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        KhachHangDAO khdao = new KhachHangDAO();
        DonViBHDAO dvdao = new DonViBHDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        TheLoaiSumDAO tlsumdao = new TheLoaiSumDAO();
        GiaiDoanDAO gddao = new GiaiDoanDAO();
        MenhGiaDAO mgdao = new MenhGiaDAO();
        SummaryDAO sdao = new SummaryDAO();
        SummaryDetailDAO smddao = new SummaryDetailDAO();
        SummarydetailDTO smddto = new SummarydetailDTO();
        SendMailDAO sm = new SendMailDAO();
        string mathamchieu;
        int ms = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["ThamChieu"] == null)
                {
                    Response.Redirect("~/Pages/Home.aspx");
                }
                //mathamchieu = Request.QueryString["Reference"];
                mathamchieu = Session["ThamChieu"].ToString();
                //Session["ThamChieu"] = mathamchieu;
                string maGDV = Session["MaGDV"].ToString();

                //load_CK();
                if (maGDV != null)
                {
                    if (mathamchieu != null)
                    {
                        loadAll(mathamchieu);
                        int masum = LayMaSummary(mathamchieu);
                        if (masum != 0)
                        {
                            lblMaSum.Text = masum.ToString();
                        }
                        else
                        {
                            ms = LayMaSumMoi(mathamchieu);
                            lblMaSum.Text = ms.ToString();
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Pages/HomeClaim.aspx");
                    }
                }
                else
                    Response.Redirect("/Pages/Longin.aspx");
            }
        }
        protected string TenGDV()
        {
            return Session["GDV"].ToString();

        }
        #region LoadClaim
        void loadAll(string mathamchieu)
        {
            if (!this.IsPostBack)
            {
                loadGDV(mathamchieu);
                loadClaim(mathamchieu);
                LoadKhachHang(mathamchieu);
                LoadNBH_DonVi(mathamchieu);
                loadTheLoaiSum();
                loadGiaiDoan();
                loadMenhGia();
                loadDSGDV();
                int kt = smddao.KiemTraSummary(mathamchieu);
                if (kt == 0)
                    lblThongBaoSumdetail.Visible = true;
                else
                {
                    lblThongBaoSumdetail.Visible = false;
                    loadSummaryBuilding(mathamchieu);
                    loadSummaryConstruction(mathamchieu);
                    loadSummaryLiability(mathamchieu);
                    loadSummaryMachinery(mathamchieu);
                    loadSummaryOther(mathamchieu);
                    loadSummaryStock(mathamchieu);
                    loadTotalSum(mathamchieu);
                }
            }
        }
        void loadDSGDV()
        {
            DataTable dt = new DataTable();
            dt = gdvdao.DanhSachGiamDinhVien();
            if (dt.Rows.Count > 0)
            {
                drGDV.DataSource = dt;
                drGDV.DataTextField = "TenGDV";
                drGDV.DataValueField = "ID_GDV";
                drGDV.DataBind();
                //drgdv2.DataSource = dt;
                //drgdv2.DataTextField = "TenGDV";
                //drgdv2.DataValueField = "Email";
                //drgdv2.DataBind();
                cklistGDV.DataSource = dt;
                cklistGDV.DataTextField = "Username";
                cklistGDV.DataValueField = "ID_GDV";
                cklistGDV.DataBind();
            }
        }
        protected void loadGiaiDoan()
        {
            drStatus.DataSource = gddao.DSGiaiDoan();
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
        }
        protected void loadGDV(string maclaim)
        {
            string tengdv = gdvdao.LayGDVTheoClaim(maclaim);
            txtSurveyor.Text = tengdv;
        }
        protected void loadClaim(string maclaim)
        {
            ClaimDTO cl = new ClaimDTO();
            cl = cldao.LayInFo(maclaim);
            lblThamChieuHead.Text = cl.TenClaim.ToString();
            txtReferencenumber.Text = cl.TenClaim.ToString();
            txtDateofloss.Text = cl.Dol.ToString();
            txtPremises.Text = cl.Premises.ToString();
            txtTypeOfloss.Text = cl.TypePolicy.ToString();
            txtbrief.Text = cl.TomTatVuViec.ToString();
            txtNote.Text = cl.GhiChu.ToString();
            txtPolicyNo.Text = cl.PolicyNo.ToString();
            txtEffective.Text = cl.Effective.ToString();
            txtA1.Text = cl.A1.ToString();
            txtA2.Text = cl.A2.ToString();
            txtC1.Text = cl.C1.ToString();
            txtC2.Text = cl.C2.ToString();
            txtC3.Text = cl.C3.ToString();
            txtE1.Text = cl.E1.ToString();
            txtE2.Text = cl.E2.ToString();
            txtG.Text = cl.G.ToString();
            txtH.Text = cl.H.ToString();
            txtI.Text = cl.I.ToString();
            txtK.Text = cl.K.ToString();

            txtD1.Text = cl.D1.ToString();
            txtLossHistory.Text = cl.LossHistory.ToString();
        }
        protected void LoadKhachHang(string maclaim)
        {
            KhachHangDTO kh = new KhachHangDTO();
            kh = khdao.LayInfo(maclaim);
            txtInsured.Text = kh.TenKhachHang.ToString();
            lblinsured.Text = kh.TenKhachHang.ToString();
            txtContactPerson.Text = kh.TenNguoiDaiDien.ToString();
            txtAddress.Text = kh.DiaChi.ToString();
            txtPhone.Text = kh.DienThoai.ToString();
            txtFaxno.Text = kh.Fax.ToString();
            txtEmail.Text = kh.Email.ToString();
        }
        protected void LoadNBH_DonVi(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = dvdao.LayTenNBH_DonVi(maclaim);
            if (dt.Rows.Count == 1)
            {
                DataRow dr = dt.Rows[0];
                txtInsurer.Text = dr[0].ToString();
                txtSubsidiary.Text = dr[1].ToString();
            }
        }
        protected void loadTheLoaiSum()
        {
            if (!this.IsPostBack)
            {

                drDSLoaiThietHai.DataSource = tlsumdao.DanhSach();
                drDSLoaiThietHai.DataTextField = "TheLoai";
                drDSLoaiThietHai.DataValueField = "ID_TheLoaiSum";
                drDSLoaiThietHai.DataBind();

            }
        }
        protected void loadSummaryBuilding(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachBuilding(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblbuilding.Visible = true;
                gvDanhMucBuilding.DataSource = dt;
                gvDanhMucBuilding.DataBind();
            }
        }
        protected void loadSummaryStock(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachStock(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblstock.Visible = true;
                gvDanhMucStock.DataSource = dt;
                gvDanhMucStock.DataBind();
            }
        }
        protected void loadSummaryMachinery(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachMachinery(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblmachinery.Visible = true;
                gvDanhMucMachinery.DataSource = dt;
                gvDanhMucMachinery.DataBind();
            }
        }
        protected void loadSummaryLiability(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachLiability(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblliability.Visible = true;
                gvDanhMucLiability.DataSource = dt;
                gvDanhMucLiability.DataBind();
            }
        }
        protected void loadSummaryConstruction(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachConstruction(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblconstruction.Visible = true;
                gvDanhMucConstruction.DataSource = dt;
                gvDanhMucConstruction.DataBind();
            }
        }
        protected void loadSummaryOther(string maclaim)
        {
            DataTable dt = new DataTable();
            dt = smddao.DanhSachOther(maclaim);
            if (dt.Rows.Count > 0)
            {
                lblother.Visible = true;
                gvDanhMucOther.DataSource = dt;
                gvDanhMucOther.DataBind();
            }
        }
        void loadTotalSum(string id)
        {
            DataTable dt = new DataTable();
            dt = smddao.loadTotalSum(id);
            if (dt.Rows.Count > 0)
            {
                gvTotal.DataSource = dt;
                gvTotal.DataBind();
            }
        }
        protected void loadMenhGia()
        {
            if (!this.IsPostBack)
            {
                drMenhGia.DataSource = mgdao.DanhSach();
                drMenhGia.DataValueField = "ID_MenhGia";
                drMenhGia.DataTextField = "MenhGia";
                drMenhGia.DataBind();
            }
        }
        protected int LayMaSummary(string idclaim)
        {
            int ma = 0;
            ma = sdao.KiemTraMa(idclaim);
            return ma;
        }
        protected int LayMaSumMoi(string idclaim)
        {
            return sdao.LayMaSummaryMoi(idclaim);
        }
        protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
        {
            if (rdILA.Checked == true)
            {
                txtA2.Enabled = false;
                txtA2.ReadOnly = true;
                txtA1.Enabled = true;
                txtA1.ReadOnly = false;
            }
            else
            {

                txtA2.Enabled = true;
                txtA2.ReadOnly = false;
                txtA1.Enabled = false;
                txtA1.ReadOnly = true;
            }
        }

        protected void rdILA_CheckedChanged(object sender, EventArgs e)
        {
            if (rdILA.Checked == true)
            {
                txtA2.Enabled = false;
                txtA2.ReadOnly = true;
                txtA1.Enabled = true;
                txtA1.ReadOnly = false;
                txtE1.Enabled = true;
                txtE1.ReadOnly = false;
                txtE2.Enabled = false;
                txtE2.ReadOnly = true;
            }
            else
            {

                txtA2.Enabled = true;
                txtA2.ReadOnly = false;
                txtE2.Enabled = true;
                txtE2.ReadOnly = false;
                txtA1.Enabled = false;
                txtA1.ReadOnly = true;
                txtE1.Enabled = false;
                txtE1.ReadOnly = true;
            }
        }

        protected void rdFR_CheckedChanged(object sender, EventArgs e)
        {
            if (rdILA.Checked == true)
            {
                txtA2.Enabled = false;
                txtA2.ReadOnly = true;
                txtA1.Enabled = true;
                txtA1.ReadOnly = false;
                txtE1.Enabled = true;
                txtE1.ReadOnly = false;
                txtE2.Enabled = false;
                txtE2.ReadOnly = true;
            }
            else
            {
                txtA2.Enabled = true;
                txtA2.ReadOnly = false;
                txtE2.Enabled = true;
                txtE2.ReadOnly = false;
                txtA1.Enabled = false;
                txtA1.ReadOnly = true;
                txtE1.Enabled = false;
                txtE1.ReadOnly = true;
            }
        }
        protected string GETMaThamChieu()
        {
            string matc = cldao.LayMaTheoTen(txtReferencenumber.Text);
            bool kttc = cldao.KiemTraThamChieu(matc);
            if (kttc == true)
                return matc;
            else
                return "NULL";
        }
        #endregion
        #region Update_Claim
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            int magiaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
            string giaidoan = drStatus.SelectedItem.ToString();
            string matc = GETMaThamChieu();
            //bool kttc = KiemTraMaThamChieu();
            if (magiaidoan != 0)
            {
                bool up = cldao.UpdateStatus(matc, magiaidoan);
                if (up == true)
                {
                    if (giaidoan == "Case Closed")
                    {
                        bool ra = cldao.UpdateRate(matc, 0);
                        if (ra == true)
                        {
                            //Response.Write("<script>alert('Updated !');</script>");
                            loadAll(matc);
                        }
                        Response.Write("<script>alert('Updated status!');</script>");
                    }
                }
                else
                    Response.Write("<script>alert('Update Fail!');</script>");
            }
        }

        protected void btnSaveA1_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtA1.Text;
            bool up = cldao.UpdateA1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "A1", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);

            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveA2_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtA2.Text;
            bool up = cldao.UpdateA2(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update",TenGDV(), text, "A2", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }


        protected void btnSaveC1_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtC1.Text;
            bool up = cldao.UpdateC1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "C1", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveC2_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtC2.Text;
            bool up = cldao.UpdateC2(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "C2", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveC3_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtC3.Text;
            bool up = cldao.UpdateC3(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "C3", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveE1_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtE1.Text;
            bool up = cldao.UpdateE1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "E1", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveE2_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtE2.Text;
            bool up = cldao.UpdateE2(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "E2", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveG_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtG.Text;
            bool up = cldao.UpdateG(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update",TenGDV(), text, "G", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveH_Click1(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtH.Text;
            bool up = cldao.UpdateH(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "H", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveH_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtH.Text;
            bool up = cldao.UpdateH(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "H", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveI_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtI.Text;
            bool up = cldao.UpdateI(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "I", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
        List<string> dsemail = new List<string>();
        protected void cklistGDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tagname = null;
                List<String> YrStrList = new List<string>();
                foreach (ListItem item in cklistGDV.Items)
                {
                    if (item.Selected)
                    {
                        tagname += item.Value;
                        YrStrList.Add(item.Value);
                    }
                    String YrStr = String.Join(";", YrStrList.ToArray());

                }
            }
        }

        protected void btnSaveK_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtK.Text;
            int magdv = int.Parse(Session["MaGDV"].ToString());
            string tengiamdv = gdvdao.LayMaTen(magdv);
            bool up = cldao.UpdateK(ma, text);
            if (up == true)
            {
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "K", ma);
                sendTagName();

            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnSaveD1_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtD1.Text;
            bool up = cldao.UpdateD1(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Update", TenGDV(), text, "D1", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Reference"];
            smddto.MaSummary = int.Parse(lblMaSum.Text);
            smddto.MaTheLoai = int.Parse(drDSLoaiThietHai.SelectedItem.Value.ToString());
            string diengiai = txtDienGiai.Text;
            if (diengiai != "")
                smddto.TenHangMuc = diengiai;
            else
                smddto.TenHangMuc = "";
            int menhgia = int.Parse(drMenhGia.SelectedItem.Value.ToString());
            if (menhgia != 0)
                smddto.MaMenhGia = menhgia;
            else
                Response.Write("<script>alert('Chưa chọn mệnh giá !');</script>");
            string giatr = txtGiaTriKhieuNai.Text;
            if (giatr != "")
                smddto.GiaTriKhieuNai = float.Parse(giatr);
            else
                smddto.GiaTriKhieuNai = 0;
            string thiethai = txtThietHaiHopLy.Text;
            if (thiethai != "")
                smddto.ThietHaiHopLy = float.Parse(thiethai);
            else
                smddto.ThietHaiHopLy = 0;
            string soluong = txtSoLuong.Text;
            if (soluong != "")
                smddto.SoLuong = int.Parse(soluong);
            else
                smddto.SoLuong = 0;
            string dexuat = txtDeXuatTinhToan.Text;
            if (dexuat != "")
                smddto.DeXuatTinhToan = float.Parse(dexuat);
            else
                smddto.DeXuatTinhToan = 0;
            string ghichu = txtGhiChu.Text;
            if (ghichu != "")
                smddto.GhiChu = ghichu;
            else
                smddto.GhiChu = "";

            bool t = smddao.ThemSummaryDettailMoi(smddto);
            if (t == true)
            {
                //Response.Write("<script>alert('Đã thêm mới !');</script> ");
                Response.Redirect(Request.Url.PathAndQuery, true);
                loadAll(id);
            }
        }

        protected void btnCapNhatInfoBasic_Click(object sender, EventArgs e)
        {
            KhachHangDTO khm = new KhachHangDTO();
            ClaimDTO clm = new ClaimDTO();
            string maclaim = cldao.LayMaTheoTen(lblThamChieuHead.Text);
            if (maclaim != null)
            {
                clm.MaClaim = maclaim;
                clm.TenClaim = txtReferencenumber.Text;
                clm.Premises = txtPremises.Text;
                clm.PolicyNo = txtPolicyNo.Text;
                clm.Effective = txtEffective.Text;
                clm.TypePolicy = txtTypeOfloss.Text;
                khm.TenKhachHang = txtInsured.Text;
                khm.TenNguoiDaiDien = txtContactPerson.Text;
                khm.Fax = txtFaxno.Text;
                khm.DienThoai = txtPhone.Text;
                khm.Email = txtEmail.Text;
                khm.DiaChi = txtAddress.Text;
                bool up = cldao.UpdateInfo(clm, khm);
                if (up == true)
                {
                    sm.CapNhatInfoBasic(clm, khm);
                    Response.Write("<script>alert('Updated!');</script>");
                }
            }
        }
        #endregion
        public void Export(DataTable dt, string sheetName, string title)
        {
            //Tạo các đối tượng Excel
            Microsoft.Office.Interop.Excel.Application oExcel = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel.Workbooks oBooks;
            Microsoft.Office.Interop.Excel.Sheets oSheets;
            Microsoft.Office.Interop.Excel.Workbook oBook;
            Microsoft.Office.Interop.Excel.Worksheet oSheet;

            //Tạo mới một Excel WorkBook 
            oExcel.Visible = true;
            oExcel.DisplayAlerts = false;
            oExcel.Application.SheetsInNewWorkbook = 1;
            oBooks = oExcel.Workbooks;

            oBook = (Microsoft.Office.Interop.Excel.Workbook)(oExcel.Workbooks.Add(Type.Missing));
            oSheets = oBook.Worksheets;
            oSheet = (Microsoft.Office.Interop.Excel.Worksheet)oSheets.get_Item(1);
            oSheet.Name = sheetName;

       


            // Tạo mẳng đối tượng để lưu dữ toàn bồ dữ liệu trong DataTable,
            // vì dữ liệu được được gán vào các Cell trong Excel phải thông qua object thuần.
            object[,] arr = new object[dt.Rows.Count, dt.Columns.Count];

            //Chuyển dữ liệu từ DataTable vào mảng đối tượng
            for (int r = 0; r < dt.Rows.Count; r++)
            {
                DataRow dr = dt.Rows[r];
                for (int c = 0; c < dt.Columns.Count; c++)
                {
                    arr[r, c] = dr[c];
                }
            }

            //Thiết lập vùng điền dữ liệu
            int rowStart = 38;
            int columnStart = 1;

            int rowEnd = rowStart + dt.Rows.Count - 1;
            int columnEnd = dt.Columns.Count;

            // Ô bắt đầu điền dữ liệu
            Microsoft.Office.Interop.Excel.Range c1 = (Microsoft.Office.Interop.Excel.Range)oSheet.Cells[rowStart, columnStart];
            // Ô kết thúc điền dữ liệu
            Microsoft.Office.Interop.Excel.Range c2 = (Microsoft.Office.Interop.Excel.Range)oSheet.Cells[rowEnd, columnEnd];
            // Lấy về vùng điền dữ liệu
            Microsoft.Office.Interop.Excel.Range range = oSheet.get_Range(c1, c2);

            //Điền dữ liệu vào vùng đã thiết lập
            range.Value2 = arr;

            // Kẻ viền
            range.Borders.LineStyle = Microsoft.Office.Interop.Excel.Constants.xlSolid;
          
        }
        private void PrepareGridViewForExport(Control gv)
        {
            LinkButton lb = new LinkButton();
            Literal l = new Literal();
            string name = String.Empty;
            for (int i = 0; i < gv.Controls.Count; i++)
            {
                if (gv.Controls[i].GetType() == typeof(LinkButton))
                {
                    l.Text = (gv.Controls[i] as LinkButton).Text;
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                else if (gv.Controls[i].GetType() == typeof(DropDownList))
                {
                    l.Text = (gv.Controls[i] as DropDownList).SelectedItem.Text;
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                else if (gv.Controls[i].GetType() == typeof(CheckBox))
                {
                    l.Text = (gv.Controls[i] as CheckBox).Checked ? "True" : "False";
                    gv.Controls.Remove(gv.Controls[i]);
                    gv.Controls.AddAt(i, l);
                }
                if (gv.Controls[i].HasControls())
                {
                    PrepareGridViewForExport(gv.Controls[i]);
                }
            }
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            GridView gvclaimxuat = new GridView();
            DataTable dt = new DataTable();
            string id = cldao.LayMaTheoTen(lblThamChieuHead.Text);
            dt = cldao.XuatClaim(id);
            int dem = dt.Rows.Count;
            gvclaimxuat.DataSource = dt;
            gvclaimxuat.DataBind();
            //Export(dt, "Claim", lblThamChieuHead.Text);
            ExportToExcel(lblThamChieuHead.Text + ".xls", gvclaimxuat);

            gvclaimxuat = null;
            gvclaimxuat.Dispose();

        }

        private void ExportToExcel(string strFileName, GridView gv)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
            Response.ContentType = "application/ms-excel";
            Response.ContentEncoding = Encoding.Unicode;
            Response.BinaryWrite(Encoding.Unicode.GetPreamble());
            Response.Charset = "";
            //Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            Response.Write("<font style='font-size:13.0pt; font-family:Times New Roman;'>");
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gv.RenderControl(htw);

            Response.Write(sw.ToString());
            Response.End();


        }

        #region EditSummaryDetail
        protected void gvDanhMucBuilding_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucBuilding.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucBuilding_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucBuilding.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucBuilding.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucBuilding.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        
        }
        bool CapNhatSum(GridViewRow row, int idsumd)
        {
            string id = Request.QueryString["Reference"];
            TextBox tenhangmuc = row.Cells[1].Controls[0] as TextBox;
            TextBox giatrikhieunai = row.Cells[2].Controls[0] as TextBox;
            TextBox soluong = row.Cells[3].Controls[0] as TextBox;
            TextBox thiethaihoply = row.Cells[4].Controls[0] as TextBox;
            TextBox dexuattinhtoan = row.Cells[5].Controls[0] as TextBox;
            TextBox ghichu = row.Cells[6].Controls[0] as TextBox;
            SummarydetailDTO smddt = new SummarydetailDTO();
            int masum = LayMaSummary(id);
            smddt.MaSummary = masum;
            smddt.MaSummaryDetail = idsumd;
            smddt.TenHangMuc = tenhangmuc.Text;
            smddt.GiaTriKhieuNai = float.Parse(giatrikhieunai.Text);
            smddt.ThietHaiHopLy = float.Parse(thiethaihoply.Text);
            smddt.SoLuong = int.Parse(soluong.Text);
            smddt.DeXuatTinhToan = float.Parse(dexuattinhtoan.Text);
            smddt.GhiChu = ghichu.Text;
            return smddao.CapNhatSummaryDetail(smddt);

        }
        protected void gvDanhMucBuilding_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucBuilding.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucMachinery.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucMachinery.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucMachinery_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucMachinery.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucMachinery.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucMachinery.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucStock_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucStock.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucStock.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucStock.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucStock_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucStock.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucStock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucStock.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucConstruction.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucConstruction.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucConstruction_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucConstruction.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucConstruction.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucStock.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucLiability_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucLiability.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucLiability_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucLiability.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucLiability_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucConstruction.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucConstruction.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucStock.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }

        protected void gvDanhMucOther_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDanhMucOther.EditIndex = -1;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucOther_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDanhMucOther.EditIndex = e.NewEditIndex;
            string id = Request.QueryString["Reference"];
            loadAll(id);
        }

        protected void gvDanhMucOther_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = Request.QueryString["Reference"];
            GridViewRow row = gvDanhMucOther.Rows[e.RowIndex];
            int idsumd = int.Parse(gvDanhMucOther.DataKeys[e.RowIndex].Value.ToString());
            bool up = CapNhatSum(row, idsumd);
            if (up == true)
            {
                e.Cancel = true;
                gvDanhMucStock.EditIndex = -1;
                loadAll(id);
            }
            else
            {
                e.Cancel = false;
            }
        }
        #endregion

        protected void btnUpdateFrief_Click(object sender, EventArgs e)
        {
            string id = cldao.LayMaTheoTen(lblThamChieuHead.Text);
            string bri = txtbrief.Text;
            bool up = cldao.CapNhatBrief(id, bri);
            if (up == true)
            {
                Response.Write("<script>alert('Updated!');</script>");
                loadAll(id);
            }
        }


        #region XuatFile CSV
        public void ExportGridViewToCSV(GridView grdGridView, string fileName)
        {

            Response.Clear();

            Response.AddHeader("content-disposition", string.Format

                ("attachment;filename={0}.csv", fileName));

            Response.Charset = "";

            Response.ContentType = "application/vnd.csv";

            StringWriter stringWrite = new StringWriter();

            HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            grdGridView.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();

        }


        #endregion

        protected void btnSaveSummarydetail_Click(object sender, EventArgs e)
        {
            GridView gv = new GridView();
            string idclaim = lblThamChieuHead.Text;
            gv.DataSource = smddao.LaySummaryAll(idclaim);
            gv.DataBind();
            string filename = txtReferencenumber.Text;
            ExportGridViewToCSV(gv, filename);
        }

        protected void btnUpdateLH_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtLossHistory.Text;
            bool up = cldao.UpdateLH(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Update_Claim",TenGDV(), text, "Loss History", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
        double qtyb = 0;
        double claimAb = 0;
        double agreeAb = 0;
        double proposedAdjusb = 0;
        protected void gvDanhMucBuilding_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //double qty = 0;
            //double claimA = 0;
            //double agreeA = 0;
            //double proposedAdjus = 0;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusb += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyb.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyb);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAb.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAb);
                    e.Row.Cells[4].Text = agreeAb.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAb);
                    e.Row.Cells[5].Text = proposedAdjusb.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusb);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtym = 0;
        double claimAm = 0;
        double agreeAm = 0;
        double proposedAdjusm = 0;
        protected void gvDanhMucMachinery_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtym += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtym.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtym);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAm.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAm);
                    e.Row.Cells[4].Text = agreeAm.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAm);
                    e.Row.Cells[5].Text = proposedAdjusm.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusm);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtys = 0;
        double claimAs = 0;
        double agreeAs = 0;
        double proposedAdjuss = 0;
        protected void gvDanhMucStock_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtys += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAs += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAs += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjuss += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtys.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtys);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAs.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAs);
                    e.Row.Cells[4].Text = agreeAs.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAs);
                    e.Row.Cells[5].Text = proposedAdjuss.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjuss);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    //Label lbltotal = (Label)e.Row.FindControl("lbltotal");
                    //lbltotal.Text = tongtime.ToString();
                }
        }
        double qtyc = 0;
        double claimAc = 0;
        double agreeAc = 0;
        double proposedAdjusc = 0;
        protected void gvDanhMucConstruction_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyc.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyc);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAs.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAc);
                    e.Row.Cells[4].Text = agreeAc.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAc);
                    e.Row.Cells[5].Text = proposedAdjusc.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusc);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                   
                }
        }
        double qtyl = 0;
        double claimAl = 0;
        double agreeAl = 0;
        double proposedAdjusl = 0;
        protected void gvDanhMucLiability_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjusl += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyl.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyl);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAl.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAl);
                    e.Row.Cells[4].Text = agreeAl.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAl);
                    e.Row.Cells[5].Text = proposedAdjusl.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjusl);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    
                }
        }
        double qtyo = 0;
        double claimAo = 0;
        double agreeAo = 0;
        double proposedAdjuso = 0;
        protected void gvDanhMucOther_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAo += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjuso += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinhToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[2].Text = qtyo.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", qtyo);
                    e.Row.Cells[2].HorizontalAlign = e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[3].Text = claimAo.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", claimAo);
                    e.Row.Cells[4].Text = agreeAo.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", agreeAo);
                    e.Row.Cells[5].Text = proposedAdjuso.ToString();
                    e.Row.Cells[5].Text = string.Format("{0:###,###}", proposedAdjuso);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                 
                }
        }
        double qtyt = 0;
        double claimAt = 0;
        double agreeAt = 0;
        double proposedAdjust = 0;
        protected void gvTotal_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                qtyt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "GiaTriKhieuNai"));
                claimAt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "SoLuong"));
                agreeAt += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "ThietHaiHopLy"));
                proposedAdjust += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "DeXuatTinToan"));
            }
            else
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[1].Text = qtyt.ToString();
                    e.Row.Cells[1].Text = string.Format("{0:###,###}", qtyt);
                    e.Row.Cells[0].HorizontalAlign = e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[2].Text = claimAt.ToString();
                    e.Row.Cells[2].Text = string.Format("{0:###,###}", claimAt);
                    e.Row.Cells[3].Text = agreeAt.ToString();
                    e.Row.Cells[3].Text = string.Format("{0:###,###}", agreeAt);
                    e.Row.Cells[4].Text = proposedAdjust.ToString();
                    e.Row.Cells[4].Text = string.Format("{0:###,###}", proposedAdjust);
                    //e.Row.Cells[4].HorizontalAlign = e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Font.Bold = true;
                    
                }
        }

        
        protected void btnRate_Click(object sender, EventArgs e)
        {
            int rate = 0;
            
            rate = int.Parse(drRate.SelectedItem.Value.ToString());
            string ma = GETMaThamChieu();
            bool up = cldao.UpdateRate(ma, rate);
            if (up == true)
            {
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnfollower_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            //int magdv = int.Parse(drGDV.SelectedItem.Value.ToString());
            string follower = drGDV.SelectedItem.ToString();
            if (follower != "")
            {
                bool up = cldao.UpdateFollower(ma, follower);
                if (up == true)
                {
                    Response.Write("<script>alert('Updated !');</script>");
                    loadAll(ma);
                }
                else
                    Response.Write("<script>alert('Update Fail!');</script>");
            }
        }

      
        void sendTagName()
        {
            string ma = GETMaThamChieu();
            string text = txtK.Text;
            int magdv = int.Parse(Session["MaGDV"].ToString());
            string tengiamdv = gdvdao.LayTenTheoMa(magdv);
            string brief = txtbrief.Text;
            foreach (ListItem item in cklistGDV.Items)
            {
                if (item.Selected)
                {
                    string name = item.ToString();
                    string email = gdvdao.LayEmail(name);
                    sm.ThongBaoClaimHandlingSummary("Claim_Handling",tengiamdv, email, text, ma, brief);
                }
            }
        }
       
    }
}