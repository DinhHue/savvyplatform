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
    public partial class task : System.Web.UI.Page
    {
        DaiLyDAO dldao = new DaiLyDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string id = Session["ThamChieu"].ToString();
                gvDSDuocNhan.DataSource = dldao.TaskClaim(id);
                gvDSDuocNhan.DataBind();
            }
        }
    }
}