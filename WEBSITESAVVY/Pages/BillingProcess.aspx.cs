using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class BillingProcess : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
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
                    loadDSClaimChoThanhToan();
                }
            }
        }
        void loadDSClaimChoThanhToan()
        {
            DataTable dt = new DataTable();
            dt = cldao.ClaimWaitingInvoile();
            if (dt.Rows.Count > 0)
            {
                grDSClaim0.DataSource = dt;
                grDSClaim0.DataBind();
            }
        }
        protected void grDSClaim0_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grDSClaim0.SelectedRow;
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
                    //Response.Redirect("~/Pages/ManageClaim.aspx?Claim=" + ma);
                    //Response.Redirect("~/Pages/InformationForm.aspx?Reference=" + ma);
                    Response.Redirect("~/Pages/Layout.aspx");
                }
                else
                    Response.Write("<script> alert('You can't acess on this case!');</script>");

                // Response.Redirect("~/Pages/InformationForm.aspx?1v5tdadefojhwty");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }

        protected void grDSClaim0_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //GridViewRow row = grDSClaim0.Rows[e.RowIndex];
            //TextBox txtdocs = row.Cells[6].Controls[0] as TextBox;
            //string idclaim = grDSClaim0.DataKeys[e.RowIndex].Value.ToString();
            //TextBox txtTenClaim = row.Cells[1].Controls[0] as TextBox;
            // string tenclaim = txtTenClaim.Text;
            //string doc = txtdocs.Text;
            //TextBox txtngay= row.Cells[4].Controls[0] as TextBox;
            //string ngay= txtngay.Text;
            //DropDownList drStatus = (DropDownList)row.FindControl("drStatus");
            //int giaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
            //TextBox txtrate = row.Cells[8].Controls[0] as TextBox;
            //int rate = int.Parse(txtrate.Text);
            //TextBox txtbrief = row.Cells[2].Controls[0] as TextBox;
            //string brief = txtbrief.Text;
            //DropDownList drGDV1 = (DropDownList)row.FindControl("drGDV1");
            //string follower = drGDV1.SelectedItem.ToString();
            //bool kq = cldao.UpdateDocs(idclaim,tenclaim, doc, ngay, giaidoan, rate, brief, follower);
            //if (kq == true)
            //{
            //    e.Cancel = true;
            //    grDSClaim0.EditIndex = -1;
                
            //    loadDSClaimChoThanhToan();
            //}
            //else
                Response.Write("<script>alert('Fail!');</script>");
        }

        protected void grDSClaim0_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSClaim0.EditIndex = e.NewEditIndex;
           
            loadDSClaimChoThanhToan();
        }

        protected void grDSClaim0_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSClaim0.EditIndex = -1;
            
            loadDSClaimChoThanhToan();
        }

        protected void grDSClaim0_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSClaim0.PageIndex = e.NewPageIndex;
           
            loadDSClaimChoThanhToan();
            
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
        GiaiDoanDAO gddao = new GiaiDoanDAO();
        protected void grDSClaim0_RowDataBound(object sender, GridViewRowEventArgs e)
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

                    DropDownList drGDV1 = (DropDownList)e.Row.FindControl("drGDV1");
                    drGDV1.DataSource = gdvdao.DanhSachGiamDinhVien();
                    drGDV1.DataTextField = "TenGDV";
                    drGDV1.DataValueField = "ID_GDV";
                    drGDV1.DataBind();
                    DataRowView drgdv = e.Row.DataItem as DataRowView;
                    drGDV1.SelectedValue = drgdv["Follower"].ToString();

                }
            }
        }
    }
}