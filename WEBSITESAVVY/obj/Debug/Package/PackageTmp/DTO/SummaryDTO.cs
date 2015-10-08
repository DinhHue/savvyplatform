using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class SummaryDTO
    {
        private int maSummary;

        public int MaSummary
        {
            get { return maSummary; }
            set { maSummary = value; }
        }
        private int maClaim;

        public int MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private int soLuong;

        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }
              
        private int maMenhGia;

        public int MaMenhGia
        {
            get { return maMenhGia; }
            set { maMenhGia = value; }
        }

        private int maTheLoaiSum;

        public int MaTheLoaiSum
        {
            get { return maTheLoaiSum; }
            set { maTheLoaiSum = value; }
        }
        private float tongGiaTriThietHai;

        public float TongGiaTriThietHai
        {
            get { return tongGiaTriThietHai; }
            set { tongGiaTriThietHai = value; }
        }
        private float tongNguyenGia;

        public float TongNguyenGia
        {
            get { return tongNguyenGia; }
            set { tongNguyenGia = value; }
        }
        private float tongCPKhoiPhuc;

        public float TongCPKhoiPhuc
        {
            get { return tongCPKhoiPhuc; }
            set { tongCPKhoiPhuc = value; }
        }
        private float tongTienBoiThuong;

        public float TongTienBoiThuong
        {
            get { return tongTienBoiThuong; }
            set { tongTienBoiThuong = value; }
        }
    }
}