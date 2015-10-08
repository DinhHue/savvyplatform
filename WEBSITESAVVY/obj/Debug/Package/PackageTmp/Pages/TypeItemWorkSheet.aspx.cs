using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class TypeItemWorkSheet : System.Web.UI.Page
    {
        LoaiHangMucDAO l = new LoaiHangMucDAO();
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["ThamChieu"] != null)
                {
                    lblID_Claim.Text = Session["ThamChieu"].ToString();
                    loadHM(lblID_Claim.Text);
                }

            }

        }
        void loadHM(string idclaim)
        {
            DataTable dt = new DataTable();
            dt = l.DanhSachHangMuc(idclaim);
            if (dt.Rows.Count > 0)
            {
                gvDSTypeItem.DataSource = dt;
                gvDSTypeItem.DataBind();
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string id = lblID_Claim.Text;
            string ten = txtNameType.Text;
            bool kq = l.InsetLoaiHangMuc(ten, id);
            if (kq == true)
            {
                loadHM(id);
                txtNameType.Text = "";
                //string claimID = Session["ThamChieu"].ToString();
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " created a type of list worksheet of case " + id + ".";
                SaveLogTracking(maGDV, noidung, id);
            }
            else
                Response.Write("<script>alert('Không thêm được!');</script>");
        }
        void SaveLogTracking(int maGDV, string noidung, string maclaim)
        {
            try
            {
                TrackingDTO tr = new TrackingDTO();
                TrackingDAO trdao = new TrackingDAO();
                tr.MaGDV = maGDV;
                tr.NoiDung = noidung;
                tr.TimeReal = DateTime.Now;
                tr.MaClaim = maclaim;
                trdao.InsertTracking(tr);
            }
            catch (Exception ex)
            { }
        }
        protected void gvDSTypeItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(gvDSTypeItem.DataKeys[e.RowIndex].Value.ToString());
            bool kq = l.DeleteLoaiHangMuc(ma);
            if (kq == true)
                loadHM(lblID_Claim.Text);
        }
    }
}