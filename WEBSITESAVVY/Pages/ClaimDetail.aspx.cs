﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class ClaimDetail : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        GiaiDoanDAO gddao = new GiaiDoanDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["MaGDV"];
            if (ck == null)
            {
                return;
            }
            else
            {
                if(Session["ThamChieu"] != null)
                {
                    DataTable dt = new DataTable();
                    int idgdv = int.Parse(Request.Cookies["MaGDV"].Value);
                    dt = gdvdao.LayTenvaChucVu(idgdv);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        string name = dr[0].ToString();
                        lblName.InnerHtml = name;
                    }

                    string id = Session["ThamChieu"].ToString();
                    
                    loadGiaiDoan();
                    loadDSGDV();
                    loadinfo(id);
                }
                else
                {
                    Response.Write("<script>alert('Không lấy được tham chiêu!');</script>");
                }
            }
        }

        protected void loadGiaiDoan()
        {
            drStatus.DataSource = gddao.DSGiaiDoan();
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
        }

        void loadDSGDV()
        {
            DataTable dt = new DataTable();
            dt = gdvdao.DanhSachGiamDinhVien();
            if (dt.Rows.Count > 0)
            {
                drGDV.DataSource = dt;
                drGDV.DataTextField = "TenGDV";
                drGDV.DataValueField = "ID_GDV";
                drGDV.DataBind();

            }
        }

        void loadinfo(string id)
        {
            DataTable dt = new DataTable();
            ClaimDAO cl = new ClaimDAO();
            dt = cl.ClaimMaster(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieuHead.Text = dr[0].ToString();
                lblinsured.Text = dr[1].ToString();
                txtbrief.Text = dr[2].ToString();
            }
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            int magiaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
            string giaidoan = drStatus.SelectedItem.ToString();
            string matc = Session["ThamChieu"].ToString();
            //bool kttc = KiemTraMaThamChieu();
            if (magiaidoan != 0)
            {
                bool up = cldao.UpdateStatus(matc, magiaidoan);
                if (up == true)
                {
                    if (giaidoan == "Case Closed")
                    {
                        bool ra = cldao.UpdateRate(matc, 0);
                        if (ra == true)
                        {
                            //Response.Write("<script>alert('Updated !');</script>");
                            loadGiaiDoan();
                            loadinfo(matc);
                            loadGiaiDoan();
                        }
                        Response.Write("<script>alert('Updated status!');</script>");
                    }
                }
                else
                    Response.Write("<script>alert('Update Fail!');</script>");
            }
        }

        protected void btnUpdatebrief_Click(object sender, EventArgs e)
        {
            string id = Session["ThamChieu"].ToString();
            string bri = txtbrief.Text;
            bool up = cldao.CapNhatBrief(id, bri);
            if (up == true)
            {
                Response.Write("<script>alert('Updated!');</script>");
                loadGiaiDoan();
                loadinfo(id);
                loadGiaiDoan();
            }
        }

        protected void btnfollower_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();
            string follower = drGDV.SelectedItem.ToString();
            if (follower != "")
            {
                bool up = cldao.UpdateFollower(ma, follower);
                if (up == true)
                {
                    Response.Write("<script>alert('Updated !');</script>");
                    loadGiaiDoan();
                    loadinfo(ma);
                    loadGiaiDoan();
                }
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnRate_Click(object sender, EventArgs e)
        {
            int rate = 0;

            rate = int.Parse(drRate.SelectedItem.Value.ToString());
            string ma = Session["ThamChieu"].ToString();
            bool up = cldao.UpdateRate(ma, rate);
            if (up == true)
            {
                Response.Write("<script>alert('Updated !');</script>");
                loadGiaiDoan();
                loadinfo(ma);
                loadGiaiDoan();
            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
    }
}