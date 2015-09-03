using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class CongTacTimeSheetDTO
    {
        private string ma;

        public string Ma
        {
            get { return ma; }
            set { ma = value; }
        }
        private string congTac;

        public string CongTac
        {
            get { return congTac; }
            set { congTac = value; }
        }
    }
}