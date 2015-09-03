using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class LinhVucKinhDoanhDTO
    {
        private int maLVKD;

        public int MaLVKD
        {
            get { return maLVKD; }
            set { maLVKD = value; }
        }
        private string tenLVKD;

        public string TenLVKD
        {
            get { return tenLVKD; }
            set { tenLVKD = value; }
        }
    }
}