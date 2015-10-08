<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AdjustSummary.aspx.cs" Inherits="WEBSITESAVVY.Pages.AdjustSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ListAssessment</title>

    <script type="text/javascript" src="../js/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.tablednd.js"></script>
    <script type="text/javascript" src="../Scripts/json2.js"></script>
    <script type="text/javascript" src="/Scripts/Excell.js"></script>



    <script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>


    <script type="text/javascript">



        $(document).ready(function () {

            //$("#gvLoaiHangMucDetails tr:even").addClass("alt");
            //$("#gvLoaiHangMucDetails").tableDnD();



            $('.cellEdit').click(function () {

                if ($(this).hasClass("active"))
                    return;

                updateFinishText();
                $('.cellEdit').removeClass("active");
                $('.editRow').removeClass('editRow');
                $(this).parent().addClass("editRow");
                $(this).addClass("active");
                $('.active .input').focus();
                $('.active .input').select();

                $('.active .input').keypress(function (e) {
                    if (e.which == 13) {
                        e.preventDefault();
                        updateFinishText();
                        $('.cellEdit').removeClass("active");
                        $('.editRow').removeClass('editRow');
                    }
                });

            }); //end onclick event



            //remove group
            $(".fieldUnitRemove").click(function () {
                hideColumn('.fieldUnit', true);
                $("#ckfieldUnit").attr('checked', false);
            });
            $("#ckfieldUnit").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldUnit', false);
                else
                    hideColumn('.fieldUnit', true);
            });
            //
            $(".fieldCurRemove").click(function () {
                hideColumn('.fieldCur', true);
                $("#ckfieldCur").attr('checked', false);
            });
            $("#ckfieldCur").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldCur', false);
                else
                    hideColumn('.fieldCur', true);
            });




            $(".grClaimRemove").click(function () {
                hideColumnClaim(true);
                $("#ckClaim").attr('checked', false);
            });
            $("#ckClaim").click(function () {
                if ($(this).is(':checked'))
                    hideColumnClaim(false);
                else
                    hideColumnClaim(true);
            });

            $(".grSupportRemove").click(function () {
                hideColumnSupport(true);
                $("#ckSupport").attr('checked', false);
            });
            $("#ckSupport").click(function () {
                if ($(this).is(':checked'))
                    hideColumnSupport(false);
                else
                    hideColumnSupport(true);
            });


            $(".grReasonableRemove").click(function () {
                hideColumnReasonable(true);
                $("#ckReasonable").attr('checked', false);
            });
            $("#ckReasonable").click(function () {
                if ($(this).is(':checked'))
                    hideColumnReasonable(false);
                else
                    hideColumnReasonable(true);
            });

            //show hide comlunm//
            $(".fieldGiaTriQuyDoiRemove").click(function () {
                hideColumn('.fieldGiaTriQuyDoi', true);
                $("#ckGiaTriQuyDoi").attr('checked', false);
            });
            $("#ckGiaTriQuyDoi").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldGiaTriQuyDoi', false);
                else
                    hideColumn('.fieldGiaTriQuyDoi', true);
            });

            $(".fieldSoTienBaoHiemRemove").click(function () {
                hideColumn('.fieldSoTienBaoHiem', true);
                $("#ckSoTienBaoHiem").attr('checked', false);
            });
            $("#ckSoTienBaoHiem").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldSoTienBaoHiem', false);
                else
                    hideColumn('.fieldSoTienBaoHiem', true);
            });

            $(".fieldGiaTriChiuRuiRoRemove").click(function () {
                hideColumn('.fieldGiaTriChiuRuiRo', true);
                $("#ckGiaTriChiuRuiRo").attr('checked', false);
            });
            $("#ckGiaTriChiuRuiRo").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldGiaTriChiuRuiRo', false);
                else
                    hideColumn('.fieldGiaTriChiuRuiRo', true);
            });


            $(".fieldTileBTRemove").click(function () {
                hideColumn('.fieldTileBT', true);
                $("#ckTileBT").attr('checked', false);
            });
            $("#ckTileBT").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldTileBT', false);
                else
                    hideColumn('.fieldTileBT', true);
            });

            $(".fieldDeXuatTinhToanRemove").click(function () {
                hideColumn('.fieldDeXuatTinhToan', true);
                $("#ckDeXuatTinhToan").attr('checked', false);
            });
            $("#ckDeXuatTinhToan").click(function () {
                if ($(this).is(':checked'))
                    hideColumn('.fieldDeXuatTinhToan', false);
                else
                    hideColumn('.fieldDeXuatTinhToan', true);
            });



            //Show column
            $(".imgAdd").bind('click', function (event) {
                $('#popup').css('left', event.pageX + 15);      // <<< use pageX and pageY
                $('#popup').css('top', event.pageY + 15);
                $('#popup').css('display', 'inline');
            });

            $(".header").bind("contextmenu", function (event) {
                event.preventDefault();

                $('#popup').css('left', event.pageX + 15);      // <<< use pageX and pageY
                $('#popup').css('top', event.pageY + 15);
                $('#popup').css('display', 'inline');

            });

            $('#popup').mouseleave(function () {
                $(this).hide();
            });

            loadCombobox();
            setClassColumnEnd();

        });
		
		function loadCombobox()
		{
			$('.cellEdit .input').each(function () {
				var type = $(this).attr("type");
				if (type == "select-one") {
					$(this).val($(this).parent().attr('val'));
				}
			});
			
		}

		function updateFinishText() {

            updateThanhTien();
            
            var val = $('.editRow .active').attr("val");
            var newVal = $('.editRow .active .input').val();
            var type = $('.editRow .active .input').attr("type");
            if (type == "select-one") {
                $('.editRow .active .label').html($('.editRow .active .input option:selected').text());
            } else {
                if (val != newVal)
                    $('.editRow .active .label').html(newVal);
            }


            if (val != newVal)
                $('.editRow .active').parent().addClass('rowChanged');
        }

		
		function hideColumnSummary(flag) {
		    if (flag)   $('.grSummary').hide();
		    else        $('.grSummary').show();
        }
        function hideColumnClaim(flag) {
            if (flag)   $('.grClaim').hide();
            else $('.grClaim').show();
        }
		function hideColumnSupport(flag) {
            if (flag)   $('.grSupport').hide();
            else 		$('.grSupport').show();
        }
		function hideColumnReasonable(flag) {
            if (flag)   $('.grReasonable').hide();
            else 		$('.grReasonable').show();
        }

        function hideColumn(obj, flag) {
            if (flag) $(obj).hide();
            else $(obj).show();
        }

        function setClassColumnEnd() {
            $('#gvLoaiHangMucDetails').find('tbody').each(function () {

                if (!$(this).hasClass('group_category')) {

                    $(this).find('tr').each(function () {

                        if (!$(this).hasClass('header')) {

                            $($(this).children()[23]).addClass('grSummary');
        

                        }
                    });

                };

            });
        }

        function updateThanhTien() {
            $('.rowChanged').each(function () {
                var idSumDetail = $(this).attr("id_SummaryDetail");

                var soLuongC = 0;
                var donGiaC = 0;
                var soLuongH = 0;
                var donGiaH = 0;
                $(this).find('td').each(function () {


                    var key = $(this).attr("key");

                    if (key == "SoLuongC")  soLuongC = $(this).find(".input").val();
                    if (key == "DonGiaC")   donGiaC = $(this).find(".input").val();


                    if (key == "ThanhTienC") {
                        $(this).find(".label").html((soLuongC * donGiaC).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                        $(this).find(".input").val(soLuongC * donGiaC);
                    }

                    if (key == "SoLuongH")  soLuongH = $(this).find(".input").val();
                    if (key == "DonGiaH")   donGiaH = $(this).find(".input").val();


                    if (key == "ThanhTienH") {
                        $(this).find(".label").html((soLuongH * donGiaH).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                        $(this).find(".input").val(soLuongH * donGiaH);
                    }

                });


            });
        }

		
		///////////////////////////
		///updateAllField
		///////////////////////////
		function updateAllField()
		{
			updateFinishText();
			//alert("updateAllField");
			var win = $.messager.progress({
							title: 'Please waiting',
							msg: 'Loading data...'
						});

			var count = 0;
			var countRowChanged = $('.rowChanged').length;
			if (countRowChanged <= 0) {
			    $.messager.progress('close');
			    return;    
			}
			    
            
			var dataSent = "";

			$('.rowChanged').each(function () {
				var idSumDetail = $(this).attr("id_SummaryDetail");
				var str = "id:" + idSumDetail + "; ";
				$(this).find('td').each(function () {

					//alert($(this).index());
					if($(this).hasClass('cellEdit'))
					{
						var key = $(this).attr("key");
						var val = $(this).find(".input").val();
						
						str = str + key + ":" + val + "; ";
		            }

                });

				
				str = str.substring(0, str.length - 2);

				dataSent = dataSent + str + "~";

            });



            dataSent = dataSent.substring(0, dataSent.length - 1);
            var datajson = {
                str:dataSent
            }

            datajson = JSON.stringify(datajson);
            //alert(datajson);

			$.ajax({
					type: 'POST',
					url: document.URL + '/UpdateAllFieldSummaryDetail',
					data: datajson,
					contentType: 'application/json; charset=utf-8',
					dataType: 'json',
					success: function (r) {
					    $.messager.progress('close');
					    if (r.d == true) {
					        window.location.replace(document.URL);
					    }
					    else {
					        $.messager.show({
					            title: 'Error',
					            msg: 'Update row false!',
					            showType: 'slide'
					        });
					    }
					}
				});
			
			//window.location.replace(document.URL);
		}

		function exportExcell() {

		    $('.gridtable .input').remove();
		    $('.imgRemove').remove();
		    $('.imgAdd').remove();

		    tableToExcel('gvLoaiHangMucDetails', 'Claim Summary');

		    setTimeout(function () {
		        location.reload();
		    }, 2000);
		    
		}


    </script>

    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .header
    {      
         color:White;
         background:#060;
         text-align:center;
         vertical-align:top;
         font-weight: bold;  

    }
	
	.navbuttonouter {
		color: #444;
		cursor: pointer;
		font-size: 11px;
		font-weight: bold;
		line-height: 27px;
		text-align: center;
		border: 1px solid #CDCDCD;
		border-radius: 5px;
	}
	
	#popup {
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        background: none repeat scroll 0% 0% #FFF;
        border: 1px solid #CCC;
        position: absolute;
        display:none;
        top: 0px;
    }
    
    .rowEdit
    {
        cursor:pointer;
    }
    
    .rowChanged
    {
        background: none repeat scroll 0% 0% rgba(255, 202, 202, 0.47);
    }
    
    .active
    {
        background:#FFF;
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
    
    .tDnD_whileDrag {
        background-color: #DCDCDC;
    }
    
    
    .imgRemove , .imgAdd
    {
        cursor:pointer;
    }
    
    
    .cellEdit .label
    {   
        display:table-cell;
    }
    .cellEdit .input
    {   
        display:none;
    }
    
    .active .label
    {   
        display:none;
    }
    .active .input
    {   
        display:table-cell;
        margin:-5px;
        border-radius:0px;
        width:100%;
        height:100%;
        border:none;
        padding:5px 5px;
    }
    
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:5px; margin-bottom:50px;">
        <div style="text-align:center">
            <h3 style="margin:0px; padding:0px;">CLAIM & ADJUSTMENT SUMMARY WORKSHEET</h3>
            <h4 style="margin:0px; padding:0 0 20px 0px;"><i>(BẢNG TỔNG HỢP THIỆT HẠI VÀ ĐỀ XUẤT BỒI THƯỜNG)</i></h4>
         </div>

        <asp:GridView ID="gvLoaiHangMucDetails" runat="server" CssClass="gridtable"
             AutoGenerateColumns="False" ShowFooter="false" ShowHeader="False" 
             OnRowDataBound="gvgvLoaiHangMucDetails_OnRowDataBound" 
             onrowcreated="gvLoaiHangMucDetails_RowCreated" >
            <Columns>
                <asp:TemplateField >
                    <ItemTemplate >
                        <div style="text-align:center">
                            <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                            <asp:Label ID="lblLoaiHangMucID" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiHangMuc") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-Width="250" ItemStyle-Width="250" >
                    <ItemTemplate >
                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoaiHangMuc") %></b></span>
                    </ItemTemplate>
                    <FooterTemplate >
                        <span><b>GRAND TOTAL (TỔNG CỘNG):</b></span>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="" />
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="fieldUnit" />
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="fieldCur" />
                <asp:TemplateField HeaderStyle-Width="120" ItemStyle-Width="120"  ItemStyle-CssClass="grClaim" >
                    <ItemTemplate >
                        <asp:Label ID="lblSoLuongC" runat="server" Text='' Font-Bold="false" ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grClaim"/>
                <asp:TemplateField HeaderStyle-Width="120" ItemStyle-Width="120"  ItemStyle-CssClass="grClaim" >
                    <ItemTemplate>
                        <asp:Label ID="lblThanhTienC" runat="server" Text='' Font-Bold="true" ></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="grSupport"/>
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="grReasonable"/>
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="grReasonable"/>
                <asp:BoundField HeaderStyle-Width="100" ItemStyle-Width="100" ItemStyle-CssClass="grReasonable"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="fieldGiaTriQuyDoi"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="fieldSoTienBaoHiem"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="fieldGiaTriChiuRuiRo"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="fieldTileBT"/>
                <asp:BoundField HeaderStyle-Width="120" ItemStyle-Width="120" ItemStyle-CssClass="fieldDeXuatTinhToan"/>

                <asp:TemplateField>
                    <ItemTemplate>
                    <tbody class="group_category" id_loaihangmuc="<%#DataBinder.Eval(Container.DataItem, "ID_LoaiHangMuc") %>" >
                        <asp:Repeater ID="repeaterChild" runat="server" OnItemDataBound="repeaterChild_OnItemDataBound" >
                            <ItemTemplate>
                                <tr class="rowEdit" id_SummaryDetail="<%# Eval("ID_Summary_Detail") %>">
                                    <td align="center"><%# Container.ItemIndex + 1 %></td>
                                    <td class="cellEdit" key="TenHangMuc" val="<%# Eval("TenHangMuc") %>" align="left"><label class="label"> <%# Eval("TenHangMuc") %> </label><input class="input" type="text" value="<%# Eval("TenHangMuc") %>" /></td>
                                    <td class="cellEdit " key="SoLuong" val="<%# Eval("SoLuong") %>" align="right"><label class="label"> <%# Eval("SoLuong", "{0:#,##0.0}")%></label><input class="input" type="text" value="<%# Eval("SoLuong") %>" /></td>
                                    <td class="cellEdit fieldUnit" key="ID_DonViTinh" val="<%# Eval("ID_DonViTinh") %>" align="center"><label class="label"> <%# Eval("TenDonVi") %></label><asp:DropDownList ID="ddlDonVi"  CssClass="input" runat="server" /></td>
                                    <td class="cellEdit fieldCur" key="ID_MenhGia" val="<%# Eval("ID_MenhGia") %>" align="center"><label class="label"> <%# Eval("MenhGia") %></label><asp:DropDownList ID="ddlMenhGia"  CssClass="input" runat="server"  /></td>
                                    <td align="right" class="cellEdit grClaim"" key="SoLuongC" val="<%# Eval("SoLuongC") %>" ><label class="label"> <%# Eval("SoLuongC", "{0:#,##0.0}")%></label><input class="input" type="text" value="<%# Eval("SoLuongC") %>" /></td>
                                    <td align="right" class="cellEdit grClaim"" key="DonGiaC" val="<%# Eval("DonGiaC") %>" ><label class="label"> <%# Eval("DonGiaC", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("DonGiaC") %>" /></td>
                                    <td align="right" class="cellEdit grClaim" key="ThanhTienC" val="<%# Eval("ThanhTienC") %>" onclick="return false;" ><label class="label"> <%# Eval("ThanhTienC", "{0:#,##0.0}")%></label><input class="input" type="text" value="<%# Eval("ThanhTienC") %>" /></td>
                                    <td class="cellEdit grSupport" key="NoSS" val="<%# Eval("NoSS") %>" ><label class="label"> <%# Eval("NoSS", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("NoSS") %>" /></td>
                                    <td class="cellEdit grSupport" key="OrgHS" val="<%# Eval("OrgHS") %>" ><label class="label"> <%# Eval("OrgHS", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("OrgHS") %>" /></td>
                                    <td class="cellEdit grSupport" key="OrgNguyenGia" val="<%# Eval("OrgNguyenGia") %>"><label class="label"> <%# Eval("OrgNguyenGia", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("OrgNguyenGia") %>" /></td>
                                    <td class="cellEdit grSupport" key="TimeBatDau" val="<%# Eval("TimeBatDau") %>"><label class="label"> <%# Eval("TimeBatDau","{0:#,##0}") %></label><input class="input" type="text" value="<%# Eval("TimeBatDau") %>" /></td>
                                    <td class="cellEdit grSupport" key="TimeSuDung" val="<%# Eval("TimeSuDung") %>"><label class="label"> <%# Eval("TimeSuDung","{0:#,##0}") %></label><input class="input" type="text" value="<%# Eval("TimeSuDung") %>" /></td>
                                    <td class="cellEdit grSupport" key="ChungTuThayThe" val="<%# Eval("ChungTuThayThe") %>" ><label class="label"> <%# Eval("ChungTuThayThe", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("ChungTuThayThe") %>" /></td>
                                    <td class="cellEdit grSupport" key="DonGiaMoi" val="<%# Eval("DonGiaMoi") %>"><label class="label"> <%# Eval("DonGiaMoi", "{0:#,##0}") %></label><input class="input" type="text" value="<%# Eval("DonGiaMoi") %>" /></td>
                                    <td align="right" class="cellEdit grReasonable" key="SoLuongH" val="<%# Eval("SoLuongH") %>"><label class="label"> <%# Eval("SoLuongH", "{0:#,##0.0}")%></label><input class="input" type="text" value="<%# Eval("SoLuongH") %>" /></td>
                                    <td align="right" class="cellEdit grReasonable" key="DonGiaH" val="<%# Eval("DonGiaH") %>"><label class="label"> <%# Eval("DonGiaH", "{0:#,##0}") %></label><input class="input" type="text" value="<%# Eval("DonGiaH") %>" /></td>
                                    <td align="right" class="cellEdit grReasonable" key="ThanhTienH" val="<%# Eval("ThanhTienH") %>"><label class="label"> <%# Eval("ThanhTienH", "{0:#,##0.0}")%></label><input class="input" type="text" value="<%# Eval("ThanhTienH") %>" /></td>
                                    <td class="cellEdit fieldGiaTriQuyDoi" key="QuiDoi" val="<%# Eval("QuiDoi") %>" ><label class="label"> <%# Eval("QuiDoi", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("QuiDoi") %>" /></td>
                                    <td class="cellEdit fieldSoTienBaoHiem" key="SumInsured" valign="<%# Eval("SumInsured") %>" ><label class="label"> <%# Eval("SumInsured", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("SumInsured") %>" /></td>
                                    <td class="cellEdit fieldGiaTriChiuRuiRo" key="GiaTriChiuRuiRo" val="<%# Eval("GiaTriChiuRuiRo") %>"><label class="label"> <%# Eval("GiaTriChiuRuiRo", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("GiaTriChiuRuiRo") %>" /></td>
                                    <td class="cellEdit fieldTileBT" key="TyLeBoiThuong" val="<%# Eval("TyLeBoiThuong") %>"><label class="label"> <%# Eval("TyLeBoiThuong", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("TyLeBoiThuong") %>" /></td>
                                    <td class="cellEdit fieldDeXuatTinhToan" key="DeXuatTinhToan" val="<%# Eval("DeXuatTinhToan") %>"><label class="label"> <%# Eval("DeXuatTinhToan", "{0:#,##0}")%></label><input class="input" type="text" value="<%# Eval("DeXuatTinhToan") %>" /></td>
                                    <td class="cellEdit grSummary"  key="GhiChu" val="<%# Eval("GhiChu") %>" align="left"><label class="label"> <%# Eval("GhiChu") %></label><input class="input" type="text" value="<%# Eval("GhiChu") %>" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    <tbody>                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

	<div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
        <input type="button"  class="btn" onclick="location.reload();" value="Reload" />
        <input type="button"  class="btn" onclick="exportExcell();" value="Export Excel" />
        <input type="button"  class="btn" onclick="updateAllField();" value="Save Change" />

    </div>
	
	
    <div id="popup" style="width:250px; background:#FFF; padding:5px 20px;">
        <p><input id="ckfieldUnit" type="checkbox" checked="checked" >Show Unit</input></p>
        <p><input id="ckfieldCur" type="checkbox" checked="checked" >Show Cur</input></p>
        <p><input id="ckClaim"   type="checkbox" checked="checked" >Show Group Claim</input></p>
        <p><input id="ckSupport" type="checkbox" checked="checked" >Show Group Supporting</input></p>
        <p><input id="ckReasonable" type="checkbox" checked="checked" >Show Group Reasonable </input></p>
        <p><input id="ckGiaTriQuyDoi" type="checkbox" checked="checked" >Gía trị quy đổi </input></p>
        <p><input id="ckSoTienBaoHiem" type="checkbox" checked="checked" >Số tiền Bảo hiểm </input></p>
        <p><input id="ckGiaTriChiuRuiRo" type="checkbox" checked="checked" >Giá trị chịu rủi ro </input></p>
        <p><input id="ckTileBT" type="checkbox" checked="checked" >Tỉ lệ BT </input></p>
        <p><input id="ckDeXuatTinhToan" type="checkbox" checked="checked" >Đề xuất tính toán </input></p>
    </div>
    </form>
</body>
</html>