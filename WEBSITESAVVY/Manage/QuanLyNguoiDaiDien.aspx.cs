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
    public partial class QuanLyNguoiDaiDien : System.Web.UI.Page
    {
        DaiDienDAO dd = new DaiDienDAO();
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
                    Panel1.Visible = false;
                    if (dt.Rows.Count > 0)
                    {
                        drBH.DataSource = dt;
                        drBH.DataValueField = "ID_NhaBH";
                        drBH.DataTextField = "TenNhaBH";
                        drBH.DataBind();
                        int maNhaBH = int.Parse(drBH.SelectedItem.Value.ToString());
                        load_DonViBaoHiem(maNhaBH);
                    }

                  
                }
            }
        }

        void load_DonViBaoHiem(int maNhaBH)
        {
            if (!this.IsPostBack)
            {

                DonViBHDAO dvbhdao = new DonViBHDAO();
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
        protected void drBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_Grid();       
        }
        void load_DaiDien()
        {
            DataTable dt = new DataTable();
           
            dt = dd.DSNguoiDaiDien(int.Parse(drDV.SelectedItem.Value.ToString()));
            grDaiDienBH.DataSource = dt;
            grDaiDienBH.DataBind();

        }

        
        protected void grDaiDienBH_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(grDaiDienBH.DataKeys[e.RowIndex].Value.ToString());
            bool kq = dd.XoaDaiDien(ma);
            if (kq == true)
                load_DaiDien();
            else
                Response.Write("<script>alert('Không thể xoá!');</script>");
        }

        void loadInfoUpdate(int ma)
        {
            DataRow dr = dd.InfoDaiDien(ma);
            if (dr != null)
            { 
                lblID.Text=dr["ID_DaiDien"].ToString();
                txtHoTen.Text=dr["TenNguoiDaiDien"].ToString();
                txtchucvu.Text=dr["ChucVu"].ToString();
                txtdienthoai.Text=dr["DienThoai"].ToString();
                txtemail.Text=dr["Email"].ToString();
            }
        }
        protected void grDaiDienBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DaiDienDAO dd = new DaiDienDAO();
            GridViewRow row = grDaiDienBH.SelectedRow;
            int ma = 0;
            if (row != null)
            {
                ma = int.Parse(row.Cells[0].Text);
                loadInfoUpdate(ma);
                Panel1.Visible = true;
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            DaiDienDTO ddo = new DaiDienDTO();
            ddo.MaDaiDien = int.Parse(lblID.Text);
            ddo.TenNguoiDaiDien = txtHoTen.Text;
            ddo.PhongBan = txtphongban.Text;
            ddo.ChucVu = txtphongban.Text;
            ddo.DienThoai = txtdienthoai.Text;
            ddo.Email = txtemail.Text;
            bool cn = dd.UpdateDaiDien(ddo);
            if (cn == true)
            {
                load_DaiDien();
                Panel1.Visible = false;
            }
        }
       
    }
}