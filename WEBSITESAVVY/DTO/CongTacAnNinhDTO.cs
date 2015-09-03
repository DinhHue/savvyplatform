using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class CongTacAnNinhDTO
    {
        private int id_CongTacAnNinh;

        public int Id_CongTacAnNinh
        {
            get { return id_CongTacAnNinh; }
            set { id_CongTacAnNinh = value; }
        }
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string lapDatHTBT;

        public string LapDatHTBT
        {
            get { return lapDatHTBT; }
            set { lapDatHTBT = value; }
        }
        private string hoatDongGiamSat;

        public string HoatDongGiamSat
        {
            get { return hoatDongGiamSat; }
            set { hoatDongGiamSat = value; }
        }
        private string cameraAnNinh;

        public string CameraAnNinh
        {
            get { return cameraAnNinh; }
            set { cameraAnNinh = value; }
        }
        private string hopDongBaoTri;

        public string HopDongBaoTri
        {
            get { return hopDongBaoTri; }
            set { hopDongBaoTri = value; }
        }
        private string khoaChim;

        public string KhoaChim
        {
            get { return khoaChim; }
            set { khoaChim = value; }
        }
        private string thietKeKhoaCuaSo;

        public string ThietKeKhoaCuaSo
        {
            get { return thietKeKhoaCuaSo; }
            set { thietKeKhoaCuaSo = value; }
        }
        private string baoVe;

        public string BaoVe
        {
            get { return baoVe; }
            set { baoVe = value; }
        }
        private string nguoiThuongTruc;

        public string NguoiThuongTruc
        {
            get { return nguoiThuongTruc; }
            set { nguoiThuongTruc = value; }
        }
    }
}