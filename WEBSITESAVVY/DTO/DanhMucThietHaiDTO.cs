using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DanhMucThietHaiDTO
    {
        int ma;

        public int Ma
        {
            get { return ma; }
            set { ma = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        string tenHangMuc;

        public string TenHangMuc
        {
            get { return tenHangMuc; }
            set { tenHangMuc = value; }
        }
        string thietHaiHoanToan;

        public string ThietHaiHoanToan
        {
            get { return thietHaiHoanToan; }
            set { thietHaiHoanToan = value; }
        }
        string thietHaiMotPhan;

        public string ThietHaiMotPhan
        {
            get { return thietHaiMotPhan; }
            set { thietHaiMotPhan = value; }
        }
        private int maHangMuc;

        public int MaHangMuc
        {
            get { return maHangMuc; }
            set { maHangMuc = value; }
        }
        private string trangThai;

        public string TrangThai
        {
            get { return trangThai; }
            set { trangThai = value; }
        }
        private string tinhTrang;

        public string TinhTrang
        {
            get { return tinhTrang; }
            set { tinhTrang = value; }
        }
        private string yKienGDV;

        public string YKienGDV
        {
            get { return yKienGDV; }
            set { yKienGDV = value; }
        }
        private string moTaChung;

        public string MoTaChung
        {
            get { return moTaChung; }
            set { moTaChung = value; }
        }
    }
}