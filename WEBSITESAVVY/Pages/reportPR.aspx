<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="reportPR.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportPR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>report PR</title>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>

    <script type="text/javascript" src="../js/jquery-1.4.min.js"></script>

    <script type="text/javascript" src="../tinymce/tinymce.min.js"></script>

    <script type="text/javascript">
        
        function cancel(obj)
        {
            var key = $(obj).attr("key");
            $("#lbl" + key).show();
            $("#panel" + key).hide();
        };

        function editField(obj) {
            var key = $(obj).attr("key");

            <%  if(isLock)  Response.Write("return;");    %>

            $("#lbl" + key).hide();
            $("#panel" + key).show();

            window.location.href = "#" + key;

            tinymce.init({
                selector: "#txt" + key,
                plugins: [
                        "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                        "table contextmenu directionality emoticons textcolor paste fullpage textcolor colorpicker textpattern example"
                ],

                toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
                toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent | undo redo | image media code preview | forecolor backcolor | print fullscreen |",
                toolbar3: "",

                menubar: false,
                toolbar_items_size: 'small',

                image_advtab: true,


            });
        }

    </script>




    <style type="text/css">
        @page :first {
              margin: 5mm 7.5mm 0 15mm;   
        }
        @page {
              size: A4 portrait;
              margin: 7mm 7.5mm 0 15mm;
        }
        
        body
        {
            width:900px;
            margin:0px auto;
            font-size:19px;
            background:#FFF;
            line-height:1.5;
            font-family:Times New Roman;
        }
        
        .page
        {
            background: #fff;
            width: 100%;
            /*height: 1490px;*/
            page-break-after: always;
        }
        
        .body
        {
            background:FFF;
            width: 888px;
        }
        
        .footer
        {
            background:#fff;
            width:100%;
        }
        
        .tool_bottom
        {
	        padding:5px; position: fixed; bottom: 0px; left: 0px; background:#EAEAEA; width:100%; border-top:1px solid #DDD; text-align:center;
        }
        
        h1, h2, h3, h4
        {
            padding:0px;
            margin:0px 0px;
        }
        
        table
        {
            border: 0px;
        }
        
        table td 
        {
            vertical-align:top;
        }
        
        p {
            margin:0px 0px 10px;
            padding:0px;   
        }

        .align-left
        {
            text-align:left!important;
            margin-left: 5px;
        }
        
        .align-left p
        {
            text-align:left!important;
        }
        
        .align-right
        {
            text-align:right;
            margin-left: 5px;
        }
        
        .bg_text
        {
            /*background:#f0f0f0;*/
            font-weight:bold;
            font-size:20px;
            padding:0px 5px;
        }
        
        .align-center
        {
            text-align:center;
        }
        
        .title_2
        {
            /*text-decoration:underline; */
            font-style:italic;
            margin-top:15px;
        }
        
        
        .field_input
        {
            /*border-left: 1.5px solid #FFFFFF;
            border-right: 1.5px solid #FFFFFF;
            border-top: 1.5px solid #FFFFFF;
            border-bottom: 1.5px solid #DCDCDC;
           
            color: #000080;
            
            margin-top: 1px;
            margin-bottom: 2px;
            margin-left: 82px;*/
        }
        
        .hr
        {
            height: 1px;
            background: none repeat scroll 0% 0% #008000;
            margin-bottom: 10px;
        }
        
        .gridview
        {
            width: 100%;
            border: 1px solid #CDCDCD;
            border-collapse: collapse;
        }
    
        .gridview  td 
        {
            border: 1px solid #CDCDCD;
            padding: 7px 5px 2px 5px;
            height: 25px;
            /*color: #004033;*/
            vertical-align:top;
        }
        
        .dislay-block
        {
            display:block ! important;
        }
       
        .box
        {
            margin:10px 5px 20px 0;
        }
      
        .box *
        {
            font-size:19px!important;
        }  
        
        .box h3
        {
            font-size:22px!important;
            margin:10px 0px 15px 0px;
        }  
      
        
    </style>

    <style type="text/css">
        .hiden
        {
            display:none ;
        }
        .panelUpdate *
        {
            font-size:14px !important;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div id="page1" >
            <div id="body1" class="body">
                <div id="header">
                    <div style="height:30px"></div>
                   <%-- <div><img src="<%= Request.Url.GetLeftPart(UriPartial.Authority) +"/images/banner.jpg" %>" width="637px" height="125px" alt="" /><br /></div>
            
                    <div>--%>
                     <div style="float:left; width:65%; clear:both;"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            
                    <div>
                        <asp:Label ID="lblNgayMoPR" runat="server" Text="Ngày 5/3/2014."
                              CssClass="title_2" Width="581px" 
                            Font-Size="18px" ></asp:Label>
                    </div>
                    <div style="text-align:left;  margin-bottom:15px">
                        <table style="width:100%">
                            <tr valign="middle">
                                <td style="text-align:left; "><i><u>Tham chiếu KH:</u> <asp:Label 
                                        ID="lblRefKH" runat="server" 
                                    Width="279px"  CssClass="field_input" ></asp:Label> </i>
                                </td>
                                <td class="align-left" style="color:#006600;"><i><u>Tham chiếu Savvy:</u> </i><asp:Label ID="lblTenClaim" runat="server" 
                                    Text="SR01+ CL.TENCLAIM" Width="275px" 
                                    ForeColor="#006600" Font-Bold=True CssClass="field_input" ></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                    <div>
                        <h3><asp:Label ID="lblTenNhaBH" runat="server" 
                            Text="TEN NHÀ BẢO HIỂM" Width="800px" 
                            CssClass="field_input" Font-Bold="True" ></asp:Label></h3>
                        <h3><asp:Label ID="lblTenDonVi" runat="server" 
                                    Text="TEN DON VI" Width="800px" 
                                    CssClass="field_input" Font-Bold="True" ></asp:Label></h3>
                        <div style="font:20px; margin-bottom:10px" ><i>
                            <u><asp:Label  runat="server" >Địa chỉ</asp:Label>:</u>
                            <asp:Label ID="lblDiaChiNBH" runat="server" Width="800px"  ></asp:Label></i>
                        </div>

                        <table width="100%" >
                            <tr>
                                <td style="width:200px"><b><u>Kính gửi:</u></b></td>
                                <td >
                                    <asp:Label ID="lblKinhGui" runat="server" Width="760px" 
                                        CssClass="field_input" Font-Bold=True Font-Size="20px" ></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

                <div id="content">
                    


                    <table width="750px" cellspacing="10px" >

                        <tr>
                            <td colspan="3" style="text-align:center; "  >
                                <div class="bg_text" style="margin:3px 5px">
                                    <h2 style="padding-top:10px; padding-bottom:5px; margin:0"  >BÁO CÁO GIÁM ĐỊNH SƠ BỘ<br /></h2>
                                    
                                    <asp:Label ID="lblBrief" runat="server" Width="90%" 
                                        ForeColor="#006600" Font-Bold=True CssClass="field_input" 
                                        Font-Italic="True" ></asp:Label>
                                    
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label  runat="server" 
                                    Text="BÁO CÁO TRƯỚC" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDateILA" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label  runat="server" 
                                    Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPolicyNo" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="20px" ></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label7"  runat="server" 
                                    Text="TÊN VÀ ĐỊA CHỈ <br/> NGƯỜI ĐƯỢC BẢO HIỂM" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td  >
                                <asp:Label ID="lblTenKH" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" Font-Size="20px" ></asp:Label><br />
                                <asp:Label ID="lblDiaChiKH" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label><br />
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label  runat="server" 
                                    Text="LĨNH VỰC KINH DOANH" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label9"  runat="server" 
                                    Text="ĐỊA ĐIỂM TỔN THẤT" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPremises" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label11"  runat="server" 
                                    Text="NGÀY GIỜ TỔN THẤT" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDOL" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label13"  runat="server" 
                                    Text="NGUYÊN NHÂN" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblSortCause" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label15"  runat="server" 
                                    Text="PHẠM VI TỔN THẤT" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPhamViTonThat" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label17"  runat="server" 
                                    Text="QUY TẮC VÀ TÓM LƯỢC<BR/>HỢP ĐỒNG BẢO HIỂM" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblNamPolicy" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label><br />

                                <table>
                                    <tr>
                                        <td><span><b>1. <u>Tổng số tiền bảo hiểm:</u></b></span></td>
                                        <td><asp:Label ID="lblSumInSured" runat="server" Width="354px"  Font-Bold=False ></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span><b>2. <u>Thời hạn bảo hiểm:</u></b></span> </td>
                                        <td><asp:Label ID="lblEffective" runat="server"  Width="354px" Font-Bold=False ></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span><b>3. <u>Mức miễn thường:</u></b></span> </td>
                                        <td><asp:Label ID="lblMucMienThuong" runat="server" Width="354px" Font-Bold=False ></asp:Label></td>
                                    </tr>
                                </table>

                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label19"  runat="server" 
                                    Text="ĐIỀU KHOẢN BỔ SUNG" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDKBX" runat="server" Width="570px" 
                                    CssClass="align-left" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label21"  runat="server" 
                                    Text="KHIẾU NẠI CỦA NĐBH" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblKhieuNai" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td class="bg_text">
                                <asp:Label ID="Label23"  runat="server" 
                                    Text="DỰ PHÒNG BỒI THƯỜNG" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDuPhongBoiThuong" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" Font-Size="22px" ></asp:Label>
                            </td>
                        </tr>


                    </table>

                </div>
            
            </div>
            <div style="clear:both; page-break-after: always;"><br /></div>
        </div>


        <div class="page">
            <div class="body">
                <h3 style="text-align:center; font-size:25px!important; color:#006600; margin:20px 0px 0px 0">MỤC LỤC BÁO CÁO</h3>
                <table style="font:22px; cursor:pointer; width:100%;" cellpadding="20px" >
                    <tr><td onclick="window.location.href ='#A1'"><b style="float:left;">I. GIỚI THIỆU CHUNG</b> 
                        <div style="float:right; text-align:right;" >................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#GioiThieu'"><b style="float:left;">II. NGƯỜI ĐƯỢC BẢO HIỂM </b>
                        <div style="float:right; text-align:right;" >.....................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#C1'"><b style="float:left;">III. DIỄN BIẾN </b>
                        <div style="float:right; text-align:right;" >..............................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#C3'"><b style="float:left;">IV. NGUYÊN NHÂN </b>
                        <div style="float:right; text-align:right;" >......................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#E1'"><b style="float:left;">V. PHẠM VI BẢO HIỂM </b>
                        <div style="float:right; text-align:right;" >...............................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#D1'"><b style="float:left;">VI. PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</b><div style="float:right; text-align:right;" >......................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#G'"><b style="float:left;">VII. ĐƠN BẢO HIỂM KHÁC </b>
                        <div style="float:right; text-align:right;" >........................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#H'"><b style="float:left;">VIII. GIÁ TRỊ THU HỒI </b>
                        <div style="float:right; text-align:right;" >................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#I'"><b style="float:left;">IX. DỰ PHÒNG BỒI THƯỜNG </b>
                        <div style="float:right; text-align:right;" >...................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#TT'"><b style="float:left;">X. BÁO CÁO TIẾP THEO </b>
                        <div style="float:right; text-align:right;" >............................................................................................................................</div></td></tr>
                </table>


            </div>
        </div>




        <div class="box" >
            <h3 id="A1" key="A1" title="Giới Thiệu Chung" onclick="parent.updateField(this);">I. GIỚI THIỆU CHUNG</h3>
            <div >
                <asp:Label ID="lblA1" key="A1" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelA1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtA1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateA1" key="A1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelA1" key="A1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="GioiThieu" key="GioiThieu" title="Người Được Bảo Hiểm" onclick="parent.updateField(this);">II. NGƯỜI ĐƯỢC BẢO HIỂM</h3>
            <div key="GioiThieu" >
                <asp:Label ID="lblGioiThieu" key="GioiThieu" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGioiThieu" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGioiThieu" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateGioiThieu" key="GioiThieu" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelGioiThieu" key="GioiThieu" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="C1" key="DienBienTonThat" title="Diễn Biến" onclick="parent.updateField(this);">III. DIỄN BIẾN</h3>
            <div>
                <asp:Label ID="lblDienBienTonThat" key="DienBienTonThat" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelDienBienTonThat" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtDienBienTonThat" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateC1" key="DienBienTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelC1" key="DienBienTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="C3" key="C3" title="Nguyên Nhân" onclick="parent.updateField(this);">IV. NGUYÊN NHÂN</h3>
            <div>
                <asp:Label ID="lblC3" key="C3" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelC3" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtC3" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="C3" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="C3" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="E1" key="E1" title="Phạm Vi Bảo Hiểm" onclick="parent.updateField(this);">V. PHẠM VI BẢO HIỂM</h3>
            <div>
                <asp:Label ID="lblE1" key="E1" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelE1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtE1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="E1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="E1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="D1" key="D1" title="Phạm Vi Và Mức Độ Thiệt Hại" onclick="parent.updateField(this);">VI. PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</h3>
            <div>
                <asp:Label ID="lblD1" key="D1" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelD1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtD1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button   key="D1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="D1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="G" key="G" title="Đơn Bảo Hiểm Khác" onclick="parent.updateField(this);">VII. ĐƠN BẢO HIỂM KHÁC</h3>
            <div>
                <asp:Label ID="lblG" key="G" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelG" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtG" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button   key="G" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="G" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="H" key="H" title="Giá Trị Thu Hồi" onclick="parent.updateField(this);">VIII. GIÁ TRỊ THU HỒI</h3>
            <div>
                <asp:Label ID="lblH" key="H" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelH" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtH"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="H" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="H" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="I" key="I" title="Dự Phòng Bồi Thường" onclick="parent.updateField(this);">IX. DỰ PHÒNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblI" key="I" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelI" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtI"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="I" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="I" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="TamUngBoiThuongText" key="TamUngBoiThuongText" title="Tạm Ứng Bồi Thường" onclick="parent.updateField(this);">X. TẠM ỨNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoiThuongText" key="TamUngBoiThuongText" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoiThuongText" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoiThuongText"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="TamUngBoiThuongText" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="TamUngBoiThuongText" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="TT" key="TT" title="Báo Cáo Tiếp Theo" onclick="parent.updateField(this);" >XI. BÁO CÁO TIẾP THEO</h3>
            <div style="text-align: justify"><%--<asp:Label ID="lblTT" runat="server" Width="100%" ></asp:Label>--%>
            <p>  Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và sẽ định kỳ báo cáo để Nhà Bảo Hiểm nắm rõ.</p><p>  Nếu Quý Công ty Bảo hiểm có bất kỳ câu hỏi hoặc yêu cầu nào khác liên quan đến công tác giám định vụ tổn thất này, xin vui lòng liên lạc với chúng tôi để được hỗ trợ tốt nhất.</p></div>
        </div>

         <table width="100%">
                    <tr>
                        <td width="40%" style="padding-left: 10px">
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Người báo cáo"></asp:Label>
                            <br />
                            <asp:Label ID="Label34" runat="server" Font-Italic="True" Text="Prepared by"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="center" width="40%">
                            <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Phê duyệt bởi"></asp:Label>
                            <br />
                            <asp:Label ID="Label37" runat="server" Font-Italic="True" 
                                Text="Checked &amp; Approved  by"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%" style="padding-left: 10px">
                            <asp:Label ID="lblNguoiBaoCao" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="center" width="40%">
                            <asp:Label ID="lblNguoiCheckBC" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="40%" style="padding-left: 10px">
                            <br />
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="center" width="40%">
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 10px; font-style: italic; padding-left: 10px;" 
                            width="40%">
                            <asp:Label ID="Label38" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td style="font-size: 10px; text-align: center; font-style: italic">
                            &nbsp;</td>
                        <td align="center" 
                            style="font-size: 10px; text-align: center; font-style: italic" width="40%">
                            <asp:Label ID="Label39" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" 
                            style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            width="40%">
                            <asp:Label ID="Label40" runat="server" Text="(Chức vụ (Job Title):"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucVuNguoiBC" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td class="style2" style="font-size: 11px; color: #000066; font-style: italic">
                        </td>
                        <td class="style2" align="center" 
                            style="font-size: 12px; color: #000066; font-style: italic" width="40%">
                            <asp:Label ID="Label41" runat="server" Text="(Chức vụ (Job Title):"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucvuNguoiCheck" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                    </tr>
                    </table>
    <script language="javascript">
        function printPDF() {
            $('.tool_bottom').css("display", "none");
            window.print();
            $('.tool_bottom').css("display", "inherit");
        }
    </script>
    <div id="tool_bottom" runat="server" class="tool_bottom" >
        <button class="btn" onclick="printPDF();" >Export to PDF</button>&nbsp;&nbsp;&nbsp;  &nbsp
        <button class="btn" onclick="window.open('../Pages/reportPR_word.aspx','_blank');">Export To Word</button>&nbsp;&nbsp;&nbsp;  &nbsp
        <asp:Button class="btn" ID="btnPreparePR" runat="server" Text="Preparer" 
            onclick="btnPreparePR_Click"  />  
            &nbsp;&nbsp;&nbsp;  &nbsp
        <asp:Button class="btn" ID="btnCheckPR" runat="server" Text="Checker" onclick="btnCheckILA_Click"/>
    </div>
    <div id="w_UpdateField" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:650px;height:490px;padding:0px;"></div>
    <div id="w_UpdateFieldSmall" class="easyui-window" title="Update" data-options="modal:false,closed:true,iconCls:'icon-save'" style="width:450px;height:300px;padding:0px;"></div>
  
    <div style="height:40px;"></div>

    </form>
</body>
</html>
