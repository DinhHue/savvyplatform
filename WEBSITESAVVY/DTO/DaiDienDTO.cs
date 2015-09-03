using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DaiDienDTO
    {
        private int maDaiDien;

        public int MaDaiDien
        {
            get { return maDaiDien; }
            set { maDaiDien = value; }
        }
        private string tenNguoiDaiDien;

        public string TenNguoiDaiDien
        {
            get { return tenNguoiDaiDien; }
            set { tenNguoiDaiDien = value; }
        }
        private string phongBan;

        public string PhongBan
        {
            get { return phongBan; }
            set { phongBan = value; }
        }
        private string chucVu;

        public string ChucVu
        {
            get { return chucVu; }
            set { chucVu = value; }
        }
        private string dienThoai;

        public string DienThoai
        {
            get { return dienThoai; }
            set { dienThoai = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private int maDonVi;

        public int MaDonVi
        {
            get { return maDonVi; }
            set { maDonVi = value; }
        }
        private int thucHienBoiThuong;

        public int ThucHienBoiThuong
        {
            get { return thucHienBoiThuong; }
            set { thucHienBoiThuong = value; }
        }
    }
}