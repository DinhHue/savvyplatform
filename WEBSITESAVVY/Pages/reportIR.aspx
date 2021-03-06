﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportIR.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportIR" %>
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
        };


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
                    <div style="float:left; width:65%; clear:both;"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            
                    <div>
                        <asp:Label ID="lblIRDate" runat="server" key="IRDate" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit title_2" Width="581px" Font-Size="18px" ></asp:Label>
                              <asp:Panel ID="panelIRDate" Width="400px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtIRDate" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button21" title="Date prepare - IR" key="IRDate" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="IRDate" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                    </div>
                    <div style="text-align:center; margin-bottom:15px">
                        <table style="width:100%">
                            <tr valign="middle">
                                <td class="align-left" style="width:50%"><i><u>Tham chiếu KH:</u>  <asp:Label 
                                        ID="lblRefKH" runat="server" 
                                    Width="279px"  key="RefKH" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit" ></asp:Label> 
                                    <asp:Panel ID="panelRefKH" Width="275px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtRefKH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button12" title="Tham chiếu khách hàng - IR" key="RefKH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="RefKH" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>

                                
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
                                   <asp:Label ID="lblPhuTrachNBH" runat="server" Width="760px" key="PhuTrachNBH"  type="SingleLine" onclick="editField(this)"
                                        CssClass="field_input label-edit" Font-Bold=True Font-Size="20px" ></asp:Label>
                                         <asp:Panel ID="panelPhuTrachNBH" Width="80%"  CssClass="panelUpdate hiden" runat="server">
                                        <asp:TextBox ID="txtPhuTrachNBH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                        <div style="margin-top:10px">
                                            <asp:Button ID="Button15" title="Người nhận báo cáo - IR" key="PhuTrachNBH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button1" title="Địa điểm tổn thất - IR"  key="Premises" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button2" title="Ngày giờ tổn thất - IR"  key="DOL" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button3" title="Nguyên nhân - IR" key="SortCause" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button4" title="Phạm vi tổn thất - IR" key="PhamViTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button5" title="Loại bảo hiểm - IR" key="NamePolicy" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button ID="Button7" title="Số tiền bảo hiểm - IR" key="SumInSured" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button ID="Button8" title="Thời hạn bảo hiểm - IR"  key="Effective" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button ID="Button9" title="Mức miễn thường - IR" key="MucMienThuong" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                <asp:Label ID="lblDKBS" key="DKBS" type="MultiLine" onclick="editField(this)" CssClass="label-edit align-left" runat="server" Width="570px" 
                                    Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelDKBS" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDKBS" CssClass="hiden" TextMode="MultiLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button10" title="Điều khoản bổ sung - IR"  key="DKBS" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                        <asp:Button ID="Button6" title="Số tiền khiếu nại - IR" key="KhieuNai" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="KhieuNai" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblDuPhongTonThatIR" key="DuPhongTonThatIR"  type="SingleLine" onclick="editField(this)" CssClass="label-edit field_input" runat="server" Width="570px" 
                                    Font-Bold="true" Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelDuPhongTonThatIR" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDuPhongTonThatIR" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button11" title="Dự phòng tổn thất - IR" key="DuPhongTonThatIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DuPhongTonThatIR" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblTamUngBoiThuong" key="TamUngBoiThuong"  type="SingleLine" onclick="editField(this)" CssClass="label-edit field_input" runat="server" Width="570px" 
                                    Font-Bold="true" Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelTamUngBoiThuong" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTamUngBoiThuong" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button   key="TamUngBoiThuong" title="Tạm ứng bồi thường - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TamUngBoiThuong" type="button" value="Cancel" onclick="cancel(this)" />
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
                    <tr><td onclick="window.location.href ='#ExecutiveSummaryIR'">
                        <b style="float:left;">KHÁI QUÁT VỤ VIỆC VÀ TIẾN TRÌNH </b>
                        <div style="float:right; text-align:right;" >..................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#K'"><b style="float:left;">QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI </b>
                        <div style="float:right; text-align:right;" >.........................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#AdjustmentIR'"><b style="float:left;">CẬP NHẬT TIẾN ĐỘ TÍNH TOÁN </b>
                        <div style="float:right; text-align:right;" >..........................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#H'"><b style="float:left;">GIÁ TRỊ THU HỒI </b>
                        <div style="float:right; text-align:right;" >.....................................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#I'"><b style="float:left;">CẬP NHẬT DỰ PHÒNG </b>
                        <div style="float:right; text-align:right;" >.............................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#TamUngBoithuongTextIR'"><b style="float:left;">TẠM ỨNG BỒI THƯỜNG </b>
                        <div style="float:right; text-align:right;" >.........................................................................................................................</div></td></tr>
                    <tr><td onclick="window.location.href ='#TT'"><b style="float:left;">BÁO CÁO TIẾP THEO </b>
                        <div style="float:right; text-align:right;" >..............................................................................................................................</div></td></tr>

                </table>


            </div>
            <!--<div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>-->
        </div>




        <div class="box" >
            <h3 id="ExecutiveSummaryIR" key="ExecutiveSummaryIR" title="Executive Summary" >KHÁI QUÁT VỤ VIỆC VÀ TIẾN TRÌNH</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryIR"  key="ExecutiveSummaryIR" onclick="editField(this)"  CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelExecutiveSummaryIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtExecutiveSummaryIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="ExecutiveSummaryIR" title="Khái quát vụ việc và tiến trình - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input ikey="ExecutiveSummaryIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="K" key="K" title="Claim Handling TimeLine" >QUÁ TRÌNH XỬ LÝ VÀ KHIẾU NẠI</h3>
            <div>
                <asp:Label ID="lblK" key="K" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelK" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtK" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="K" title="Quá trình xử lý và khiếu nại - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="K" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        <div class="box" >
            <h3 id="AdjustmentIR" key="AdjustmentIR" title="Outline of Claim Adjustment" >CẬP NHẬT TIẾN ĐỘ TÍNH TOÁN</h3>
            <div>
                <asp:Label ID="lblAdjustmentIR" key="AdjustmentIR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelAdjustmentIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtAdjustmentIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="AdjustmentIR" title="Cập nhật tiến độ tính toán - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="AdjustmentIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
		
		<div class="box" >
            <h3 id="H" key="H" title="Salvage" >GIÁ TRỊ THU HỒI</h3>
            <div>
                <asp:Label ID="lblGiaTriThuHoiHIR" key="GiaTriThuHoiHIR" onclick="editField(this)" 
                    CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGiaTriThuHoiHIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGiaTriThuHoiHIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="GiaTriThuHoiHIR" title="Giá trị thu hồi - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="GiaTriThuHoiHIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="I" key="I" title="Interim Reserve" >CẬP NHẬT DỰ PHÒNG</h3>
            <div>
                <asp:Label ID="lblI" key="I" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelI" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtI" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="I" title="Cập nhật dự phòng - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="I" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h3 id="TamUngBoithuongTextIR" key="TamUngBoithuongTextIR" title="Interim Payment">TẠM ỨNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoithuongTextIR" key="TamUngBoithuongTextIR" 
                    onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoithuongTextIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoithuongTextIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="TamUngBoithuongTextIR" title="Tạm ứng bồi thường - IR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="TamUngBoithuongTextIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        

        <div class="box" >
            <h3 id="TT">BÁO CÁO TIẾP THEO</h3>
            <div style="text-align: justify"><%--<asp:Label ID="lblTT" runat="server" Width="100%" ></asp:Label>--%>
            <p>Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và cập nhật ngay khi có thông tin mới nhất để phục vụ cho công tác quản lý bồi thường của Nhà Bảo Hiểm.</p>
            <p>Nếu Quý Công ty Bảo hiểm có câu hỏi hoặc bất kỳ yêu cầu nào khác sau khi xem báo cáo này, xin vui lòng thông tin cho chúng tôi để được đáp ứng thỏa đáng.</p>
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
                        <td width="34%">
                            <asp:Label ID="lblID_GDVIR" key="ID_GDVIR" type="SingeLine"  
                                CssClass="field_input label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVIR" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVIR"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button13"  key="ID_GDVIR" onclick="btnUpdateGDV_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVIR" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                            <br />
                            <asp:Label ID="lblChucVuNguoiBC" runat="server" Font-Bold="False" 
                                Font-Italic="True"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblID_GDVIRCheck" key="ID_GDVIRCheck" type="SingeLine" 
                                CssClass="label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVIRCheck" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVIRCheck"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button14"  key="ID_GDVIRCheck" onclick="btnUpdateGDVCheck_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVIRCheck" type="button" value="Cancel" onclick="cancel(this)" />
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
        <button class="btn" onclick="printPDF();" >Export to PDF</button> &nbsp;&nbsp;&nbsp;  &nbsp
        <button class="btn" onclick="window.open('../Pages/reportIR_word.aspx?ClaimID=<%= mClaimID %>','_blank');">Export To Word</button> &nbsp;&nbsp;&nbsp;  &nbsp
        <asp:Button class="btn" ID="btnPrepareIR" runat="server" Text="Preparer" 
            onclick="btnPrepareIR_Click" />  
            &nbsp;&nbsp;&nbsp;  &nbsp
        <asp:Button class="btn" ID="btnCheckIR" runat="server" Text="Checker" 
            onclick="btnCheckIR_Click"/>
    </div>
    <div style="height:40px;"></div>
    <!--end tool bottom-->

    </form>
</body>
</html>
