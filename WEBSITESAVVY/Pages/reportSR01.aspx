<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportSR01.aspx.cs"  Inherits="WEBSITESAVVY.Pages.reportSR01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>report SR01</title>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>

    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>

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
            if(type == "SingleLine")
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

            
        }

        function x() {
            this.FirstName = ko.observable("Anubhav");
            this.change = ko.observable(false);
            this.edit = function () {
                this.change(true)
            }
        }
        ko.applyBindings(new x());
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
            width:980px;
            margin:0px auto;
            font-size:18px;
        }
        
        .page
        {
            background: #fff;
            width: 100%;
            height: 1490px;
            page-break-after: always;
        }
        
        .body
        {
            background:FFF;
            height:93%;
        }
        .footer
        {
            background:#fff;
            height:7%;
            width:100%;
        }
        
        .tool_bottom
        {
	        padding:5px; position:fixed; bottom: 0px; left: 0px; background:#EAEAEA; width:100%; border-top:1px solid #DDD; text-align:center; margin-top: -180px;
        }
        
        table
        {
            border: 0px;
        }
        
        table td 
        {
            vertical-align:top;
            margin-left: 40px;
        }
        
        /*p 
        {
            margin:0px;
            padding:0px;   
        }*/
        
        
        .align-right
        {
            text-align:right;
            margin-left: 5px;
        }
        
        .bg_text
        {
            background:#f0f0f0;
            font-weight:bold;
            font-size:17px;
            /*padding:2px; */
        }
        
        .align-center
        {
            text-align:center;
        }
        
        .title_2
        {
            font-size:14px;
            /*text-decoration:underline; */
            font-style:italic;
        }
        
        
        .field_input
        {
            border-left: 1.5px solid #FFFFFF;
            border-right: 1.5px solid #FFFFFF;
            border-top: 1.5px solid #FFFFFF;
            border-bottom: 1.5px solid #DCDCDC;
            /*background: #EBF3EB;*/
            color: #000080;
            /*padding:3px 3px 0px 7px;*/
            /*font-weight:bold;*/
            margin-top: 1px;
            margin-bottom: 2px;
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
            display:block ;
        }
       
      .menufo{
           
          top: 100%;
         
          margin-top: -10em;
          text-align:left;
        }
        .menufo: hover{
            
          margin-top: -22px;
        
        }
        
        .hiden
        {
            display:none ;
        }
        .label-edit
        {
            cursor:pointer;
            min-height:20px;
        }
    </style>  
        

</head>
<body >
    
        <form id="form1" runat="server">
    
        <div id="page1" class="page">
            <div id="body1" class="body">
                <div id="header">
                    <div style="height:30px"></div>
                    <div style="text-align:center;width:65%" align="center"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            
                    <div style="clear:both; font-size: 18px; color: #006600; text-align: right;" 
                        class="align-right">
                       Ngày <asp:Label ID="lblNgayBatDauGiamDinh" 
                            key="NgayBatDauGiamDinh" runat="server" Text="5/3/2014." type="SingleLine" onclick="editField(this)" 
                              CssClass="label-edit align-right" ></asp:Label>

                                <asp:Panel ID="panelNgayBatDauGiamDinh" Width="269px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtNgayBatDauGiamDinh" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button21" key="NgayBatDauGiamDinh" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="NgayBatDauGiamDinh" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                    </div>
                    <div style="text-align:center; color:#006600">
                        <h1 style="margin-top:0px;">BIÊN BẢN GIÁM ĐỊNH HIỆN TRƯỜNG <br />
                        <i>(SITE SURVEY RECORD)</i></h1>
                    </div>
                </div>

                <div id="content1">
                    <table width="100%">
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" 
                                    Text="Tham chiếu Hồ sơ Giám định<br/><i>Claim File’s Reference Number</i>" 
                                    Width="232px" CssClass="align-right bg_text" ></asp:Label></td>
                            <td class="style3" >
                                <asp:Label ID="lblTenClaim" runat="server" 
                                    Text="SR01+ CL.TENCLAIM" Width="240px" 
                                    ForeColor="#006600" Font-Bold="True" key="TenClaim" CssClass="field_input"  type="SingleLine" onclick="editField(this)" runat="server"></asp:Label>

                                     <asp:Panel ID="panelTenClaim" Width="269px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenClaim" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button20" key="TenClaim" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="TenClaim" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                                    </td>
                            <td valign="top"  >
                                <div style="float:left;">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Giám định viên <i>Surveyor</i>" Width="123px"  
                                        CssClass="align-right bg_text" ></asp:Label>
                                </div>
                                <asp:Label ID="lblSR01GDV" runat="server" Text="GIAM DINH VIEN" 
                                    Width="252px"  ForeColor="#006600" Font-Bold="True" key="SR01GDV" type="SingleLine" onclick="editField(this)" 
                                    CssClass="field_input label-edit align-center" Height="40px" ></asp:Label>
                                      <asp:Panel ID="panelSR01GDV" Width="250px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtSR01GDV" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button24" key="SR01GDV" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="SR01GDV" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                                    </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style1" >
                                <asp:Label ID="Label2" runat="server" 
                                    Text="Nhà Bảo hiểm <br/><i>Insurer</i>" 
                                    Width="130px" CssClass=" bg_text" ></asp:Label>
                                <asp:Label ID="lblTenNhaBH" runat="server" 
                                    Text="TEN NHÀ BẢO HIỂM" Width="395px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label></td>
                            <td valign="top" class="style2"><asp:Label ID="Label10" runat="server"
                                    Text="Số HĐBH <br/><i>Policy No.</i>" Width="110px"  
                                    CssClass="align-right bg_text" ></asp:Label>

                                <asp:Label ID="lblPolicyNO" key="PolicyNO" type="SingleLine" onclick="editField(this)" runat="server" Text="POLICY NO." 
                                    Width="269px"  CssClass="field_input label-edit align-center" ></asp:Label>
                                
                                <asp:Panel ID="panelPolicyNO" Width="269px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPolicyNO" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="PolicyNO" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="PolicyNO" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel> 
                                    
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style1" >
                                <asp:Label ID="Label4" runat="server" 
                                    Text="Đơn vị <br/><i>Subsidiary</i>" 
                                    Width="130px" CssClass="bg_text" ></asp:Label>
                                <asp:Label ID="lblTenDonVi" runat="server" 
                                    Text="TEN DON VI" Width="395px" 
                                    CssClass="field_input" Font-Bold="true" ></asp:Label></td>
                            <td ><asp:Label ID="Label5" runat="server"
                                    Text="Hiệu lực <br/><i>Effective</i>" Width="110px"  
                                    CssClass="align-right bg_text" ></asp:Label>

                                <asp:Label ID="lblEffective" key="Effective" type="SingleLine" onclick="editField(this)" runat="server" Text="Effective" 
                                    Width="269px"  CssClass="field_input label-edit align-center" ></asp:Label>
                                <asp:Panel ID="panelEffective" Width="269px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtEffective" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button key="Effective" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="Effective" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style1" >
                                <asp:Label ID="Label6" runat="server" 
                                    Text="Người được BH <br/><i>Insured</i>" 
                                    Width="130px" CssClass=" bg_text" ></asp:Label>
                                <asp:Label ID="lblTenKhachHang" runat="server" key="TenKhachHang" 
                                    type="SingleLine" onclick="editField(this)"
                                    Text="NGUOI DUOC BAO HIEM" Width="395px" 
                                    CssClass="field_input label-edit" Font-Bold="True" ></asp:Label>
                                     <asp:Panel ID="panelTenKhachHang" Width="395px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenKhachHang" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button14" key="TenKhachHang" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="TenKhachHang" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                                    </td>
                            <td ><asp:Label ID="Label8" runat="server"
                                    Text="Số Fax <br/><i>Fax No.</i>" Width="110px"  
                                    CssClass="align-right bg_text" ></asp:Label>
                                <asp:Label ID="lblFax" runat="server" Text="Fax No." key="Fax" type="SingleLine" onclick="editField(this)"
                                    Width="269px"  CssClass="field_input label-edit align-center" ></asp:Label>
                                      <asp:Panel ID="panelFax" Width="250px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtFax" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button15" key="Fax" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="Fax" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                                    </td>
                        </tr>
                        <tr>
                            <td colspan="3" >
                                <asp:Label ID="Label7" runat="server" 
                                    Text="Địa chỉ <br/><i>Address</i>" 
                                    Width="130px" CssClass="bg_text" ></asp:Label>
                                <asp:Label ID="lblDiaChi" runat="server" Width="811px" key="DiaChi" type="SingleLine" onclick="editField(this)"
                                    CssClass="field_input label-edit" ></asp:Label>
                                      <asp:Panel ID="panelDiaChi" Width="395px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDiaChi" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button16" key="DiaChi" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="DiaChi" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                                    </td>
                        </tr>
                        <tr>
                            <td colspan="3" >
                                <asp:Label ID="Label9" runat="server" 
                                    Text="Người liên hệ <br/><i>Contact Person</i>" 
                                    Width="130px" CssClass=" bg_text" ></asp:Label>
                                <asp:Label ID="lblTenNguoiDaiDien" runat="server"  key="TenNguoiDaiDien" type="SingleLine" onclick="editField(this)"
                                    Text="NGUOI LIEN HE" Width="217px" 
                                    CssClass="field_input  label-edit"  ></asp:Label>
                                    <asp:Panel ID="panelTenNguoiDaiDien" Width="215px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenNguoiDaiDien" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button17" key="TenNguoiDaiDien" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="TenNguoiDaiDien" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                     </asp:Panel>
                                <asp:Label  runat="server"
                                    Text="Số điện thoại <br/><i>Phone No.</i>" Width="99px"  
                                    CssClass=" bg_text" ></asp:Label>
                                <asp:Label ID="lblDienThoai" runat="server" Text="PHONE " key="DienThoai" type="SingleLine" onclick="editField(this)"
                                    Width="121px"  CssClass="field_input label-edit" ></asp:Label>
                                    <asp:Panel ID="panelDienThoai" Width="120px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDienThoai" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button18" key="DienThoai" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="DienThoai" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                 </asp:Panel>
                                <asp:Label ID="Label12" runat="server"
                                    Text="Thư điện tử <br/><i>Email</i>" Width="91px"  
                                    CssClass="align-right bg_text" ></asp:Label>
                                <asp:Label ID="lblEmail" runat="server" Text="EMAIL" key="Email"  type="SingleLine" onclick="editField(this)"
                                    Width="221px"  CssClass="field_input label-edit" ></asp:Label>
                                     <asp:Panel ID="panelEmail" Width="220px"  CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtEmail" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button19" key="Email" onclick="btnUpdateKhachHang_Click" Text="Update" runat="server"/>
                                        <input  key="Email" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                 </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" style="text-align:center; "  >
                                <div class="bg_text" style="margin:3px 5px">
                                    <h3 style="padding-top:10px; padding-bottom:5px; margin:0"  >THÔNG TIN SƠ BỘ VỀ TỔN THẤT<br />
                                            <i>INITIAL INFORMATION OF LOSS / DAMAGE </i></h3>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" >
                                <asp:Label ID="Label11" runat="server" 
                                    Text="Địa điểm tổn thất  <br/><i>Premises </i>" 
                                    Width="130px" CssClass=" bg_text" ></asp:Label>
                                
                                <asp:Label ID="lblPremises" key="Premises" type="SingleLine" onclick="editField(this)" runat="server" 
                                    Text="DIA DIEM TON THAT" Width="456px" 
                                    CssClass="field_input label-edit"  ></asp:Label>

                                <asp:Panel ID="panelPremises" Width="456px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtPremises" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="Premises" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="Premises" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>


                                <asp:Label  runat="server"
                                    Text="Ngày tổn thất <br/><i>Date of loss</i>" Width="106px"  
                                    CssClass="align-right bg_text" ></asp:Label>
                                
                                <asp:Label ID="lblDOL" key="DOL" type="SingleLine" onclick="editField(this)" runat="server" Text="NGAY TON THAT" 
                                    Width="221px"  CssClass="field_input label-edit align-center" Font-Bold="false" ></asp:Label>
                                <asp:Panel ID="panelDOL" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDOL" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button  key="DOL" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                        <input  key="DOL" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>

                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" class="style5">
                                <div style="float:left; width:inherit">
                                    <asp:Label ID="Label13" runat="server" 
                                        Text="Loại hình tổn thất  <br/><i>Type of Loss </i>" 
                                        Width="137px" CssClass=" bg_text" ></asp:Label>
                                </div>
                                <div style="float:left; width:85%">
                                    <table style="font-size:12px;font-weight:bold; margin-top:7px;" >
                                        <tr align="center" valign="bottom">
                                            <td class="style6"><asp:CheckBox ID="ck1" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck2" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck3" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck4" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck5" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck6" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck7" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck8" runat="server" Text=" "   /></td>
                                            <td class="style6"><asp:CheckBox ID="ck9" runat="server" Text=" "   /></td>
                                            <td class="style7"><asp:CheckBox ID="ck10" runat="server" Text=" "   /></td>
                                            <td rowspan="2">
                                                <asp:Label ID="lblGhiChuLoaiHinhTonThat" key="GhiChuLoaiHinhTonThat" type="SingleLine" onclick="editField(this)" runat="server" Width="88px" Text=" "
                                                     CssClass="field_input label-edit dislay-block" Font-Bold="False" ></asp:Label>
                                                <asp:Panel ID="panelGhiChuLoaiHinhTonThat" Width="88px"  CssClass="panelUpdate hiden" runat="server">
                                                    <asp:TextBox ID="txtGhiChuLoaiHinhTonThat" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                                    <div style="margin-top:10px">
                                                        <asp:Button  key="GhiChuLoaiHinhTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                        <input  key="GhiChuLoaiHinhTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><asp:Label ID="Label21" runat="server" 
                                                    Text="Cháy, Nổ<br/><i>(Fire, Explosion)</i>" Width="53px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label24" runat="server" 
                                                    Text="Lũ lụt&lt;br/&gt;&lt;i&gt;(Flood)&lt;/i&gt;" Width="40px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label25" runat="server" 
                                                    Text="Nước tràn / rò rỉ &lt;br/&gt;&lt;i&gt;(Water Leakage /Bursting)&lt;/i&gt;" 
                                                    Width="85px"  CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label26" runat="server" Text="Gió / Bão <br/><i>(Wind /Storm)</i>" Width="60px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label27" runat="server" Text="Sét đánh<br/><i>(Lightning)</i>" Width="52px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label28" runat="server" 
                                                    Text="Sự cố điện<br/><i>(Electrical)</i>" Width="56px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label29" runat="server" Text="Trục trặc về điện tử<br/><i>(Electronic)</i>" 
                                                    Width="60px"  CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label30" runat="server" Text="trục trặc vận hành máy móc<br/><i>(M.Breakdown)</i>" 
                                                    Width="77px"  CssClass="align-center" ></asp:Label></td>
                                            <td><asp:Label ID="Label31" runat="server" Text="Sập đổ nhà/vật kiến trúc<br/><i>(B.Collapse)</i>" 
                                                    Width="79px"  CssClass="align-center" ></asp:Label></td>
                                            <td class="style8"><asp:Label ID="lblGhiChuLHTT" runat="server" 
                                                    Text="Khác<br><i>(Others):</i>" Width="50px"  
                                                    CssClass="align-center" ></asp:Label></td>
                                        </tr>
                                    </table>    
                                </div>
                                <div style="clear:both;"></div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" valign="top">
                                <table>
                                    <tr>
                                        <td class="style1"><asp:Label ID="Label15" runat="server" 
                                                    Text="Diễn biến tổn thất <br/><i>Circumstances</i>" 
                                                    Width="139px" CssClass=" bg_text" ></asp:Label></td>
                                        <td style="vertical-align:bottom" class="style1">

                                            <asp:Label ID="lblDienBienTonThat" key="DienBienTonThat" type="MultiLine" onclick="editField(this)" runat="server" Width="802px" Text=" "
                                                 CssClass="field_input label-edit dislay-block" Font-Bold="False" ></asp:Label>
                                            <asp:Panel ID="panelDienBienTonThat" Width="802px"  CssClass="panelUpdate hiden" runat="server">
                                                <asp:TextBox ID="txtDienBienTonThat" CssClass="hiden" TextMode="MultiLine" Height="150px" Width="100%" runat="server" />
                                                <div style="margin-top:10px">
                                                    <asp:Button key="DienBienTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="DienBienTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="3">
                                <table >
                                    <tr>
                                        <td><asp:Label ID="Label20" runat="server" 
                                            Text="Thông báo CQ chức năng <br/><i>Reported to the Local <br/> Authority (Police)?  </i>" 
                                            Width="199px" CssClass=" bg_text" ></asp:Label></td>             
                                            <td><asp:CheckBox ID="checkBoxThongBao" runat="server" Text=" "  Width="49px" 
                                                    AutoPostBack="True" oncheckedchanged="checkBoxThongBao_CheckedChanged"  /></td>
                                            
                                            <td><asp:Label  runat="server"
                                                Text="Ghi chú thêm<br/><i>Further notes</i>" Width="133px"  
                                                    CssClass="align-right bg_text" ></asp:Label></td>
                                            <td>

                                                <asp:Label ID="lblGhiChuTBCQCN" key="GhiChuTBCQCN" type="SingleLine" onclick="editField(this)" runat="server" Text="GHI CHÚ THÊM" 
                                                    Width="537px"  CssClass="field_input label-edit align-left" Font-Bold="False"></asp:Label>
                                                
                                                <asp:Panel ID="panelGhiChuTBCQCN" Width="535px"  CssClass="panelUpdate hiden" runat="server">
                                                    <asp:TextBox ID="txtGhiChuTBCQCN" CssClass="hiden" TextMode="SingleLine" Width="100%" runat="server" />
                                                    <div style="margin-top:10px">
                                                        <asp:Button key="GhiChuTBCQCN" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                        <input  key="GhiChuTBCQCN" type="button" value="Cancel" onclick="cancel(this)" />
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                     </tr>
                                </table>
                            </td>
                        </tr>
                       
                        <tr id="row_PhamViTonThat">
                            <td colspan="3">
                                <table>
                                    <tr>
                                        <td class="style1">
                                            
                                            <asp:Label runat="server" 
                                                Text="Phạm vi tổn thất <br/> <i>Extent of Loss </i>" 
                                                Width="130px" CssClass=" bg_text" ></asp:Label>
                                        </td>
                                        <td style="vertical-align:bottom" class="style1">
                                            
                                            <asp:Label ID="lblPhamViTonThat" key="PhamViTonThat" type="MultiLine" onclick="editField(this)" runat="server"
                                                 CssClass="field_input label-edit dislay-block" Font-Bold="false" Text=" " Width="807px" ></asp:Label>


                                            <asp:Panel ID="panelPhamViTonThat" Width="807px" CssClass="panelUpdate hiden" runat="server">
                                                <asp:TextBox ID="txtPhamViTonThat" CssClass="hiden" TextMode="MultiLine" Height="150px" Width="100%" runat="server" />
                                                <div style="margin-top:10px">
                                                    <asp:Button key="PhamViTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                                    <input  key="PhamViTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                                </div>
                                            </asp:Panel>
                                                
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr> 
                        
                        <tr id="row_DuPhongTonThat">
                            <td colspan="3" >
                            
                                <div style="float:left; width:58%">
                                    <asp:Label ID="Label17" runat="server" 
                                        Text="Ước tính tổn thất  <br/><i>Estimated Loss </i>" 
                                        Width="144px" CssClass=" bg_text" ></asp:Label>

                                    <asp:Label ID="lblDuPhongTonThat" key="DuPhongTonThat" type="SingleLine" onclick="editField(this)" runat="server" 
                                        Text="UOC TINH TON THAT" Width="217px" Font-Bold="True"
                                        CssClass="field_input label-edit" ForeColor="#006600" ></asp:Label>

                                    <asp:Panel ID="panelDuPhongTonThat" Width="217px"  CssClass="panelUpdate hiden" runat="server">
                                        <asp:TextBox ID="txtDuPhongTonThat" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                        <div style="margin-top:10px">
                                            <asp:Button key="DuPhongTonThat" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                            <input  key="DuPhongTonThat" type="button" value="Cancel" onclick="cancel(this)" />
                                        </div>
                                    </asp:Panel>


                                    <asp:Label ID="Label19" runat="server"
                                        Text="Phụ lục đính kèm <br/><i>Appendix attached</i>" Width="140px"  
                                        CssClass="align-right bg_text" ></asp:Label>
                                </div>
                                <div style="float:left; width:42%">
                                   <asp:Label ID="lblPhuLucDinhKemSR01" runat="server" key="PhuLucDinhKemSR01" type="MultiLine" onclick="editField(this)"  Text="Phụ lục ảnh giám định hiện trường." 
                                        Width="389px"  CssClass="field_input label-edit" Font-Bold="false"  ></asp:Label>
                                         <asp:Panel ID="panelPhuLucDinhKemSR01" Width="350px"  CssClass="panelUpdate hiden" runat="server">
                                        <asp:TextBox ID="txtPhuLucDinhKemSR01" CssClass="hiden" TextMode="MultiLine" Height="150px"  Width="100%" runat="server" />
                                        <div style="margin-top:10px">
                                            <asp:Button ID="Button25" key="PhuLucDinhKemSR01" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                                            <input  key="PhuLucDinhKemSR01" type="button" value="Cancel" onclick="cancel(this)" />
                                        </div>
                                    </asp:Panel>
                                </div>
                               
                                <div style="clear:both;"><br /></div>
                            </td>
                        </tr>

                    </table>

                </div>
             
            </div>

            <div id="footer1" class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>
        </div>

        <div class="page">
            <div class="body">
                <table width="100%">
                    <tr>
                        <td style="width:80%; height:90px" >
                            <div style="padding-top:15px;">
                                <asp:Label ID="Label18" runat="server" 
                                 Text="Tham chiếu <i>(Savvy’s Ref.) </i> :" 
                                 Width="239px" 
                                 ForeColor="#006600" Font-Bold="True" Font-Size="20px" ></asp:Label>

                                 <asp:Label ID="lblTenClaim1" runat="server" 
                                    Text="SR01_1413BMSG-TP-PAR (SR01+ CL.TENCLAIM)" Width="509px" 
                                    ForeColor="#006600" Font-Bold="True" Font-Size="20px" ></asp:Label>
                            </div>
                            <div style="padding-top:5px;">
                                
                                <asp:Label ID="Label23" runat="server" 
                                 Text="Biên Bản Hiện Trường <i>(Site-Survey Record)</i> – Trang <i>(Page)</i>: 2/2"  
                                 ForeColor="#006600" Font-Bold="true" Font-Size="20px" ></asp:Label>
                            </div>
                            
                        </td>
                        <td><img src="../images/logo.png" height="90px"></td>
                    </tr>
                </table>
                <div class="hr"></div>

                <div id="content">
                    
                    <table id="tableTT">
                        <tr>
                            <td style="visibility:hidden" ><span id="Span1" class=" bg_text" style="display:inline-block;width:130px;">Phạm vi tổn thất <br> <i>Extent of Loss </i></span></td>
                            <td style="vertical-align:bottom" >
                                <span id="lblPhamViTonThatTT" class="field_input dislay-block" style="display:inline-block;font-weight:normal;width:807px;"></span></td>
                        </tr>
                    </table>

                    <asp:Label ID="Label33" runat="server" 
                         Text="Đề phòng, hạn chế tổn thất và khuyến cáo của giám định viên:  <br/><i>Loss Mitigating Actions & Recommendation: </i>" 
                         Width="488px" CssClass="align bg_text" Font-Bold="True" ></asp:Label>

                    <asp:Label ID="lblDePhongVaKhuyenCao" key="DePhongVaKhuyenCao" type="MultiLine" onclick="editField(this)" runat="server" 
                         Text="Đề phòng khuyến cáo" 
                         Width="99%" CssClass="field_input label-edit"  ></asp:Label>
                                                
                    <asp:Panel ID="panelDePhongVaKhuyenCao" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                        <asp:TextBox ID="txtDePhongVaKhuyenCao" CssClass="hiden" TextMode="MultiLine" Height="150px" Width="100%" runat="server" />
                        <div style="margin-top:10px">
                            <asp:Button  key="DePhongVaKhuyenCao" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                            <input  key="DePhongVaKhuyenCao" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>


                    <h3 style="padding-top:10px; text-align:center;">TỔNG HỢP THIỆT HẠI VÀ PHƯƠNG HƯỚNG KHẮC PHỤC<br />
                                    <i>SUMMARY OF LOSS / DAMAGE & INITIAL MEASURES</i></h3>

                    <asp:GridView ID="gvDanhMucThietHai" runat="server" CssClass="gridview"
                         AutoGenerateColumns="False" Width="99%" CellPadding="4" 
                        ForeColor="#000" GridLines="None"  >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="25%">
                                <HeaderTemplate>
                                    <span>HẠNG MỤC TÀI SẢN<br />
                                        <i>(PROPERTY'S ITEMS)</i></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span style="color:#000080"><%#DataBinder.Eval(Container.DataItem, "TenHangMuc") %></span>
                                    <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("ID") %>' />
                                </ItemTemplate>
                                <HeaderStyle Width="25%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="50%">
                                <HeaderTemplate>
                                    <span>Tình trạng thiệt hại/Phương án khắc phục<br />
                                        <i>(Brief description of damage/ Available measurements)</i></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span style="color:#000080">
                                        <%#DataBinder.Eval(Container.DataItem, "TinhTrangChung")%></span>
                                </ItemTemplate>
                                <HeaderStyle Width="50%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="5%">
                                <HeaderTemplate>
                                    <span>Thiệt hại hoàn toàn<br />
                                        <i>(Destroyed)</i></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span style="text-align:center;display:block"><input type="checkbox"
                                    <%#(Eval("TinhTrang").ToString().ToUpper() == "YES" ? "Checked" : "")%>  /></span>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Width="5%">
                                <HeaderTemplate>
                                    <span >Ý kiến của GDV<br />
                                        <i>(Remark)</i></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <span></span>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>
                        </Columns>
  
                        <HeaderStyle BackColor="#E4E4E4" ForeColor="#333333" Font-Bold="True" />
                        <RowStyle BackColor="#F2F2F2" />
                    </asp:GridView>

                    <span class="bg_text" style="padding-top:10px; text-align:center; display:block; width:98%; margin-top:3px">
                        <b>Ý kiến của giám định viên <i>(Loss Adjuster’s Remark)</i></b>
                    </span>

                    <asp:GridView ID="gvYKienYCo" runat="server" CssClass="gridview"
                         AutoGenerateColumns="False" ShowFooter="false" ShowHeader="false" Width="99%"  >
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="4%" >
                                <itemtemplate >
                                    <span style="color:#000080" class="bg_text" style="text-align:center;display:block; padding:0;"><%#(Container.DataItemIndex+1)%></span>
                                </itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="96%">
                                <ItemTemplate>
                                    <span style="color:#000080"><%#DataBinder.Eval(Container.DataItem, "YKienGDV") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <span class="field_input">
                    <asp:Label ID="lblYKienGDVSR01" key="YKienGDVSR01" type="MultiLine" onclick="editField(this)" runat="server" 
                         Text="Ý Kiến GDV" 
                         Width="99%" CssClass="field_input label-edit"  ></asp:Label>
                                                
                    <asp:Panel ID="panelYKienGDVSR01" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                        <asp:TextBox ID="txtYKienGDVSR01" CssClass="hiden" TextMode="MultiLine" Height="150px" Width="100%" runat="server" />
                        <div style="margin-top:10px">
                            <asp:Button ID="Button1"  key="YKienGDVSR01" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                            <input  key="YKienGDVSR01" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                    </span>
                    <br />
                    <div class="field_input" style="text-align: justify; width: 99%;">
                    Công tác giám định hiện trường kết thúc lúc
                    <asp:Label ID="lblGioKhaoSatHienTruong" runat="server"  key="GioKhaoSatHienTruong" type="SingleLine"  onclick="editField(this)"
                         Text="GioKhaoSatHienTruong" CssClass="field_input label-edit" ></asp:Label>
                             <asp:Panel ID="panelGioKhaoSatHienTruong" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                        <asp:TextBox ID="txtGioKhaoSatHienTruong" CssClass="hiden" TextMode="SingleLine" Width="200px" runat="server" />
                        <div style="margin-top:10px">
                            <asp:Button ID="Button22"  key="GioKhaoSatHienTruong" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                            <input key="GioKhaoSatHienTruong" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                         .
                         Các bước tiếp theo trong tiến trình thu thập thông tin / đánh giá tổn thất và xác định trách nhiệm của Hợp đồng bảo hiểm sẽ được chúng tôi liên tục cập nhật để Quý Công ty Bảo hiểm nắm bắt thông tin xử lý thuận tiện nhất. 
                   
                        <br />
                        Following completion of our preliminary site survey dated 
                    <asp:Label ID="lblGioKhaoSatHienTruongEN" runat="server" key="GioKhaoSatHienTruongEN"  type="SingleLine" onclick="editField(this)"
                         Text= "GioKhaoSatHienTruongEN" CssClass="field_input label-edit" Font-Italic="True" Font-Bold="False" ></asp:Label>
                          <asp:Panel ID="panelGioKhaoSatHienTruongEN" Width="99%"  CssClass="panelUpdate hiden" runat="server">
                        <asp:TextBox ID="txtGioKhaoSatHienTruongEN" CssClass="hiden" TextMode="SingleLine" Width="200px" runat="server" />
                        <div style="margin-top:10px">
                            <asp:Button ID="Button23"  key="GioKhaoSatHienTruongEN" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                            <input key="GioKhaoSatHienTruongEN" type="button" value="Cancel" onclick="cancel(this)" />
                        </div>
                    </asp:Panel>
                          as above stated, our further reports shall follow with updated progress in respect of the requested information obtained, damage assessment and available loss adjustment for Insurers’ convenient review and consideration.
                         
                         </div>
                </div>
                  <table width="100%">
                    <tr>
                        <td width="25%" style="padding-left: 10px" align="center">
                            <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Đại diện cho"></asp:Label>
                            <br />
                            <asp:Label ID="Label34" runat="server" Font-Italic="True" Text="(On behafl of)"></asp:Label>
                        </td>
                        <td align="center" width="25%">
                            <asp:Label ID="Label50" runat="server" Font-Bold="True" Text="Đại diện cho"></asp:Label>
                            <br />
                            <asp:Label ID="Label51" runat="server" Font-Italic="True" Text="(On behafl of)"></asp:Label>
                        </td>
                        <td align="center" width="25%">
                            <asp:Label ID="Label54" runat="server" Font-Bold="True" Text="Đại diện cho"></asp:Label>
                            <br />
                            <asp:Label ID="Label52" runat="server" Font-Italic="True" Text="(On behafl of)"></asp:Label>
                        </td>
                        <td align="center" width="25%">
                            <asp:Label ID="Label55" runat="server" Font-Bold="True" 
                                Text="Đại diện cho "></asp:Label>
                            <br />
                            <asp:Label ID="Label53" runat="server" Font-Italic="True" Text="(On behafl of)"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="25%" style="padding-left: 10px" align="center">
                            <asp:Label ID="lblDaiDien1"  key="DaiDien1" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">DaiDien1</asp:Label>                  
                             <asp:Panel ID="panelDaiDien1" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDaiDien1" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button2"  key="DaiDien1" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="DaiDien1" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td width="25%" align="center">
                              <asp:Label ID="lblDaiDien2"  key="DaiDien2" type="SingleLine" 
                                  onclick="editField(this)" runat="server" Font-Bold="True" 
                                  CssClass="field_input label-edit" Width="90%">DaiDien2</asp:Label>                  
                             <asp:Panel ID="panelDaiDien2" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDaiDien2" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button3"  key="DaiDien2" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="DaiDien2" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                            </td>
                        <td width="25%" align="center">                           
                              <asp:Label ID="lblDaiDien3"  key="DaiDien3" type="SingleLine" 
                                  onclick="editField(this)" runat="server" Font-Bold="True" 
                                  CssClass="field_input label-edit" Width="90%">DaiDien3</asp:Label>                  
                             <asp:Panel ID="panelDaiDien3" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDaiDien3" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button4"  key="DaiDien3" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="DaiDien3" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td align="center" width="25%">                           
                            <asp:Label ID="lblDaiDien4"  key="DaiDien4" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">DaiDien4</asp:Label>                  
                             <asp:Panel ID="panelDaiDien4" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtDaiDien4" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button5"  key="DaiDien4" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="DaiDien4" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="25%" style="padding-left: 10px">
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            &nbsp;</td>
                        <td width="25%">
                            &nbsp;</td>
                        <td align="center" width="25%">
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                      <tr>
                        <td style="font-size: 10px; font-style: italic; padding-left: 10px;" 
                            width="25%" align="center">
                            <asp:Label ID="Label38" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td style="font-size: 10px; text-align: center; font-style: italic" width="25%">
                            <asp:Label ID="Label44" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td style="font-size: 10px; text-align: center; font-style: italic" width="25%">
                            <asp:Label ID="Label47" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                        <td align="center" 
                            style="font-size: 10px; text-align: center; font-style: italic" 
                            width="25%">
                            <asp:Label ID="Label39" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%" style="padding-left: 10px" align="center">
                              <asp:Label ID="lblTenDaiDien1"  key="TenDaiDien1" type="SingleLine" 
                                  onclick="editField(this)" runat="server" Font-Bold="True" 
                                  CssClass="field_input label-edit" Width="90%">TenDaiDien1</asp:Label>                  
                             <asp:Panel ID="panelTenDaiDien1" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenDaiDien1" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button6"  key="TenDaiDien1" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="TenDaiDien1" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td align="center" width="25%">                         
                                 <asp:Label ID="lblTenDaiDien2"  key="TenDaiDien2" type="SingleLine" 
                                     onclick="editField(this)" runat="server" Font-Bold="True" 
                                     CssClass="field_input label-edit" Width="90%">TenDaiDien2</asp:Label>                  
                             <asp:Panel ID="panelTenDaiDien2" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenDaiDien2" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button7"  key="TenDaiDien2" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="TenDaiDien2" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td align="center" width="25%">
                            <asp:Label ID="lblTenDaiDien3"  key="TenDaiDien3" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">TenDaiDien3</asp:Label>                  
                             <asp:Panel ID="panelTenDaiDien3" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenDaiDien3" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button8"  key="TenDaiDien3" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="TenDaiDien3" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td align="center" width="25%">
                                <asp:Label ID="lblTenDaiDien4"  key="TenDaiDien4" type="SingleLine" 
                                    onclick="editField(this)" runat="server" Font-Bold="True" 
                                    CssClass="field_input label-edit" Width="90%">TenDaiDien4</asp:Label>                  
                             <asp:Panel ID="panelTenDaiDien4" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtTenDaiDien4" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button9"  key="TenDaiDien4" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="TenDaiDien4" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                    </tr>
                  
                    <tr>
                        <td class="style2" 
                            style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            width="25%" align="center">
                            <asp:Label ID="Label40" runat="server" Text="(Chức vụ (Job Title):" 
                                ForeColor="Black"></asp:Label>
                            <br />
                                <asp:Label ID="lblChucVuDaiDien1"  key="ChucVuDaiDien1" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">ChucVuDaiDien1</asp:Label>                  
                             <asp:Panel ID="panelChucVuDaiDien1" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtChucVuDaiDien1" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button10"  key="ChucVuDaiDien1" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="ChucVuDaiDien1" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td class="style2" style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            align="center" width="25%">
                            <asp:Label ID="Label45" runat="server" Text="(Chức vụ (Job Title):" 
                                ForeColor="Black"></asp:Label>
                            <br />
                           <asp:Label ID="lblChucVuDaiDien2"  key="ChucVuDaiDien2" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">ChucVuDaiDien2</asp:Label>                  
                             <asp:Panel ID="panelChucVuDaiDien2" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtChucVuDaiDien2" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button11"  key="ChucVuDaiDien2" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="ChucVuDaiDien2" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td class="style2" style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            align="center" width="25%">
                            <asp:Label ID="Label46" runat="server" Text="(Chức vụ (Job Title):" 
                                ForeColor="Black"></asp:Label>
                            <br />
                                <asp:Label ID="lblChucVuDaiDien3"  key="ChucVuDaiDien3" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">ChucVuDaiDien3</asp:Label>                  
                             <asp:Panel ID="panelChucVuDaiDien3" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtChucVuDaiDien3" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button12"  key="ChucVuDaiDien3" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="ChucVuDaiDien3" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                        <td class="style2" align="center" 
                            
                            style="font-size: 12px; color: #000066; font-style: italic; padding-left: 10px;" 
                            width="25%">
                            <asp:Label ID="Label41" runat="server" Text="(Chức vụ (Job Title):" 
                                ForeColor="Black"></asp:Label>
                            <br />
                            <asp:Label ID="lblChucVuDaiDien4"  key="ChucVuDaiDien4" type="SingleLine" 
                                onclick="editField(this)" runat="server" Font-Bold="True" 
                                CssClass="field_input label-edit" Width="90%">ChucVuDaiDien4</asp:Label>                  
                             <asp:Panel ID="panelChucVuDaiDien4" Width="221px" CssClass="panelUpdate hiden" runat="server">
                                    <asp:TextBox ID="txtChucVuDaiDien4" CssClass="hiden" TextMode="SingleLine"  Width="100%" runat="server" />
                                    <div style="margin-top:10px">
                                        <asp:Button ID="Button13"  key="ChucVuDaiDien4" onclick="btnUpdateDaiDien_Click" Text="Update" runat="server"/>
                                        <input  key="ChucVuDaiDien4" type="button" value="Cancel" onclick="cancel(this)" />
                                    </div>
                                </asp:Panel>
                        </td>
                    </tr>
                    </table>
            </div>
            <div class="footer"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>
        </div>

         <!--tool bottom-->
         <script type="text/javascript">
            function printPDF() {
                $('.tool_bottom').css("display", "none");
                window.print();
                $('.tool_bottom').css("display", "inherit");
            }
          </script>
        <div id="tool_bottom" runat="server" class="tool_bottom" >
           <button  class="btn" onclick="printPDF();" >Export to PDF</button> 
          
        </div>
        <div style="height:40px;"></div>
        <!--end tool bottom-->

        </form>
        

        <script type="text/javascript">

            function getString(array, start, end) {
                var result = "";
                for (var i = start; i < end; i++) {
                    result += array[i] + " ";
                }
                return result;
            }

            var header = document.getElementById("header");
            var content = document.getElementById("content1");
            var footer = document.getElementById("footer1");
            var realHeight = header.offsetHeight + content.offsetHeight + footer.offsetHeight;
            var pageHeight = document.getElementById("page1").offsetHeight;
            if (realHeight > pageHeight) {
                var row12 = document.getElementById("row_PhamViTonThat");
                var row13 = document.getElementById("row_DuPhongTonThat");
                $(row13).css({ "display": "none" });

                //var lblPhamViTonThat = document.getElementById("lblPhamViTonThat");
                //var lblPhamViTonThatTT = document.getElementById("lblPhamViTonThatTT");
                var data = $(lblPhamViTonThat).html();

                $("#lblPhamViTonThat").html(" ");

                var arrData = data.split(" ");

                var i = 0;
                while (i < arrData.length) {

                    $(lblPhamViTonThat).append(arrData[i] + " ");
                    realHeight = header.offsetHeight + content.offsetHeight + footer.offsetHeight;

                    if (realHeight + 30 >= pageHeight) {

                        $("#lblPhamViTonThat").html(getString(arrData, 0, i));

                        var str = getString(arrData, i, arrData.length - 1);
                        $("#lblPhamViTonThatTT").html(str);

                        $("#tableTT").append($(row13).html());

                        break;
                    }

                    i++;
                }

            }

            //window.print();

          
        </script>

</body>
</html>
