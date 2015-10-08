using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class TienDoXyLyDTO
    {
        int maTienDo;

        public int MaTienDo
        {
            get { return maTienDo; }
            set { maTienDo = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        int stt;

        public int Stt
        {
            get { return stt; }
            set { stt = value; }
        }
        string hoSoYeuCau;

        public string HoSoYeuCau
        {
            get { return hoSoYeuCau; }
            set { hoSoYeuCau = value; }
        }
        string tinhTrang;

        public string TinhTrang
        {
            get { return tinhTrang; }
            set { tinhTrang = value; }
        }
        string phuongAnDeXuat;

        public string PhuongAnDeXuat
        {
            get { return phuongAnDeXuat; }
            set { phuongAnDeXuat = value; }
        }
        int phamViTonThat;

        public int PhamViTonThat
        {
            get { return phamViTonThat; }
            set { phamViTonThat = value; }
        }

    }
}