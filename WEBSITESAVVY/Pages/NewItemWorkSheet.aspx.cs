using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Pages
{
    public partial class NewItemWorkSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                 HttpCookie ck = Request.Cookies["MaGDV"];
                 if (ck != null)
                 {
                     if (Session["ThamChieu"] != null)
                     {
                         string id = Session["ThamChieu"].ToString();
                         lblIDClaim.Text = id;
                         loadDropType(id);
                         loadUnit();
                         LoadItem(id);
                     }
                 }
                 else
                     Response.Redirect("~/Pages/Login.aspx");
            }
        }
        void loadDropType(string idclaim)
        {
            LoaiHangMucDAO l = new LoaiHangMucDAO();
            DataTable dt = l.DanhSachHangMuc(idclaim);
            if (dt.Rows.Count > 0)
            {
                drTypeItem.DataSource = dt;
                drTypeItem.DataTextField= "TenLoaiHangMuc";
                drTypeItem.DataValueField = "ID_LoaiHangMuc";
                drTypeItem.DataBind();
            }
        }
        void loadUnit()
        {
            DonViTinhDAO d = new DonViTinhDAO();
            drUnit.DataSource = d.SelectAll();
            drUnit.DataTextField = "TenDonVi";
            drUnit.DataValueField = "ID_DonViTinh";
            drUnit.DataBind();
        }
        LossListDAO ld = new LossListDAO();
        void LoadItem(string idclaim)
        {
            
            DataTable dt = new DataTable();
            dt = ld.Select(idclaim);
            if (dt.Rows.Count > 0)
            {
                grDSItem.DataSource = dt;
                grDSItem.DataBind();
            }
        }
        GiamDinhVienDAO gdv = new GiamDinhVienDAO();
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            LossListDTO l = new LossListDTO();
            LossListDAO ldao = new LossListDAO();
            string tenhangmuc= txtDescription.Text;
            if (tenhangmuc != "")
            {
                l.TenHangMuc = tenhangmuc;
                 float sl = 0;
            if (txtSoLuong.Text!="" && float.TryParse(txtSoLuong.Text, out sl))
            {
                l.SoLuong = sl;
                l.MaDonViTinh = int.Parse(drUnit.SelectedItem.Value.ToString());
                string ghichu = txtGhiChu.Text;
                if (ghichu != "")
                    l.GhiChu = ghichu;
                else
                    l.GhiChu = "";
                l.LoaiHangMuc = int.Parse(drTypeItem.SelectedItem.Value.ToString());
                l.MaClaim = lblIDClaim.Text;
                bool kq = ldao.Insert(l);
                if (kq == true)
                {
                    LoadItem(lblIDClaim.Text);
                    int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                    string noidung = gdv.LayTenTheoMa(maGDV) + " created a item of list worksheet of case " + lblIDClaim.Text + ".";
                    SaveLogTracking(maGDV, noidung, lblIDClaim.Text);
                }
                else
                    Response.Write("<script>alert('Nhập đủ các vị trí có (*)!');</script>");
            }
            else
                Response.Write("<script>alert('Nhập sai định dạng sô!');</script>");
            }
            else
                Response.Write("<script>alert('Không bỏ trống tên hạng mục tổn thất!');</script>");
            //string sl = txtSoLuong.Text;         

           
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
        protected void grDSItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ma = int.Parse(grDSItem.DataKeys[e.RowIndex].Value.ToString());
            bool kq = ld.Delete(ma);
            if (kq == true)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + "deleted item of list worksheet of case " + lblIDClaim.Text + ".";
                SaveLogTracking(maGDV, noidung, lblIDClaim.Text);
                LoadItem(lblIDClaim.Text);
            }
            else
                Response.Write("<script> alert('Can't deleted!');</script>");
        }

        protected void grDSItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            grDSItem.EditIndex = -1;
            LoadItem(lblIDClaim.Text);
        }

        protected void grDSItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grDSItem.EditIndex = e.NewEditIndex;
            LoadItem(lblIDClaim.Text);  
        }

        protected void grDSItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grDSItem.Rows[e.RowIndex];
            TextBox txtTenHangMuc2 = row.Cells[1].Controls[0] as TextBox;
            TextBox txtsoluong2 = row.Cells[2].Controls[0] as TextBox;
            TextBox txtghichu2 = row.Cells[5].Controls[0] as TextBox;
            int ma = int.Parse(grDSItem.DataKeys[e.RowIndex].Value.ToString());
            LossListDTO l = new LossListDTO();
            l.MaLossList = ma;
            l.TenHangMuc = txtTenHangMuc2.Text;
            l.SoLuong = float.Parse(txtsoluong2.Text);
            l.GhiChu = txtghichu2.Text;
            bool kq = ld.Update(l);
            if (kq == true)
            {
                e.Cancel = true;
                grDSItem.EditIndex = -1;
                LoadItem(lblIDClaim.Text);
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited item of list worksheet of case " + lblIDClaim.Text + ".";
                SaveLogTracking(maGDV, noidung, lblIDClaim.Text);
            }
        }

    }
}