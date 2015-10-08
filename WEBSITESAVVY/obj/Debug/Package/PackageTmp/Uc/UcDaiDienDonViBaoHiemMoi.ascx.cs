using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;

namespace WEBSITESAVVY.Uc
{
    public partial class UcDonViBaoHiemMoi : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    NhaBHDAO nbhdao = new NhaBHDAO();
                    DataTable dt = new DataTable();
                    dt = nbhdao.DSCongTyTong();
                    if (dt.Rows.Count > 0)
                    {
                        drNBH.DataSource = dt;
                        drNBH.DataValueField = "ID_NhaBH";
                        drNBH.DataTextField = "TenNhaBH";
                        drNBH.DataBind();
                        int maNhaBH = int.Parse(drNBH.SelectedItem.Value.ToString());
                        load_DonViBaoHiem(maNhaBH);
                    }
                    lblThongBao.Text = "";
                }catch(Exception ex)
                {
                    lblThongBao.Text = "Chưa có nhà bảo hiểm nào !";
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
                int thuchienboithuong = int.Parse(drThucHienBoiThuong.SelectedItem.Value.ToString());
                dddto.ThucHienBoiThuong = thuchienboithuong;
                bool kq= dddao.ThemDaiDienMoi(dddto);
                if (kq == true)
                {
                    lblThongBao.Text = "Succeed!";
                    txtHoTen.Text = "";
                    txtchucvu.Text = "";
                    txtphongban.Text = "";
                    txtdienthoai.Text = "";
                    txtemail.Text = "";
                }
                else
                    lblThongBao.Text = "Fail!";
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