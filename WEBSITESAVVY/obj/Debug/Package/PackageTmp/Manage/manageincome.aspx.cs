using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class manageincome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                
                  
            }
        }
        InvoiceDAO inv = new InvoiceDAO();
        IncomeDAO ic = new IncomeDAO();
        TimeSheetDAO ts = new TimeSheetDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            InvoiceDTO invdto = new InvoiceDTO();
            invdto.MaClaim = txtId_claim.Text;
            invdto.NoInvoice = txtInvoice.Text;
            invdto.GrandTotal = float.Parse(txtTongTien.Text);
            invdto.DateIssue = DateTime.Parse(txtIssueDate.Text);
            bool kq = inv.Insert(invdto);
            if (kq == true)
            {
                IncomeDTO idto = new IncomeDTO();
                //int idgdv = int.Parse(drDSGDV.SelectedItem.Value.ToString());
                int idgdv = 0;
                
                //idto.MaGDV = 0;
                string thamchieu = txtId_claim.Text;
                //bool kttrung = idao.KiemTraTrung(thamchieu, idgdv);
                DataTable dt = ts.ListIDGDV(thamchieu);
                List<string> ListID = new List<string>();
                if(dt.Rows.Count>0)
                {
                    //foreach (DataRow dr in dt.Rows)
                    for(int t=0;t<dt.Rows.Count;t++)
                    {
                        ListID.Add(dt.Rows[t][0].ToString());
                    }
                }
                //int maLA = int.Parse(ListID[0].ToString());
               
                //foreach (DataRow ID_GDV in ListID)
                for(int i=0; i<ListID.Count; i++)
                {
                    //Response.Write("<script>alert('" + ListID[i].ToString()+ "');</script>");
                    idgdv = int.Parse(ListID[i].ToString());
                    idto.MaGDV = idgdv;
                    int maInvoice = inv.SelectMaMax();
                    idto.MaInvoice = maInvoice;
                    idto.MaClaim = thamchieu;
                    float feeissue = float.Parse(txtIssueFee.Text);
                    idto.IssueFee = feeissue;
                    float feereal = float.Parse(txtRealfee.Text);
                    idto.RealFee = feereal;
                    float percentage = feereal / feeissue;
                    idto.Percentage = percentage;
                    float magicincome = ts.CyberIncomeGDV(thamchieu, idgdv);
                    idto.CyberIncome = magicincome;
                    float realincome = percentage * magicincome / 4;
                    idto.RealIncome = realincome;
                    bool them = ic.Insert(idto);
                }
                Session["ThamChieu"] = thamchieu;
                Response.Redirect("~/Pages/detailincome.aspx");
            }
        }
    }
}