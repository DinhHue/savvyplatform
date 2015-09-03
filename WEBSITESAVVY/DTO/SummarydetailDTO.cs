using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class SummarydetailDTO
    {
        private int maSummaryDetail;

        public int MaSummaryDetail
        {
            get { return maSummaryDetail; }
            set { maSummaryDetail = value; }
        }
        private int maSummary;

        public int MaSummary
        {
            get { return maSummary; }
            set { maSummary = value; }
        }

        private int maTheLoai;

        public int MaTheLoai
        {
            get { return maTheLoai; }
            set { maTheLoai = value; }
        } 
        private string tenHangMuc;

        public string TenHangMuc
        {
            get { return tenHangMuc; }
            set { tenHangMuc = value; }
        }
      
        private float giaTriKhieuNai;

        public float GiaTriKhieuNai
        {
            get { return giaTriKhieuNai; }
            set { giaTriKhieuNai = value; }
        }
        private int soLuong;

        public int SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }
        private float thietHaiHopLy;

        public float ThietHaiHopLy
        {
            get { return thietHaiHopLy; }
            set { thietHaiHopLy = value; }
        }
        private float deXuatTinhToan;

        public float DeXuatTinhToan
        {
            get { return deXuatTinhToan; }
            set { deXuatTinhToan = value; }
        }

      
        private string ghiChu;

        public string GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }
        private string link;

        public string Link
        {
            get { return link; }
            set { link = value; }
        }
        private int maMenhGia;

        public int MaMenhGia
        {
            get { return maMenhGia; }
            set { maMenhGia = value; }
        }
    }
}