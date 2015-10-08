using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class QuanLyHutThuocDTO
    {
        private int id_QuanLyHutThuoc;

        public int Id_QuanLyHutThuoc
        {
            get { return id_QuanLyHutThuoc; }
            set { id_QuanLyHutThuoc = value; }
        }
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string thucHien;

        public string ThucHien
        {
            get { return thucHien; }
            set { thucHien = value; }
        }
        private string nhaKho;

        public string NhaKho
        {
            get { return nhaKho; }
            set { nhaKho = value; }
        }
        private string sanXuat;

        public string SanXuat
        {
            get { return sanXuat; }
            set { sanXuat = value; }
        }
        private string khac;

        public string Khac
        {
            get { return khac; }
            set { khac = value; }
        }
        private string nhanXet;

        public string NhanXet
        {
            get { return nhanXet; }
            set { nhanXet = value; }
        }
    }
}