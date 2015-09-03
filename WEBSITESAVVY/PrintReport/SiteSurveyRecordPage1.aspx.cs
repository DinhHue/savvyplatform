using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data.SqlClient;
using System.Data;
namespace WEBSITESAVVY.PrintReport
{
    public partial class SiteSurveyRecordPage1 : System.Web.UI.Page
    {
        string mathamchieu = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                mathamchieu = Request.QueryString["IDClaim"];
                //mathamchieu="1401";
                Session["ThamChieu"] = mathamchieu;
                string maGDV = Session["MaGDV"].ToString();
               // string maGDV = "10";
                if (maGDV != null)
                {
                    if (mathamchieu != null)
                    {
                        ViewClaim(mathamchieu);
                       //loaddanhmucthiethai(mathamchieu);
                    }
                    else
                    {
                        Response.Redirect("~/Pages/HomeClaim.aspx");
                    }
                }
                else
                    Response.Redirect("/Pages/Longin.aspx");
            }
        }
        //void loaddanhmucthiethai(string idclaim)
        //{
        //    DanhMucThietHaiDAO dm = new DanhMucThietHaiDAO();
        //    gvDanhSachHangMucThietHai.DataSource = dm.DanhSachDanhMucThietHaiTheoClaim(idclaim);
        //    gvDanhSachHangMucThietHai.DataBind();
        //}
        void ViewClaim(string idclaim)
        {
            DataTable dt = new DataTable();
            ClaimDAO cl = new ClaimDAO();
            dt = cl.ViewSiteSurveyRecord(idclaim);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblNgayThucHien.Text = DateTime.Today.ToShortDateString();
                lblThamChieu.Text = dr[1].ToString();
                lblGDV.Text = dr[2].ToString();
                lblInsurer.Text = dr[3].ToString();
                lblSubsidiary.Text = dr[4].ToString();
                lblSoHDBH.Text = dr[5].ToString();
                lblEffective.Text = dr[6].ToString();
                lblInsured.Text = dr[7].ToString();
                lblFax.Text = dr[8].ToString();
                lblAddress.Text = dr[9].ToString();
                lblContectPerson.Text = dr[10].ToString();
                lblPhone.Text = dr[11].ToString();
                lblEmail.Text = dr[12].ToString();
                lblPremises.Text = dr[13].ToString();
                lblDateofloss.Text = dr[14].ToString();
                lblTypeofloss.Text = dr[15].ToString();
                lblCircumstances.Text = dr[16].ToString();
                lblTBCQCN.Text = dr[17].ToString();
                lblFurtherNotes.Text = dr[18].ToString();
                lblExtentOfloss.Text = dr[19].ToString();
                lblInitialReserve.Text = dr[20].ToString();
                lblAppendixAttached.Text = dr[21].ToString();
                //lblKhuyenCao.Text = dr[22].ToString();
                //lblYKien.Text = dr[23].ToString();
                //lblNgayGioKetThuc.Text = dr[24].ToString();

            }
        }
        protected void btnXemDS_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Home.aspx");
        }
    }
}