using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class MenhGiaDTO
    {
        private int maMenhGia;

        public int MaMenhGia
        {
            get { return maMenhGia; }
            set { maMenhGia = value; }
        }
        private string menhGia;

        public string MenhGia
        {
            get { return menhGia; }
            set { menhGia = value; }
        }
    }
}