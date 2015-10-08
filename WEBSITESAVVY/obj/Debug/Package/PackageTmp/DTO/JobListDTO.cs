using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class JobListDTO
    {
        private int idJobList;

        public int IdJobList
        {
            get { return idJobList; }
            set { idJobList = value; }
        }
        private DateTime ngayThucHien;

        public DateTime NgayThucHien
        {
            get { return ngayThucHien; }
            set { ngayThucHien = value; }
        }
        private string nameJob;

        public string NameJob
        {
            get { return nameJob; }
            set { nameJob = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
    }
}