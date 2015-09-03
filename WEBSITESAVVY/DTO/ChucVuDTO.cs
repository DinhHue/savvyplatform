using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class ChucVuDTO
    {
        private int maChucVu;

        public int MaChucVu
        {
            get { return maChucVu; }
            set { maChucVu = value; }
        }
        private string tenChucVu;

        public string TenChucVu
        {
            get { return tenChucVu; }
            set { tenChucVu = value; }
        }
    }
}