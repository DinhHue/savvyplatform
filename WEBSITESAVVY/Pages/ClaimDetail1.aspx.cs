using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEBSITESAVVY.Pages
{
    public partial class ClaimDetail1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                HttpCookie ck = Request.Cookies["MaGDV"];
                if (ck != null)
                {
                    //CoverInfomation1.Visible = false;
                    //A111_Introduction1.Visible = false;
                    string req = Request.QueryString["Ref"];
                    if (req == "Cover")
                    {
                        CoverInfomation1.Visible = true;
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
                    if (req == "A111")
                    {
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = true;
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
                    if (req == "Insured")
                    {
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = true;
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
                    if (req == "Circumstance")
                    {
                        A131Circumstance1.Visible = true;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
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
                    if (req == "ES" || req == "ESIR" || req == "ESFR")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = true;
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
                    if (req == "Handling")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = true;
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
                    if (req == "COL" || req == "COLIR" || req == "COLFR")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = true;
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
                    if (req == "PL" || req == "PLIR" || req == "PLFR")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = true;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "DLE" || req == "DLEIR" || req == "DLEFR")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = true;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "CA" || req == "CAIR" || req == "CAFR")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = true;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "Salvage")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = true;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "History")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = true;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "OtherI")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        OtherInsured1.Visible = true;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "Settlement")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = true;
                        ClaimDisscusion1.Visible = false;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "Discussion")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
                        ExecutiveSummary1.Visible = false;
                        A22QuanLyKhieuNai1.Visible = false;
                        CauseofLoss1.Visible = false;
                        PolicyLaibility1.Visible = false;
                        DetailLossExtent1.Visible = false;
                        ClaimAdjustment1.Visible = false;
                        Salvage1.Visible = false;
                        LossHistory1.Visible = false;
                        ClaimSettlement1.Visible = false;
                        ClaimDisscusion1.Visible = true;
                        OtherInsured1.Visible = false;
                        Task1.Visible = false;
                    }
                    if (req == "Task")
                    {
                        A131Circumstance1.Visible = false;
                        CoverInfomation1.Visible = false;
                        A111_Introduction1.Visible = false;
                        A12Insured1.Visible = false;
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
                        Task1.Visible = true;
                    }
                }
            }
        
        }
    }
}