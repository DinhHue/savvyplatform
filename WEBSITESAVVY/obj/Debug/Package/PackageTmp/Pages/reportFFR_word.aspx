<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportFFR_word.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportFFR_word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>report FFR</title>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>

    <script type="text/javascript" src="../js/jquery-1.4.min.js"></script>
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
            width:650px;
            margin:0px auto;
            font-size:16px;
            background:#FFF;
            line-height:1.5;
            font-family:Times New Roman;
        }
        
        .page
        {
            background: #fff;
            width: 650px;
            page-break-after: always;
        }
        
        .body
        {
            background:FFF;
            width: 650px;
        }

        
        h1, h2, h3, h4
        {
            padding:0px;
            margin:0px 0px;
        }
        
        table
        {
            border-style: none;
            border-color: inherit;
            border-width: 0px;
            margin-right: 0px;
        }
        
        table td 
        {
            vertical-align:top;
            margin-left: 80px;
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
            font-size:16px;
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
            width: 650px;
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
            font-size:16px!important;
        }  
        
        .box h3
        {
            font-size:16px!important;
            margin:10px 0px 15px 0px;
        }  
      
        

        
        
    </style>
</head>
<body id="body" runat="server">
    <form id="form1" runat="server">
        <div id="page1" >
            <div id="body1" class="body">
                <div id="header">
                    
                    <img src="<%= Request.Url.GetLeftPart(UriPartial.Authority) +"/images/banner.jpg" %>" style="width:500px;height:100px" alt="" />

                    <div>
                        <asp:Label ID="lblNgayMoPR" runat="server" Text="Ngày 5/3/2014."
                              CssClass="title_2" Width="635px" 
                            Font-Size="15px" ></asp:Label>
                    </div>
                    <div style="text-align:center; margin-bottom:15px">
                        <table style="width:630px; font-size:15px" cellspacing="0px" >
                            <tr valign="middle">
                                <td class="align-left" style="width:300px"><i><u>Tham chiếu KH:</u> 
                                <asp:Label  ID="lblRefKH" runat="server" 
                                    Width="183px" Font-Size="15px" CssClass="field_input" ></asp:Label> </i>

                                
                                    </i></td>
                                <td class="align-left" style="color:#006600;"><i><u>Tham chiếu Savvy:</u> </i>
                                <asp:Label ID="lblTenClaim" runat="server" 
                                    Text="SR01+ CL.TENCLAIM" Width="174px" Font-Size="15px"
                                    ForeColor="#006600" Font-Bold=True CssClass="field_input" ></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                    <div>
                        <h3 style="margin:5px 0px" ><asp:Label ID="lblTenNhaBH" runat="server" 
                            Text="TEN NHÀ BẢO HIỂM" Width="630px" 
                            CssClass="field_input" Font-Bold="True" ></asp:Label></h3>
                        <h3 style="margin:5px 0px 10px 0px" ><asp:Label ID="lblTenDonVi" runat="server" 
                                    Text="TEN DON VI" Width="630px" 
                                    CssClass="field_input" Font-Bold="True" ></asp:Label></h3>
                        <div style="font-size:15px; margin-bottom:10px" ><i>
                            <u><asp:Label ID="Label1"  runat="server" >Địa chỉ</asp:Label>:</u>
                            <asp:Label ID="lblDiaChiNBH" runat="server" Width="572px"  ></asp:Label></i>
                        </div>

                        <table width="650px" >
                            <tr>
                                <td style="width:200px; font-size:15px;"><b><u>Kính gửi:</u></b></td>
                                <td >
                                    <asp:Label ID="lblKinhGui" runat="server" Width="556px" 
                                        CssClass="field_input" Font-Bold=True Font-Size="15px" ></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

                <div id="content">
                    


                    <table width="600px" cellspacing="5px" >

                        <tr style="vertical-align:top; font-size:16px;">
                            <td colspan="3" style="text-align:center; "   >
                                <div class="bg_text" style="margin:10px 0px">
                                    <h2 style="margin:5px 0px"  >BÁO CÁO GIÁM ĐỊNH<br /></h2>
                                    
                                    <asp:Label ID="lblBrief" runat="server" Width="600px" 
                                        ForeColor="#006600" Font-Bold=True CssClass="field_input" 
                                        Font-Italic="True" Font-Size="15px" ></asp:Label>
                                    
                                </div>
                            </td>
                        </tr>

                        <tr style="display:none;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label2"  runat="server" 
                                    Text="BÁO CÁO TRƯỚC" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDateILA" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label3"   runat="server" 
                                    Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                    Width="200px" CssClass="bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPolicyNo" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>


                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;" >
                                <asp:Label ID="Label7"  runat="server" 
                                    Text="TÊN VÀ ĐỊA CHỈ <br/> NGƯỜI ĐƯỢC BẢO HIỂM" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td  >
                                <asp:Label ID="lblTenKH" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="true" Font-Size="16px" ></asp:Label><br />
                                <asp:Label ID="lblDiaChiKH" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label><br />
                            </td>
                        </tr>

                        <tr style="display:none">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label4" runat="server" 
                                    Text="LĨNH VỰC KINH DOANH" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label9"  runat="server" 
                                    Text="ĐỊA ĐIỂM TỔN THẤT" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPremises" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label11"  runat="server" 
                                    Text="NGÀY GIỜ TỔN THẤT" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDOL" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label13"  runat="server" 
                                    Text="NGUYÊN NHÂN" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblSortCause" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label15"  runat="server" 
                                    Text="PHẠM VI TỔN THẤT" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblPhamViTonThat" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label17"  runat="server" 
                                    Text="QUY TẮC VÀ TÓM LƯỢC<BR/>HỢP ĐỒNG BẢO HIỂM" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblNamPolicy" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label><br />

                                <table>
                                    <tr>
                                        <td style="width:180px;" ><span><b>1. <u>Tổng số tiền bảo hiểm:</u></b></span></td>
                                        <td><asp:Label ID="lblSumInSured" runat="server" Width="225px"  Font-Bold=False ></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span><b>2. <u>Thời hạn bảo hiểm:</u></b></span> </td>
                                        <td><asp:Label ID="lblEffective" runat="server"  Width="225px" Font-Bold=False ></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span><b>3. <u>Mức miễn thưởng:</u></b></span> </td>
                                        <td><asp:Label ID="lblMucMienThuong" runat="server" Width="225px" Font-Bold=False ></asp:Label></td>
                                    </tr>
                                </table>


                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label19"  runat="server" 
                                    Text="ĐIỀU KHOẢN BỔ XUNG" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDKBX" runat="server" Width="404px" 
                                    CssClass="align-left" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;">
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label21"  runat="server" 
                                    Text="KHIẾU NẠI CỦA NĐBH" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblKhieuNai" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label>
                            </td>
                        </tr>


                        <tr style="vertical-align:top; font-size:16px;"> 
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label5"  runat="server" 
                                    Text="THIỆT HẠI HỢP LÝ" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblThietHaiHopLy" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>

                        <tr style="vertical-align:top; font-size:16px;"> 
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label6"  runat="server" 
                                    Text="THUỘC PHẠM VI HĐBH" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTonThatHopLy" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
                        <tr style="vertical-align:top; font-size:16px;"> 
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label10"  runat="server" 
                                    Text="TRỪ GIÁ TRỊ THU HỒI" 
                                    Width="200px" CssClass=" bg_text" Font-Italic="True" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTruGiaTriThuHoi" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
                        <tr style="vertical-align:top; font-size:16px;"> 
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label14"  runat="server" 
                                    Text="TRỪ MỨC MIỄN THƯỜNG" 
                                    Width="200px" CssClass=" bg_text" Font-Italic="True" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTruMucMienThuong" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
                        <tr style="vertical-align:top; font-size:16px;"> 
                            <td style="padding:5px; font-weight: bold; width:210px;">
                                <asp:Label ID="Label18"  runat="server" 
                                    Text="ĐỀ XUẤT BỒI THƯỜNG" 
                                    Width="200px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblBoiThuong" runat="server" Width="404px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            
            </div>
            <div style="clear:both; page-break-after: always;"><br /></div>
             <!--<div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="650px" alt="" /></div>    -->
        </div>


        <div class="page">
            <div class="body">

                
                <h3 style="text-align:center; font-size:22px; color:#006600; margin:20px 0px 30px 0; ">MỤC LỤC BÁO CÁO</h3>
                    
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:250px; font-size:16px" ><b>I. TÓM TẮT VỤ VIỆC</b></td>
                        <td style="text-align:right; font-size:16px" >.....................................................................................................................</td>
                    </tr>
                </table>     
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr>
                        <td style="width:300px; font-size:16px" ><b>II. NGƯỜI ĐƯỢC BẢO HIỂM </b></td>
                        <td style="text-align:right; font-size:16px" >........................................................................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:350px;font-size:16px"  ><b>III. QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI</b></td>
                        <td style="text-align:right; font-size:16px" >.....................................................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr>
                        <td style="width:250px; font-size:16px" ><b>IV. DIỄN BIẾN TỔN THẤT </b></td>
                        <td style="text-align:right; font-size:16px" >............................................................................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:220px;font-size:16px" ><b>V. NGUYÊN NHÂN </b></td>
                        <td style="text-align:right; font-size:16px" >...........................................................................................................................</td>
                    </tr>
                </table>         
               <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:250px; font-size:16px" ><b>VI. PHẠM VI BẢO HIỂM  </b></td>
                        <td style="text-align:right; font-size:16px" >................................................................................................................</td>
                    </tr>
                </table>     
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:350px;font-size:16px"><b>VII. PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI </b></td>
                        <td style="text-align:right; font-size:16px" >.....................................................................................</td>
                    </tr>
                </table>    
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:500px; font-size:16px" ><b>VIII. YÊU CẦU BỒI THƯỜNG VÀ ĐỀ XUẤT TÍNH TOÁN </b></td>
                        <td style="text-align:right; font-size:16px" >.....................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:350px; font-size:16px" ><b>IX. ĐƠN BẢO HIỂM KHÁC </b></td>
                        <td style="text-align:right; font-size:16px" >...........................................................................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:250px; font-size:16px" ><b>X. GIÁ TRỊ THU HỒI   </b></td>
                        <td style="text-align:right; font-size:16px" >.......................................................................................................................</td>
                    </tr>
                </table> 
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:300px; font-size:16px" ><b>XI. ĐỀ XUẤT CHUNG CUỘC </b></td>
                        <td style="text-align:right; font-size:16px" >.........................................................................................................</td>
                    </tr>
                </table>  
                <table style="font-size:16px;width:650px; margin:20px 0px">
                    <tr >
                        <td style="width:250px; font-size:16px" ><b>XII. KẾT LUẬN  </b></td>
                        <td style="text-align:right; font-size:16px" >................................................................................................................................</td>
                    </tr>
                </table>  



            </div>
            <div style="clear:both; page-break-after: always;"><br /></div>
        </div>




        <div class="box" >
            <h3 id="ExecutiveSummaryFR">I. TÓM TẮT VỤ VIỆC</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryFR" runat="server" Width="650px" ></asp:Label>
            </div>
        </div>

        <div class="box" >
            <h3 id="GioiThieu">II. NGƯỜI ĐƯỢC BẢO HIỂM </h3>
            <div>
                <asp:Label ID="lblGioiThieu" runat="server" Width="650px" ></asp:Label>
            </div>
        </div>

        <div class="box" >
            <h3 id="K">III. QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI</h3>
            <div><asp:Label ID="lblK" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="C1">IV. DIỄN BIẾN TỔN THẤT</h3>
            <div>
                <asp:Label ID="lblDienBienTonThat" runat="server" Width="650px" ></asp:Label>
            </div>
        </div>

        <div class="box" >
            <h3 id="C3">V. NGUYÊN NHÂN</h3>
            <div><asp:Label ID="lblC3" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="E1">VI. PHẠM VI BẢO HIỂM</h3>
            <div><asp:Label ID="lblE2" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="D1">VII. PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</h3>
            <div><asp:Label ID="lblD1" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="B1">VIII. YÊU CẦU BỒI THƯỜNG VÀ ĐỀ XUẤT TÍNH TOÁN</h3>
            <div><asp:Label ID="lblB1" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="G">IX. ĐƠN BẢO HIỂM KHÁC</h3>
            <div><asp:Label ID="lblG" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="H">X. GIÁ TRỊ THU HỒI</h3>
            <div><asp:Label ID="lblH" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="B2">XI. ĐỀ XUẤT CHUNG CUỘC</h3>
            <div><asp:Label ID="lblB2" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="Conclution">XII. KẾT LUẬN</h3>
            <div><asp:Label ID="lblConclution" runat="server" Width="650px" ></asp:Label></div>
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

    </form>
</body>
</html>
