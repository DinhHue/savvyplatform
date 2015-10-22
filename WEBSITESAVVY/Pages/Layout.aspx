<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="WEBSITESAVVY.Pages.Layout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Claim Detail</title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<!--<link rel="stylesheet" type="text/css" href="../Content/themes/bootstrap/easyui.css">-->
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../css/claim.css"/>
	<script type="text/javascript" src="../Scripts/jquery.min.js"></script>
	<script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


    <style type="text/css">
        iframe
        {
            border:1px solid #BCBCBC;
            box-sizing: inherit;
        }
        .frame
        {
            border:1px solid #BCBCBC;
            width:100%;
            height:100%;
        }
        .modal-header {
            padding: 8px 15px;
        }
        .modal-body {
            padding: 10px;
        }
        .contentDialog
        {
            height:350px;
        }
        
    </style>

    <script type="text/javascript">

        var report = "";

        function closeDialog() {
            //$('.panel-tool-close').trigger("click");
            $('#w_UpdateField').window('close');
            $('#w_UpdateFieldSmall').window('close');
            $('#w_Popup').window('close');
        }

        function closeAllDialog() {
            $('.panel-tool-close').trigger("click");
            $('.close').trigger("click");
        }

        function reloaData() {
            var p = $('#panelMenu').accordion('getSelected');
            if (p) {
                var index = $('#panelMenu').accordion('getPanelIndex', p);
                loadReport(index);
               
            }
        }

        function loadContent(obj) {
            var href = $(obj).attr("href");
            var content = "<iframe src='"+ href +"'></iframe>";
            $("#frameCenter").attr("src", href);
            return false;
        }

        function showPopup(obj) {
            var href = $(obj).attr("href");

            var content = "<iframe src='"+ href +"'></iframe>";

            $('#w_Popup').html(content);
            $('#w_Popup').window('open');

            var parentWindow = $('#w_Popup').parent(".panel");
            var title = $(parentWindow).children().children()[0];

            $(title).html($($(obj).children().children()[0]).html() );

            return false;
        }

        function loadReport(index) {

            var Link = "";
            report = ""
            if (index == 0)
                Link = "../Pages/generalinformation.aspx";
                
            if (index == 1)
                Link = "../Pages/sitephoto.aspx";
            if (index == 2) {
                Link = "../Pages/reportSR01.aspx";
                report = "SR01"
            }
            else if (index == 3) {
                Link = "../Pages/reportILA.aspx";
                report = "ILA"
            }
            else if (index == 4) {
                Link = "../Pages/reportPR.aspx";
                report = "PR"
            }
            else if (index == 5) {
                Link = "../Pages/reportIR.aspx";
                report = "IR"
            }
            else if (index == 6) {
                Link = "../Pages/reportFR.aspx";
                report = "FR"
            }
            else if (index == 7) {
                Link = "../Pages/reportFFR.aspx";
                report = "FFR"
            }
            else if (index == 8)
                Link = "../Pages/listworksheet.aspx";
            else if (index == 9)
                link = "../Pages/task.aspx";

			if (Link != "")
			    $("#frameCenter").attr("src", Link);

			if (report === "") $("#choose").hide();
			else $("#choose").show();

        }


        function updateField(obj) {

            closeAllDialog();

            var type = $(obj).attr("type");

            var parentWindow = $('#w_UpdateField').parent(".panel");
            if (type == "date")
                parentWindow = $('#w_UpdateFieldSmall').parent(".panel");
//            if (type == "sorttext")
//                parentWindow = $('#w_UpdateFieldSmall').parent(".panel");

            var title = $(parentWindow).children().children()[0];
            var strTitle = $($(obj).children().children()[0]).html();

            var tiltePop = $(obj).attr("title");
            if (tiltePop) strTitle = tiltePop;

            $(title).html(strTitle);

            var key = $(obj).attr("key");
            //alert(key);
            var param = "?key=" + key;
           
            if (type)  param += "&type=" + type;
            param += "&title=" + strTitle;

            var content = "<iframe src='../Pages/ClaimUpdateFieldPop.aspx" + param + "'></iframe>";
           
            if (type == "date") {
                $('#w_UpdateFieldSmall').html(content);
                $('#w_UpdateFieldSmall').window('open');

                var parentWindow = $('#w_UpdateFieldSmall').parent(".panel");
                
            } else {
                $('#w_UpdateField').html(content);
                $('#w_UpdateField').window('open');

                var parentWindow = $('#w_UpdateField').parent(".panel");
            }
                      
        }

        function showMessage(_title, _msg) {
            $.messager.show({
                title: _title,
                msg: _msg,
                timeout: 4000,
                showType: 'slide'
            });
        }


        function SendSubmit() {
            if (report != "") {
                var url = "../Messages/submitreport.aspx?report=" + report;
                var contentPage = '<iframe style="width:100%; height:100% ; border:none;" src="' + url + '"></iframe>'
                //$("#w_MessageClaim").html(contentPage);
                //$('#w_MessageClaim').window('open');
                //window.scrollTo(0, 0);
                $('#titleStatus').html("Submit to...");
                $('.contentDialog').html(contentPage);
            }
        }
        function SendChecked() {
            if (report != "") {
                var url = "../Messages/checkedreport.aspx?report=" + report;
                var contentPage = '<iframe style="width:100%; height:100% ; border:none;" src="' + url + '"></iframe>'
                //$("#w_CheckClaim").html(contentPage);
                //$('#w_CheckClaim').window('open');
                //window.scrollTo(0, 0);
                $('#titleStatus').html('Checked, send message to ...');
                $('.contentDialog').html(contentPage);
            }
        }

    </script>

    <script type="text/javascript">
       var ClaimName = '<%= claimName %>';
        $(document).ready(function () {

            $("#panelMenu").accordion({
                onSelect: function (title, index) {
                    //alert(title +"_"+ index);
                    title += "   [" + ClaimName + "]"
                    $(".layout-panel-center .panel-title").html(title);
                    loadReport(index);
                }
            });

        });

    </script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:inherit;padding:0 0 2px 0; overflow:hidden;">
		 <div class="easyui-panel" style="padding:5px;background: url('../images/ambitios_header_bg.gif'); width:100%">
            <div class="logo" >SAVVY ADJUSTERS JSC</div>
			<table class="tool_menu">
				<tr>
					<td style="text-align:right;">            
						<a href="../Pages/Home.aspx" class="easyui-splitbutton" class="easyui-linkbutton" data-options="menu:'#mm1', plain:false" class="button-menu" ><span ><span>Home<span></span></a>
						<a href="../Pages/DonViBaoHiem.aspx" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu" >Insurer</span></a>
						<a href="../Pages/TimeSheet.aspx" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu">Timesheet</span></a>
						<a href="../Pages/QuanLyQuiTrinh.aspx" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu">Memos</span></a>
						<a href="../Pages/DAILYTODO.aspx" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu">To-do-list</span></a>
						<a href="../Pages/ListWeeklyReport.aspx" class="easyui-linkbutton" data-options="plain:true" ><span class="button-menu">Weekly Update</span></a>
                        <a href="../Pages/trackinglog.aspx" class="easyui-linkbutton" data-options="plain:true" ><span class="button-menu">Events</span></a>
						<a href="javascript:void(0)" onclick="$('#w_NewClaim').window('open')" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu">New Claim</span></a>
					    <a href="http://blog.savvyadjusters.com/"class="easyui-linkbutton" data-options="plain:true" ><span class="button-menu">Blogs</span></a>
                     </td>
                    <td>
                        <div style="float:right">
							<a class="easyui-splitbutton" href="#" class="easyui-linkbutton" data-options="menu:'#mmProfile', plain:false">
                            <span><span style="color:#444">
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label> <asp:Label 
                                ID="lblChucVu" runat="server" Visible="False"></asp:Label>
                             <asp:HyperLink ID="linklogin" runat="server" Text="Log In" 
                        NavigateUrl="~/Pages/Login.aspx"></asp:HyperLink>
                        
                            </span></span></a>
						</div>
                    </td>
				</tr>
			</table>
        </div>
        <div id="mm1" class="menu-content" style="width:10%;"><%//200 %>
			<ul>
              <%--  <li><a class="easyui-linkbutton" href="../Pages/SubHome.aspx" data-options="plain:true">Riot_Home</a></li>--%>
			    <li><a class="easyui-linkbutton" href="../Pages/ClaimFollow.aspx" data-options="plain:true">Claim Following</a></li>
				<li><a class="easyui-linkbutton" href="../Pages/BillingProcess.aspx" data-options="plain:true">Claim Billing</a></li>
            </ul>
        </div>


        <div id="mmProfile" class="menu-content" style="width:200px;">
            <ul>
                <li><a href="../Manage/HomeManager.aspx" class="easyui-linkbutton" data-options="plain:true"> Management </a></li>
                <li><a href="javascript:void(0)" onclick="$('#w_changePass').window('open')" class="easyui-linkbutton" data-options="plain:true" >Change passwork</a></li>
			    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true">Logout</a></li>
                
            </ul>
        </div>
	</div>
	<div data-options="region:'west',split:true,title:'Part of Claim'" style="width:25%">
		<div id="panelMenu" class="easyui-accordion" data-options="fit:false,border:false" style="width:100%;">
            <div id="GeIn" title="General Information"  style="padding:0px;">            
		    </div>
            <div id="SP" title="Site Photos"  style="padding:0px;">            
			</div>	
			<div id="SR01" title="SR01"  style="padding:0px;">
                <ol type="1" >
                    <li><a href="../Pages/basicinforpop.aspx?type=SR01" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">
                        Basic Infomation</a></li>
                     <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="NgayBatDauGiamDinh" type="date" onclick="updateField(this);" >Date Site Survey</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);"  >
                        Circumstances</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PhamViTonThat" onclick="updateField(this);"  >
                        Extent of Loss </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DePhongVaKhuyenCao" onclick="updateField(this);"  >
                        Recommendation </a></li>
				    <li><a href="../Pages/ClaimSummaryOfLossPop.aspx?type=SR01" class="easyui-linkbutton" data-options="plain:true"  onclick="return showPopup(this);"  >
                        Summary of Loss </a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GhiChuLoaiHinhTonThat" onclick="updateField(this);"  >
                       Other type of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GhiChuTBCQCN" type="date" onclick="updateField(this);"  >
                       Further notes</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DuPhongTonThat" type="date" onclick="updateField(this);"  >
                       Estimated Loss / Initial Reserve </a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="YKienGDVSR01" onclick="updateField(this);">
						Loss Adjuster’s Remark</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioKhaoSatHienTruong" type="date" onclick="updateField(this);" >
                        Time complete survey(VN)</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioKhaoSatHienTruongEN" type="date" onclick="updateField(this);" >
                        Time complete survey(EN)</a></li>
                </ol>
			</div>	
			<div id="ILA" title="ILA" >
				<ol type="1" >
                 <%--   <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ILADATE" type="date"  onclick="updateField(this);">
						Date issue</a></li>--%>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ILADATE" type="date" onclick="updateField(this);">
						Date issue</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);">
						Circumstances</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PhamViTonThat" onclick="updateField(this);">
						Extent of Loss</a></li>
                          <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DuPhongTonThat" type="date" onclick="updateField(this);"  >
                       Estimated Loss / Initial Reserve </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DePhongVaKhuyenCaoILA" onclick="updateField(this);">
						Recommendation </a></li>
                         <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PhuLucDinhKem" onclick="updateField(this);">
						Appendix attached </a></li>
				    <li><a href="../Pages/ClaimSummaryOfLossPop.aspx?type=ILA" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">
						Summary of Loss </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="YKienGDV" onclick="updateField(this);">
						Loss Adjuster’s Remark</a></li>
                </ol>
			</div>
            <div id="PR" title="PR" >
				<ol type="1">
                    <li><a href="../Pages/basicinforPR.aspx?type=PR" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">Basic Infomation </a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PRDate" title="Date Prepare Report - PR" type="date" onclick="updateField(this);">Date Prepare Report</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="A1" title="Introduction - PR" onclick="updateField(this);">Introduction</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioiThieu" onclick="updateField(this);">Insured </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);">Circumstance</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C3" onclick="updateField(this);">Cause of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="E1" onclick="updateField(this);">Policy Liability</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="D1" onclick="updateField(this);">Extent of Damage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="G" onclick="updateField(this);">Other Insurance </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="I" onclick="updateField(this);">Reserve for Insurer</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="TamUngBoiThuongText" onclick="updateField(this);">Payment On Account</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" >Procedure</a></li>
                </ol>
			</div>
			<div title="IR" >
				<ol type="1">
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="IRDate" type="date" onclick="updateField(this);">Date Prepare Report</a></li>
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
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="FRDate"type="date" onclick="updateField(this);">Date Prepare Report</a></li>
                    <li><a href="../Pages/BasicFR.aspx?type=FR" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">General Information</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ExecutiveSummaryFR" onclick="updateField(this);">Executive Summary</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="K" onclick="updateField(this);">Claim handling Process</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C3FR" onclick="updateField(this);">Cause of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="E2" onclick="updateField(this);">Policy liability </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B1" onclick="updateField(this);">Claim amount and proposed settlement</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B2" onclick="updateField(this);">Final Proposed Settlement</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="Conclution" onclick="updateField(this);">Conclusion</a></li>
                </ol>
			</div>
            <div title="FFR" >
				<ol type="1">
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="FFRDate" type="date" onclick="updateField(this);">Date Prepare Report</a></li>
                     <li><a href="../Pages/BasicFR.aspx?type=FR" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">General Information</a></li>
                     <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="ExecutiveSummaryFR" onclick="updateField(this);">Executive Summary</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioiThieu" onclick="updateField(this);">Insured </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="K" onclick="updateField(this);">Claim handling Process</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DienBienTonThat" onclick="updateField(this);">Circumstance</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="C3FR" onclick="updateField(this);">Cause of loss</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="E2" onclick="updateField(this);">Policy liability </a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="D1" onclick="updateField(this);">Extent of Damage</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B1" onclick="updateField(this);">Claim amount and proposed settlement</a></li>				   
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="G" onclick="updateField(this);">Other Insurance </a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="H" onclick="updateField(this);">Salvage</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="B2" onclick="updateField(this);">Final Proposed Settlement</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="Conclution" onclick="updateField(this);">Conclusion</a></li>
                </ol>
			</div>
			<div title="PROCESSING DATA" >
				<ol type="1">
                    <li><a href="../Pages/listworksheet.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >List Properties Damage</a></li>
				    <li><a href="../Pages/AdjustSummary.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Adjustment</a></li>
                    <li><a href="../Pages/newitemworksheetpop.aspx"  onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Insert New Item ...</a></li>
				    
                </ol>
			</div>
			<div title="MORE ..." >
				<ol type="1">
                    <li><a href="../Pages/docsrequestn.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Docs Request </a></li>
				    <li><a href="../Pages/ViewWR.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Weekly Update</a></li>
				    <li><a href="../Pages/discussionclaim.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true" >Internal Discussion </a></li>
				    <li><a href="../Pages/task.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Task Assigned</a></li>
                    <li><a href="eventscase.aspx" onclick="return loadContent(this);" class="easyui-linkbutton" data-options="plain:true">Activity History</a></li>
                </ol>
			</div>
		</div>
	</div>
	<!--<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>-->
	<div data-options="region:'south',border:true" style="background:#E0ECFF;padding:4px; overflow:hidden;font-size:16px">
        Savvy Adjuster JSC

    <div class="dropdown"  style="float:right; display:none" id="choose" >
        <button class="btn btn-default dropdown-toggle" style="padding:2px 12px" type="button" data-toggle="dropdown">Choose...
        <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right" style="position:fixed; top:auto; bottom:20px; right:20px;" >
            <li><a data-toggle="modal" data-target="#myModal" onclick="SendSubmit();" href="javascript:void() " >Submit</a></li>
			<li><a data-toggle="modal" data-target="#myModal" onclick="SendChecked();" href="javascript:void() " >Checked</a></li>            
        </ul>
    </div>

    </div>
	<div id="layoutContent" data-options="region:'center',title:'General Information'">
        <iframe id="frameCenter" title="General Information" src="../Pages/generalinformation.aspx" ></iframe>
	</div>

    <!-- window -->
    <div id="w_changePass" class="easyui-window" title="Change passwork" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:280px;padding:10px;">
        <iframe src="../Pages/ChangePassW.aspx" ></iframe>
    </div>

    <div id="w_NewClaim" class="easyui-window" title="New claim" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Pages/NewClaimpop.aspx" ></iframe>
    </div>

    <div id="w_Submit" class="easyui-window" title="Submit to ..." data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Messages/submitreport.aspx"></iframe>
    </div>

    <div id="w_UpdateField" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:650px;height:490px;padding:0px;"></div>
    <div id="w_UpdateFieldSmall" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:350px;height:200px;padding:0px;"></div>

    <!-- default popup -->
    <div id="w_Popup" class="easyui-window" title="Popup" data-options="modal:false,closed:true,iconCls:''" style="width:800px;height:490px;padding:0px;"></div>

    <!-- popup status submit/checked -->
    <div id="w_MessageClaim" class="easyui-window" title=" Submit to ..."  data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:550px;height:250px;">submit</div>
    <div id="w_CheckClaim" class="easyui-window" title=" Checked, send message to ..."  data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:550px;height:400px;">checked</div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 id="titleStatus" class="modal-title">
                        Submit </h4>
                </div>
                <div class="modal-body contentDialog">Loading...</div>
            </div>
        </div>
    </div>

</body>
</html>