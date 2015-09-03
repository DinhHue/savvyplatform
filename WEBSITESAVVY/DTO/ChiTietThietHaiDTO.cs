using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class ChiTietThietHaiDTO
    {
        int maChiTietThietHai;

        public int MaChiTietThietHai
        {
            get { return maChiTietThietHai; }
            set { maChiTietThietHai = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        int stt;

        public int Stt
        {
            get { return stt; }
            set { stt = value; }
        }
        string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        float giaTriKhieuNai;

        public float GiaTriKhieuNai
        {
            get { return giaTriKhieuNai; }
            set { giaTriKhieuNai = value; }
        }
        float chiPhiKhoiPhuc;

        public float ChiPhiKhoiPhuc
        {
            get { return chiPhiKhoiPhuc; }
            set { chiPhiKhoiPhuc = value; }
        }
        float deXuatTinhToan;

        public float DeXuatTinhToan
        {
            get { return deXuatTinhToan; }
            set { deXuatTinhToan = value; }
        }
        float thietHaiHopLy;

        public float ThietHaiHopLy
        {
            get { return thietHaiHopLy; }
            set { thietHaiHopLy = value; }
        }
        string ghiChu;

        public string GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }
        int maLinhVucTonThat;

        public int MaLinhVucTonThat
        {
            get { return maLinhVucTonThat; }
            set { maLinhVucTonThat = value; }
        }
    }
}