using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class ItemDRDTO
    {
        private int maItem;

        public int MaItem
        {
            get { return maItem; }
            set { maItem = value; }
        }
        private string tenItem;


        public string TenItem
        {
            get { return tenItem; }
            set { tenItem = value; }
        }
    }
}