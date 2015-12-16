using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Pages
{
    public partial class ClaimSummaryOfLossPop : System.Web.UI.Page
    {
        static String mClaimID = "";
        GiamDinhVienDAO gdv = new DAO.GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["claimID"] != null)
                mClaimID = Request.QueryString["claimID"];

            if (!IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    string id = Request.Cookies["MaGDV"].Value;


                    if (mClaimID != "")
                    {

                        grDanhMucThietHaiSR01.Visible = false;
                        grDanhMucThietHaiILA.Visible = false;

                        if (Request.QueryString["type"] != null)
                        {
                            String type = Request.QueryString["type"].ToString();
                            if (type == "SR01")
                            {
                                grDanhMucThietHaiSR01.Visible = true;
                            }
                            else if (type == "ILA")
                            {
                                grDanhMucThietHaiILA.Visible = true;
                            }
                        }


                        loadDanhMucThietHai();

                        load_Damaged();
                    }
                }
            }
        }

        private void loadDanhMucThietHai()
        {
            DanhMucThietHaiDAO danhMucThietHaiDAO = new DanhMucThietHaiDAO();
            DataTable dataSource = danhMucThietHaiDAO.DanhSachDanhMucThietHaiTheoClaim(mClaimID);

            grDanhMucThietHaiILA.DataSource = dataSource;
            grDanhMucThietHaiILA.DataBind();

            grDanhMucThietHaiSR01.DataSource = dataSource;
            grDanhMucThietHaiSR01.DataBind();
        }

        private void load_Damaged()
        {
            HangMucDAO dao = new HangMucDAO();
            drDamaged.DataSource = dao.DanhSachHangMuc();
            drDamaged.DataValueField = "ID_HangMuc";
            drDamaged.DataTextField = "TenHangMuc";
            drDamaged.DataBind();
        }

        protected void btnCreatnew_Click(object sender, EventArgs e)
        {
            panelGrid.Visible = false;
            panelAddEdit.Visible = true;

            btnAdd.Visible = true;
            btnUpdate.Visible = false;

            resetForm();
        }

        private void resetForm()
        {
            hiddenDanhMucID.Value = "";
            drDamaged.SelectedValue = "0";
            txtTotally.Text = "";
            txtPartial.Text = "";
            txtYKienGDV.Text = "";
            checkTinhTrang.Checked = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            panelGrid.Visible = true;
            panelAddEdit.Visible = false;
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Text = "";

                DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();

                DanhMucThietHaiDTO thietHai = new DanhMucThietHaiDTO();
                string thamchieu = mClaimID;
                thietHai.MaClaim = thamchieu;
                thietHai.MaHangMuc = int.Parse(drDamaged.SelectedValue);
                thietHai.ThietHaiHoanToan = txtTotally.Text;
                thietHai.TrangThai = txtPartial.Text;
                if(checkTinhTrang.Checked)
                    thietHai.TinhTrang = "Yes";
                else
                    thietHai.TinhTrang = "No";
                thietHai.YKienGDV = txtYKienGDV.Text;
                thietHai.MoTaChung = txtMoTaChung.Text;
                dao.ThemDanhMucThietHai(thietHai);

                Response.Write("<script>parent.reloaData();</script>");
                panelGrid.Visible = true;
                panelAddEdit.Visible = false;
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " created a summary of loss of case SR01" + thamchieu + " .";
                SaveLogTracking(maGDV, noidung, thamchieu);
                loadDanhMucThietHai();
            }catch(Exception ex){
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                lblMessage.Text = "";

                DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();

                DanhMucThietHaiDTO thietHai = new DanhMucThietHaiDTO();
                thietHai.Ma = int.Parse( hiddenDanhMucID.Value );
                thietHai.MaClaim = mClaimID;
                thietHai.MaHangMuc = int.Parse(drDamaged.SelectedValue);
                thietHai.ThietHaiHoanToan = txtTotally.Text;
                thietHai.TrangThai = txtPartial.Text;
                if (checkTinhTrang.Checked)
                    thietHai.TinhTrang = "Yes";
                else
                    thietHai.TinhTrang = "No";
                thietHai.YKienGDV = txtYKienGDV.Text;
                thietHai.MoTaChung = txtMoTaChung.Text;
                dao.CapNhatDanhMucThietHai(thietHai);

                panelGrid.Visible = true;
                panelAddEdit.Visible = false;

                Response.Write("<script>parent.reloaData();</script>");
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " edited summary of loss of case" + mClaimID + " .";
                SaveLogTracking(maGDV, noidung, mClaimID);
                loadDanhMucThietHai();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void grDanhMucThietHaiSR01_RowEditing(object sender, GridViewEditEventArgs e)
        {
			GridViewRow grRow = grDanhMucThietHaiSR01.Rows[e.NewEditIndex];
            string id = ((HiddenField)grRow.FindControl("hiddenID")).Value;
            e.Cancel = true;

            DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();
            DataRow dtRow = dao.GetDanhMucThietHai(id);

            panelGrid.Visible = false;
            panelAddEdit.Visible = true;
            btnAdd.Visible = false;
            btnUpdate.Visible = true;

            hiddenDanhMucID.Value = id;
            drDamaged.SelectedValue = dtRow["ID_HangMuc"].ToString();
            txtMoTaChung.Text = dtRow["TinhTrangChung"].ToString();
            txtTotally.Text = dtRow["ThietHaiHoanToan"].ToString();
            txtPartial.Text = dtRow["TrangThai"].ToString();
            txtYKienGDV.Text = dtRow["YKienGDV"].ToString();

            if(dtRow["TinhTrang"].ToString().ToLower() == "yes")
                checkTinhTrang.Checked = true;
            else
                checkTinhTrang.Checked = false;

        }

        protected void grDanhMucThietHaiILA_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow grRow = grDanhMucThietHaiILA.Rows[e.NewEditIndex];
            string id = ((HiddenField)grRow.FindControl("hiddenID")).Value;
            e.Cancel = true;

            DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();
            DataRow dtRow = dao.GetDanhMucThietHai(id);

            panelGrid.Visible = false;
            panelAddEdit.Visible = true;
            btnAdd.Visible = false;
            btnUpdate.Visible = true;

            hiddenDanhMucID.Value = id;
            drDamaged.SelectedValue = dtRow["ID_HangMuc"].ToString();
            txtMoTaChung.Text = dtRow["TinhTrangChung"].ToString();
            txtTotally.Text = dtRow["ThietHaiHoanToan"].ToString();
            txtPartial.Text = dtRow["TrangThai"].ToString();
            txtYKienGDV.Text = dtRow["YKienGDV"].ToString();

            if (dtRow["TinhTrang"].ToString().ToLower() == "yes")
                checkTinhTrang.Checked = true;
            else
                checkTinhTrang.Checked = false;

        }

        protected void grDanhMucThietHaiILA_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow grRow = grDanhMucThietHaiILA.Rows[e.RowIndex];
            string id = ((HiddenField)grRow.FindControl("hiddenID")).Value;
            string thamchieu = mClaimID;
            DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();
            bool kq=dao.XoaDanhMucThietHai(int.Parse( id ));
            if (kq == true)
            {
                loadDanhMucThietHai();
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " delete summary of loss ILA of case " + thamchieu + " .";
            }
            Response.Write("<script>parent.reloaData();</script>");
        }

        protected void grDanhMucThietHaiSR01_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow grRow = grDanhMucThietHaiSR01.Rows[e.RowIndex];
            string id = ((HiddenField)grRow.FindControl("hiddenID")).Value;
            string thamchieu = mClaimID;
            DanhMucThietHaiDAO dao = new DanhMucThietHaiDAO();
            bool kq=dao.XoaDanhMucThietHai(int.Parse(id));
            if (kq == true)
            {
                loadDanhMucThietHai();
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdv.LayTenTheoMa(maGDV) + " delete summary of loss SR01 of case " + thamchieu + " .";
            }
            Response.Write("<script>parent.reloaData();</script>");
        }

       

    }
}