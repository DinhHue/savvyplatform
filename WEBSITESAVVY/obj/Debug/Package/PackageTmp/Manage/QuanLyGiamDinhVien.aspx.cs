using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WEBSITESAVVY.DAO;
using WEBSITESAVVY.DTO;
using System.Data;
using System.Security.Cryptography;
namespace WEBSITESAVVY.Manage
{
    public partial class QuanLyGiamDinhVien : System.Web.UI.Page
    {
        GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck == null)
                    Response.Redirect("~/Pages/Login.aspx");
                else
                {
                    load_ChucVu();
                    HienThiDanhSach();
                    sua.Visible = false;
                }
            }
        }
        protected void HienThiDanhSach()
        {

            gvDSGDV.DataSource = gdvdao.DanhSachQuanLyGDV();
            gvDSGDV.DataBind();

        }
        void load_ChucVu()
        {
            if (!this.IsPostBack)
            {
                ChucVuDAO cvdao = new ChucVuDAO();
                drChucVu.DataSource = cvdao.DSChucVu();
                drChucVu.DataValueField = "Id_ChucVu";
                drChucVu.DataTextField = "TenChucVu";
                drChucVu.DataBind();

                drChucVuS.DataSource = cvdao.DSChucVu();
                drChucVuS.DataValueField = "Id_ChucVu";
                drChucVuS.DataTextField = "TenChucVu";
                drChucVuS.DataBind();
            }
        }

        protected void gvDSGDV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
            int autoid = int.Parse(gvDSGDV.DataKeys[e.RowIndex].Value.ToString());
            bool kq= gdvdao.XoaGDV(autoid);
            if(kq==true)
                HienThiDanhSach();
        }

        //protected void gvDSGDV_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridViewRow row = gvDSGDV.SelectedRow;
        //    int maS = 0;
        //    if (row != null)
        //    {
        //        string temp = row.Cells[0].Text;
        //        maS = int.Parse(temp.ToString());
        //    }
           
        //    GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
        //    DataTable dt = new DataTable();
        //    dt = gdvdao.GiamDinhVienTheoMa(maS);
        //    if (dt.Rows.Count > 0)
        //    {
        //        DataRow dr = dt.Rows[0];
        //        txtMaS.Text = dr[0].ToString();
        //        txtTenS.Text = dr[1].ToString();
        //        txtDtS.Text = dr[2].ToString();
        //        txtEmailS.Text = dr[3].ToString();
        //        txtDiaChiS.Text = dr[5].ToString();
        //        drChucVuS.SelectedValue = dr[6].ToString();

        //    }
        //    sua.Visible = true;
        //}

        protected void btnHienThem_Click(object sender, EventArgs e)
        {
            them.Visible = true;
            danhsach.Visible = false;
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            them.Visible = false;
            danhsach.Visible = true;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                string ten = txtTen.Text;
                string dt = txtDienThoai.Text;
                string email = txtEmail.Text;
                string ngaysinh = txtNgay.Text;
                string diachi = txtDiaChi.Text;
                int chucvu = int.Parse(drChucVu.SelectedValue.ToString());
                string maten = txtMaTenN.Text;
                float rate = float.Parse(txtRate.Text);
                string user = txtuser.Text;
                string pass = GetMD5Hash(txtpass.Text);
                string fullname = txtFullName.Text;
                GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
                gdvdao.ThemGiamDinhVien(ten, dt, email, ngaysinh, diachi, chucvu, user, pass, maten, rate, fullname);
                HienThiDanhSach();
                danhsach.Visible = true;
                them.Visible = false;
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không để trống thông tin!');</script>");
            }
        }
        public string GetMD5Hash(string input)
        {
            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            string password = s.ToString();
            return password;
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                int ma = int.Parse(txtMaS.Text);
                string ten = txtTenS.Text;
                string dt = txtDtS.Text;
                string email = txtEmailS.Text;
                string diachi = txtDiaChiS.Text;
                int chucvu = int.Parse(drChucVuS.SelectedValue.ToString());
                string un = txtUsernameS.Text;
                float rate = float.Parse(txtRateU.Text);
                string maten = txtMaTenS.Text;
                int kh = int.Parse(txtKichHoat.Text);
                int pub = int.Parse(txtPublic.Text);
                GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
                string tenfull = txtFullnameS.Text;
                gdvdao.SuaGDV(ma, ten, dt, email, diachi, chucvu, un, maten, kh, pub, rate, tenfull);
                HienThiDanhSach();
                sua.Visible = false;
            
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không để trống thông tin!');</script>");
            }
        }

        protected void gvDSGDV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDSGDV.PageIndex = e.NewPageIndex;
            HienThiDanhSach();
        }
        int magdv = 0;       

        protected void gvDSGDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            GiamDinhVienDAO gdvdao = new GiamDinhVienDAO();
            GridViewRow row = gvDSGDV.SelectedRow;
            int mgdv = 0;
            if (row != null)
            {
                string temp = row.Cells[0].Text;
                mgdv = int.Parse(temp.ToString());
            }
            if (mgdv != null)
            {
                DataTable dt = new DataTable();
                dt = gdvdao.GiamDinhVienTheoMa(mgdv);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtMaS.Text = dr[0].ToString();
                    txtTenS.Text = dr[1].ToString();
                    txtDtS.Text = dr[2].ToString();
                    txtEmailS.Text = dr[3].ToString();
                    txtDiaChiS.Text = dr[5].ToString();
                    drChucVuS.SelectedValue = dr[6].ToString();
                    txtUsernameS.Text = dr[7].ToString();
                    txtMaTenS.Text = dr[9].ToString();
                    txtKichHoat.Text = dr[10].ToString();
                    txtPublic.Text = dr[11].ToString();
                    txtFullnameS.Text = dr["FullName"].ToString();
                    txtRateU.Text=dr["Rate"].ToString();
                }
                sua.Visible = true;
            }
        }

        protected void gvDSGDV_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int maGDV=int.Parse(gvDSGDV.DataKeys[e.RowIndex].Value.ToString());
            gdvdao.XoaGDV(maGDV);
            HienThiDanhSach();
        }

    }
}