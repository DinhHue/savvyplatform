using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class HinhThucLuuKhoDTO
    {
        private int id_HinhThuc;

        public int Id_HinhThuc
        {
            get { return id_HinhThuc; }
            set { id_HinhThuc = value; }
        }
        private int id_QuanLyKho;

        public int Id_QuanLyKho
        {
            get { return id_QuanLyKho; }
            set { id_QuanLyKho = value; }
        }
        private int san;

        public int San
        {
            get { return san; }
            set { san = value; }
        }
        private int paller;

        public int Paller
        {
            get { return paller; }
            set { paller = value; }
        }
        private int ke_Cao;

        public int Ke_Cao
        {
            get { return ke_Cao; }
            set { ke_Cao = value; }
        }
        private int khac;

        public int Khac
        {
            get { return khac; }
            set { khac = value; }
        }
    }
}