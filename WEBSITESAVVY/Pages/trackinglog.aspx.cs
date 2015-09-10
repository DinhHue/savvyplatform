using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class trackinglog : System.Web.UI.Page
    {
        TrackingDAO tr = new TrackingDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
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
                    //bool ktcv = gdvdao.KiemTraChucVuQuanLy(magdv);
                    DataTable dt = new DataTable();
                    dt = gdvdao.CheckManager(magdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        int cv = int.Parse(dr[0].ToString());
                        if (cv != 2)
                        {
                            //Response.Write(@"<script language='javascript'> alert('You can't access!')</script>");
                            
                            Response.Redirect(Request.UrlReferrer.ToString());// quay lại trang trước đó
                            //Response.Redirect("~/Pages/Notification.aspx");
                        }
                        string date = DateTime.Today.ToShortDateString();
                        Load(date);
                    }
                }
            }
        }
        void Load(string today)
        {
           
            PagedDataSource items = new PagedDataSource();
            DataView dv = new DataView(tr.ListTrackingDate(DateTime.Parse(today)));
            items.DataSource = dv;
            items.AllowPaging = true;
            items.PageSize = 5000;
            items.CurrentPageIndex = PageNumber;
            rp_Tracking.DataSource = items;
            rp_Tracking.DataBind();
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

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            if(IsPostBack)
                Load(txtDate.Text);
        }
    }
}