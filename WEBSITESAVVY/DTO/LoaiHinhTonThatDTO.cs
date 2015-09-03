using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LoaiHinhTonThatDTO
    {
        private int maLoaiHinhTonThat;

        public int MaLoaiHinhTonThat
        {
            get { return maLoaiHinhTonThat; }
            set { maLoaiHinhTonThat = value; }
        }
        private string tenLoaiHinhTonThat;

        public string TenLoaiHinhTonThat
        {
            get { return tenLoaiHinhTonThat; }
            set { tenLoaiHinhTonThat = value; }
        }
    }
}