using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class ThamSoDTO
    {
        private int id_ThamSo;

        public int Id_ThamSo
        {
            get { return id_ThamSo; }
            set { id_ThamSo = value; }
        }
        private int giaTri;

        public int GiaTri
        {
            get { return giaTri; }
            set { giaTri = value; }
        }
    }
}