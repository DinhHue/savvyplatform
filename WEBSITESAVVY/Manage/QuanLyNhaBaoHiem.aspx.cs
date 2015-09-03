using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using System.Collections;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyNhaBaoHiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                    HienThiDanhSach();
            }
        }
        protected void HienThiDanhSach()
        {
            NhaBHDAO nbbhdao = new NhaBHDAO();
            gvDSCongTy.DataSource = nbbhdao.DSCongTyTong();
            gvDSCongTy.DataBind();
        }
        protected void txtTim_Click(object sender, EventArgs e)
        {
            string ten = txtProductList.Text;
            Tim(ten);
        }
        protected void Tim(string ten)
        {
            Session["Tim"] = txtProductList.Text;
            NhaBHDAO nbhdao = new NhaBHDAO();
            gvDSCongTy.DataSource = nbhdao.CongTyTheoTen(ten);
            gvDSCongTy.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            NhaBHDAO nbbhdao = new NhaBHDAO();
            string ten = txtTenCongTy.Text;
            nbbhdao.ThemCongTy(ten);
            HienThiDanhSach();
            txtTenCongTy.Text = "";
        }

        protected void gvDSCongTy_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDSCongTy.EditIndex = -1;
            if (Session["Tim"] != null)
            {
                string tim = Session["Tim"].ToString();
                Tim(tim);
            }
            else
            {
                HienThiDanhSach();
            }
        }

        //protected void gvDSCongTy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    NhaBHDAO nbbhdao = new NhaBHDAO();
        //    int autoid = int.Parse(gvDSCongTy.DataKeys[e.RowIndex].Value.ToString());
        //    nbbhdao.XoaCongTy(autoid);
        //    if (Session["Tim"] != null)
        //    {
        //        string tim = Session["Tim"].ToString();
        //        Tim(tim);
        //    }
        //    else
        //    {
        //        HienThiDanhSach();
        //    }
        //}

        protected void gvDSCongTy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDSCongTy.EditIndex = e.NewEditIndex;
            //int key = int.Parse(gvDSCongTy.DataKeys[e.r
            //string ten = ((GridView)sender).Rows[1].Cells[0].Text;

            if (Session["Tim"] != null)
            {
                string tim = Session["Tim"].ToString();
                Tim(tim);
            }
            else
            {
                HienThiDanhSach();
            }
        }

        protected void gvDSCongTy_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDSCongTy.Rows[e.RowIndex];

            TextBox txt2nd_column = row.Cells[1].Controls[0] as TextBox;


            int a = Int32.Parse(gvDSCongTy.DataKeys[e.RowIndex].Value.ToString());
            string b = txt2nd_column.Text;


            NhaBHDAO nbbhdao = new NhaBHDAO();
            nbbhdao.SuaCongTy(a, b);

            e.Cancel = true;
            gvDSCongTy.EditIndex = -1;
            HienThiDanhSach();
        }
    }
}