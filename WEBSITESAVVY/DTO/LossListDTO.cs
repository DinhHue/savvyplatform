using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LossListDTO
    {
        int maLossList;

        public int MaLossList
        {
            get { return maLossList; }
            set { maLossList = value; }
        }
        string tenHangMuc;

        public string TenHangMuc
        {
            get { return tenHangMuc; }
            set { tenHangMuc = value; }
        }
        float soLuong;

        public float SoLuong
        {
            get { return soLuong; }
            set { soLuong = value; }
        }
        int maDonViTinh;

        public int MaDonViTinh
        {
            get { return maDonViTinh; }
            set { maDonViTinh = value; }
        }
        string ghiChu;

        public string GhiChu
        {
            get { return ghiChu; }
            set { ghiChu = value; }
        }
        int loaiHangMuc;

        public int LoaiHangMuc
        {
            get { return loaiHangMuc; }
            set { loaiHangMuc = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
    }
}