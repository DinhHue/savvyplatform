using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class NhomHangMucDTO
    {
        private int maNhomHangMuc;

        public int MaNhomHangMuc
        {
            get { return maNhomHangMuc; }
            set { maNhomHangMuc = value; }
        }
        private string tenNhomHangMuc;

        public string TenNhomHangMuc
        {
            get { return tenNhomHangMuc; }
            set { tenNhomHangMuc = value; }
        }
    }
}