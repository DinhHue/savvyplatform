using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class SubHome : System.Web.UI.Page
    {
        ClaimDAO cl = new ClaimDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {

                    loadRiotClaim();
                }
            }
        }
        void loadRiotClaim()
        {
            DataTable dt = new DataTable();
            dt = cl.selectRiotClaim();
            grDSRiotClaim.DataSource = dt;
            grDSRiotClaim.DataBind();
        }
        bool CheckPub(int GDV, string idclaim)
        {
            int PUBGDV = gdvdao.LayMaPub(GDV);
            int PUBCLAIM = cl.LayMaPUB(idclaim);
            bool kt = false;
            if (PUBGDV == 1)
                kt = true;
            else
                if (PUBGDV == 2 && PUBGDV == PUBCLAIM)
                    kt = true;
                else
                    if (PUBGDV == 3 && PUBGDV == PUBCLAIM)
                        kt = true;
            return kt;
        }
        protected void grDSRiotClaim_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = grDSRiotClaim.SelectedRow;
            if (row != null)
            {
                //string temp = row.Cells[0].Text;
                string thamchieu = row.Cells[1].Text;
                string ma = cl.LayMaTheoTen(thamchieu);
                Session["ThamChieu"] = ma;
                int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                int pub = gdvdao.LayMaPub(magdv);
                //bool kt = cldao.KiemTraTruyCap(pub, ma);
                bool kt = CheckPub(magdv, ma);
                if (kt == true)
                {
                    Response.Redirect("~/Pages/ClaimDetail1.aspx?Ref=Cover");
                }
                else
                    Response.Write("<script> alert('You can't acess on this case!');</script>");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }

        protected void grDSRiotClaim_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSRiotClaim.EditIndex = -1;
            loadRiotClaim();
        }

        protected void grDSRiotClaim_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSRiotClaim.EditIndex = e.NewEditIndex;
            loadRiotClaim();
        }

        protected void grDSRiotClaim_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        //    GridViewRow row = grDSRiotClaim.Rows[e.RowIndex];

        //    TextBox txtdocs = row.Cells[6].Controls[0] as TextBox;
        //    string idclaim = grDSRiotClaim.DataKeys[e.RowIndex].Value.ToString();
        //    TextBox txtTenClaim = row.Cells[1].Controls[0] as TextBox;
        //    string tenclaim = txtTenClaim.Text;
        //    string doc = txtdocs.Text;
        //     TextBox txtngay= row.Cells[4].Controls[0]as TextBox;
        //    string ngay= txtngay.Text;
        //    //TextBox txtgiaidoan= row.Cells[5].Controls[0]as TextBox;
        //    int giaidoan = cl.LayMaGiaiDoanHoanThanh(tenclaim);
        //    TextBox txtrate = row.Cells[8].Controls[0] as TextBox;
        //    int rate = int.Parse(txtrate.Text);
        //    TextBox txtbrief = row.Cells[2].Controls[0] as TextBox;
        //    string brief = txtbrief.Text;
        //    TextBox txtfollower = row.Cells[7].Controls[0] as TextBox;
        //    string follower = txtfollower.Text;

        //    bool kq=cl.UpdateDocs(tenclaim, doc, ngay,giaidoan,rate, brief,follower);
        //    //bool kq = cl.UpdateDocs(tenclaim, doc);
        //    if (kq == true)
        //    {
        //        e.Cancel = true;
        //        grDSRiotClaim.EditIndex = -1;
        //        loadRiotClaim();
        //    }
        //    else
        //        Response.Write("<script>alert('Fail!');</script>");
        }
    }
}