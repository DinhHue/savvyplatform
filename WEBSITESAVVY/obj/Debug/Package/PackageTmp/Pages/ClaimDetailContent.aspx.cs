using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEBSITESAVVY.Pages
{
    public partial class ClaimDetailContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invisibleAll();
                string req = Request.QueryString["Ref"];
                visibleUI(req);
            }
            
        }

        public void visibleUI(String req)
        {
            if (req == "Cover")
            {
                CoverInfomation1.Visible = true;
            }
            if (req == "A111")
            {
                A111_Introduction1.Visible = true;
            }
            if (req == "Insured")
            {
                A12Insured1.Visible = true;
            }
            if (req == "Circumstance")
            {
                A131Circumstance1.Visible = true;
            }
            if (req == "ES" || req == "ESIR" || req == "ESFR")
            {
                ExecutiveSummary1.Visible = true;
            }
            if (req == "Handling")
            {
                A22QuanLyKhieuNai1.Visible = true;
            }
            if (req == "COL" || req == "COLIR" || req == "COLFR")
            {
                CauseofLoss1.Visible = true;
            }
            if (req == "PL" || req == "PLIR" || req == "PLFR")
            {
                PolicyLaibility1.Visible = true;
            }
            if (req == "DLE" || req == "DLEIR" || req == "DLEFR")
            {
                DetailLossExtent1.Visible = true;
            }
            if (req == "CA" || req == "CAIR" || req == "CAFR")
            {
                ClaimAdjustment1.Visible = true;
            }
            if (req == "Salvage")
            {
                Salvage1.Visible = true;
            }
            if (req == "History")
            {
                LossHistory1.Visible = true;
            }
            if (req == "OtherI")
            {
                OtherInsured1.Visible = true;
            }
            if (req == "Settlement")
            {
                ClaimSettlement1.Visible = true;
            }
            if (req == "Discussion")
            {
                ClaimDisscusion1.Visible = true;
            }
            if (req == "Task")
            {
                Task1.Visible = true;
            }
        }

        protected void invisibleAll()
        {
            CoverInfomation1.Visible = false;
            A111_Introduction1.Visible = false;
            A12Insured1.Visible = false;
            A131Circumstance1.Visible = false;
            ExecutiveSummary1.Visible = false;
            A22QuanLyKhieuNai1.Visible = false;
            CauseofLoss1.Visible = false;
            PolicyLaibility1.Visible = false;
            DetailLossExtent1.Visible = false;
            ClaimAdjustment1.Visible = false;
            Salvage1.Visible = false;
            LossHistory1.Visible = false;
            ClaimSettlement1.Visible = false;
            ClaimDisscusion1.Visible = false;
            OtherInsured1.Visible = false;
            Task1.Visible = false;
        }
    }
}