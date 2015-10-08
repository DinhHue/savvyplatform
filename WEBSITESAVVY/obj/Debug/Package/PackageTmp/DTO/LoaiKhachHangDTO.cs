using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LoaiKhachHangDTO
    {
        private int maLKH;

        public int MaLKH
        {
            get { return maLKH; }
            set { maLKH = value; }
        }
        private string tenLKH;

        public string TenLKH
        {
            get { return tenLKH; }
            set { tenLKH = value; }
        }
    }
}