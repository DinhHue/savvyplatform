using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DiaryDTO
    {
        private int maDiary;

        public int MaDiary
        {
            get { return maDiary; }
            set { maDiary = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        //private string ngayThuc;

        //public string NgayThuc
        //{
        //    get { return ngayThuc; }
        //    set { ngayThuc = value; }
        //}
        private DateTime ngayThuc;

        public DateTime NgayThuc
        {
            get { return ngayThuc; }
            set { ngayThuc = value; }
        }
        private DateTime ngay;

        public DateTime Ngay
        {
            get { return ngay; }
            set { ngay = value; }
        }
        private string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        private float soGio;

        public float SoGio
        {
            get { return soGio; }
            set { soGio = value; }
        }
        //private string ngayGioBatDau;

        //public string NgayGioBatDau
        //{
        //    get { return ngayGioBatDau; }
        //    set { ngayGioBatDau = value; }
        //}
        //private string ngayGioKetThuc;

        //public string NgayGioKetThuc
        //{
        //    get { return ngayGioKetThuc; }
        //    set { ngayGioKetThuc = value; }
        //}
        private DateTime ngayGioBatDau;

        public DateTime NgayGioBatDau
        {
            get { return ngayGioBatDau; }
            set { ngayGioBatDau = value; }
        }
        private DateTime ngayGioKetThuc;

        public DateTime NgayGioKetThuc
        {
            get { return ngayGioKetThuc; }
            set { ngayGioKetThuc = value; }
        }
        private string ketQua;

        public string KetQua
        {
            get { return ketQua; }
            set { ketQua = value; }
        }
    }
}