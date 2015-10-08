using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DTO;
using WEBSITESAVVY.DAO;
namespace WEBSITESAVVY.Manage
{
    public partial class CapNhatDonViBaoHiem : System.Web.UI.Page
    {
        DonViBHDAO dvdao = new DonViBHDAO();
        DonViDTO dvdto = new DonViDTO();
        NhaBHDAO bhdao = new NhaBHDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                dvdto = (DonViDTO)Session["DonViBH"];
                txtTendonvi.Text = dvdto.TenDonVi;
                txtDiaChi.Text = dvdto.DiaChi;
                txtDienThoai.Text = dvdto.DienThoai;
                txtFax.Text = dvdto.Fax;
                txtWebsite.Text = dvdto.WebSite;
                txtMaHoa.Text = dvdto.MaHoa;
                txtMaSoThue.Text = dvdto.MaSoThue.ToString();
                string NBH = bhdao.LayTen(dvdto.Id_NhaBH);
                txtNhaBH.Text = NBH;
            }
        }
       
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            
            string mahoa = Session["MaHoa"].ToString();
            txtMaHoa.Text = mahoa;
            dvdto.TenDonVi = txtTendonvi.Text.Trim();
           
            string diachi = txtDiaChi.Text.Trim();
            if (diachi != "")
                dvdto.DiaChi = diachi;
            else
                dvdto.DiaChi = "";
            string dienthoai = txtDienThoai.Text.Trim();
            if (dienthoai != "")
                dvdto.DienThoai = dienthoai;
            else
                dvdto.DienThoai = "";
            string fax = txtFax.Text.Trim();
            if (fax != "")
                dvdto.Fax = fax;
            else
                dvdto.Fax = "";
            string web = txtWebsite.Text.Trim();
            if (web != "")
                dvdto.WebSite = web;
            else
                dvdto.WebSite = "";
            string thue = txtMaSoThue.Text;
            if (thue != "")
                dvdto.MaSoThue = thue;
            else
                dvdto.MaSoThue = "";
            //dvdto.MaNguoiDaiDien = int.Parse(drNguoiDaiDien.SelectedItem.Value.ToString());
           
            dvdto.MaHoa = mahoa;
            bool kt = dvdao.CapNhat(dvdto);
            if (kt == true)
            {
               
                lblThongBao.Text = "Succeed!";
                //Response.Redirect("~/Manage/QuanLyDonViBaoHiem.aspx");
            }
            else
                lblThongBao.Text = "Fail!";
        }
    }
}