using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class NhaBaoHiemDTO
    {
        private int id_NhaBH;

        public int Id_NhaBH
        {
            get { return id_NhaBH; }
            set { id_NhaBH = value; }
        }
        private string tenNhaBH;

        public string TenNhaBH
        {
            get { return tenNhaBH; }
            set { tenNhaBH = value; }
        }
        private int soLuongDonVi;

        public int SoLuongDonVi
        {
            get { return soLuongDonVi; }
            set { soLuongDonVi = value; }
        }
    }
}