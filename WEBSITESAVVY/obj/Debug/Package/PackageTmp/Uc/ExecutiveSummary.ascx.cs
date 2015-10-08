using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Uc
{
    public partial class ExecutiveSummary : System.Web.UI.UserControl
    {
        ClaimDAO cldao = new ClaimDAO();
        SendMailDAO sm = new SendMailDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string id = Session["ThamChieu"].ToString();

                if (id != null)
                {
                   // load_CK();
                    load(id);
                    string quest = Request.QueryString["Ref"];
                    if (quest == "ES")
                    {
                        txtIR.Visible = false;
                        btnUpdateIR.Visible = false;
                        txtFR.Visible = false;
                        btnUpdateFR.Visible = false;
                        lblFR.Visible = false;
                        lblIR.Visible = false;
                    }
                    if (quest == "ESIR")
                    {
                        txtIR.Visible = true;
                        btnUpdateIR.Visible = true;
                        txtFR.Visible = false;
                        btnUpdateFR.Visible = false;
                        lblFR.Visible = false;
                        lblIR.Visible = true;
                    }
                    if (quest == "ESFR")
                    {
                        txtIR.Visible = false;
                        btnUpdateIR.Visible = false;
                        txtFR.Visible = true;
                        btnUpdateFR.Visible = true;
                        lblFR.Visible = true;
                        lblIR.Visible = false;
                    }
                }
            }
        }
        //void load_CK()
        //{
        //    txtIR.config.toolbar = new object[]
        //    {
        //        new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"},
        //        new object[] {"Styles", "Format", "FontSize"  }
        //    };
        //    txtFR.config.toolbar = new object[]
        //    {
        //        new object[] { "Bold", "Italic", "-", "NumberedList", "BulletedList","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"},
        //        new object[] {"Styles", "Format", "FontSize"  }
        //    };
        //}
        void load(string id)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectExecutiveSummary(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                string text = dr[0].ToString();
                if (text != "")
                    txtIR.Text = dr[0].ToString();
                string text1 = dr[1].ToString();
                if (text1 != "")
                txtFR.Text = dr[1].ToString();
            }
            
        }
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected string TenGDV()
        {
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengdv = gdvdao.LayTenTheoMa(maGDV);
            //tengdv=lblGDV.ToString();
            return tengdv;

        }

        protected void btnUpdateIR_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();

            string text = txtIR.Text;
            bool up = cldao.UpdateExecutiveSummaryIR(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Executive Summary - IR", ma);
                Response.Write("<script>alert('Updated !');</script>");
                load(ma);

            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }

        protected void btnUpdateFR_Click(object sender, EventArgs e)
        {
            string ma = Session["ThamChieu"].ToString();

            string text = txtFR.Text;
            bool up = cldao.UpdateExecutiveSummaryFR(ma, text);
            if (up == true)
            {
                sm.sendNoiDungClaim("Report_Update", TenGDV(), text, "Executive Summary - FR", ma);
                Response.Write("<script>alert('Updated !');</script>");
                load(ma);

            }
            else
                Response.Write("<script>alert('Update Fail!');</script>");
        }
    }
}