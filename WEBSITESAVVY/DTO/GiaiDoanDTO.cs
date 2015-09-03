using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class GiaiDoanDTO
    {
        private int maGiaiDoan;

        public int MaGiaiDoan
        {
            get { return maGiaiDoan; }
            set { maGiaiDoan = value; }
        }
        private string tenGiaiDoan;

        public string TenGiaiDoan
        {
            get { return tenGiaiDoan; }
            set { tenGiaiDoan = value; }
        }
    }
}