using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class DAILYDTO
    {
        int maDaiLy;

        public int MaDaiLy
        {
            get { return maDaiLy; }
            set { maDaiLy = value; }
        }
        string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        string dienGiai;

        public string DienGiai
        {
            get { return dienGiai; }
            set { dienGiai = value; }
        }
        string done;

        public string Done
        {
            get { return done; }
            set { done = value; }
        }
        int rate;

        public int Rate
        {
            get { return rate; }
            set { rate = value; }
        }
        int lev;

        public int Lev
        {
            get { return lev; }
            set { lev = value; }
        }
        int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        DateTime ngay;

        public DateTime Ngay
        {
            get { return ngay; }
            set { ngay = value; }
        }
        DateTime deadline;

        public DateTime Deadline
        {
            get { return deadline; }
            set { deadline = value; }
        }
        int maGDVNhan;

        public int MaGDVNhan
        {
            get { return maGDVNhan; }
            set { maGDVNhan = value; }
        }
    }
}