﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {                
                linklogin.Visible = true;
                pnaccountinfo.Visible = false;
               //Response.Redirect("~/Pages/Login.aspx");
            }
            else
            {
                // HeadLoginView.Visible = false;
                DataTable dt = new DataTable();
                int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                dt = gdvdao.LayTenvaChucVu(idgdv);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    //string name = Session["GDV"].ToString();
                    string name = dr[0].ToString();
                    lblName.Text = name;
                    //string chucvu = Session["ChucVu"].ToString();
                    string chucvu = dr[1].ToString();
                    lblChucVu.Text = chucvu;
                }
                linklogin.Visible = false;
                //string name = Session["GDV"].ToString();
                //lblName.Text = name;
                //string chucvu = Session["ChucVu"].ToString();
                //lblChucVu.Text = chucvu;
                pnaccountinfo.Visible = true;                
            }
        }
    }
}
