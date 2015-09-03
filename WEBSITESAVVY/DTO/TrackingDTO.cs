using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class TrackingDTO
    {
        private int idTracking;

        public int IdTracking
        {
            get { return idTracking; }
            set { idTracking = value; }
        }
        private DateTime timeReal;

        public DateTime TimeReal
        {
            get { return timeReal; }
            set { timeReal = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private string noiDung;

        public string NoiDung
        {
            get { return noiDung; }
            set { noiDung = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
    }
}