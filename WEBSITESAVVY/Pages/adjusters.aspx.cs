using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
namespace WEBSITESAVVY
{
    public partial class adjusters : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                //if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    load_GiaiDoan();
                    Session["ThamChieu"] = txtThamChieu.Text;
                   
                }
            }
        }
        void load_GiaiDoan()
        {
            GiaiDoanDAO gd = new GiaiDoanDAO();
            DataTable dt = new DataTable();
            dt = gd.DSGiaiDoan();
            drLoaiBaoCao.DataSource=dt;
            drLoaiBaoCao.DataTextField = "TenGiaiDoan";
            drLoaiBaoCao.DataValueField = "ID_GiaiDoanHoanThanh";
            drLoaiBaoCao.DataBind();
        }
        protected void btnTimClaim_Click(object sender, EventArgs e)
        {
            Session["ThamChieu"] = txtThamChieu.Text;
			
            if (int.Parse(drLoaiBaoCao.SelectedValue) == 1)
             {
                 Response.Redirect("~/Pages/KhaoSatRuiRo.aspx");
             }
           
             if (int.Parse(drLoaiBaoCao.SelectedValue) == 2)
             {
              
                 Response.Redirect("~/Pages/UpdateBaoCaoDauTien.aspx");             
               
             }
             if (int.Parse(drLoaiBaoCao.SelectedValue) == 3)
             {                
               
                 Response.Redirect("~/Pages/UpdateBaoCaoSoBo.aspx");               
               
             }
             if (int.Parse(drLoaiBaoCao.SelectedValue) == 4)
             {
                 Response.Redirect("~/Pages/UpdateBaoCaoCuoiCung.aspx");             
               
             }
        }

       
    }
}