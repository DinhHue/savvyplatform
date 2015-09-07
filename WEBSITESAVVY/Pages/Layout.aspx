<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="WEBSITESAVVY.Pages.Layout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<meta charset="UTF-8">
	<title>Claim Detail</title>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<!--<link rel="stylesheet" type="text/css" href="../Content/themes/bootstrap/easyui.css">-->
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../css/claim.css"/>
	<script type="text/javascript" src="../Scripts/jquery.min.js"></script>
	<script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>


    <script type="text/javascript">


        function closeDialog() {
            //$('.panel-tool-close').trigger("click");
            $('#w_UpdateField').window('close');
            $('#w_UpdateFieldSmall').window('close');
            $('#w_Popup').window('close');
        }

        function closeAllDialog() {
            $('.panel-tool-close').trigger("click");
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
            if (index == 0)
                Link = "../Pages/generalinformation.aspx";
			if(index == 1)
				Link = "../Pages/reportSR01.aspx";
			else if(index == 2)
				Link = "../Pages/reportILA.aspx";
			else if(index == 3)
				Link = "../Pages/reportPR.aspx";
			else if(index == 4)
			    Link = "../Pages/reportIR.aspx";
			else if(index == 5)
			    Link = "../Pages/reportFR.aspx";
			else if(index == 6)
			    Link = "../Pages/reportFFR.aspx";
			else if(index == 7)
			    Link = "../Pages/listworksheet.aspx";
			else if (index == 8)
			    link = "../Pages/task.aspx";

			if (Link != "")
			    $("#frameCenter").attr("src", Link);

            /*$.ajax({
                url: Link,
                beforeSend: function () {
                    //$("#mp-loading").css("display", "block");
                },
                success: function (data) {
                    $("#layoutContent").html(data);

                    //$("#mp-loading").css("display", "none");
                }
            });*/
        }


        function updateField(obj) {

            closeAllDialog();

            var type = $(obj).attr("type");

            var parentWindow = $('#w_UpdateField').parent(".panel");
            if (type == "date")
                parentWindow = $('#w_UpdateFieldSmall').parent(".panel");

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
						<a href="javascript:void(0)" onclick="$('#w_NewClaim').window('open')" class="easyui-linkbutton" data-options="plain:true"><span class="button-menu">New Claim</span></a></td>
					<td><div style="float:right">
							<a class="easyui-splitbutton" href="#" class="easyui-linkbutton" data-options="menu:'#mmProfile', plain:false">
                            <span><span style="color:#444">
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label> <asp:Label 
                                ID="lblChucVu" runat="server" Visible="False"></asp:Label>
                             <asp:HyperLink ID="linklogin" runat="server" Text="Log In" 
                        NavigateUrl="~/Pages/Login.aspx"></asp:HyperLink>
                        
                            </span></span></a>
						</div></td>
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
        <div id="GeIn" title="GeIn"  style="padding:0px;">            
			</div>	
			<div id="SR01" title="SR01"  style="padding:0px;">
                <ol type="1" >
                    <li><a href="../Pages/basicinforpop.aspx?type=SR01" class="easyui-linkbutton" data-options="plain:true" onclick="return showPopup(this);">
                        Basic Infomation</a></li>
                     <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="NgayBatDauGiamDinh" onclick="updateField(this);" >Date Site Survey</a></li>
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
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GhiChuTBCQCN" onclick="updateField(this);"  >
                       Further notes</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DuPhongTonThat" onclick="updateField(this);"  >
                       Estimated Loss / Initial Reserve </a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="YKienGDVSR01" onclick="updateField(this);">
						Loss Adjuster’s Remark</a></li>
				    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioKhaoSatHienTruong" onclick="updateField(this);" >
                        Time complete survey(VN)</a></li>
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="GioKhaoSatHienTruongEN" onclick="updateField(this);" >
                        Time complete survey(EN)</a></li>
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
                          <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="DuPhongTonThat" onclick="updateField(this);"  >
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
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="PRDate" title="Date Prepare Report - PR" onclick="updateField(this);">Date Prepare Report</a></li>
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
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="IRDate" onclick="updateField(this);">Date Prepare Report</a></li>
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
                    <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="FRDate" onclick="updateField(this);">Date Prepare Report</a></li>
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
                    <%-- <li><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" key="FFRDate" onclick="updateField(this);">Date Prepare Report</a></li>--%>
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
	<div data-options="region:'south',border:true" style="height:20px;background:#E0ECFF;padding:2px;">Savvy Adjuster JSC</div>
	<div id="layoutContent" data-options="region:'center',title:'Report'">
        <iframe id="frameCenter" src="../Pages/generalinformation.aspx" ></iframe>
	</div>

    <!-- window -->
    <div id="w_changePass" class="easyui-window" title="Change passwork" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:280px;padding:10px;">
        <iframe src="../Pages/ChangePassW.aspx" ></iframe>
    </div>

    <div id="w_NewClaim" class="easyui-window" title="New claim" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Pages/NewClaimpop.aspx" ></iframe>
    </div>

    <div id="w_UpdateField" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:650px;height:490px;padding:0px;"></div>
    <div id="w_UpdateFieldSmall" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:450px;height:300px;padding:0px;"></div>

    <!-- default popup -->
    <div id="w_Popup" class="easyui-window" title="Popup" data-options="modal:false,closed:true,iconCls:''" style="width:800px;height:490px;padding:0px;"></div>

</body>
</html>