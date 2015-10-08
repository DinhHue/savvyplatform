using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Uc
{
    public partial class NhaBaoHiem : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblThongBao.Text = "";
                NhaBHDAO bhdao = new NhaBHDAO();
                DataTable dt = bhdao.DSCongTyTong();
                grDS.DataSource = dt;
                grDS.DataBind();
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }
    }
}