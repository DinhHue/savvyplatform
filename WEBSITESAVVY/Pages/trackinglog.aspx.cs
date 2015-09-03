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
        protected void Page_Load(object sender, EventArgs e)
        {
            string date = DateTime.Today.ToShortDateString();
            Load(date);
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