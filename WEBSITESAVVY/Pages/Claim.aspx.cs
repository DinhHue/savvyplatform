using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
//using CrystalDecisions.CrystalReports.Engine;
//using CrystalDecisions.Shared;
using System.Security.Policy;
using WEBSITESAVVY.Uc;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html;
//using iTextSharp.text.html.simpleparser;
using System.IO;
namespace WEBSITESAVVY
{
    public partial class Claim : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        ClaimDTO cldto = new ClaimDTO();
        TaiSanDAO tsdao = new TaiSanDAO();
        TaiSanDTO tsdto = new TaiSanDTO();
        KhaoSatRuiRoDAO ksrr = new KhaoSatRuiRoDAO();
      
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);    
        }
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
                    lblThongBaoClaim.Text = "";
                }
            }
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Session["ThamChieu"] = txtThamChieu.Text;                
                try
                {                    
                    string thamchieu = txtThamChieu.Text;
                    DataTable dt = new DataTable();
                    if (thamchieu != null)
                    {
                        bool kt = ksrr.KiemTraThamChieuKSRR(thamchieu);

                        if (int.Parse(drGiaiDoan.SelectedValue) == 1)
                        {
                
                            if (kt == true)
                            {                               
                               Response.Redirect("~/Pages/ViewKhaoSatRuiRo.aspx");
                            }
                            else
                                lblThongBaoClaim.Text = "Sai tham chiếu!";
                        }
                        else
                        {
                            bool ktclaim = cldao.KiemTraThamChieu(thamchieu);
                            if (ktclaim == true)
                            {
                                if (int.Parse(drGiaiDoan.SelectedValue) == 2)
                                    Response.Redirect("~/Pages/ViewBaoCaoDauTien.aspx");
                                if (int.Parse(drGiaiDoan.SelectedValue) == 3)
                                       Response.Redirect("~/Pages/ViewBaoCaoSoBo.aspx");                   
                                if (int.Parse(drGiaiDoan.SelectedValue) == 4)
                                    Response.Redirect("~/Pages/ViewBaoCaoCuoiCung.aspx");
                                
                            }
                            else
                                lblThongBaoClaim.Text = "Sai tham chiếu!";
                        }
                    }                       
                }                
                catch (Exception ex)
                {
                    lblThongBaoClaim.Text = ex.Message;
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (int.Parse(drGiaiDoan.SelectedValue) == 1)
                {
                   
                    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('In.aspx','PrintMe','height=500px,width=600px,scrollbars=1');</script>");
                }
                if (int.Parse(drGiaiDoan.SelectedValue) == 2)
                {
                    
                   
                    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('In.aspx','PrintMe','height=500px,width=600px,scrollbars=1');</script>");
                }
                if (int.Parse(drGiaiDoan.SelectedValue) == 3)
                {
                    //Session["ctrl"] = ViewBaoCaoSoBo1;
                    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('In.aspx','PrintMe','height=500px,width=600px,scrollbars=1');</script>");
                }
                if (int.Parse(drGiaiDoan.SelectedValue) == 4)
                {
                    //Session["ctrl"] = UcViewBaoCaoCuoiCung1;
                    ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('In.aspx','PrintMe','height=500px,width=600px,scrollbars=1');</script>");
                }
            }
        }

        protected void btn_ExportWord_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
            "attachment;filename=ClaimExport.doc");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-word ";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            
            //GridView1.DataBind();
            //if (IsPostBack)
            //{
            //    if (int.Parse(drGiaiDoan.SelectedValue) == 1)
            //    {
            //        Session["ctrl"] = UcViewKhaoSatRuiRo1;
            //        UcViewKhaoSatRuiRo1.RenderControl(hw);
            //    }
            //    if (int.Parse(drGiaiDoan.SelectedValue) == 2)
            //    {

                   
            //    }
            //    if (int.Parse(drGiaiDoan.SelectedValue) == 3)
            //    {
            //        Session["ctrl"] = ViewBaoCaoSoBo1;
            //        ViewBaoCaoSoBo1.RenderControl(hw);
            //    }
            //    if (int.Parse(drGiaiDoan.SelectedValue) == 4)
            //    {
            //        Session["ctrl"] = UcViewBaoCaoCuoiCung1;
            //        UcViewBaoCaoCuoiCung1.RenderControl(hw);
            //    }
            //}

            //UcViewBaoCaoDauTien1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        
      
        
    }
}