using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
namespace WEBSITESAVVY.Manage
{
    public partial class newincome : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        InvoiceDAO inv = new InvoiceDAO();
        TimeSheetDAO ts = new TimeSheetDAO();
        IncomeDAO idao = new IncomeDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        int magdv = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    magdv = int.Parse(Request.Cookies["MaGDV"].Value);

                    DataTable dt = new DataTable();
                    dt = gdvdao.CheckManager(magdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        int cv = int.Parse(dr[0].ToString());
                        if (cv != 2)
                        {
                            Response.Write("<script>alert('You can't access!');</script>");
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó

                        }
                        else
                        {
                            loadDSInvoice();
                            loadGDV();
                           
                        }
                    }

                }
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            IncomeDTO idto = new IncomeDTO();
            int idgdv = int.Parse(drDSGDV.SelectedItem.Value.ToString());
            idto.MaGDV = idgdv;
            string thamchieu = drDSClaimInvoice.SelectedItem.ToString();
            bool kttrung = idao.KiemTraTrung(thamchieu, idgdv);
           
            int maInvoice = int.Parse(drDSClaimInvoice.SelectedItem.Value.ToString());
            idto.MaInvoice = maInvoice;
            idto.MaClaim = thamchieu;
            float feeissue = float.Parse(txtPhiCG.Text);
            idto.IssueFee = feeissue;
            float feereal = float.Parse(txtPhiTT.Text);
            idto.RealFee = feereal;
            float percentage = feereal / feeissue;
            idto.Percentage = percentage;
            float magicincome = ts.CyberIncomeGDV(thamchieu, idgdv);
            idto.CyberIncome = magicincome;
            float realincome = percentage * magicincome / 4;
            idto.RealIncome = realincome;
            if (kttrung == false)
            {
                bool kq = idao.Insert(idto);
                if (kq == true)
                    loadIncomeClaim(thamchieu);
                lblThongBao.Text = "";
            }
            else
                lblThongBao.Text = "It was exist!";
        }
        void loadDSInvoice()
        {
            DataTable dt = inv.SelectYear(DateTime.Now.Year);
            drDSClaimInvoice.DataSource = dt;
            drDSClaimInvoice.DataTextField = "ID_Claim";
            drDSClaimInvoice.DataValueField = "ID_Invoice";
            drDSClaimInvoice.DataBind();
        }
        void loadGDV()
        {
            string thamchieu = drDSClaimInvoice.SelectedItem.ToString();
            DataTable dt = ts.ListGDV_Timesheet(thamchieu);
            drDSGDV.DataSource = dt;
            drDSGDV.DataTextField = "TenGDV";
            drDSGDV.DataValueField = "ID_GDV";
            drDSGDV.DataBind();
        }
        void loadIncomeClaim(string claim)
        {
            DataTable dt = new DataTable();
            dt = idao.DSIncomeClaim(claim);
            gvDSTimeSheet.DataSource = dt;
            gvDSTimeSheet.DataBind();
        }

        protected void drDSClaimInvoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGDV();
        }
    }
}