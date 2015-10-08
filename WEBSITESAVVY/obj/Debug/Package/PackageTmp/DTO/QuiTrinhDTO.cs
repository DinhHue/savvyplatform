using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class QuiTrinhDTO
    {
        private int maQuiTrinh;

        public int MaQuiTrinh
        {
            get { return maQuiTrinh; }
            set { maQuiTrinh = value; }
        }
        private string tieuDe;

        public string TieuDe
        {
            get { return tieuDe; }
            set { tieuDe = value; }
        }
        private string tomTat;

        public string TomTat
        {
            get { return tomTat; }
            set { tomTat = value; }
        }
        private string noiDung;

        public string NoiDung
        {
            get { return noiDung; }
            set { noiDung = value; }
        }

        private int maNguoiDang;

        public int MaNguoiDang
        {
            get { return maNguoiDang; }
            set { maNguoiDang = value; }
        }
        private DateTime ngayDang;

        public DateTime NgayDang
        {
            get { return ngayDang; }
            set { ngayDang = value; }
        }

        
    }
}