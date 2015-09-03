using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LoaiHangMucDTO
    {
        int maLoaiHangMuc;

        public int MaLoaiHangMuc
        {
            get { return maLoaiHangMuc; }
            set { maLoaiHangMuc = value; }
        }
        string tenLoaiHangMuc;

        public string TenLoaiHangMuc
        {
            get { return tenLoaiHangMuc; }
            set { tenLoaiHangMuc = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
    }
}