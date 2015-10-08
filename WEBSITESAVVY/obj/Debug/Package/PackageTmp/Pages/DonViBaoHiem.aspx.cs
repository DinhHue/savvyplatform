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
    public partial class DonViBaoHiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    NhaBHDAO nbhdao = new NhaBHDAO();
                    DataTable dt = new DataTable();
                    dt = nbhdao.DSCongTyTong();
                    if (dt.Rows.Count > 0)
                    {
                        drBH.DataSource = dt;
                        drBH.DataValueField = "ID_NhaBH";
                        drBH.DataTextField = "TenNhaBH";
                        drBH.DataBind();
                        int maNhaBH = int.Parse(drBH.SelectedItem.Value.ToString());
                        load_DonViBaoHiem(maNhaBH);
                    }

                    UcDaiDienDonViBaoHiemMoi1.Visible = false;
                    UcDonViBaoHiemMoi2.Visible = false;
                }
            }
        }
        void load_DonViBaoHiem(int maNhaBH)
        {
            if (!this.IsPostBack)
            {
               
                DonViBHDAO dvbhdao = new DonViBHDAO();
                DataTable dt = new DataTable();
                dt= dvbhdao.DSDonViBaoHiem(maNhaBH);
                if (dt.Rows.Count > 0)
                {
                    drDV.DataSource = dt;
                    drDV.DataValueField = "ID_DonVi";
                    drDV.DataTextField = "TenDonVi";
                    drDV.DataBind();
                }
            }
        }
        protected void drBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_Grid();            
        }
        void load_Grid()
        {
            DonViBHDAO dvbhdao = new DonViBHDAO();
            int maNhaBH = int.Parse(drBH.SelectedItem.Value.ToString());
            if (maNhaBH > 0)
            {
                DataTable dt = new DataTable();
                dt = dvbhdao.DSDonViBaoHiem(maNhaBH);
                if (dt.Rows.Count > 0)
                {
                    drDV.DataSource = dt;
                    drDV.DataValueField = "ID_DonVi";
                    drDV.DataTextField = "TenDonVi";
                    drDV.DataBind();
                }
            }
        }
        protected void btnXem_Click(object sender, EventArgs e)
        {
            load_DaiDien();
            UcDaiDienDonViBaoHiemMoi1.Visible = false;
        }
        void load_DaiDien()
        {
            DataTable dt = new DataTable();
            DaiDienDAO dd = new DaiDienDAO();
            dt = dd.DSNguoiDaiDien(int.Parse(drDV.SelectedItem.Value.ToString()));
            grDaiDienBH.DataSource = dt;
            grDaiDienBH.DataBind();
            
        }
        protected void btnNguoiDaiDienMoi_Click(object sender, EventArgs e)
        {
           
            UcDaiDienDonViBaoHiemMoi1.Visible = true;
            UcDonViBaoHiemMoi2.Visible = false;            
        }

        protected void btnDonViBaoHiemMoi_Click(object sender, EventArgs e)
        {
            UcDonViBaoHiemMoi2.Visible = true;
            load_Grid();
        }
    }
}