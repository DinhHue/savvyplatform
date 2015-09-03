using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DeXuatBoiThuongDTO
    {
        int idDeXuatBoiThuong;

        public int IdDeXuatBoiThuong
        {
            get { return idDeXuatBoiThuong; }
            set { idDeXuatBoiThuong = value; }
        }
        string maClain;

        public string MaClain
        {
            get { return maClain; }
            set { maClain = value; }
        }
        int stt;

        public int Stt
        {
            get { return stt; }
            set { stt = value; }
        }
        string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        float giaTriKhieuNai=0;

        public float GiaTriKhieuNai
        {
            get { return giaTriKhieuNai; }
            set { giaTriKhieuNai = value; }
        }
        float deXuatTinhToan=0;

        public float DeXuatTinhToan
        {
            get { return deXuatTinhToan; }
            set { deXuatTinhToan = value; }
        }
    }
}