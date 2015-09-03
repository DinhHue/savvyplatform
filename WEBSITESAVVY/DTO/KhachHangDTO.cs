using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class KhachHangDTO
    {
        private int maKhachHang;

        public int MaKhachHang
        {
            get { return maKhachHang; }
            set { maKhachHang = value; }
        }
        private string tenKhachHang;

        public string TenKhachHang
        {
            get { return tenKhachHang; }
            set { tenKhachHang = value; }
        }
        private string tenNguoiDaiDien;

        public string TenNguoiDaiDien
        {
            get { return tenNguoiDaiDien; }
            set { tenNguoiDaiDien = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string fax;

        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }
        private string dienThoai;

        public string DienThoai
        {
            get { return dienThoai; }
            set { dienThoai = value; }
        }
        private string chucVu;

        public string ChucVu
        {
            get { return chucVu; }
            set { chucVu = value; }
        }
        private string diaChi;

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }
        private int maLoaiKhachHang;

        public int MaLoaiKhachHang
        {
            get { return maLoaiKhachHang; }
            set { maLoaiKhachHang = value; }
        }
        private int maLVKD;

        public int MaLVKD
        {
            get { return maLVKD; }
            set { maLVKD = value; }
        }
        private int maDonViBH;

        public int MaDonViBH
        {
            get { return maDonViBH; }
            set { maDonViBH = value; }
        }
        private string linhVucKinhDoanh;

        public string LinhVucKinhDoanh
        {
            get { return linhVucKinhDoanh; }
            set { linhVucKinhDoanh = value; }
        }
    }
}