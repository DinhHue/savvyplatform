using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Uc
{
    public partial class ucEditDaiLy : System.Web.UI.UserControl
    {
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        DaiLyDAO dldao = new DaiLyDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.IsPostBack)
            //{
            //    int ma = int.Parse(Session["MaDaiLy"].ToString());
            //    loadDaiLyMa(ma);
            //    lblMaDaily.Text = ma.ToString();
            //}
        }
        void loadDaiLyMa(int ma)
        {
            DataTable dt = new DataTable();
            dt = dldao.DaiLyTheoMa(ma);
            if (dt.Rows.Count > 0)
            {
                gvDSImportant.DataSource = dt;
                gvDSImportant.DataBind();
            }
        }
        protected void btnUprate_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(Session["MaDaiLy"].ToString());
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            //int ma=int.Parse(lblMaDaily.Text);
            dldao.UpRate(ma);
            loadDaiLyMa(ma);

        }

        protected void btnDownrate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDone_Click(object sender, EventArgs e)
        {

        }
    }
}