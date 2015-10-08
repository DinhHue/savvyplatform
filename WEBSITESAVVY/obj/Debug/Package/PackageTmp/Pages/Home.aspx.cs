using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;

namespace WEBSITESAVVY.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        DataTable dt = new DataTable();
        DonViBHDAO dv = new DonViBHDAO();
        GiaiDoanDAO gd = new GiaiDoanDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    bool uprate = cldao.ReduceRate();
                    if (uprate == false)
                        Response.Write("<script> alert('Web page can't reduce rate of claim!');</script>");
                    loadPending();
                    //loadMaHoa();
                    loadStatus();
                    loadGDV();
                }
            }
        }
        void loadStatus()
        {
            DataTable dt = new DataTable();
            dt = gd.DSGiaiDoan();
            drStatus.DataSource = dt;
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
        }
        void loadTheoMaHoa(string mahoa)
        {
            DataTable dt = new DataTable();
            dt = cldao.SelectClaimMaHoa(mahoa);
            grDSClaim.DataSource = dt;
            grDSClaim.DataBind();
        }
        void loadTheoStatus(int magd)
        {
            DataTable dt = new DataTable();
            dt = cldao.DSClaimTheoStatus(magd);
            grDSClaim.DataSource = dt;
            grDSClaim.DataBind();
        }
        void loadPending()
        {
            DataTable dt = cldao.SelectPending();
            if (dt.Rows.Count > 0)
            {
                grDSClaim.DataSource = dt;
                grDSClaim.DataBind();
                lblThongBao.Visible = false;
            }
            else
            {
                lblThongBao.Visible = true;
                lblThongBao.Text = "Không có Case đang pending!";
            }
        }
        void loadDS()
        {
            dt = cldao.DSClaimDangGiamDinh();
            if (dt.Rows.Count > 0)
            {
                grDSClaim.DataSource = dt;
                grDSClaim.DataBind();
                int so = dt.Rows.Count;
                lblThongBao.Visible = false;
            }
            else
            {
                lblThongBao.Text = "Hiện không có Claim đang giám định!!!  ";
                lblThongBao.Visible = true;
            }
        }
        GiaiDoanDAO gddao = new GiaiDoanDAO();

        protected void loadGiaiDoan()
        {
            drStatus.DataSource = gddao.DSGiaiDoan();
            drStatus.DataTextField = "TenGiaiDoan";
            drStatus.DataValueField = "ID_GiaiDoanHoanThanh";
            drStatus.DataBind();
        }
       
        protected void btnTiemKiem_Click(object sender, EventArgs e)
        {
          
            string mathamchieu = txtThamChieu.Text;
            bool kq = cldao.KiemTraThamChieu(mathamchieu);
            if (kq == true)
            {
                Session["ThamChieu"] = mathamchieu;
                //Response.Redirect("~/Pages/ManageClaim.aspx?thamchieu=" + mathamchieu);
                //Response.Redirect("~/Pages/InformationForm.aspx?Reference="+mathamchieu);
                Response.Redirect("~/Pages/Layout.aspx");
            }
            else
                Response.Write("<script>alert('Nhập sai tham chiếu!');</script>");
        }

        protected void grDSClaim_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSClaim.PageIndex = e.NewPageIndex;
            loadDS();
        }
        bool CheckPub(int GDV,string idclaim)
        {
            int PUBGDV = gdvdao.LayMaPub(GDV);
            int PUBCLAIM = cldao.LayMaPUB(idclaim);
            bool kt= false;
            if (PUBGDV == 1)
                kt = true;
            else
                if (PUBGDV == 2 && PUBGDV ==PUBCLAIM)
                    kt = true;
                else
                    if(PUBGDV==3 && PUBGDV==PUBCLAIM)
                        kt=true;
            return kt;
        }
        protected void grDSClaim_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = grDSClaim.SelectedRow;
            if (row != null)
            {
                //string temp = row.Cells[0].Text;
                string thamchieu = row.Cells[1].Text;
                string ma = cldao.LayMaTheoTen(thamchieu);
                Session["ThamChieu"] = ma;
                //int magdv = int.Parse(Session["MaGDV"].ToString());
                int magdv = 0;
                magdv=int.Parse(Request.Cookies["MaGDV"].Value);
                int pub = gdvdao.LayMaPub(magdv);
                //bool kt = cldao.KiemTraTruyCap(pub, ma);
                bool kt = CheckPub(magdv, ma);
                if (kt == true)
                {
                    Response.Redirect("~/Pages/Layout.aspx");
                }
                else
                    Response.Write("<script> alert('You can't acess on this case!');</script>");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            int level =int.Parse(drSort.SelectedItem.Value.ToString());
            DataTable dt = new DataTable();
            dt = cldao.SelectLevel(level);
            if (dt.Rows.Count > 0)
            {
                grDSClaim.DataSource = dt;
                grDSClaim.DataBind();
            }
            else
                Response.Write("<script> alert('Không có Claim nào ở rate này !');</script>");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            DataTable dt = cldao.SelectPending();
            if (dt.Rows.Count > 0)
            {
                grDSClaim.DataSource = dt;
                grDSClaim.DataBind();
            }
            else
                Response.Write("<script> alert('Không có claim nào !');</script>");
        }
       
        protected void btnAll_Click(object sender, EventArgs e)
        {
            loadDS();
        }

        protected void btnClosed_Click(object sender, EventArgs e)
        {
            DataTable dt = cldao.SelectClosed();
            if (dt.Rows.Count > 0)
            {
                grDSClaim.DataSource = dt;
                grDSClaim.DataBind();
            }
            else
                Response.Write("<script> alert('Không có claim nào !');</script>");
        }

        protected void btnViewStatus_Click(object sender, EventArgs e)
        {
            int ma = int.Parse(drStatus.SelectedItem.Value.ToString());
            loadTheoStatus(ma);
        }
        void loadGDV()
        {
            GiamDinhVienDAO gdv = new GiamDinhVienDAO();
            drFollower.DataSource = gdv.DanhSachGiamDinhVien();
            drFollower.DataTextField = "TenGDV";
            drFollower.DataValueField = "ID_GDV";
            drFollower.DataBind();
        }

        protected void btnFollower_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                DataTable dt = new DataTable();
                //int idgdv = int.Parse(drFollower.SelectedItem.Value.ToString());
                string follower= drFollower.SelectedItem.ToString();
                dt = cldao.DSClaimTheoFollower(follower);
                if (dt.Rows.Count > 0)
                {
                    grDSClaim.DataSource = dt;
                    grDSClaim.DataBind();
                    grDSClaim.Visible = true;
                }
                else
                    grDSClaim.Visible = false;
            }
        }

        protected void grDSClaim_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSClaim.EditIndex = -1;
            loadPending();
        }

        //protected void grDSClaim_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = grDSClaim.Rows[e.RowIndex];
        //    TextBox txtdocs = row.Cells[6].Controls[0] as TextBox;
        //    string tenclaim = grDSClaim.DataKeys[e.RowIndex].Value.ToString();
        //    string doc = txtdocs.Text;
        //    TextBox txtngay= row.Cells[4].Controls[0] as TextBox;
        //    TextBox txtRate= row.Cells[8].Controls[0] as TextBox;
        //    TextBox txtbrief= row.Cells[2].Controls[0] as TextBox;
        //    string ngay= txtngay.Text;
        //    DropDownList drStatus =
        //              (DropDownList)row.FindControl("drStatus");
        //    int giaidoan = int.Parse(drStatus.SelectedItem.Value.ToString());
        //    int rate = int.Parse(txtRate.Text);
        //    string brief = txtbrief.Text;
        //    DropDownList drGDV1 =(DropDownList)row.FindControl("drGDV1");
        //    string follower = drGDV1.SelectedItem.ToString();

        //    bool kq=cldao.UpdateDocs(tenclaim, doc, ngay, giaidoan,rate, brief,follower);
        //    if (kq == true)
        //    {
        //        e.Cancel = true;
        //        grDSClaim.EditIndex = -1;
        //        loadPending();
        //    }
        //    else
        //        Response.Write("<script>alert('Fail!');</script>");
        //}

        protected void grDSClaim_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSClaim.EditIndex = e.NewEditIndex;
            loadPending();
        }

        protected void grDSClaim_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void grDSClaim_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = grDSClaim.Rows[e.NewSelectedIndex];
            string maclaim = cldao.LayMaTheoTen(row.Cells[1].Text);
            if (maclaim != "")
            {
                Response.Write("<script> window.open(w_UpdateClaim);</script>");
            }
        }

        protected void btnSearchKey_Click(object sender, EventArgs e)
        {
            string key = txtTuKhoa.Text;
            Response.Redirect("~/Pages/search.aspx?key="+key);
        }

       
    }
}