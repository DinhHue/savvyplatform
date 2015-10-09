<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportIR.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportIR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>report IR</title>
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

            <%  if(!showEdit)  Response.Write("return;");    %>

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
                    <div style="float:left; width:65%; clear:both;"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            
                    <div>
                        <asp:Label ID="lblNgayMoPR" runat="server" Text="Ngày 5/3/2014."
                              CssClass="title_2" Width="581px" 
                            Font-Size="18px" ></asp:Label>
                    </div>
                    <div style="text-align:center; margin-bottom:15px">
                        <table style="width:100%">
                            <tr valign="middle">
                                <td class="align-left" style="width:50%"><i><u>Tham chiếu KH:</u> <asp:Label 
                                        ID="lblRefKH" runat="server" 
                                    Width="279px"  CssClass="field_input" ></asp:Label></i>

                                
                                    </i></td>
                                <td class="align-left" style="color:#006600;"><i><u>Tham chiếu Savvy:</u> </i>
                                    <asp:Label ID="lblTenClaim" runat="server" 
                                    Text="IR_+ CL.TENCLAIM" Width="275px" 
                                    ForeColor="#006600" Font-Bold=True CssClass="field_input" ></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                    <div>
                        <h3 style="display:none;"><asp:Label ID="lblTenNhaBH" runat="server" 
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
                                    <h2 style="padding-top:10px; padding-bottom:5px; margin:0"  >BÁO CÁO TIẾP THEO <br /></h2>
                                    
                                    <asp:Label ID="lblBrief" runat="server" Width="90%" 
                                        ForeColor="#006600" Font-Bold=True CssClass="field_input" 
                                        Font-Italic="True" ></asp:Label>
                                    
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label  runat="server" 
                                    Text="BÁO CÁO TRƯỚC" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                               
                                    <asp:Label ID="lblILADATE" runat="server" Width="570px"
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                                    <br />
                              
                                    <asp:Label ID="lblPRDARE" runat="server" Width="570px"
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                                </td>
                        </tr>

                        <tr>
                            <td >
                                <asp:Label  runat="server" 
                                    Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                    Width="260px" CssClass="bg_text" ></asp:Label>
                            </td>
                            <td>::</td>
                            <td >
                                <asp:Label ID="lblPolicyNo" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="20px" ></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td >
                                <asp:Label ID="Label7"  runat="server" 
                                    Text="TÊN VÀ ĐỊA CHỈ <br/> NGƯỜI ĐƯỢC BẢO HIỂM" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
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
                            <td>
                                <asp:Label  runat="server" 
                                    Text="LĨNH VỰC KINH DOANH" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label9"  runat="server" 
                                    Text="ĐỊA ĐIỂM TỔN THẤT" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPremises" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label11"  runat="server" 
                                    Text="NGÀY GIỜ TỔN THẤT" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDOL" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label13"  runat="server" 
                                    Text="NGUYÊN NHÂN" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblSortCause" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label15"  runat="server" 
                                    Text="PHẠM VI TỔN THẤT" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPhamViTonThat" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td >
                                <asp:Label ID="Label17"  runat="server" 
                                    Text="QUY TẮC VÀ TÓM LƯỢC<BR/>HỢP ĐỒNG BẢO HIỂM" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
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
                                        <td><span><b>3. <u>Mức miễn thưởng:</u></b></span> </td>
                                        <td><asp:Label ID="lblMucMienThuong" runat="server" Width="354px" Font-Bold=False ></asp:Label></td>
                                    </tr>
                                </table>


                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label19"  runat="server" 
                                    Text="ĐIỀU KHOẢN BỔ XUNG" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDKBX" runat="server" Width="570px" 
                                    CssClass="align-left" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label21"  runat="server" 
                                    Text="KHIẾU NẠI CỦA NĐBH" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblKhieuNai" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <asp:Label ID="Label23"  runat="server" 
                                    Text="DỰ PHÒNG BỒI THƯỜNG" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDuPhongBoiThuong" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="true" Font-Size="22px" ></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label   runat="server" 
                                    Text="TẠM ỨNG BỒI THƯỜNG <br/> (ĐỀ XUẤT)" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTamUngBoiThuong" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="22px" ></asp:Label>
                            </td>
                        </tr>


                    </table>

                </div>
            
            </div>
            <div style="clear:both; page-break-after: always;"><br /></div>
             <!--<div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>    -->
        </div>


        <div class="page">
             <div class="body">

                <table width="100%" style="display:none">
                    <tr>
                        <td style="width:80%; height:90px" >
                            <div style="padding-top:15px;">
                                <asp:Label ID="Label18" runat="server" 
                                 Text="Tham chiếu <i>(Savvy’s Ref.) </i> :" 
                                 Width="239px" 
                                 ForeColor="#006600" Font-Bold="True" Font-Size="20px" ></asp:Label>

                                 <asp:Label ID="lblTenClaim1" runat="server" 
                                    Text="PR_1413BMSG-TP-PAR (SR01+ CL.TENCLAIM)" Width="509px" 
                                    ForeColor="#006600" Font-Bold="True" Font-Size="20px" ></asp:Label>
                            </div>
                            <div style="padding-top:5px;">
                                
                                <asp:Label runat="server"  
                                 ForeColor="#006600" Font-Bold="True" Font-Size="20px" ID="lblBrief1" ></asp:Label>
                            </div>
                            
                        </td>
                        <td><img src="../images/logo.png" height="90px"></td>
                    </tr>
                </table>
                <div class="hr"></div>

                <h3 style="text-align:center; font-size:25px!important; color:#006600; margin:20px 0px 0px 0">MỤC LỤC BÁO CÁO</h3>
                                <table style="cursor:pointer" cellpadding="20px" width="100%" >
                    <tr><td onclick="window.location.href ='#ExecutiveSummaryIR'"><b style="float:left;">I. KHÁI QUÁT VỤ VIỆC VÀ TIẾN TRÌNH </b>
                        <div style="float:right; text-align:right;" >.................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#K'"><b style="float:left;">II. QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI </b>
                        <div style="float:right; text-align:right;" >......................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#AdjustmentIR'"><b style="float:left;">III. CẬP NHẬT TIẾN ĐỘ TÍNH TOÁN </b>
                        <div style="float:right; text-align:right;" >.......................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#H'"><b style="float:left;">IV. GIÁ TRỊ THU HỒI </b>
                        <div style="float:right; text-align:right;" >..................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#I'"><b style="float:left;">V. CẬP NHẬT DỰ PHÒNG </b>
                        <div style="float:right; text-align:right;" >..........................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#TamUngBoiThuongText'"><b style="float:left;">VI. TẠM ỨNG BỒI THƯỜNG </b>
                        <div style="float:right; text-align:right;" >......................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#TT'"><b style="float:left;">VII. BÁO CÁO TIẾP THEO </b>
                        <div style="float:right; text-align:right;" >.........................................................................................................................</div></td></tr>

                </table>


            </div>
            <!--<div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>-->
        </div>




        <div class="box" >
            <h3 id="ExecutiveSummaryIR" key="ExecutiveSummaryIR" title="Executive Summary" onclick="parent.updateField(this);">I. KHÁI QUÁT VỤ VIỆC VÀ TIẾN TRÌNH</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryIR"  key="ExecutiveSummaryIR" onclick="editField(this)"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelExecutiveSummaryIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtExecutiveSummaryIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="ExecutiveSummaryIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input ikey="ExecutiveSummaryIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="K" key="K" title="Claim Handling TimeLine" onclick="parent.updateField(this);">II. QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI</h3>
            <div>
                <asp:Label ID="lblK" key="K" onclick="editField(this)"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelK" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtK" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="K" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="K" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        <div class="box" >
            <h3 id="AdjustmentIR" key="AdjustmentIR" title="Outline of Claim Adjustment" onclick="parent.updateField(this);">III. CẬP NHẬT TIẾN ĐỘ TÍNH TOÁN</h3>
            <div>
                <asp:Label ID="lblAdjustmentIR" key="AdjustmentIR" onclick="editField(this)"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelAdjustmentIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtAdjustmentIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="AdjustmentIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="AdjustmentIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
		
		<div class="box" >
            <h3 id="H" key="H" title="Salvage" onclick="parent.updateField(this);">IV. GIÁ TRỊ THU HỒI</h3>
            <div>
                <asp:Label ID="lblH" key="H" onclick="editField(this)"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelH" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtH" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="H" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="H" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="I" key="I" title="Interim Reserve" onclick="parent.updateField(this);">V. CẬP NHẬT DỰ PHÒNG</h3>
            <div>
                <asp:Label ID="lblI" key="I" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelI" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtI" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="I" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="I" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="TamUngBoiThuongText" key="TamUngBoiThuongText" title="Interim Payment" onclick="parent.updateField(this);">VI. TẠM ỨNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoiThuongText" key="TamUngBoiThuongText" onclick="editField(this)" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoiThuongText" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoiThuongText" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="TamUngBoiThuongText" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="TamUngBoiThuongText" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        

        <div class="box" >
            <h3 id="TT">VII. BÁO CÁO TIẾP THEO</h3>
            <div style="text-align: justify"><%--<asp:Label ID="lblTT" runat="server" Width="100%" ></asp:Label>--%>
            <p>Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và cập nhật ngay khi có thông tin mới nhất để phục vụ cho công tác quản lý bồi thường của Nhà Bảo Hiểm.</p>
            <p>Nếu Quý Công ty Bảo hiểm có câu hỏi hoặc bất kỳ yêu cầu nào khác sau khi xem báo cáo này, xin vui lòng thông tin cho chúng tôi để được đáp ứng thỏa đáng.</p>
            </div>
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

    <!--tool bottom-->
    <script language="javascript">
        function printPDF() {
            $('.tool_bottom').css("display", "none");
            window.print();
            $('.tool_bottom').css("display", "inherit");
        }
    </script>
    <div id="tool_bottom" runat="server" class="tool_bottom" >
        <button class="btn" onclick="printPDF();" >Export to PDF</button>
        <button class="btn" onclick="window.open('../Pages/reportIR_word.aspx','_blank');">Export To Word</button>

    </div>
    <div style="height:40px;"></div>
    <!--end tool bottom-->

    </form>
</body>
</html>
