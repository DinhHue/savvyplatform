using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
namespace WEBSITESAVVY.Uc
{
    public partial class CoverInfomation : System.Web.UI.UserControl
    {
        ClaimDAO cldao = new ClaimDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            { 
                string id=Session["ThamChieu"].ToString();
                if (id != null)
                    loadCover(id);
            }
        }
        void loadCover(string id)
        {
            DataTable dt = new DataTable();
            dt = cldao.ClaimCover(id);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                txtBaoCaoTruoc.Text = dr[0].ToString();
                txtHDBH.Text = dr[1].ToString();
                txtTenInsured.Text = dr[2].ToString();
                txtDiaChi.Text = dr[3].ToString();
                txtLinhVucKinhDoanh.Text = dr[4].ToString();
                txtDiaDiemTonThat.Text = dr[5].ToString();
                txtNgayTonThat.Text = dr[6].ToString();
                txtNguyenNhan.Text = dr[7].ToString();
                txtPhamViTT.Text = dr[8].ToString();
                txtSumInsured.Text = dr[9].ToString();
                txtThoiHanBH.Text = dr[10].ToString();
                txtMucMienThuong.Text = dr[11].ToString();
                txtDieuKhoanBoSung.Text = dr[12].ToString();
                txtKhieuNaiNDBH.Text = dr[13].ToString();
                txtDuPhongBoiThuong.Text = dr[14].ToString();
                txtTinhToanDieuChinh.Text = dr[15].ToString();
                txtTruMucMienThuong.Text = dr[16].ToString();
                txtDeXuatBoiThuong.Text = dr[17].ToString();
                txtTypePolicy.Text = dr[18].ToString();
            }
        }

        SendMailDAO sm = new SendMailDAO();
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            ClaimDTO cldto = new ClaimDTO();
            KhachHangDAO kh = new KhachHangDAO();
            KhachHangDTO khdto = new KhachHangDTO();
            GiamDinhVienDAO gd= new GiamDinhVienDAO();
            int maGDV = int.Parse(Request.Cookies["MaGDV"].Value);
            string tengd = gd.LayTenTheoMa(maGDV);
            string ma= Session["ThamChieu"].ToString();
            int idkhach = cldao.ClaimMaKH(ma);
            //khdto.MaKhachHang = idkhach;
            //update custumer
            string ten = txtTenInsured.Text;
            khdto.TenKhachHang = ten;
            string diachi = txtDiaChi.Text;
            khdto.DiaChi = diachi;
            string linhvuckd = txtLinhVucKinhDoanh.Text;
            khdto.LinhVucKinhDoanh = linhvuckd;
            bool upkh = kh.Updatecover(idkhach, ten, diachi, linhvuckd);
            //update claim
            cldto.MaClaim = ma;
            cldto.BaoCaoTruoc = txtBaoCaoTruoc.Text;
            cldto.PolicyNo = txtHDBH.Text;
            cldto.Premises = txtDiaDiemTonThat.Text;
            cldto.Dol = txtNgayTonThat.Text;
            cldto.SortCause = txtNguyenNhan.Text;
            cldto.PhamViTonThat = txtPhamViTT.Text;
            cldto.SumInsured = txtSumInsured.Text;
            cldto.Effective = txtThoiHanBH.Text;
            cldto.MucMienThuong = txtMucMienThuong.Text;
            cldto.DKBS = txtDieuKhoanBoSung.Text;
            cldto.KhieuNai = txtKhieuNaiNDBH.Text;
            cldto.DuPhongBoiThuong = txtDuPhongBoiThuong.Text;
            cldto.DieuChinh = txtTinhToanDieuChinh.Text;
            cldto.TruMienThuong = txtTruMucMienThuong.Text;
            cldto.BoiThuong = txtDeXuatBoiThuong.Text;
            cldto.NamePolicy = txtTypePolicy.Text;
            bool kq = cldao.UpdateClaimCover(cldto);
            if (kq == true && upkh==true)
            {
                string cn = CapNhatInfoBasic(cldto, khdto, tengd);
                Response.Write("<script> alert('Updated!');</script>");
                loadCover(ma);
                
            }
        }
        protected string CapNhatInfoBasic(ClaimDTO cl, KhachHangDTO kh, string ten)
        {
            string body = "<p>Update Notification - Giám định viên "+ten+" đã cập nhật một số thông tin của Claim.<p>";
           // body += "<br/> ";
            body += "<br/>1.  Previous Report: " + cl.BaoCaoTruoc;
            body += "<br/>2.	Policy number: " + cl.PolicyNo;
            body += "<br/>3.	Location of loss: " + cl.Premises;
            body += "<br/>4.	Insured: " + kh.TenKhachHang;
            body += "<br/>5.	Adress: " + kh.DiaChi;
            body += "<br/>6.	Trade: " + kh.LinhVucKinhDoanh;
            body += "<br/>7.	Date Of loss: " + cl.Dol;
            body += "<br/>8.	Cause of loss: " + cl.SortCause;
            body += "<br/>9.	Extent Of Loss: " + kh.Fax;
            body += "<br/>10.	Sum Insured: " + cl.SumInsured;
            body += "<br/>12.	Insurance Period: " + cl.Effective;
            body += "<br/>13.	Applicable Deductible: " + cl.MucMienThuong;
            body += "<br/>14.	Extentsion Clause: " + cl.DKBS;
            body += "<br/>15.	Insured's Claim: " + cl.KhieuNai;
            body += "<br/>16.	Reserve for insurers: " + cl.DuPhongBoiThuong;
            body += "<br/>17.	Proposed Adjustment: " + cl.DieuChinh;
            body += "<br/>17.	Proposed Sellement: " + cl.BoiThuong;
            string sto = "sa.team@savvyadjusters.vn";
            string master = "savvyadjus@gmail.com";
            //sm.KiemTraMailChinh(master, body, "Update Cover Infomation - " + cl.MaClaim, "Claim_CoverInfo","");
            return sm.KiemTraMailChinh(master, body, "Update Cover Infomation - " + cl.MaClaim, "Claim_CoverInfo");
        }
    }
}