using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;

namespace WEBSITESAVVY.Uc
{
    public partial class UcDonViBaoHiemMoi1 : System.Web.UI.UserControl
    {
        void load_DropList()
        {
            if (!this.IsPostBack)
            {
                //Nha bao hiem
                NhaBHDAO nbhdao = new NhaBHDAO();
                drCTYTong.DataSource = nbhdao.DSCongTyTong();
                drCTYTong.DataTextField = "TenNhaBH";
                drCTYTong.DataValueField = "ID_NhaBH";
                drCTYTong.DataBind();
               
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load_DropList();
            txtThongBaoLoiMaHoa.Text = "";
        }
        DonViDTO dvdto = new DonViDTO();
        DonViBHDAO dvdao = new DonViBHDAO();
        protected void btnThem_Click(object sender, EventArgs e)
        {
            
            try
            {
                bool kq = dvdao.KiemTraMaHoa(txtMaHoa.Text);
                if (kq == true)
                    txtThongBaoLoiMaHoa.Text = "Đã tồn tại mã hóa cho đơn vị khác !";
                else
                {
                    string mahoa  = txtMaHoa.Text.Trim();
                    if (mahoa != "")
                        dvdto.MaHoa = mahoa;
                    else
                        dvdto.MaHoa = "";
                    
                    dvdto.TenDonVi = txtTendonvi.Text.Trim();
                    dvdto.Id_NhaBH = int.Parse(drCTYTong.SelectedItem.Value.ToString());
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
                    string thue=txtMaSoThue.Text;
                    if (thue != "")
                        dvdto.MaSoThue = thue;
                    else
                        dvdto.MaSoThue = "";
                    //dvdto.MaNguoiDaiDien = int.Parse(drNguoiDaiDien.SelectedItem.Value.ToString());
                    bool kt= dvdao.DonViMoi(dvdto);
                    if (kt == true)
                    {
                        txtThongBaoLoiMaHoa.Text = "";
                        lblThemThanhCong.Text = "Succeed!";
                        //Response.Redirect("~/pages/Claim.aspx");
                    }
                    else
                        lblThemThanhCong.Text = "Fail!";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        
    }
}