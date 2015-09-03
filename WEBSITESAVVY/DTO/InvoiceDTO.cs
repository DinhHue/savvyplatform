using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WEBSITESAVVY.DTO
{
    public class InvoiceDTO
    {
        private int maInvcoice;

        public int MaInvcoice
        {
            get { return maInvcoice; }
            set { maInvcoice = value; }
        }
        private string maClaim;

        public string MaClaim
        {
            get { return maClaim; }
            set { maClaim = value; }
        }
        private string noInvoice;

        public string NoInvoice
        {
            get { return noInvoice; }
            set { noInvoice = value; }
        }
        private DateTime dateIssue;

        public DateTime DateIssue
        {
            get { return dateIssue; }
            set { dateIssue = value; }
        }
        private float grandTotal;

        public float GrandTotal
        {
            get { return grandTotal; }
            set { grandTotal = value; }
        }
        private float bVat;

        public float BVat
        {
            get { return bVat; }
            set { bVat = value; }
        }
        private float vat;

        public float Vat
        {
            get { return vat; }
            set { vat = value; }
        }
        private string thanhToan;

        public string ThanhToan
        {
            get { return thanhToan; }
            set { thanhToan = value; }
        }
    }
}