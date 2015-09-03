using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LoaiDRDTO
    {
        private int maLoaiDR;

        public int MaLoaiDR
        {
            get { return maLoaiDR; }
            set { maLoaiDR = value; }
        }
        private string tenLoai;

        public string TenLoai
        {
            get { return tenLoai; }
            set { tenLoai = value; }
        }
    }
}