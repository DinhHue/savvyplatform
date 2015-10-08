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
    public partial class updatetimesheetpop : System.Web.UI.Page
    {
        TimeSheetDAO tsdao = new TimeSheetDAO();
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        CongTacTimeSheetDAO ctdao = new CongTacTimeSheetDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["idTS"] != null)
                {
                    drGDV.Visible = false;
                    drCongTac.Visible = false;
                    btnHideCT.Visible = false;
                    btnHideGDV.Visible = false;
                    lblID_GDV.Visible = false;
                    lblID_CongTac.Visible = false;
                    int ma = int.Parse(Request.QueryString["idTS"]);
                    DataRow dr = tsdao.SelectMa(ma);
                    //dr = tsdao.SelectMa(ma);
                    int maGDV=int.Parse(Request.Cookies["MaGDV"].Value);
                    //bool kt = gdvdao.KiemTraChucVuQuanLy(maGDV);
                    bool kt = gdvdao.KiemTraBacQuanLy(maGDV);
                    if (kt == false)
                    {
                        lblTIsuee.Visible = false;
                        txtTIssue.Visible = false;
                    }
                    if (dr != null)
                    {
                        lblID.Text = dr["ID_TimeSheet"].ToString();
                        lblGDV.Text = dr["TenGDV"].ToString();
                        lblID_GDV.Text = dr["ID_GDV"].ToString();
                        txtThamChieu.Text = dr["ThamChieu"].ToString();
                        txtNgay.Text = dr["Ngay"].ToString();
                        lblCongTac.Text = dr["CongTac"].ToString();
                        lblID_CongTac.Text = dr["Ma"].ToString();
                        txtDienGiaiChiTiet.Text = dr["DienGiaiChiTiet"].ToString();
                        txtSoGio.Text = dr["ThoiLuongPhatSinh"].ToString();
                        txtTIssue.Text = dr["TimeIssue"].ToString();
                        txtEtraFee.Text = dr["ExtraFee"].ToString();

                    }
                   
                } 
            }
        }
        ClaimDAO cl = new ClaimDAO();
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            TimeSheetDTO ts = new TimeSheetDTO();
            ts.ID = int.Parse(lblID.Text);
            if (drGDV.Visible == true)
                ts.MaGDV = int.Parse(drGDV.SelectedItem.Value.ToString());
            else
                ts.MaGDV = int.Parse(lblID_GDV.Text);
            bool kttc = cl.KiemTraThamChieu(txtThamChieu.Text);
            if (kttc == true)
                ts.ThamChieu = txtThamChieu.Text;
            else
                Response.Write("<script>alert('Case no. isn't true!');</script>");
            ts.Ngay = txtNgay.Text;
            if (drCongTac.Visible == true)
                ts.IdCongTacTimeSheet = drCongTac.SelectedItem.Value.ToString();
            else
                ts.IdCongTacTimeSheet = lblID_CongTac.Text;
            ts.DienGiai = txtDienGiaiChiTiet.Text;
            string extr = txtEtraFee.Text;
            if (extr != "")
                ts.ExtraFee = extr;
            else
                ts.ExtraFee = "";
            ts.ThoiLuongPhatSinh = float.Parse(txtSoGio.Text);
            ts.TimeIssue = float.Parse(txtTIssue.Text);
            bool up = tsdao.UpdateMa(ts);
            if (up == true)
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdvdao.LayTenTheoMa(maGDV) + " updated a timesheet of case " + txtThamChieu.Text + " .";
                SaveLogTracking(maGDV, noidung, txtThamChieu.Text);
                Response.Write("<script> window.parent.closeDialog(); </script>");
                Response.Write("<script> window.parent.location.reload();</script>");
            }
            else
            {
                int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
                string noidung = gdvdao.LayTenTheoMa(maGDV) + " failed to update timesheet of case" + txtThamChieu.Text + " .";
                SaveLogTracking(maGDV, noidung, txtThamChieu.Text);
                Response.Write("<script>alert('Update fail!');</script>");
            }
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
        protected void btnChangeGDV_Click(object sender, EventArgs e)
        {
            lblGDV.Visible = false;
            btnChangeGDV.Visible = false;
            btnHideGDV.Visible = true;
            drGDV.DataSource = gdvdao.DanhSachGiamDinhVien();
            drGDV.DataTextField = "TenGDV";
            drGDV.DataValueField = "ID_GDV";
            drGDV.DataBind();
            drGDV.Visible = true;
        }

        protected void btnChangeCT_Click(object sender, EventArgs e)
        {
            lblCongTac.Visible = false;
            btnChangeCT.Visible = false;
            btnHideCT.Visible = true;
            drCongTac.DataSource = ctdao.DanhSachCongTac();
            drCongTac.DataTextField = "CongTac";
            drCongTac.DataValueField = "Ma";
            drCongTac.DataBind();
            drCongTac.Visible = true;
        }

        protected void btnHideGDV_Click(object sender, EventArgs e)
        {
            lblGDV.Visible = true;
            btnChangeGDV.Visible = true;
            btnHideGDV.Visible = false;           
            drGDV.Visible = false;
        }

        protected void btnHideCT_Click(object sender, EventArgs e)
        {
            lblCongTac.Visible = true;
            btnChangeCT.Visible = true;
            btnHideCT.Visible = false;
            drCongTac.Visible = false;
        }
    }
}