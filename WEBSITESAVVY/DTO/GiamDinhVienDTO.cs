using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class GiamDinhVienDTO
    {
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private string tenGDV;

        public string TenGDV
        {
            get { return tenGDV; }
            set { tenGDV = value; }
        }
        private string dienthoai;

        public string Dienthoai
        {
            get { return dienthoai; }
            set { dienthoai = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private DateTime ngaySinh;

        public DateTime NgaySinh
        {
            get { return ngaySinh; }
            set { ngaySinh = value; }
        }
        private string diaChi;

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }
        private int maChucVu;

        public int MaChucVu
        {
            get { return maChucVu; }
            set { maChucVu = value; }
        }
        private string username;

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        private string pass;

        public string Pass
        {
            get { return pass; }
            set { pass = value; }
        }
        private string maTen;

        public string MaTen
        {
            get { return maTen; }
            set { maTen = value; }
        }
    }
}