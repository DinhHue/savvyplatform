using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DRDTO
    {
        private int maDR;

        public int MaDR
        {
            get { return maDR; }
            set { maDR = value; }
        }
        private int maLoaiDR;

        public int MaLoaiDR
        {
            get { return maLoaiDR; }
            set { maLoaiDR = value; }
        }
        private int maItem;

        public int MaItem
        {
            get { return maItem; }
            set { maItem = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private string tenDR;

        public string TenDR
        {
            get { return tenDR; }
            set { tenDR = value; }
        }
        private string tinhTrang;

        public string TinhTrang
        {
            get { return tinhTrang; }
            set { tinhTrang = value; }
        }
        private DateTime ngayNhan;

        public DateTime NgayNhan
        {
            get { return ngayNhan; }
            set { ngayNhan = value; }
        }
    }
}