<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="detailclaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.detailclaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="easyui-layout">
<div data-options="region:'west',split:true,title:'Part of Claim'" style="width:25%">
		<div id="panelMenu" class="easyui-accordion" data-options="fit:false,border:false" style="width:100%;">
			<div id="SR01" title="SR01"  style="padding:0px;">
                <ol type="1" >
                    <li><a href="../Pages/basicinforpop.aspx?type=SR01" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">
                        Basic Infomation</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);"  >
                        Circumstances</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PhamViTonThat" onclick="updateField(this);"  >
                        Extent of Loss </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DePhongVaKhuyenCao" onclick="updateField(this);"  >
                        Recommendation </a></li>
				    <li><a href="../Pages/ClaimSummaryOfLossPop.aspx?type=SR01" class="easyui-linkbutton" data-options="plain:true"  onclick="return showPopup(this);"  >
                        Summary of Loss </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="YKienGDV" onclick="updateField(this);"  >
                        Loss Adjuster’s Remark</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioKhaoSatHienTruong" onclick="updateField(this);" >
                        Time complete survey</a></li>
                </ol>
			</div>	
			<div id="ILA" title="ILA" >
				<ol type="1" >
                    <%--<li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ILADATE" type="date"  onclick="updateField(this);">
						Date issue</a></li>--%>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ILADATE"  onclick="updateField(this);">
						Date issue</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);">
						Circumstances</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PhamViTonThat" onclick="updateField(this);">
						Extent of Loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DePhongVaKhuyenCao" onclick="updateField(this);">
						Recommendation </a></li>
				    <li><a href="../Pages/ClaimSummaryOfLossPop.aspx?type=ILA" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">
						Summary of Loss </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="YKienGDV" onclick="updateField(this);">
						Loss Adjuster’s Remark</a></li>
                </ol>
			</div>
            <div id="PR" title="PR" >
				<ol type="1">
                    <li><a href="../Pages/basicinforPR.aspx?type=PR" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">Basic Infomation </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Introduction</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);">Insured </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C1" onclick="updateField(this);">Circumstance</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C3" onclick="updateField(this);">Cause of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="E1" onclick="updateField(this);">Policy Liability</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="D1" onclick="updateField(this);">Extent of Damege</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="G" onclick="updateField(this);">Other Insurance </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="I" onclick="updateField(this);">Reserve for Insurer</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="TamUngBoiThuongText" onclick="updateField(this);">Payment On Account</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" >Procedure</a></li>
                </ol>
			</div>
			<div title="IR" >
				<ol type="1">
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="BaoCaoTruoc" onclick="updateField(this);">Previous Report</a></li>
                     <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="TamUngBoiThuong" onclick="updateField(this);">Interim Payment</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ExecutiveSummaryIR" onclick="updateField(this);">Executive Summary</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="K" onclick="updateField(this);">Claim Handling TimeLine</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="AdjustmentIR" onclick="updateField(this);">Outline of Claim Adjustment </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="I" onclick="updateField(this);">Interim Reserve</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="TamUngBoiThuongText" onclick="updateField(this);">Interim Payment</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" >Procedure</a></li>
                </ol>
			</div>
			<div title="FR" >
				<ol type="1">
                    <li><a href="../Pages/BasicFR.aspx?type=FR" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">General Information</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ExecutiveSummaryFR" onclick="updateField(this);">Executive Summary</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="K" onclick="updateField(this);">Claim handling Process</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C3FR" onclick="updateField(this);">Cause of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="E2" onclick="updateField(this);">Policy liability </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B1" onclick="updateField(this);">Claim amount and proposed settlement</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B2" onclick="updateField(this);">Final Proposed Settlement</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Conclusion</a></li>
                </ol>
			</div>
            <div title="FFR" >
				<ol type="1">
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" >General Information</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Insured</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Extent of Loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Policy</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Other insurnce</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">General Information</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Insured</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Extent of Loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Policy</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Other insurnce</a></li>
                </ol>
			</div>
			<div title="PROCESSING DATA" >
				<ol type="1">
                    <li><a href="../Pages/listworksheet.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >List Properties Damage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Adjustment</a></li>
                    <li><a href="../Pages/newitemworksheetpop.aspx"  onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Insert New Item ...</a></li>
				    
                </ol>
			</div>
			<div title="MORE ..." >
				<ol type="1">
                    <li><a href="../Pages/docsrequestn.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Docs Request </a></li>
				    <li><a href="../Pages/ViewWR.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Weekly Update</a></li>
				    <li><a href="../Pages/discussionclaim.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Internal Discussion </a></li>
				    <li><a href="../Pages/task.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Task Assigned</a></li>
                </ol>
			</div>
		</div>
	</div>
	<!--<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>-->
	<div id="layoutContent" data-options="region:'center',title:'Report'">
        <iframe id="frameCenter" src="../Pages/reportSR01.aspx" ></iframe>
	</div>

    <!-- window -->

    <div id="w_UpdateField" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:650px;height:490px;padding:0px;"></div>
    <div id="w_UpdateFieldSmall" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:450px;height:300px;padding:0px;"></div>

    <!-- default popup -->
    <div id="w_Popup" class="easyui-window" title="Popup" data-options="modal:false,closed:true,iconCls:''" style="width:800px;height:490px;padding:0px;"></div>
    </div>
</asp:Content>
