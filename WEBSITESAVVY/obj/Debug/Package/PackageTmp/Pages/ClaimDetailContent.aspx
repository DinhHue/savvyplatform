<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimDetailContent.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimDetailContent" %>
<%@ Register src="../Uc/CoverInfomation.ascx" tagname="CoverInfomation" tagprefix="uc1" %>
<%@ Register src="../Uc/A111_Introduction.ascx" tagname="A111_Introduction" tagprefix="uc2" %>
<%@ Register src="../Uc/A12Insured.ascx" tagname="A12Insured" tagprefix="uc3" %>
<%@ Register src="../Uc/A131Circumstance.ascx" tagname="A131Circumstance" tagprefix="uc4" %>
<%@ Register src="../Uc/ExecutiveSummary.ascx" tagname="ExecutiveSummary" tagprefix="uc5" %>
<%@ Register src="../Uc/A22QuanLyKhieuNai.ascx" tagname="A22QuanLyKhieuNai" tagprefix="uc6" %>
<%@ Register src="../Uc/CauseofLoss.ascx" tagname="CauseofLoss" tagprefix="uc7" %>
<%@ Register src="../Uc/PolicyLaibility.ascx" tagname="PolicyLaibility" tagprefix="uc8" %>
<%@ Register src="../Uc/DetailLossExtent.ascx" tagname="DetailLossExtent" tagprefix="uc9" %>
<%@ Register src="../Uc/ClaimAdjustment.ascx" tagname="ClaimAdjustment" tagprefix="uc10" %>
<%@ Register src="../Uc/Salvage.ascx" tagname="Salvage" tagprefix="uc11" %>
<%@ Register src="../Uc/LossHistory.ascx" tagname="LossHistory" tagprefix="uc12" %>
<%@ Register src="../Uc/ClaimSettlement.ascx" tagname="ClaimSettlement" tagprefix="uc13" %>
<%@ Register src="../Uc/ClaimDisscusion.ascx" tagname="ClaimDisscusion" tagprefix="uc14" %>
<%@ Register src="../Uc/OtherInsured.ascx" tagname="OtherInsured" tagprefix="uc15" %>
<%@ Register src="../Uc/Task.ascx" tagname="Task" tagprefix="uc16" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:CoverInfomation ID="CoverInfomation1" runat="server" />
        <uc2:A111_Introduction ID="A111_Introduction1" runat="server" />
        <uc3:A12Insured ID="A12Insured1" runat="server" /></div>
        <uc4:A131Circumstance ID="A131Circumstance1" runat="server" />
        <uc5:ExecutiveSummary ID="ExecutiveSummary1" runat="server" />
        <uc6:A22QuanLyKhieuNai ID="A22QuanLyKhieuNai1" runat="server" />
        <uc7:CauseofLoss ID="CauseofLoss1" runat="server" />
        <uc8:PolicyLaibility ID="PolicyLaibility1" runat="server" />
        <uc9:DetailLossExtent ID="DetailLossExtent1" runat="server" />
        <uc10:ClaimAdjustment ID="ClaimAdjustment1" runat="server" />
        <uc11:Salvage ID="Salvage1" runat="server" />
        <uc12:LossHistory ID="LossHistory1" runat="server" />
        <uc13:ClaimSettlement ID="ClaimSettlement1" runat="server" />
        <uc14:ClaimDisscusion ID="ClaimDisscusion1" runat="server" />
        <uc15:OtherInsured ID="OtherInsured1" runat="server" />
        <uc16:Task ID="Task1" runat="server" />
    </div>
    </form>
</body>
</html>
