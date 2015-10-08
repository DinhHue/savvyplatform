using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class SitePhotoDTO
    {
        private int id_SP;

        public int Id_SP
        {
            get { return id_SP; }
            set { id_SP = value; }
        }
        private string id_Claim;

        public string Id_Claim
        {
            get { return id_Claim; }
            set { id_Claim = value; }
        }
        private string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        private string hinh;

        public string Hinh
        {
            get { return hinh; }
            set { hinh = value; }
        }
    }
}