﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportFR.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportFR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>report FR</title>
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
            $("#panel" + key).css("display", "inline-table");

            window.location.href = "#" + key;
            $("#txt" + key).val($("#lbl" + key).html());
            

            var type = $(obj).attr("type");
            if(type === "SingleLine")
            {
                $("#txt" + key).show();
            }
            else
            {
    
                tinymce.init({
                    forced_root_block : '',
                    selector: "#txt" + key,
                    plugins: [
                            "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                            "table contextmenu directionality emoticons textcolor paste textcolor colorpicker textpattern example"
                    ],

                    toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
                    toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent | undo redo | image media code preview | forecolor backcolor | print fullscreen |",
                    toolbar3: "",

                    menubar: false,
                    toolbar_items_size: 'small',

                    image_advtab: true,
                    convert_urls : false



                });
            }
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
            page-break-after: always;
        }
        
        .body
        {
            background:FFF;
            height:93%;
            width: 888px;
        }
        .footer
        {
            background:#fff;
            height:7%;
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
        
        .label-edit
        {
            cursor:pointer;
            min-height:20px;
        }
        
        .panelUpdate *
        {
            font-size:16px !important;
        }
        
        .panelUpdate
        {
            width:100%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page1" >
            <div id="body1" class="body">
                <div id="header">
                    <div style="height:30px"></div>
                    <div style="float:left; width:65%; clear:both;"><img src="<%= Request.Url.GetLeftPart(UriPartial.Authority) +"/images/banner.jpg" %>" width="100%" alt="" /></div>           
                    <div>
                        <asp:Label ID="lblFRDate" runat="server" key="FRDate" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit title_2" Width="581px" Font-Size="18px" ></asp:Label>
                              <asp:Panel ID="panelFRDate" Width="400px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtFRDate" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button21" title="Date prepare - FR" key="FRDate" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="FRDate" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 

                    </div>
                    <div style="text-align:center; margin-bottom:15px">
                        <table style="width:100%">
                            <tr valign="middle">
                                <td class="align-left" style="width:50%"><i><u>Tham chiếu KH:</u> <asp:Label 
                                        ID="lblRefKH" runat="server" 
                                    Width="279px"  key="RefKH" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit" ></asp:Label> 
                                    <asp:Panel ID="panelRefKH" Width="275px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtRefKH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button1" key="RefKH"  title="Tham chiếu KH - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="RefKH" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel></i>

                                
                                   </td>
                                <td class="align-left" style="color:#006600;"><i><u>Tham chiếu Savvy:</u> </i><asp:Label ID="lblTenClaim" runat="server" 
                                    Text="SR01+ CL.TENCLAIM" Width="275px" 
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
                                     <asp:Label ID="lblPhuTrachNBH" runat="server" Width="760px" key="PhuTrachNBH"  type="SingleLine" onclick="editField(this)"
                                        CssClass="field_input label-edit" Font-Bold=True Font-Size="20px" ></asp:Label>
                                         <asp:Panel ID="panelPhuTrachNBH" Width="80%"  CssClass="panelUpdate hiden" runat="server">
                                        <asp:TextBox ID="txtPhuTrachNBH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                        <div style="margin-top:10px">
                                            <asp:Button ID="Button6"  title="Người nhận báo cáo - FR" key="PhuTrachNBH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                            <input  key="PhuTrachNBH" type="button" value="Cancel" onclick="cancel(this)" />
                                        </div>
                                    </asp:Panel>
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
                                    <h2 style="padding-top:10px; padding-bottom:5px; margin:0"  >BÁO CÁO GIÁM ĐỊNH CUỐI 
                                        CÙNG<br /></h2>
                                    
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
                                <%--<asp:Label ID="lblBaoCaoTruoc" runat="server" Width="570px" 
                                    CssClass="field_input" Font-Bold=False ></asp:Label>--%>
                                    
                                    <asp:Label ID="lblILADATE" runat="server" Width="570px"
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                                   <br />
                              
                                    <asp:Label ID="lblPRDARE" runat="server" Width="570px"
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                                <br />
                               
                                    <asp:Label ID="lblIRDATE" runat="server" Width="570px"
                                    CssClass="field_input" Font-Bold=False ></asp:Label>
                                
                            </td>
                        </tr>

                        <tr>
                            <td >
                                <asp:Label  runat="server" 
                                    Text="HỢP ĐỒNG BẢO HIỂM SỐ" 
                                    Width="260px" CssClass="bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
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
                                <asp:Label ID="lblPremises" key="Premises" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelPremises" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPremises" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="Premises"  title="Địa điểm tổn thất - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="Premises" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblDOL" key="DOL" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelDOL" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDOL" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DOL"  title="Ngày tổn thất - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DOL" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblSortCause" key="SortCause" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelSortCause" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtSortCause" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="SortCause"  title="Nguyên nhân - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="SortCause" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblPhamViTonThat" key="PhamViTonThat" type="MultiLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelPhamViTonThat" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPhamViTonThat" CssClass="hiden" TextMode="MultiLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="PhamViTonThat"  title="Phạm vi tổn thất - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="PhamViTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
   
                                <asp:Label ID="lblNamePolicy" key="NamePolicy" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelNamePolicy" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtNamePolicy" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="NamePolicy"  title="Quy tắc hợp đồng bảo hiểm - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="NamePolicy" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                                
                                <br />

                                <table>
                                    <tr>
                                        <td><span><b>1. <u>Tổng số tiền bảo hiểm:</u></b></span></td>
                                        <td>

                                            <asp:Label ID="lblSumInSured" key="SumInSured" type="SingleLine" onclick="editField(this)" CssClass="label-edit" runat="server" Width="354px" Font-Bold=False ></asp:Label>

                                            <asp:Panel ID="panelSumInSured" Width="354px" CssClass="panelUpdate hiden" runat="server">
                                                <asp:TextBox ID="txtSumInSured" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                                <div style="margin-top:10px">
                                                    <asp:Button  key="SumInSured"  title="Số tiền bảo hiểm - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="SumInSured" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span><b>2. <u>Thời hạn bảo hiểm:</u></b></span> </td>
                                        <td>
                                            <asp:Label ID="lblEffective" key="Effective" runat="server" type="SingleLine" onclick="editField(this)" CssClass="label-edit"  Width="354px" Font-Bold=False ></asp:Label>
                                        
                                            <asp:Panel ID="panelEffective" Width="354px" CssClass="panelUpdate hiden" runat="server">
                                                <asp:TextBox ID="txtEffective" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                                <div style="margin-top:10px">
                                                    <asp:Button  key="Effective"  title="Thời hạn bảo hiểm - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="Effective" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span><b>3. <u>Mức miễn thường:</u></b></span> </td>
                                        <td>
                                            <asp:Label ID="lblMucMienThuong" key="MucMienThuong" type="SingleLine" onclick="editField(this)" CssClass="label-edit" runat="server" Width="354px" Font-Bold=False ></asp:Label>
                                            <asp:Panel ID="panelMucMienThuong" Width="354px" CssClass="panelUpdate hiden" runat="server">
                                                <asp:TextBox ID="txtMucMienThuong" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                                <div style="margin-top:10px">
                                                    <asp:Button  key="MucMienThuong"  title="Mức miễn thường - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="MucMienThuong" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>


                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="Label19"  runat="server" 
                                    Text="ĐIỀU KHOẢN BỔ SUNG" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblDKBS" key="DKBS" type="SingleLine" onclick="editField(this)" CssClass="label-edit align-left" runat="server" Width="570px" 
                                    Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelDKBS" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDKBS" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DKBS"  title="Điều khoản bổ sung - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DKBS" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblKhieuNai" key="KhieuNai" type="SingleLine" onclick="editField(this)" CssClass="label-edit" runat="server" Width="570px" 
                                     Font-Bold="true" ></asp:Label>
                                <asp:Panel ID="panelKhieuNai" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtKhieuNai" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="KhieuNai"  title="Số tiền khiếu nại - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="KhieuNai" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label  runat="server" 
                                    Text="TỔN THẤT HỢP LÝ" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                
                                <asp:Label ID="lblThietHaiHopLy" key="ThietHaiHopLy" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="true" Font-Size="22px" ></asp:Label>

                                <asp:Panel ID="panelThietHaiHopLy" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtThietHaiHopLy" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="ThietHaiHopLy"  title="Số tiền thiệt hại hợp lý - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="ThietHaiHopLy" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <asp:Label  runat="server" 
                                    Text="THUỘC PHẠM VI HĐBH" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTonThatHopLe" key="TonThatHopLe" type="SingleLine" onclick="editField(this)"  runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="True" Font-Size="22px" ></asp:Label>

                                <asp:Panel ID="panelTonThatHopLe" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTonThatHopLe" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="TonThatHopLe"  title="Số tiền thuộc phạm vi bảo hiểm - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TonThatHopLe" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>


                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label   runat="server" 
                                    Text="TRỪ GIÁ TRỊ THU HỒI" 
                                    Width="260px" CssClass=" bg_text" Font-Italic="true" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label  ID="lblTruGiaTriThuHoi"  key="TruGiaTriThuHoi" type="SingleLine" onclick="editField(this)"  runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="True"  Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelTruGiaTriThuHoi" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTruGiaTriThuHoi" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="TruGiaTriThuHoi"  title="Trừ giá trị thu hồi - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TruGiaTriThuHoi" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td >
                                <asp:Label   runat="server" 
                                    Text="TẠM ỨNG BỒI THƯỜNG" 
                                    Width="260px" CssClass=" bg_text" Font-Italic="True" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td>
                                <asp:Label ID="lblTamUngBoiThuong" key="TamUngBoiThuong" type="SingleLine" onclick="editField(this)"  runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="True" Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelTamUngBoiThuong" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTamUngBoiThuong" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="TamUngBoiThuong"  title="Số tiền tạm ứng bồi thường - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TamUngBoiThuong" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label   runat="server" 
                                    Text="TRỪ MỨC MIẾN THƯỜNG" 
                                    Width="260px" CssClass=" bg_text" Font-Italic="True" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblTruMienThuong"  key="TruMienThuong" type="SingleLine" onclick="editField(this)"  runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="True" Font-Size="22px" ></asp:Label>

                                <asp:Panel ID="panelTruMienThuong" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTruMienThuong" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="TruMienThuong"  title="Số tiền trừ miễn thường - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TruMienThuong" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label   runat="server" 
                                    Text="ĐỀ XUẤT BỒI THƯỜNG" 
                                    Width="260px" CssClass=" bg_text" ></asp:Label>
                            </td>
                            <td>:</td>
                            <td >
                                <asp:Label ID="lblBoiThuong" key="BoiThuong" type="SingleLine" onclick="editField(this)"  runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold="True" Font-Size="22px" ></asp:Label>

                                <asp:Panel ID="panelBoiThuong" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtBoiThuong" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="BoiThuong"  title="Số tiền bồi thường - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="BoiThuong" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>

                                
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
                    <tr><td onclick="window.location.href ='#ExecutiveSummaryFR'"><b style="float:left">TÓM TẮT VỤ VIỆC </b>
                        <div style="float:right; text-align:right;" >..................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#K'"><b style="float:left">QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI </b>
                        <div style="float:right; text-align:right;" >......................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#C3FR'"><b style="float:left">NGUYÊN NHÂN </b>
                        <div style="float:right; text-align:right;" >......................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#E2'"><b style="float:left">PHẠM VI BẢO HIỂM </b>
                        <div style="float:right; text-align:right;" >.............................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#B1'"><b style="float:left">YÊU CẦU BỒI THƯỜNG VÀ ĐỀ XUẤT TÍNH TOÁN </b>
                        <div style="float:right; text-align:right;" >..........................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#H'"><b style="float:left">GIÁ TRỊ THU HỒI&nbsp; </b>
                        <div style="float:right; text-align:right;" >.................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#B2'"><b style="float:left">ĐỀ XUẤT CHUNG CUỘC </b>
                        <div style="float:right; text-align:right;" >.....................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#Conclution'"><b style="float:left">KẾT LUẬN </b>
                        <div style="float:right; text-align:right;" >............................................................................................................................................</div></td></tr>
                
                </table>


            </div>
            <!--<div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>-->
        </div>




        <div class="box" >
            <h3 id="ExecutiveSummaryFR" key="ExecutiveSummaryFR" title="Executive Summary" >TÓM TẮT VỤ VIỆC</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryFR" key="ExecutiveSummaryFR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelExecutiveSummaryFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtExecutiveSummaryFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="ExecutiveSummaryFR"  title="Tóm tắt vụ việc - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="ExecutiveSummaryFR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="K" key="K" title="Claim handling Process">QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI</h3>
            <div>
                <asp:Label ID="lblK" key="K" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelK" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtK" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="K" title="Quá trính xử lý & khiếu nại - FR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="K" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        <div class="box" >
            <h3 id="C3FR" key="C3FR" title="Cause of loss">NGUYÊN NHÂN</h3>
            <div>
                <asp:Label ID="lblC3FR" key="C3FR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelC3FR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtC3FR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="C3FR" title="Phân tích nguyên nhân - FR"   onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="C3FR"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="E2" key="E2" title="Policy liability" >PHẠM VI BẢO HIỂM</h3>
            <div>
                <asp:Label ID="lblE2" key="E2" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelE2" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtE2" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="E2" title="Phạm vi bảo hiểm - FR"   onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="E2"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="B1" key="B1" title="Claim amount and proposed settlement">YÊU CẦU BỒI THƯỜNG VÀ ĐỀ XUẤT TÍNH TOÁN</h3>
            <div>
                <asp:Label ID="lblB1" key="B1" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelB1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtB1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="B1" title="Yêu cầu bồi thường & đề xuất tính toán - FR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="B1"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
            <h3 id="H" key="H" title="Salvage" >
                GIÁ TRỊ THU HỒI</h3>
            <div>
                <asp:Label ID="lblGiaTriThuHoiHFR" key="GiaTriThuHoiHFR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGiaTriThuHoiHFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGiaTriThuHoiHFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="GiaTriThuHoiHFR" title="Giá trị thu hồi - FR"   onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="GiaTriThuHoiHFR"   type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
            <h3 id="B2" key="B2" title="Final Proposed Settlement" >
                ĐỀ XUẤT CHUNG CUỘC</h3>
            <div>
                <asp:Label ID="lblB2" key="B2" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelB2" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtB2" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="B2" title="Đề xuất chung cuộc - FR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="B2"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="Conclution" key="Conclution" title="Conclusion" >KẾT LUẬN</h3>
            <div>
                <asp:Label ID="lblConclution" key="Conclution" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelConclution" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtConclution" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="Conclution" title="Kết luận - FR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="Conclution"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
       
         <table width="100%">
                    <tr>
                        <td width="34%" style="padding-left: 10px">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Người lập"></asp:Label>
                            <br />
                            <asp:Label ID="Label2" runat="server" Font-Italic="True" Text="Prepared by"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Người kiểm tra"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Font-Italic="True" 
                                Text="Checked  by"></asp:Label>
                        </td>
                        <td align="left" width="33%">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Phê duyệt bởi"></asp:Label>
                            <br />
                            <asp:Label ID="Label6" runat="server" Font-Italic="True" 
                                Text="Approved  by"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="34%" style="padding-left: 10px">
                            <br />
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="center" width="33%">
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="34%" style="padding-left: 10px">
                            <asp:Label ID="lblID_GDVFR" key="ID_GDVFR" type="SingeLine"  
                                CssClass="field_input label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVFR" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVFR"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button13"  key="ID_GDVFR" onclick="btnUpdateGDV_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVFR" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                            <br />
                            <asp:Label ID="lblChucVuNguoiBC" runat="server" Font-Bold="False" 
                                Font-Italic="True"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblID_GDVCheckFR" key="ID_GDVCheckFR" type="SingeLine" 
                                CssClass="label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVCheckFR" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVCheckFR"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button14"  key="ID_GDVCheckFR" onclick="btnUpdateGDVCheck_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVCheckFR" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                            <br />
                            <asp:Label ID="lblChucvuNguoiCheck" runat="server" Font-Bold="False" 
                                Font-Italic="True"></asp:Label>
                        </td>
                        <td align="left" width="33%">
                            <asp:Label ID="lblNguoiPheDuyet" runat="server" Font-Bold="True" Width="100%"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucvuNguoiPheDuyet" runat="server" Font-Bold="False" 
                                Font-Italic="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td 
                            width="34%" style="font-size: 16px">
                            <asp:Label ID="Label49" runat="server" Text="Mobile:" Font-Bold="False" 
                                Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblDienThoaiPre" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label50" runat="server" Text="Email:" Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblEmailPre" runat="server" Font-Underline="True" 
                                ForeColor="#0000CC"></asp:Label>
                            <br />
                        </td>
                        <td 
                            align="left" style="font-size: 16px">
                            <asp:Label ID="Label47" runat="server" Text="Mobile:" Font-Bold="False" 
                                Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblDienThoaiCheck" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label48" runat="server" Text="Email:" Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblEmailCheck" runat="server" Font-Underline="True" 
                                ForeColor="#0000CC"></asp:Label>
                            <br />
                        </td>
                        <td align="left" width="33%" style="font-size: 16px">
                            <asp:Label ID="Label46" runat="server" Text="Mobile:" Font-Bold="False" 
                                Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblDienThoaiPheduyet" runat="server"></asp:Label>
                            <br />
                            <asp:Label ID="Label16" runat="server" Text="Email:" Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblEmailPheduyet" runat="server" Font-Underline="True" 
                                ForeColor="#0000CC"></asp:Label>
                            <br />
                            <br />
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
            <button class="btn" onclick="printPDF();" >Export to PDF</button>   &nbsp;&nbsp;&nbsp;  &nbsp
            <button class="btn" onclick="window.open('../Pages/reportFR_word.aspx?ClaimID=<%= mClaimID %>','_blank');">Export To Word</button>   &nbsp;&nbsp;&nbsp;  &nbsp
            <asp:Button class="btn" ID="btnPreparePR" runat="server" Text="Preparer" 
                onclick="btnPreparePR_Click" />  
            &nbsp;&nbsp;&nbsp;  &nbsp
        <asp:Button class="btn" ID="btnCheckPR" runat="server" Text="Checker" 
                onclick="btnCheckPR_Click" />
        </div>
        <div style="height:40px;"></div>
        <!--end tool bottom-->

    </form>
</body>
</html>