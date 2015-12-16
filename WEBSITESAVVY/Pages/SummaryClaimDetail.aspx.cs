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
    public partial class SummaryClaimDetail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string mathamchieu = Session["ThamChieu"].ToString();
            DataTable dt = new DataTable();
            ClaimDAO cl = new ClaimDAO();
            dt = cl.TomTat(mathamchieu);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                lblThamChieu.Text = dr[0].ToString();
                lblGDV1.Text = dr[1].ToString();
                lblDonVi.Text = dr[2].ToString();
                lblNDBH.Text = dr[3].ToString();
                lblDiaChi.Text = dr[4].ToString();
                lblNguoiLienHe.Text = dr[5].ToString();
                lblSoHDBH.Text = dr[6].ToString();
                lblHieuLuc.Text = dr[7].ToString();
                lblFax.Text = dr[8].ToString();
                lblSoDienThoai.Text = dr[9].ToString();
                lblEmail.Text = dr[10].ToString();
                lblDiaDiemTT.Text = dr[11].ToString();
                lblLoaiHinhTonThat.Text = dr[12].ToString();
                lblNgayTonThat.Text = dr[13].ToString();
                lblDienBienTonThat.Text = dr[14].ToString();
                lblThongBaoCQChucNang.Text = dr[15].ToString();
                lblNguyenNhanTT.Text = dr[16].ToString();
                lblPhamViBH.Text = dr[17].ToString();
                lblDienBienKhieuNai.Text = dr[18].ToString();
                lblMoTaPhamViThietHai.Text = dr[19].ToString();
                lblGiaTriDeXuat.Text = dr[20].ToString();
                lblGiaTriThuHoi.Text = dr[21].ToString();
                lblKetLuan.Text = dr[22].ToString();
            }

        }
    }
}