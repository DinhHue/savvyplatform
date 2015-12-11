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
            $("#panel" + key).css("display", "inline-table");

            window.location.href = "#" + key;            

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
    <%--     <asp:ScriptManager ID="ScriptManager2" runat="server"/>--%>
        <div id="page1" >
            <div id="body1" class="body">
                <div id="header">
                    <div style="height:30px"></div>
                    <%-- <div><img src="<%= Request.Url.GetLeftPart(UriPartial.Authority) +"/images/banner.jpg" %>" width="637px" height="125px" alt="" /><br /></div>
            
                    <div>--%>
                     <div style="float:left; width:65%; clear:both;"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            
                    <div class="title_2">
                       &nbsp;<asp:Label ID="lblPRDate" runat="server" key="PRDate" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit" Width="550px" Font-Size="18px" ></asp:Label>
                              <asp:Panel ID="panelPRDate" Width="400px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPRDate" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server"></asp:TextBox>
                                   <%--  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                        Enabled="True" Format="dd/mm/yyyy" TargetControlID="txtPRDate">
                    </ajaxToolkit:CalendarExtender>--%>
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button21" title="Date prepare - PR" key="PRDate" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="PRDate" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                    </div>
                    <div style="text-align:left;  margin-bottom:15px">
                        <table style="width:100%">
                            <tr valign="middle">
                                <td style="text-align:left; "><i><u>Tham chiếu KH:</u> <asp:Label 
                                        ID="lblRefKH" runat="server" 
                                    Width="279px"  key="RefKH" type="SingleLine" onclick="editField(this)" 
                              CssClass="field_input label-edit" ></asp:Label> 
                                    <asp:Panel ID="panelRefKH" Width="275px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtRefKH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button1" title="Reference of insured - PR" key="RefKH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="RefKH" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                                    </i>
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
                            CssClass="field_input" Font-Bold="True" Visible="False" ></asp:Label></h3>
                        <h3><asp:Label ID="lblTenDonVi" runat="server" 
                                    Text="TEN DON VI" Width="800px" 
                                    CssClass="field_input" Font-Bold="True" ></asp:Label></h3>
                        <div style="font:20px; margin-bottom:10px" ><i>
                            <u><asp:Label  runat="server" >Địa chỉ</asp:Label>:</u>
                            <asp:Label ID="lblDiaChiNBH" runat="server" Width="800px"  ></asp:Label></i>
                        </div>

                        <table width="100%" >
                            <tr>
                                <td style="width:150px"><b><u>Kính gửi</u>:</b></td>
                                <td align="left" >
                                    <asp:Label ID="lblPhuTrachNBH" runat="server" Width="760px" key="PhuTrachNBH"  type="SingleLine" onclick="editField(this)"
                                        CssClass="field_input label-edit" Font-Bold=True Font-Size="20px" ></asp:Label>
                                         <asp:Panel ID="panelPhuTrachNBH" Width="80%"  CssClass="panelUpdate hiden" runat="server">
                                        <asp:TextBox ID="txtPhuTrachNBH" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                        <div style="margin-top:10px">
                                            <asp:Button ID="Button6" title="Phụ trách NBH - PR" key="PhuTrachNBH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                    <h2 style="padding-top:10px; padding-bottom:5px; margin:0"  >BÁO CÁO GIÁM ĐỊNH SƠ BỘ<br /></h2>
                                    
                                    <asp:Label ID="lblBriefReport"  key="BriefReport" type="SingleLine" runat="server" Width="90%" onclick="editField(this)"                                   
                                        ForeColor="#006600" Font-Bold=True CssClass="field_input label-edit" 
                                        Font-Italic="True" ></asp:Label>
                                     <asp:Panel ID="panelBriefReport" Width="500px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtBriefReport" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button7" key="BriefReport" title="brief - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="BriefReport" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblLinhVucKinhDoanh" runat="server" Width="570px" key="LinhVucKinhDoanh"  type="SingleLine" onclick="editField(this)"
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>
                            <asp:Panel ID="panelLinhVucKinhDoanh" Width="500px"  CssClass="panelUpdate hiden" runat="server">
                            <asp:TextBox ID="txtLinhVucKinhDoanh" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                            <div style="margin-top:10px">
                                <asp:Button ID="Button14" key="LinhVucKinhDoanh" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                <input  key="LinhVucKinhDoanh" type="button" value="Cancel" onclick="cancel(this)" />
                            </div>
                        </asp:Panel>
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
                                <asp:Label ID="lblPremises" key="Premises" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelPremises" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPremises" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="Premises" title="Premises - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="Premises" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblDOL" key="DOL" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelDOL" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDOL" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DOL" title="Date of loss - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DOL" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblSortCause" key="SortCause" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelSortCause" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtSortCause" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="SortCause" title="Nguyên nhân - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="SortCause" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblPhamViTonThat" key="PhamViTonThat" type="MultiLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelPhamViTonThat" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPhamViTonThat" CssClass="hiden" TextMode="MultiLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="PhamViTonThat" title="Phạm vi tổn thất - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="PhamViTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
   
                                <asp:Label ID="lblNamePolicy" key="NamePolicy" type="SingleLine" onclick="editField(this)" runat="server" Width="570px" 
                                    CssClass="field_input label-edit" Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelNamePolicy" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtNamePolicy" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="NamePolicy" title="Type name policy - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button  key="SumInSured"  title="SumInsured - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button  key="Effective" title="Effective - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
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
                                                    <asp:Button  key="MucMienThuong" title="Mức miễn thường - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="MucMienThuong" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>
                                        </td>
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
                                <asp:Label ID="lblDKBS" key="DKBS" type="MultiLine" onclick="editField(this)" CssClass="label-edit align-left" runat="server" Width="570px" 
                                    Font-Bold=False ></asp:Label>

                                <asp:Panel ID="panelDKBS" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDKBS" CssClass="hiden" TextMode="MultiLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DKBS" title="Điều khoản bổ sung - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DKBS" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblKhieuNai" key="KhieuNai" type="SingleLine" onclick="editField(this)" CssClass="label-edit" runat="server" Width="570px" 
                                     Font-Bold="true" ></asp:Label>
                                <asp:Panel ID="panelKhieuNai" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtKhieuNai" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="KhieuNai" title="Số tiền khiếu nại - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="KhieuNai" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblTamUngBoiThuongPR" key="TamUngBoiThuongPR"  type="SingleLine" 
                                    onclick="editField(this)" CssClass="label-edit field_input" runat="server" Width="570px" 
                                    Font-Bold="True" Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelTamUngBoiThuongPR" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTamUngBoiThuongPR" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button3" title=" Số tiền tạm ứng bồi thường - PR"  key="TamUngBoiThuongPR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TamUngBoiThuongPR" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                                <asp:Label ID="lblDuPhongTonThatPR" key="DuPhongTonThatPR"  type="SingleLine" onclick="editField(this)" CssClass="label-edit field_input" runat="server" Width="570px" 
                                    Font-Bold="true" Font-Size="22px" ></asp:Label>
                                <asp:Panel ID="panelDuPhongTonThatPR" Width="570px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDuPhongTonThatPR" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DuPhongTonThatPR" title=" Số tiền dự phòng tổn thất - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DuPhongTonThatPR" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
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
                    <tr id="MucLuc_A1" runat="server"><td onclick="window.location.href ='#A1'"><b style="float:left;">GIỚI THIỆU CHUNG</b> 
                        <div style="float:right; text-align:right;" >..................................................................................................................................</div></td></tr>
                    <tr id="MucLuc_GioiThieu" runat="server"><td onclick="window.location.href ='#GioiThieu'"><b style="float:left;">NGƯỜI ĐƯỢC BẢO HIỂM </b>
                        <div style="float:right; text-align:right;" >........................................................................................................................</div></td></tr>
                    <tr id="MucLuc_C1" runat="server"><td onclick="window.location.href ='#C1'"><b style="float:left;">DIỄN BIẾN </b>
                        <div style="float:right; text-align:right;" >..................................................................................................................................................</div></td></tr>
                    <tr id="MucLuc_C3" runat="server"><td onclick="window.location.href ='#C3'"><b style="float:left;">NGUYÊN NHÂN </b>
                        <div style="float:right; text-align:right;" >..........................................................................................................................................</div></td></tr>
                    <tr id="MucLuc_E1" runat="server"><td onclick="window.location.href ='#E1'"><b style="float:left;">PHẠM VI BẢO HIỂM </b>
                        <div style="float:right; text-align:right;" >.................................................................................................................................</div></td></tr>
                    <tr id="MucLuc_D1" runat="server"><td onclick="window.location.href ='#D1'"><b style="float:left;">PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</b><div style="float:right; text-align:right;" >..........................................................................................................</div></td></tr>
                    <tr id="MucLuc_G" runat="server"><td onclick="window.location.href ='#G'"><b style="float:left;">ĐƠN BẢO HIỂM KHÁC </b>
                        <div style="float:right; text-align:right;" >.............................................................................................................................</div></td></tr>
                    <tr id="MucLuc_H" runat="server"><td onclick="window.location.href ='#H'"><b style="float:left;">GIÁ TRỊ THU HỒI </b>
                        <div style="float:right; text-align:right;" >......................................................................................................................................</div></td></tr>
                    <tr id="MucLuc_TheQuyenTruyDoi" runat="server">
                        <td onclick="window.location.href ='#TheQuyenTruyDoi'"><b style="float:left;">THẾ QUYỀN TRUY ĐÒI BÊN THỨ BA </b>
                        <div style="float:right; text-align:right;" >
                            ...................................................................................................</div>
                        </td></tr>
                    <tr id="MucLuc_I" runat="server"><td onclick="window.location.href ='#I'"><b style="float:left;">DỰ PHÒNG BỒI THƯỜNG </b>
                        <div style="float:right; text-align:right;" >.......................................................................................................................</div></td></tr>
                     <tr id="MucLuc_TamUngBoiThuongText" runat="server"><td onclick="window.location.href ='#TamUngBoiThuongText'"><b style="float:left;">TẠM ỨNG BỒI THƯỜNG </b>
                        <div style="float:right; text-align:right;" >.......................................................................................................................</div></td></tr>
                    <tr id="MucLuc_TT" runat="server"><td onclick="window.location.href ='#TT'"><b style="float:left;">BÁO CÁO TIẾP THEO </b>
                        <div style="float:right; text-align:right;" >...............................................................................................................................</div></td></tr>
                </table>


            </div>
        </div>




        <div class="box" id="panelMucLucA1" runat="server" >
            <%--<h3 id="A1" key="A1" title="Giới Thiệu Chung" onclick="parent.updateField(this);">I. GIỚI THIỆU CHUNG</h3>--%>
            <h3 id="A1" key="A1" title="Giới Thiệu Chung">GIỚI THIỆU CHUNG</h3>
            <div >
                <asp:Label ID="lblA1" key="A1"  onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelA1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtA1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateA1" title="Giới thiệu chung - PR" key="A1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelA1" key="A1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucGioiThieu" runat="server" >
            <h3 id="GioiThieu" key="GioiThieu" title="Người Được Bảo Hiểm">NGƯỜI ĐƯỢC BẢO HIỂM</h3>
            <div key="GioiThieu" >
                <asp:Label ID="lblGioiThieu" key="GioiThieu" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGioiThieu" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGioiThieu" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateGioiThieu" title="Người được bảo hiểm - PR" key="GioiThieu" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelGioiThieu" key="GioiThieu" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucDienBienTonThat" runat="server" >
            <h3 id="C1" key="C1" title="Diễn Biến" >DIỄN BIẾN</h3>
            <div>
                <asp:Label ID="lblC1" key="C1" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelC1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtC1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateC1" title="Diễn biến tổn thất - PR" key="C1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelC1" key="C1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucC3" runat="server" >
            <h3 id="C3" key="C3" title="Nguyên Nhân" >NGUYÊN NHÂN</h3>
            <div>
                <asp:Label ID="lblC3" key="C3" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelC3" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtC3" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="C3" title="Phân tích nguyên nhân - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="C3" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucE1" runat="server"  >
            <h3 id="E1" key="E1" title="Phạm Vi Bảo Hiểm" >PHẠM VI BẢO HIỂM</h3>
            <div>
                <asp:Label ID="lblE1" key="E1" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelE1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtE1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="E1" title="Phạm vi bảo hiểm - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="E1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucD1" runat="server"   >
            <h3 id="D1" key="D1" title="Phạm Vi Và Mức Độ Thiệt Hại" >PHẠM VI VÀ MỨC ĐỘ THIỆT HẠI</h3>
            <div>
                <asp:Label ID="lblD1" key="D1" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelD1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtD1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button   key="D1" title="Phạm vi và mức độ thiệt hại - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="D1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucG" runat="server"   >
            <h3 id="G" key="G" title="Đơn Bảo Hiểm Khác" >ĐƠN BẢO HIỂM KHÁC</h3>
            <div>
                <asp:Label ID="lblG" key="G" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelG" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtG" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button   key="G" title="Đơn bảo hiểm khác - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="G" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucH" runat="server"   >
            <h3 id="H" key="H" title="Giá Trị Thu Hồi" >GIÁ TRỊ THU HỒI</h3>
            <div>
                <asp:Label ID="lblH" key="H" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelH" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtH"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="H" title="Giá trị thu hồi - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="H" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        
        <div class="box" id="panelMucLucTheQuyenTruyDoi" runat="server"   >
            <h3 id="TheQuyenTruyDoi" key="TheQuyenTruyDoi" title="Giá Trị Thu Hồi" >THẾ QUYỀN TRUY ĐÒI BÊN THỨ BA</h3>
            <div>
                <asp:Label ID="lblTheQuyenTruyDoi" key="TheQuyenTruyDoi" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTheQuyenTruyDoi" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTheQuyenTruyDoi"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button2" title="Thế quyền truy đòi bên thứ ba - PR"  key="TheQuyenTruyDoi" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="TheQuyenTruyDoi" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="box"  id="panelMucLucI" runat="server"  >
            <h3 id="I" key="I" title="Dự Phòng Bồi Thường" >DỰ PHÒNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblI" key="I" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelI" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtI"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button key="I" title="Dư phòng bồi thường - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="I" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box"  id="panelMucLucTamUngBoiThuongText" runat="server"  >
            <h3 id="TamUngBoiThuongText" key="TamUngBoiThuongText" title="Tạm Ứng Bồi Thường">TẠM ỨNG BỒI THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoiThuongText" key="TamUngBoiThuongText" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoiThuongText" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoiThuongText"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button  key="TamUngBoiThuongText" title="Tạm ứng bồi thường - PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="TamUngBoiThuongText" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" id="panelMucLucTT" runat="server"  >
            <h3 id="lblTT" key="TT" title="Báo Cáo Tiếp Theo" runat="server" >BÁO CÁO TIẾP THEO</h3>
            <div style="text-align: justify"><%--<asp:Label ID="lblTT" runat="server" Width="100%" ></asp:Label>--%>
            <p id="txtTT" runat="server">  Các thông tin và diễn biến tiếp theo liên quan đến vụ tổn thất này sẽ tiếp tục được chúng tôi quan tâm theo dõi và sẽ định kỳ báo cáo để Nhà Bảo Hiểm nắm rõ.</p><p>  Nếu Quý Công ty Bảo hiểm có bất kỳ câu hỏi hoặc yêu cầu nào khác liên quan đến công tác giám định vụ tổn thất này, xin vui lòng liên lạc với chúng tôi để được hỗ trợ tốt nhất.</p></div>
        </div>

         <table width="100%">
                    <tr>
                        <td width="34%" style="padding-left: 10px">
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Người lập"></asp:Label>
                            <br />
                            <asp:Label ID="Label34" runat="server" Font-Italic="True" Text="Prepared by"></asp:Label>
                        </td>
                        <td align="left" width="33%">
                            <asp:Label ID="Label42" runat="server" Font-Bold="True" Text="Người kiểm tra"></asp:Label>
                            <br />
                            <asp:Label ID="Label43" runat="server" Font-Italic="True" 
                                Text="Checked  by"></asp:Label>
                        </td>
                        <td align="left" width="33%">
                            <asp:Label ID="Label36" runat="server" Font-Bold="True" Text="Phê duyệt bởi"></asp:Label>
                            <br />
                            <asp:Label ID="Label37" runat="server" Font-Italic="True" 
                                Text="Approved  by"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="34%" style="padding-left: 10px">
                            <br />
                            <br />
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                        <td align="center" width="33%">
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="34%">
                            <asp:Label ID="lblID_GDVPR" key="ID_GDVPR" type="SingeLine"  
                                CssClass="field_input label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVPR" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVPR"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button4"  key="ID_GDVPR" onclick="btnUpdateGDV_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVPR" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                            <br />
                            <asp:Label ID="lblChucVuNguoiBC" runat="server" Font-Bold="False" 
                                Font-Italic="True"></asp:Label>
                        </td>
                        <td align="left" width="33%">
                            <asp:Label ID="lblID_GDVCheckPR" key="ID_GDVCheckPR" type="SingeLine" 
                                CssClass="label-edit"  onclick="editField(this)" runat="server" 
                                Font-Bold="True" Width="100%"></asp:Label>
                             <asp:Panel ID="panelID_GDVCheckPR" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                                     <asp:DropDownList ID="drID_GDVCheckPR"  Width="50%" runat="server">
                                     </asp:DropDownList>
                        <div style="margin-top:10px">
                            <asp:Button ID="Button5"  key="ID_GDVCheckPR" onclick="btnUpdateGDVCheck_Click" Text="Update" runat="server"/>
                            <input  key="ID_GDVCheckPR" type="button" value="Cancel" onclick="cancel(this)" />
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
                            align="left" style="font-size: 16px" width="33%">
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
                            <asp:Label ID="Label41" runat="server" Text="Email:" Font-Underline="True"></asp:Label>
                            &nbsp;<asp:Label ID="lblEmailPheduyet" runat="server" Font-Underline="True" 
                                ForeColor="#0000CC"></asp:Label>
                            <br />
                            <br />
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

    <div style="height:40px;"></div>

    </form>
</body>
</html>
