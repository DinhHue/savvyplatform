using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
namespace WEBSITESAVVY.mobile
{
    public partial class Homem : System.Web.UI.Page
    {
        ClaimDAO cldao = new ClaimDAO();
        DataTable dt = new DataTable();
        DonViBHDAO dv = new DonViBHDAO();
        GiaiDoanDAO gd = new GiaiDoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MaGDV"] == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    loadPending();
                    loadMaHoa();
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
        void loadMaHoa()
        {
            DataTable dt = new DataTable();
            dt = dv.DSDVMaHoa();
            drDonViBH.DataSource = dt;
            drDonViBH.DataValueField = "ID_DonVi";
            drDonViBH.DataTextField = "MaHoa";
            drDonViBH.DataBind();
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
        protected void btnTiemKiem_Click(object sender, EventArgs e)
        {
      
            string mathamchieu = txtThamChieu.Text;
            bool kq = cldao.KiemTraThamChieu(mathamchieu);
            if (kq == true)
            {
                Session["ThamChieu"] = mathamchieu;
                //Response.Redirect("~/Pages/ManageClaim.aspx?thamchieu=" + mathamchieu);
                Response.Redirect("~/mobile/InformationForm.aspx?Reference=" + mathamchieu);
            }
            else
                Response.Write("<script>alert('Nhập sai tham chiếu!');</script>");
        }

        protected void grDSClaim_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grDSClaim.PageIndex = e.NewPageIndex;
            loadDS();
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
                //Response.Redirect("~/Pages/ManageClaim.aspx?Claim=" + ma);
                // Response.Redirect("~/Pages/InformationForm.aspx?Reference=" + ma);
                Response.Redirect("~/mobile/InformationForm.aspx?1v5tdadefojhwty");
            }
            else
                Response.Write("<script> alert('Claim chưa có trong dữ liệu!');</script>");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            int level = int.Parse(drSort.SelectedItem.Value.ToString());
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

        protected void btnUprate_Click(object sender, EventArgs e)
        {
            cldao.UpdateAutoTangRate();
            loadPending();
        }

        protected void btnDownrate_Click(object sender, EventArgs e)
        {
            cldao.UpdateAutoGiamRate();
            loadPending();
            // Response.Write("<script> alert('Reduced rate !');</script>");
        }

        protected void btnXemDonViBH_Click(object sender, EventArgs e)
        {
            string ma = drDonViBH.SelectedItem.ToString();
            loadTheoMaHoa(ma);
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
               // int idgdv = int.Parse(drFollower.SelectedItem.Value.ToString());
                string follower = drFollower.SelectedItem.ToString();
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

        protected void grDSClaim_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //GridViewRow row = grDSClaim.Rows[e.RowIndex];

            //TextBox txtdocs = row.Cells[6].Controls[0] as TextBox;
            //string tenclaim = grDSClaim.DataKeys[e.RowIndex].Value.ToString();
            //string doc = txtdocs.Text;
            // TextBox txtngay= row.Cells[4].Controls[0] as TextBox;
            //string ngay= txtngay.Text;
            //int giaidoan = cldao.LayMaGiaiDoanHoanThanh(tenclaim);
            //TextBox txtrate = row.Cells[8].Controls[0] as TextBox;
            //int rate = int.Parse(txtrate.Text);
            //TextBox txtbrief = row.Cells[2].Controls[0] as TextBox;
            //string brief = txtbrief.Text;
            //TextBox txtfollower = row.Cells[7].Controls[0] as TextBox;
            //string follower = txtfollower.Text;
            //bool kq = cldao.UpdateDocs(tenclaim, doc, ngay, giaidoan, rate, brief, follower);
            //if (kq == true)
            //{
            //    e.Cancel = true;
            //    grDSClaim.EditIndex = -1;
            //    loadPending();
            //}
            //else
            //    Response.Write("<script>alert('Fail!');</script>");
        }

        protected void grDSClaim_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSClaim.EditIndex = e.NewEditIndex;
            loadPending();
        }
    }
}