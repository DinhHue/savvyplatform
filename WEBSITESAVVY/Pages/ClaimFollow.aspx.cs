using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using WEBSITESAVVY.DAO;

namespace WEBSITESAVVY.Pages
{
    public partial class ClaimFollow : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        ClaimDAO cldao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                //if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    //string name = Session["GDV"].ToString();
                    string name= gdvdao.LayTenTheoMa(int.Parse(Request.Cookies["MaGDV"].Value));
                    lblGDV.Text = name;
                    // int idgdv= int.Parse(Session["MaGDV"].ToString());
                    LoadClaim();
                }
            }

        }
        void LoadClaim()
        {
            string name = gdvdao.LayTenTheoMa(int.Parse(Request.Cookies["MaGDV"].Value));
            DSClaimFollow.DataSource = cldao.DSClaimTheoFollower(name);
            DSClaimFollow.DataBind();
        }
        protected void DSClaimFollow_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = DSClaimFollow.SelectedRow;
            if (row != null)
            {
                //string temp = row.Cells[0].Text;
                string thamchieu = row.Cells[1].Text;
                string ma = cldao.LayMaTheoTen(thamchieu);
                Session["ThamChieu"] = ma;
                //int magdv = int.Parse(Session["MaGDV"].ToString());
                int magdv = int.Parse(Request.Cookies["MaGDV"].Value);
                int pub = gdvdao.LayMaPub(magdv);
                //bool kt = cldao.KiemTraTruyCap(pub, ma);
                bool kt = CheckPub(magdv, ma);
                if (kt == true)
                {
                    //Response.Redirect("~/Pages/ClaimDetail1.aspx?Ref=Cover");
                    Response.Redirect("~/Pages/Layout.aspx");
                }
                else
                    Response.Write("<script> alert('You can't acess on this case!');</script>");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }
       
        bool CheckPub(int GDV, string idclaim)
        {
            int PUBGDV = gdvdao.LayMaPub(GDV);
            int PUBCLAIM = cldao.LayMaPUB(idclaim);
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

        protected void DSClaimFollow_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            DSClaimFollow.EditIndex = -1;
            LoadClaim();
        }

        protected void DSClaimFollow_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DSClaimFollow.EditIndex = e.NewEditIndex;
            LoadClaim();
        }

        protected void DSClaimFollow_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //GridViewRow row = DSClaimFollow.Rows[e.RowIndex];
            //TextBox txtdocs = row.Cells[5].Controls[0] as TextBox;
            //string tenclaim = DSClaimFollow.DataKeys[e.RowIndex].Value.ToString();
            //string doc = txtdocs.Text;
            //TextBox txtngay= row.Cells[4].Controls[0] as TextBox;
            //string ngay= txtngay.Text;
            //DropDownList drStatus = (DropDownList)row.FindControl("drStatus");
            //int giaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
            //TextBox txtrate = row.Cells[7].Controls[0] as TextBox;
            //int rate = int.Parse(txtrate.Text);
            //TextBox txtbrief = row.Cells[2].Controls[0] as TextBox;
            //string brief = txtbrief.Text;
          
            //string follower = lblGDV.Text;
            //bool kq = cldao.UpdateDocs(tenclaim, doc, ngay, giaidoan, rate, brief, follower);
            //if (kq == true)
            //{
            //    e.Cancel = true;
            //    DSClaimFollow.EditIndex = -1;
            //    LoadClaim();
            //}
            //else
            //    Response.Write("<script>alert('Fail!');</script>");
        }
        GiaiDoanDAO gddao = new GiaiDoanDAO();
        protected void DSClaimFollow_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList drStatus = (DropDownList)e.Row.FindControl("drStatus");
                    drStatus.DataSource = gddao.DSGiaiDoan();
                    drStatus.DataTextField = "TenGiaiDoan";
                    drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
                    drStatus.DataBind();
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    drStatus.SelectedValue = dr["TenGiaiDoan"].ToString();
                }
            }
        }
    }
}