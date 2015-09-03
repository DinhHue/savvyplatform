using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class TimeSheetDTO
    {
        private int iD;

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private string thamChieu;

        public string ThamChieu
        {
            get { return thamChieu; }
            set { thamChieu = value; }
        }
        private string ngay;

        public string Ngay
        {
            get { return ngay; }
            set { ngay = value; }
        }
        private string idCongTacTimeSheet;

        public string IdCongTacTimeSheet
        {
            get { return idCongTacTimeSheet; }
            set { idCongTacTimeSheet = value; }
        }
               
        private string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        private float thoiLuongPhatSinh;

        public float ThoiLuongPhatSinh
        {
            get { return thoiLuongPhatSinh; }
            set { thoiLuongPhatSinh = value; }
        }
        private DateTime gioThuc;

        public DateTime GioThuc
        {
            get { return gioThuc; }
            set { gioThuc = value; }
        }

        private float timeIssue;

        public float TimeIssue
        {
            get { return timeIssue; }
            set { timeIssue = value; }
        }
        private string extraFee;

        public string ExtraFee
        {
            get { return extraFee; }
            set { extraFee = value; }
        }
    }
}