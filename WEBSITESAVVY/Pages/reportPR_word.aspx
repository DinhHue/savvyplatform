<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="reportPR_word.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportPR_word" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>report PR</title>
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
            font-size:16px !important;
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
        
        .footer
        {
            background:#fff;
            width:650px;
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
 
            font-style:italic;
            margin-top:15px;
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
            font-size:18px!important;
            margin:10px 0px 15px 0px;
        }  
      
        
        .label-edit
        {
            cursor:pointer;
            min-height:20px;
        }
        
                
        </style>

</head>
<body id="body" runat="server" style="line-height:1.5;" >
    <form id="form1" runat="server">

        <div >
            <div >
                <img src="<%= Request.Url.GetLeftPart(UriPartial.Authority) +"/images/banner.jpg" %>" style="width:500px;height:100px" alt="" />

                <div>    
                    <asp:Label ID="lblNgayMoPR" runat="server" Text="Ngày 5/3/2014."
                            CssClass="title_2" Width="581px" 
                        Font-Size="15px" ></asp:Label>
                </div>
                <div style="text-align:left;  margin-bottom:15px">
                    <table style="width:100%">
                        <tr valign="middle">
                            <td style="text-align:left; font-size:15px;"><i><u>Tham chiếu KH:</u> 
                                <asp:Label 
                                    ID="lblRefKH" runat="server" 
                                Width="279px"  CssClass="field_input" Font-Size="15px" ></asp:Label> </i>
                            </td>
                            <td class="align-left" style="color:#006600; font-size:15px;"><i><u>Tham chiếu Savvy:</u> </i>
                                <asp:Label ID="lblTenClaim" runat="server" 
                                Text="SR01+ CL.TENCLAIM" Width="275px" 
                                ForeColor="#006600" Font-Bold="True" CssClass="field_input" Font-Size="15px" ></asp:Label></td>
                        </tr>
                    </table>
                </div>

                <div>
                    <h3 style="padding: 0px;margin: 5px 0px;" >
                        <asp:Label ID="lblTenNhaBH" runat="server" 
                        Text="TEN NHÀ BẢO HIỂM" Width="640px" 
                        CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label></h3>
                    <h3  style="padding: 0px;margin: 5px 0px;">
                        <asp:Label ID="lblTenDonVi" runat="server" 
                                Text="TEN DON VI" Width="645px" 
                                CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label></h3>
                    <div style="font:20px; margin-bottom:10px" ><i>
                        <u><asp:Label  runat="server" Font-Size="16px" >Địa chỉ</asp:Label>:</u>
                        <asp:Label ID="lblDiaChiNBH" runat="server" Width="640px" Font-Size="16px"  ></asp:Label></i>
                    </div>

                    <table width="650px" >
                        <tr>
                            <td style="width:200px; font-size:16px;"><b><u>Kính gửi:</u></b></td>
                            <td style="width:350px; font-size:16px;">
                                <asp:Label ID="lblKinhGui" runat="server" Width="550px" 
                                    CssClass="field_input" Font-Bold=True Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>

            <div id="content">
                    


                <table width="630px" cellspacing="3px" >

                    <tr style="vertical-align:top;">
                        <td colspan="3" style="text-align:center; "  >
                            <div class="bg_text" style="margin:5px;"  >

                                <h1 style=" margin-top:12px; margin-bottom:5px; font-size:21px; "  >BÁO CÁO GIÁM ĐỊNH SƠ BỘ</h1>
                                    
                                <asp:Label ID="lblBrief" runat="server" Width="600px" 
                                    ForeColor="#006600" Font-Bold="True" 
                                    Font-Italic="True" Font-Size="14px" ></asp:Label>
                                    
                            </div>
                        </td>
                    </tr>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                                <asp:Label  runat="server" 
                                    Text="BÁO CÁO TRƯỚC" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td style="width:20px;" >:</td>
                            <td class="style1"  >
                                <asp:Label ID="lblDateILA" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label  runat="server" 
                                Text="BÁO CÁO TRƯỚC" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td style="width:20px;" >:</td>
                        <td style="width:390px;"  >
                            <asp:Label ID="lblDateILA" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:16px; width:225px"  >
                                <asp:Label  runat="server" 
                                    Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td class="style2">:</td>
                            <td class="style3"  >
                                <asp:Label ID="lblPolicyNo" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px"  >
                            <asp:Label  runat="server" 
                                Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td >:</td>
                        <td >
                            <asp:Label ID="lblPolicyNo" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>


<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                                <asp:Label ID="Label7"  runat="server" 
                                    Text="TÊN VÀ ĐỊA CHỈ <br/> NGƯỜI ĐƯỢC BẢO HIỂM" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1"   >
                                <asp:Label ID="lblTenKH" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label><br />
                                <asp:Label ID="lblDiaChiKH" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label><br />
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label7"  runat="server" 
                                Text="TÊN VÀ ĐỊA CHỈ <br/> NGƯỜI ĐƯỢC BẢO HIỂM" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblTenKH" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label><br />
                            <asp:Label ID="lblDiaChiKH" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label><br />
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label  runat="server" 
                                    Text="LĨNH VỰC KINH DOANH" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1"  >
                                <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label  runat="server" 
                                Text="LĨNH VỰC KINH DOANH" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td >
                            <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145
--%>
<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label9"  runat="server" 
                                    Text="ĐỊA ĐIỂM TỔN THẤT" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1"  >
                                <asp:Label ID="lblPremises" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label9"  runat="server" 
                                Text="ĐỊA ĐIỂM TỔN THẤT" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblPremises" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label11"  runat="server" 
                                    Text="NGÀY GIỜ TỔN THẤT" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1" >
                                <asp:Label ID="lblDOL" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label11"  runat="server" 
                                Text="NGÀY GIỜ TỔN THẤT" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblDOL" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False Font-Size="16px" ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label13"  runat="server" 
                                    Text="NGUYÊN NHÂN" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1" >
                                <asp:Label ID="lblSortCause" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label13"  runat="server" 
                                Text="NGUYÊN NHÂN" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblSortCause" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label15"  runat="server" 
                                    Text="PHẠM VI TỔN THẤT" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1" >
                                <asp:Label ID="lblPhamViTonThat" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label15"  runat="server" 
                                Text="PHẠM VI TỔN THẤT" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblPhamViTonThat" runat="server" Width="375px" 
                                CssClass="field_input" Font-Bold=False ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label17"  runat="server" 
                                    Text="QUY TẮC VÀ TÓM LƯỢC<BR/>HỢP ĐỒNG BẢO HIỂM" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1" >
                                <asp:Label ID="lblNamPolicy" runat="server" Width="390px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px"  ></asp:Label><br />
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label17"  runat="server" 
                                Text="QUY TẮC VÀ TÓM LƯỢC<BR/>HỢP ĐỒNG BẢO HIỂM" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblNamPolicy" runat="server" Width="370px" 
                                 Font-Bold="True" Font-Size="16px"  ></asp:Label><br />
>>>>>>> .r145
--%>
                            <table  cellpadding="0" style="font-size:16px;" >
                                <tr style="vertical-align:top;">
                                    <td style="width:200px;"><span style="display:block; width:200px;"><b>1. <u>Tổng số tiền bảo hiểm:</u></b></span></td>
                                    <td style="width:200px;"><asp:Label ID="lblSumInSured" runat="server" Width="170px"   ></asp:Label></td>
                                </tr>
                                <tr style="vertical-align:top;">
                                    <td style="width:200px;" ><span><b>2. <u>Thời hạn bảo hiểm:</u></b></span> </td>
                                    <td><asp:Label ID="lblEffective" runat="server"  Width="170px"  ></asp:Label></td>
                                </tr>
                                <tr style="vertical-align:top;">
                                    <td style="width:200px;"><span><b>3. <u>Mức miễn thường:</u></b></span> </td>
                                    <td><asp:Label ID="lblMucMienThuong" runat="server" Width="170px" ></asp:Label></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
<%--
<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label19"  runat="server" 
                                    Text="ĐIỀU KHOẢN BỔ SUNG" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1"  >
                                <asp:Label ID="lblDKBX" runat="server" Width="370px" 
                                    CssClass="align-left" Font-Bold="False" Font-Size="16px"  ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label19"  runat="server" 
                                Text="ĐIỀU KHOẢN BỔ XUNG" 
                                Width="225px" Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td   >
                            <asp:Label ID="lblDKBX" runat="server" Width="370px" 
                                CssClass="align-left" Font-Bold="False" Font-Size="16px"  ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>

<%--<<<<<<< .mine--%>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px">
                                <asp:Label ID="Label21"  runat="server" 
                                    Text="KHIẾU NẠI CỦA NĐBH" 
                                    Width="225px" Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1"  >
                                <asp:Label ID="lblKhieuNai" runat="server" Width="370px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
<tr>
                            <td class="bg_text">
                                <asp:Label ID="Label1"  runat="server" 
                                    Text="TẠM ỨNG BỒI THƯỜNG" 
                                    Width="260px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTamUngBoiThuongPR" 
                                   CssClass=" field_input" runat="server" Width="570px" 
                                    Font-Bold="True" Font-Size="16px" ></asp:Label>                                
                            </td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td style="padding:5px; font-weight: bold; font-size:20px; width:225px" >
                                <asp:Label ID="Label23"  runat="server" 
                                    Text="DỰ PHÒNG BỒI THƯỜNG" 
                                    Width="225px"  Font-Size="16px" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td class="style1" >
                                <asp:Label ID="lblDuPhongBoiThuong" runat="server" Width="370px" 
                                    CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                            </td>
                        </tr>
<%--=======
                    <tr style="vertical-align:top;">
                        <td style="padding:5px; font-weight: bold; font-size:16px; width:225px" >
                            <asp:Label ID="Label23"  runat="server" 
                                Text="DỰ PHÒNG BỒI THƯỜNG" 
                                Width="225px"  Font-Size="16px" ></asp:Label>
                        </td>
                        <td>:</td>
                        <td  >
                            <asp:Label ID="lblDuPhongBoiThuong" runat="server" Width="370px" 
                                CssClass="field_input" Font-Bold="True" Font-Size="16px" ></asp:Label>
                        </td>
                    </tr>
>>>>>>> .r145--%>


                </table>

            </div>
            
        </div>

        <div style="clear:both; page-break-after: always;"><br /></div>


        <div class="page">
            <div class="body">



                <h3 style="text-align:center; font-size:22px; color:#006600; margin:20px 0px 0px 0">MỤC LỤC BÁO CÁO</h3>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr onclick="window.location.href ='#A1'">
                        <td style="width:350px; font-size:16px" ><b>GIỚI THIỆU CHUNG</b></td>
                        <td style="text-align:right; font-size:16px" >.................................................................................................................</td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#GioiThieu'">
                        <td style="width:350px; font-size:16px"><b>NGƯỜI ĐƯỢC BẢO HIỂM</b></td>
                        <td style="text-align:right; font-size:16px" > ......................................................................................................</td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#C1'">
                        <td style="width:350px; font-size:16px"><b>DIỄN BIẾN</b></td>
                        <td style="text-align:right; font-size:16px"> ................................................................................................................................ </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#C3'">
                        <td style="width:350px; font-size:16px"><b>NGUYÊN NHÂN</b></td>
                        <td style="text-align:right;font-size:16px"> ....................................................................................................................... </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#E1'">
                        <td style="width:350px; font-size:16px"><b>PHẠM VI BẢO HIỂM </b></td>
                        <td style="text-align:right; font-size:16px"> ............................................................................................................... </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#D1'">
                        <td style="width:350px; font-size:16px"><b>PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI </b></td>
                        <td style="text-align:right;  font-size:16px"> ..................................................................................... </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#G'">
                        <td style="width:350px; font-size:16px"><b>ĐƠN BẢO HIỂM KHÁC </b></td>
                        <td style="text-align:right;  font-size:16px"> ........................................................................................................ </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#H'">
                        <td style="width:350px; font-size:16px"><b>GIÁ TRỊ THU HỒI </b></td>
                        <td style="text-align:right;  font-size:16px"> ................................................................................................................ </td>
                    </tr>
                </table>
                 <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#TheQuyenTruyDoi'">
                        <td style="width:450px; font-size:16px"><b>THẾ QUYỀN TRUY ĐÒI BÊN THỨ BA </b></td>
                        <td style="text-align:right;  font-size:16px"> .................................................................................................... </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#I'">
                        <td style="width:450px; font-size:16px"><b>DỰ PHÒNG BỒI THƯỜNG </b></td>
                        <td style="text-align:right;  font-size:16px"> .................................................................................................... </td>
                    </tr>
                </table>
                <table style="font-size:16px;width:640px; margin:20px 0px">
                    <tr  onclick="window.location.href ='#TT'">
                        <td style="width:350px; font-size:16px"><b>BÁO CÁO TIẾP THEO </b></td>
                        <td style="text-align:right;  font-size:16px"> ............................................................................................................... </td>
                    </tr>
                </table>

            </div>
            <div style="clear:both; page-break-after: always;"><br /></div>
        </div>

        <div class="box" style="font-size:16px" >
            <h3 style="font-size:16px" id="A1">GIỚI THIỆU CHUNG</h3>
            <div>
                <asp:Label ID="lblA1" runat="server" Width="650px" ></asp:Label>
            </div>
        </div>

        <div class="box" style="font-size:16px" >
            <h3 id="GioiThieu">NGƯỜI ĐƯỢC BẢO HIỂM</h3>
            <div><asp:Label ID="lblGioiThieu" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" style="font-size:16px" >
            <h3 id="C1">DIỄN BIẾN</h3>
            <div><asp:Label ID="lblC1" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" style="font-size:16px" >
            <h3 id="C3">NGUYÊN NHÂN</h3>
            <div><asp:Label ID="lblC3" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" style="font-size:16px" >
            <h3 id="E1">PHẠM VI BẢO HIỂM</h3>
            <div><asp:Label ID="lblE1" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="D1">PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</h3>
            <div><asp:Label ID="lblD1" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="G">ĐƠN BẢO HIỂM KHÁC</h3>
            <div><asp:Label ID="lblG" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="H">GIÁ TRỊ THU HỒI</h3>
            <div><asp:Label ID="lblH" runat="server" Width="650px" ></asp:Label></div>
        </div>
        <div class="box" >
            <h3 id="TheQuyenTruyDoi">THẾ QUYỀN TRUY ĐÒI BÊN THỨ BA</h3>
            <div>
                <asp:Label ID="lblTheQuyenTruyDoi" key="TheQuyenTruyDoi" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                </div>
        </div>
        <div class="box" >
            <h3 id="I">DỰ PHÒNG BỒI THƯỜNG</h3>
            <div><asp:Label ID="lblI" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="TamUngBoiThuongText">TẠM ỨNG BỒI THƯỜNG</h3>
            <div><asp:Label ID="lblTamUngBoiThuongText" runat="server" Width="650px" ></asp:Label></div>
        </div>

        <div class="box" >
            <h3 id="TT">BÁO CÁO TIẾP THEO</h3>
            <div style="text-align: justify"><%--<asp:Label ID="lblTT" runat="server" Width="850px" ></asp:Label>--%>
            <p>  Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và sẽ định kỳ báo cáo để Nhà Bảo Hiểm nắm rõ.</p><p>  Nếu Quý Công ty Bảo hiểm có bất kỳ câu hỏi hoặc yêu cầu nào khác liên quan đến công tác giám định vụ tổn thất này, xin vui lòng liên lạc với chúng tôi để được hỗ trợ tốt nhất.</p></div>
        </div>
         <table width="100%">
                    <tr>
                        <td width="35%" style="padding-left: 10px">
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Người báo cáo"></asp:Label>
                            <br />
                            <asp:Label ID="Label34" runat="server" Font-Italic="True" Text="Prepared by"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Người kiểm tra"></asp:Label>
                            <br />
                            <asp:Label ID="Label43" runat="server" Font-Italic="True" 
                                Text="Checked  by"></asp:Label>
                        </td>
                        <td align="center" width="35%">
                            <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Phê duyệt bởi"></asp:Label>
                            <br />
                            <asp:Label ID="Label37" runat="server" Font-Italic="True" 
                                Text=" Approved  by"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="35%" style="padding-left: 10px">
                            <asp:Label ID="lblNguoiBaoCao" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="lblNguoiCheckBC" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td align="center" width="35%">
                            <asp:Label ID="lblNguoiPheDuyet" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="35%" style="padding-left: 10px">
                            <br />
                            <br />
                        </td>
                        <td align="center">
                            &nbsp;</td>
                        <td align="center" width="35%">
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 10px; font-style: italic; padding-left: 10px;" 
                            width="35%">
                            <asp:Label ID="Label38" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td style="font-size: 10px; text-align: center; font-style: italic" 
                            align="center">
                            <asp:Label ID="Label46" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td align="center" 
                            style="font-size: 10px; text-align: center; font-style: italic" 
                            width="35%">
                            <asp:Label ID="Label39" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" 
                            style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            width="35%">
                            <asp:Label ID="Label40" runat="server" Text="(Chức vụ (Job Title):"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucVuNguoiBC" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td class="style2" style="font-size: 12px; color: #000066; font-style: italic" 
                            align="center">
                            <asp:Label ID="Label41" runat="server" Text="(Chức vụ (Job Title):"></asp:Label><br />
                            <asp:Label ID="lblChucvuNguoiCheck" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                        <td class="style2" align="center" 
                            style="font-size: 12px; color: #000066; font-style: italic" width="35%">
                            <asp:Label ID="Label45" runat="server" Text="(Chức vụ (Job Title):"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucvuNguoiPheDuyet" runat="server" Font-Bold="True" 
                                ForeColor="#000066"></asp:Label>
                        </td>
                    </tr>
                    </table>

    <div style="height:40px;"></div>

    </form>
</body>
</html>
