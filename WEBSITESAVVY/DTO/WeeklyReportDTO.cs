using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class WeeklyReportDTO
    {
        private int ma;

        public int Ma
        {
            get { return ma; }
            set { ma = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private float gioTichLuy;

        public float GioTichLuy
        {
            get { return gioTichLuy; }
            set { gioTichLuy = value; }
        }
        private string duPhongTonThat;

        public string DuPhongTonThat
        {
            get { return duPhongTonThat; }
            set { duPhongTonThat = value; }
        }
        private string vuViec;

        public string VuViec
        {
            get { return vuViec; }
            set { vuViec = value; }
        }
        private string tienTrinhVaVuongMac;

        public string TienTrinhVaVuongMac
        {
            get { return tienTrinhVaVuongMac; }
            set { tienTrinhVaVuongMac = value; }
        }
        private string deXuatGiamDinh;

        public string DeXuatGiamDinh
        {
            get { return deXuatGiamDinh; }
            set { deXuatGiamDinh = value; }
        }
        private string hoSoDaNhan;

        public string HoSoDaNhan
        {
            get { return hoSoDaNhan; }
            set { hoSoDaNhan = value; }
        }
        private string hoSoConThieu;

        public string HoSoConThieu
        {
            get { return hoSoConThieu; }
            set { hoSoConThieu = value; }
        }
 
    }
}