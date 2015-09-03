using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyDonViBaoHiem : System.Web.UI.Page
    {
        NhaBHDAO nbh = new NhaBHDAO();
        DonViBHDAO dv = new DonViBHDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    grDS.Visible = false;
                    drNBH.DataSource = nbh.DSCongTyTong();
                    drNBH.DataTextField = "TenNhaBH";
                    drNBH.DataValueField = "ID_NhaBH";
                    drNBH.DataBind();
                }
            }
        }

        protected void grDS_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int madv = int.Parse(grDS.DataKeys[e.RowIndex].Value.ToString());
            dv.XoaDonVi(madv);
            int ma = int.Parse(drNBH.SelectedValue);
            loadDS(ma);
        }
        void loadDS(int ma)
        {
            if (ma != 0)
            {
                grDS.DataSource = dv.LayTenMaHoa(ma);
                grDS.DataBind();
            }
        }
        protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            grDS.Visible = true;
            int ma = int.Parse(drNBH.SelectedValue);
            loadDS(ma);
        }

        //protected void grDS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    grDS.PageIndex = e.NewPageIndex;
        //    
        //}

        protected void btnDonViBHMoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/DonViBaoHiemMoi.aspx");
        }

        protected void grDS_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDS.EditIndex = -1;
            int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
            loadDS(ma);
        }

        protected void grDS_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDS.EditIndex = e.NewEditIndex;
            int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
            loadDS(ma);
        }

        protected void grDS_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDS.Rows[e.RowIndex];
            TextBox txtmahoa = row.Cells[1].Controls[0] as TextBox;
            TextBox txttendonvi = row.Cells[2].Controls[0] as TextBox;
            TextBox txtdiachi = row.Cells[3].Controls[0] as TextBox;
            TextBox txtmst = row.Cells[4].Controls[0] as TextBox;
            int id=Int32.Parse(grDS.DataKeys[e.RowIndex].Value.ToString());
            DonViDTO dv = new DonViDTO();
            dv.Id_DonVi = id;
            dv.TenDonVi = txttendonvi.Text;
            dv.DiaChi = txtdiachi.Text;
            dv.MaHoa = txtmahoa.Text;
            dv.MaSoThue = txtmst.Text;
            DonViBHDAO dvdao = new DonViBHDAO();
            bool up=dvdao.DonViUpdate(dv);
            if (up == true)
            {
                e.Cancel = true;
                grDS.EditIndex = -1;
                int ma = int.Parse(drNBH.SelectedItem.Value.ToString());
                loadDS(ma);
            }
            else
                Response.Write("");
        }
    }
}