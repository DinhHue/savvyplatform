using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
namespace WEBSITESAVVY.Pages
{
    public partial class DaiDienDonViBaoHiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }
                else
                {
                    NhaBHDAO nbhdao = new NhaBHDAO();
                    drNBH.DataSource = nbhdao.DSCongTyTong();
                    drNBH.DataValueField = "ID_NhaBH";
                    drNBH.DataTextField = "TenNhaBH";
                    drNBH.DataBind();
                    int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                    load_DonViBaoHiem(maNhaBH);
                    lblThongBao.Text = "";
                }

            }
        }
        void load_DonViBaoHiem(int maNhaBH)
        {
            if (!this.IsPostBack)
            {

                DonViBHDAO dvbhdao = new DonViBHDAO();
                drDV.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
                drDV.DataValueField = "ID_DonVi";
                drDV.DataTextField = "TenDonVi";
                drDV.DataBind();
            }
        }
        DaiDienDTO dddto = new DaiDienDTO();
        DaiDienDAO dddao = new DaiDienDAO();
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static string[] LayDSGDV(string prefixText, int count)
        {
            DonViBHDAO dvdao = new DonViBHDAO();
            List<string> productList = new List<string>();
            DataTable dt = new DataTable();
            dt = dvdao.DSAllDonVi();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow dr = dt.Rows[i];
                    productList.Add(dr[1].ToString());
                }
            }
            var list = from p in productList
                       where p.ToLower().Contains(prefixText.ToLower())
                       select p;
            string[] prefixTextArray = list.ToArray<string>();
            return prefixTextArray;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                dddto.TenNguoiDaiDien = txtHoTen.Text;
                dddto.MaDonVi = int.Parse(drDV.SelectedItem.Value.ToString());
                dddto.ChucVu = txtchucvu.Text;
                dddto.PhongBan = txtphongban.Text;
                dddto.Email = txtemail.Text;
                dddto.DienThoai = txtdienthoai.Text;
                dddao.ThemDaiDienMoi(dddto);
                lblThongBao.Text = "Đã thêm người đại diện mới.";
                txtHoTen.Text = "";
                txtchucvu.Text = "";
                txtphongban.Text = "";
                txtdienthoai.Text = "";
                txtemail.Text = "";
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }

        protected void drNBH_SelectedIndexChanged(object sender, EventArgs e)
        {
            DonViBHDAO dvbhdao = new DonViBHDAO();
            int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
            drDV.DataSource = dvbhdao.DSDonViBaoHiem(maNhaBH);
            drDV.DataValueField = "ID_DonVi";
            drDV.DataTextField = "TenDonVi";
            drDV.DataBind();
        }
    }
}