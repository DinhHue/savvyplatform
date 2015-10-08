using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Pages
{
    public partial class QuiTrinhOffice : System.Web.UI.Page
    {
        SendMailDAO sm = new SendMailDAO();
        int id = 0;
        QuiTrinhDAO qtdao = new QuiTrinhDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
                Response.Redirect("~/Pages/Login.aspx");
           
                else
                {
                    loadDSGDV();
                    id = int.Parse(Request.QueryString["idprocedure"]);
                    QuiTrinhDAO qtdao = new QuiTrinhDAO();
                   
                    QuiTrinhDAO qt = new QuiTrinhDAO();
                    DataTable dt = new DataTable();
                    dt = qt.ChiTietQuiTrinh(id);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        lblTieuDe.Text = dr[0].ToString();
                        lblNgayDang.Text = DateTime.Parse(dr[1].ToString()).ToShortDateString();
                        lblNoiDung.Text = dr[2].ToString();
                       
                    }
                    LoadMemosOther(id);
                }
            }
        }
        void sendTagName()
        {
            string tieude = "Memos";
            string text = lblNoiDung.Text;
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengiamdv = gdvdao.LayTenTheoMa(magdv);
            string brief = lblTieuDe.Text;
            foreach (ListItem item in cklistGDV.Items)
            {
                if (item.Selected)
                {
                    string name = item.ToString();
                    string email = gdvdao.LayEmail(name);
                    sm.ThongBaoMemos("Memos_Savvy",tengiamdv, email, text, brief);
                }
            }
        }
        void loadDSGDV()
        {
            DataTable dt = new DataTable();
            dt = gdvdao.DanhSachGiamDinhVien();
            if (dt.Rows.Count > 0)
            {
                cklistGDV.DataSource = dt;
                cklistGDV.DataTextField = "Username";
                cklistGDV.DataValueField = "ID_GDV";
                cklistGDV.DataBind();
            }
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
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void btnSendtag_Click(object sender, EventArgs e)
        {
            string text = lblTieuDe.Text;
            int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengiamdv = gdvdao.LayMaTen(magdv);
            sendTagName();
        }
        void LoadMemosOther(int id)
        {
            PagedDataSource items = new PagedDataSource();
            DataView dv = new DataView(qtdao.MemosOther(id));
            items.DataSource = dv;
            items.AllowPaging = true;
            items.PageSize = 5;
            items.CurrentPageIndex = PageNumber;
            rpMemoOther.DataSource=items;
            rpMemoOther.DataBind();
        }
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
    }
}