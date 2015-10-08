using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class IncomeDTO
    {
        private int maIncome;

        public int MaIncome
        {
            get { return maIncome; }
            set { maIncome = value; }
        }
        private int maInvoice;

        public int MaInvoice
        {
            get { return maInvoice; }
            set { maInvoice = value; }
        }
        private int maGDV;

        public int MaGDV
        {
            get { return maGDV; }
            set { maGDV = value; }
        }
        private float issueFee;

        public float IssueFee
        {
            get { return issueFee; }
            set { issueFee = value; }
        }
        private float realFee;

        public float RealFee
        {
            get { return realFee; }
            set { realFee = value; }
        }
        private float percentage;

        public float Percentage
        {
            get { return percentage; }
            set { percentage = value; }
        }
        private float cyberIncome;

        public float CyberIncome
        {
            get { return cyberIncome; }
            set { cyberIncome = value; }
        }
        private float realIncome;

        public float RealIncome
        {
            get { return realIncome; }
            set { realIncome = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
    }
}