using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DonViDTO
    {
        private int id_DonVi;

        public int Id_DonVi
        {
            get { return id_DonVi; }
            set { id_DonVi = value; }
        }
        private string tenDonVi;

        public string TenDonVi
        {
            get { return tenDonVi; }
            set { tenDonVi = value; }
        }
        private int id_NhaBH;

        public int Id_NhaBH
        {
            get { return id_NhaBH; }
            set { id_NhaBH = value; }
        }
        private string diaChi;

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }
        private string dienThoai;

        public string DienThoai
        {
            get { return dienThoai; }
            set { dienThoai = value; }
        }
        private string fax;

        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }
        private string webSite;

        public string WebSite
        {
            get { return webSite; }
            set { webSite = value; }
        }
        private string maHoa;

        public string MaHoa
        {
            get { return maHoa; }
            set { maHoa = value; }
        }
        private string maSoThue;

        public string MaSoThue
        {
            get { return maSoThue; }
            set { maSoThue = value; }
        }
        private int soVuThietHai;

        public int SoVuThietHai
        {
            get { return soVuThietHai; }
            set { soVuThietHai = value; }
        }
    }
}