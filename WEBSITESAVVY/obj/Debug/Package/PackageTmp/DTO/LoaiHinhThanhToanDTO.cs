using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LoaiHinhThanhToanDTO
    {
        private int maLoaiHinhThanhToan;

        public int MaLoaiHinhThanhToan
        {
            get { return maLoaiHinhThanhToan; }
            set { maLoaiHinhThanhToan = value; }
        }
        private string loaiHinhThanhToan;

        public string LoaiHinhThanhToan
        {
            get { return loaiHinhThanhToan; }
            set { loaiHinhThanhToan = value; }
        }

    }
}