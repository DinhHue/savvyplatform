using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class HangMucDTO
    {
        private int maHangMuc;

        public int MaHangMuc
        {
            get { return maHangMuc; }
            set { maHangMuc = value; }
        }
        private string tenHangMuc;

        public string TenHangMuc
        {
            get { return tenHangMuc; }
            set { tenHangMuc = value; }
        }
    }
}