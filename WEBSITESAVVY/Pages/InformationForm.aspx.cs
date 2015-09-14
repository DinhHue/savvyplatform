using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

namespace WEBSITESAVVY.Pages
{
    public partial class InfomationForm : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        KhachHangDAO khdao = new KhachHangDAO();
        DonViBHDAO dvdao = new DonViBHDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
       
        GiaiDoanDAO gddao = new GiaiDoanDAO();
       
       
        SendMailDAO sm = new SendMailDAO();
        string mathamchieu;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                Response.Write("<script>alert("+TenGDV()+");</script>");
                mathamchieu = Request.QueryString["Reference"];
                //mathamchieu = Session["ThamChieu"].ToString();
                Session["ThamChieu"] = mathamchieu;
                string maGDV = Request.Cookies["MaGDV"].Value;
                lblGDV.Text = gdvdao.LayTenTheoMa(int.Parse(Request.Cookies["MaGDV"].Value));
                //load_CK();
                if (maGDV != null)
                {
                    if (mathamchieu != null)
                    {
                        loadAll(mathamchieu);
                        loadTaskReceived(mathamchieu);
                        //int masum = LayMaSummary(mathamchieu);
                        //if (masum != 0)
                        //{
                        //    lblMaSum.Text = masum.ToString();
                        //}
                        //else
                        //{
                        //    ms = LayMaSumMoi(mathamchieu);
                        //    lblMaSum.Text = ms.ToString();
                        //}
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
        //void load_CK()
        //{
        //    txtK.config.toolbar = new object[]
        //    {
        //         new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock","About" },
        //        new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", },
               
        //    };
        //}
        protected string TenGDV()
        {
            string tengdv = gdvdao.LayTenTheoMa(int.Parse(Request.Cookies["MaGDV"].Value));
            //tengdv=lblGDV.ToString();
            return tengdv;

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
                //loadTheLoaiSum();
                loadGiaiDoan();
                //loadMenhGia();
                loadDSGDV();           
               
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
                ckDSEmailtag.DataSource = dt;
                ckDSEmailtag.DataTextField = "Username";
                ckDSEmailtag.DataValueField = "ID_GDV";
                ckDSEmailtag.DataBind();
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
            ckDiscuss.Text = cl.Discuss.ToString();
            txtD1.Text = cl.D1.ToString();
            txtLossHistory.Text = cl.LossHistory.ToString();
            txtGioiThieu.Text = cl.GioiThieuNDBH.ToString();
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
                sm.sendNoiDungClaim("Report_Update",TenGDV(), text, "A1", ma);
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
                sm.sendNoiDungClaim("Report_Update",TenGDV(), text, "A2", ma);
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
                sm.sendNoiDungClaim("Report_Update",TenGDV(), text, "C1", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "C2", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "C3", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "E1", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "E2", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "G", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "H", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "H", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "I", ma);
                //Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
        List<string> dsemail = new List<string>();
        protected void cklistGDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            int magdv= int.Parse(Session["MaGDV"].ToString());
            string tengiamdv = gdvdao.LayMaTen(magdv);
            bool up = cldao.UpdateK(ma, text);
            if (up == true)
            {
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
                sm.sendNoiDungClaim("Claim_Handling", TenGDV(), text, "K", ma);
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
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "D1", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

       

        protected void btnCapNhatInfoBasic_Click(object sender, EventArgs e)
        {
            
                KhachHangDTO khm1 = new KhachHangDTO();
                ClaimDTO clm1 = new ClaimDTO();
                string maclaim = cldao.LayMaTheoTen(lblThamChieuHead.Text);
                if (maclaim != null)
                {
                    clm1.MaClaim = maclaim;
                    clm1.TenClaim = txtReferencenumber.Text;
                    clm1.Premises = txtPremises.Text;
                    clm1.PolicyNo = txtPolicyNo.Text;
                    clm1.Effective = txtEffective.Text;
                    clm1.TypePolicy = txtTypeOfloss.Text;
                    khm1.TenKhachHang = txtInsured.Text;
                    khm1.TenNguoiDaiDien = txtContactPerson.Text;
                    khm1.Fax = txtFaxno.Text;
                    khm1.DienThoai = txtPhone.Text;
                    khm1.Email = txtEmail.Text;
                    khm1.DiaChi = txtAddress.Text;
                    clm1.Dol = txtDateofloss.Text;
                    bool up = cldao.UpdateInfo(clm1, khm1);
                    if (up == true)
                    {
                        string m=sm.CapNhatInfoBasic(clm1, khm1);
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
            // Căn giữa cột STT
            //Microsoft.Office.Interop.Excel.Range c3 = (Microsoft.Office.Interop.Excel.Range)oSheet.Cells[rowEnd, columnStart];
            //Microsoft.Office.Interop.Excel.Range c4 = oSheet.get_Range(c1, c3);
            //oSheet.get_Range(c3, c4).HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;

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
            //GridView gv = new GridView();
            //string idclaim = lblThamChieuHead.Text;
            //gv.DataSource = smddao.LaySummaryAll(idclaim);
            //gv.DataBind();
            //string filename = txtReferencenumber.Text;
            //ExportGridViewToCSV(gv, filename);
        }

        protected void btnUpdateLH_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtLossHistory.Text;
            bool up = cldao.UpdateLH(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Loss History", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
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
           // int magdv = int.Parse(drGDV.SelectedItem.Value.ToString());
            string follower = drGDV.SelectedItem.ToString();
            if (follower!="")
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
        protected void btnSaveDiscuss_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = ckDiscuss.Text;
            bool up = cldao.UpdateDiscuss(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Claim_Discussion",TenGDV(), text, "Discuss", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
                sendThaoLuanTagName();
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
     
        void sendTagName()
        {
            string ma = GETMaThamChieu();
            string text = txtK.Text;
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
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
        DaiLyDAO dldao = new DaiLyDAO();
        void loadTaskReceived(string idclaim)
        {
            gvDSDuocNhan.DataSource = dldao.TaskClaim(idclaim);
            gvDSDuocNhan.DataBind();
        }
        void sendThaoLuanTagName()
        {
            string ma = GETMaThamChieu();
            string text = ckDiscuss.Text;
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengiamdv = gdvdao.LayTenTheoMa(magdv);
            string brief = txtbrief.Text;
            foreach (ListItem item in ckDSEmailtag.Items)
            {
                if (item.Selected)
                {
                    string name = item.ToString();
                    string email = gdvdao.LayEmail(name);
                    sm.ThongBaoThaoLuan("Claim_Disscussion",tengiamdv, email, text, ma, brief);
                }
            }
        }
        protected void ckDSEmailtag_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tagname = null;
                List<String> YrStrList = new List<string>();
                foreach (ListItem item in ckDSEmailtag.Items)
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

        protected void btn_UpdateGioiThieuNDBH_Click(object sender, EventArgs e)
        {
            string ma = GETMaThamChieu();
            string text = txtGioiThieu.Text;
            bool up = cldao.UpdateGioiThieuInsured(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update",TenGDV(), text, "Insured", ma);
                Response.Write("<script>alert('Updated !');</script>");
                loadAll(ma);
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

     
    }
}