using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class QuanLyKhoDTO
    {
        private int id_QuanLyKho;

        public int Id_QuanLyKho
        {
            get { return id_QuanLyKho; }
            set { id_QuanLyKho = value; }
        }
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string luutru;

        public string Luutru
        {
            get { return luutru; }
            set { luutru = value; }
        }
        private string moTa;

        public string MoTa
        {
            get { return moTa; }
            set { moTa = value; }
        }
        private string chieuCaoChatHang;

        public string ChieuCaoChatHang
        {
            get { return chieuCaoChatHang; }
            set { chieuCaoChatHang = value; }
        }
        private string chieuCaoNhaKho;

        public string ChieuCaoNhaKho
        {
            get { return chieuCaoNhaKho; }
            set { chieuCaoNhaKho = value; }
        }
        private string vatDung;

        public string VatDung
        {
            get { return vatDung; }
            set { vatDung = value; }
        }
        private string vatLieuDeChay;

        public string VatLieuDeChay
        {
            get { return vatLieuDeChay; }
            set { vatLieuDeChay = value; }
        }
    }
}