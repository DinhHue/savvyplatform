using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class TheLoaiSumDTO
    {
        private int maTheLoaiSum;

        public int MaTheLoaiSum
        {
            get { return maTheLoaiSum; }
            set { maTheLoaiSum = value; }
        }
        private string theLoai;

        public string TheLoai
        {
            get { return theLoai; }
            set { theLoai = value; }
        }
    }
}