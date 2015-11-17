<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimType.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>report mẫu</title>
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
    <div>
            <div class="page">
          <%--  <div class="head">
                <asp:Label ID="Label1" runat="server" Text="Đang hiển thị nội dung báo cáo mẫu"></asp:Label>
                <asp:DropDownList ID="drpolicytype" runat="server" Width="200px">
                </asp:DropDownList>


            &nbsp;
                <asp:Button ID="btnxemdangBC" runat="server" CssClass="btn" Text="Change" />


            </div>--%>
            <div class="head">
                <h3 style="text-align:center; font-size:25px!important; color:#006600; margin:20px 0px 0px 0">
                    ĐOẠN  MẪU 
                    BÁO  CÁO  GIÁM  ĐỊNH  SƠ  BỘ</h3>


            </div>
        




        <div class="box" >
            <h2 id="GioiThieuChungA1" key="GioiThieuChungA1" title="Giới Thiệu Chung">I. GIỚI  THIỆU   CHUNG</h3>
            <%--<h3 id="GioiThieuChungA1" key="GioiThieuChungA1" title="Giới Thiệu Chung">GIỚI THIỆU CHUNG</h3>--%>
            <div >
                <asp:Label ID="lblGioiThieuChungA1" key="GioiThieuChungA1" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGioiThieuChungA1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGioiThieuChungA1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateA1" key="GioiThieuChungA1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelA1" key="GioiThieuChungA1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h2 id="GioiThieuNDBH" key="GioiThieuNDBH" title="Người Được Bảo Hiểm">NGƯỜI  ĐƯỢC  BẢO  HIỂM</h3>
            <div key="GioiThieu" >
                <asp:Label ID="lblGioiThieuNDBH" key="GioiThieuNDBH" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGioiThieuNDBH" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGioiThieuNDBH" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button id="btnUpdateGioiThieu" key="GioiThieuNDBH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input id="btnCancelGioiThieu" key="GioiThieuNDBH" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
          <h2 id="C1" key="DienBienTonThat" title="Diễn Biến" >DIỄN  BIẾN</h3>
            <div>
                <asp:Label ID="lblDienBienTonThat" key="DienBienTonThat" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
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
              <h2 id="NguyenNhanC3" key="NguyenNhanC3" title="Nguyên Nhân" >NGUYÊN  NHÂN</h3>
            <div>
                <asp:Label ID="lblNguyenNhanC3" key="NguyenNhanC3" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelNguyenNhanC3" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtNguyenNhanC3" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button13"  key="NguyenNhanC3" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="NguyenNhanC3" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
             <h2 id="E1" key="E1" title="Phạm Vi Bảo Hiểm" >PHẠM  VI  BẢO  HIỂM</h3>
            <div>
                <asp:Label ID="lblPhamViBaoHiemE1PR" key="PhamViBaoHiemE1PR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelPhamViBaoHiemE1PR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtPhamViBaoHiemE1PR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button14"  key="PhamViBaoHiemE1PR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="PhamViBaoHiemE1PR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
             <h2 id="PhamViMucDoThietHaiD1" key="PhamViMucDoThietHaiD1" title="Phạm Vi Và Mức Độ Thiệt Hại" >PHẠM  VI  VÀ  MỨC  ĐỘ  THIỆ T HẠI</h3>
            <div>
                <asp:Label ID="lblPhamViMucDoThietHaiD1" key="PhamViMucDoThietHaiD1" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelPhamViMucDoThietHaiD1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtPhamViMucDoThietHaiD1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button15"   key="PhamViMucDoThietHaiD1" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="PhamViMucDoThietHaiD1" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="G" key="G" title="Đơn Bảo Hiểm Khác" >ĐƠN  BẢO  HIỂM  KHÁC</h3>
            <div>
                <asp:Label ID="lblDonBaoHiemKhacG" key="DonBaoHiemKhacG" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelDonBaoHiemKhacG" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtDonBaoHiemKhacG" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button16"   key="DonBaoHiemKhacG" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="DonBaoHiemKhacG" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
            <h2 id="H" key="H" title="Giá Trị Thu Hồi" >GIÁ  TRỊ  THU  HỒI</h3>
            <div>
                <asp:Label ID="lblGiaTriThuHoiH" key="GiaTriThuHoiH" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGiaTriThuHoiH" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGiaTriThuHoiH"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button17"  key="GiaTriThuHoiH" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="GiaTriThuHoiH" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        
        <div class="box" >
             <h2 id="TheQuyenTruyDoi" key="TheQuyenTruyDoi" title="Giá Trị Thu Hồi" >THẾ  QUYỀN  TRUY  ĐÒI  BÊN  THỨ  BA</h3>
            <div>
                <asp:Label ID="lblTheQuyenTruyDoi" key="TheQuyenTruyDoi" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTheQuyenTruyDoi" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTheQuyenTruyDoi"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button18"  key="TheQuyenTruyDoi" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="TheQuyenTruyDoi" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="box" >
            <h2 id="DuPhongBoiThuong" key="DuPhongBoiThuong" title="Dự Phòng Bồi Thường" >DỰ  PHÒNG  BỒI  THƯỜNG</h3>
            <div>
                <asp:Label ID="lblDuPhongBoiThuong" key="DuPhongBoiThuong" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelDuPhongBoiThuong" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtDuPhongBoiThuong"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button19" key="DuPhongBoiThuong" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="DuPhongBoiThuong" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
             <h2 id="TamUngBoiThuongText" key="TamUngBoiThuongText" title="Tạm Ứng Bồi Thường">TẠM  ỨNG  BỒI  THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoiThuongText" key="TamUngBoiThuongText" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoiThuongText" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoiThuongText"  CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button20"  key="TamUngBoiThuongText" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input  key="TamUngBoiThuongText" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

         <div class="head">
              <div class="head">
                <h3 style="text-align:center; font-size:25px!important; color:#006600; margin:20px 0px 0px 0">
                    ĐOẠN&nbsp; MẪU&nbsp; BÁO&nbsp; CÁO&nbsp; GIÁM&nbsp; ĐỊNH&nbsp; TIẾP&nbsp;&nbsp; THEO</h3>
                    </div>
            </div>
        
        <div class="box" >
             <h2 id="ExecutiveSummaryHIR" key="ExecutiveSummaryHIR" title="Executive Summary" >KHÁI&nbsp; QUÁT&nbsp; VỤ&nbsp; VIỆC&nbsp; VÀ&nbsp; TIẾN&nbsp; TRÌNH</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryHIR"  key="ExecutiveSummaryHIR" 
                    onclick="editField(this)"  CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelExecutiveSummaryHIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtExecutiveSummaryHIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button1" key="ExecutiveSummaryHIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="ExecutiveSummaryHIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="K" key="K" title="Claim Handling TimeLine" >QUÁ&nbsp; TRÌNH&nbsp; XỬ&nbsp; LÝ&nbsp; VÀ&nbsp; KHIẾU&nbsp; NẠI</h3>
            <div>
                <asp:Label ID="lblQuaTrinhXuLyKhieuNaiK" key="QuaTrinhXuLyKhieuNaiK" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelQuaTrinhXuLyKhieuNaiK" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtQuaTrinhXuLyKhieuNaiK" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button2" key="QuaTrinhXuLyKhieuNaiK" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="QuaTrinhXuLyKhieuNaiK" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        <div class="box" >
             <h2 id="AdjustmentIR" key="AdjustmentIR" title="Outline of Claim Adjustment" >CẬP&nbsp; NHẬT&nbsp; TIẾN&nbsp; ĐỘ&nbsp; TÍNH&nbsp; TOÁN</h3>
            <div>
                <asp:Label ID="lblAdjustmentIR" key="AdjustmentIR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelAdjustmentIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtAdjustmentIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button3" key="AdjustmentIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="AdjustmentIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
		
		<div class="box" >
              <h2 id="H1" key="H" title="Salvage" >GIÁ&nbsp; TRỊ&nbsp; THU&nbsp; HỒI</h3>
            <div>
                <asp:Label ID="lblGiaTriThuHoiHIR" key="GiaTriThuHoiHIR" onclick="editField(this)" 
                    CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGiaTriThuHoiHIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGiaTriThuHoiHIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button4" key="GiaTriThuHoiHIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="GiaTriThuHoiHIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="I" key="I" title="Interim Reserve" >CẬP&nbsp; NHẬT&nbsp; DỰ&nbsp; PHÒNG</h3>
            <div>
                <asp:Label ID="lblCapNhatDuPhongI" key="CapNhatDuPhongI" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelCapNhatDuPhongI" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtCapNhatDuPhongI" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button5" key="CapNhatDuPhongI" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="CapNhatDuPhongI" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="H2" key="TamUngBoiThuongText" title="Interim Payment">TẠM&nbsp; ỨNG&nbsp; BỒI&nbsp; THƯỜNG</h3>
            <div>
                <asp:Label ID="lblTamUngBoiThuongTextIR" key="TamUngBoithuongTextIR" 
                    onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelTamUngBoithuongTextIR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtTamUngBoithuongTextIR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button6" key="TamUngBoithuongTextIR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="TamUngBoithuongTextIR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="head">
                  <h2 style="text-align:center; font-size:25px!important; color:#006600; margin:20px 0px 0px 0">
                    ĐOẠN&nbsp; MẪU&nbsp; BÁO&nbsp; CÁO&nbsp; GIÁM&nbsp; ĐỊNH&nbsp; CUỐI&nbsp; CÙNG</h3>

            </div>
            
        <div class="box" >
              <h2 id="ExecutiveSummaryFR" key="ExecutiveSummaryFR" title="Executive Summary" >TÓM&nbsp; TẮT&nbsp; VỤ&nbsp; VIỆC</h3>
            <div>
                <asp:Label ID="lblExecutiveSummaryFR" key="ExecutiveSummaryFR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelExecutiveSummaryFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtExecutiveSummaryFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button7" key="ExecutiveSummaryFR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="ExecutiveSummaryFR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="H3" key="K" title="Claim handling Process">QUÁ&nbsp; TRÌNH&nbsp; XỬ&nbsp; LÝ&nbsp; VÀ&nbsp; KHIẾU&nbsp; NẠI</h3>
            <div>
                <asp:Label ID="lblQuaTrinhXuLyKhieuNaiKFR" key="QuaTrinhXuLyKhieuNaiKFR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelQuaTrinhXuLyKhieuNaiKFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtQuaTrinhXuLyKhieuNaiKFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button8" key="QuaTrinhXuLyKhieuNaiKFR" onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="QuaTrinhXuLyKhieuNaiKFR" type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>


        <div class="box" >
             <h2 id="C3FR" key="C3FR" title="Cause of loss">NGUYÊN&nbsp; NHÂN</h3>
            <div>
                <asp:Label ID="lblNguyenNhanC3FR" key="NguyenNhanC3FR" onclick="editField(this)" CssClass="label-edit"  runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelNguyenNhanC3FR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtNguyenNhanC3FR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button9" key="NguyenNhanC3FR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="NguyenNhanC3FR"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="E2" key="E2" title="Policy liability" >PHẠM&nbsp; VI&nbsp; BẢO&nbsp; HIỂM</h3>
            <div>
                <asp:Label ID="lblPhamViBaoHiemE2FR" key="PhamViBaoHiemE2FR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelPhamViBaoHiemE2FR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtPhamViBaoHiemE2FR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button10" key="PhamViBaoHiemE2FR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="PhamViBaoHiemE2FR"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="B1" key="B1" title="Claim amount and proposed settlement">YÊU&nbsp; CẦU&nbsp; BỒI&nbsp; THƯỜNG&nbsp; VÀ&nbsp; ĐỀ&nbsp; XUẤT&nbsp; TÍNH&nbsp; TOÁN</h3>
            <div>
                <asp:Label ID="lblYeuCauBoiThuongB1" key="YeuCauBoiThuongB1" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelYeuCauBoiThuongB1" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtYeuCauBoiThuongB1" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button11" key="YeuCauBoiThuongB1"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="YeuCauBoiThuongB1"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
              <h2 id="H4" key="H" title="Salvage" >
                GIÁ&nbsp; TRỊ&nbsp; THU&nbsp; HỒI</h3>
            <div>
                <asp:Label ID="lblGiaTriThuHoiHFR" key="GiaTriThuHoiHFR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelGiaTriThuHoiHFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtGiaTriThuHoiHFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button12" key="GiaTriThuHoiHFR"   onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="GiaTriThuHoiHFR"   type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
             <h2 id="B2" key="B2" title="Final Proposed Settlement" >
                ĐỀ&nbsp; XUẤT&nbsp; CHUNG&nbsp; CUỘC</h3>
            <div>
                <asp:Label ID="lblDeXuatChungCuocB2" key="DeXuatChungCuocB2" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelDeXuatChungCuocB2" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtDeXuatChungCuocB2" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button21" key="DeXuatChungCuocB2"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="DeXuatChungCuocB2"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div class="box" >
              <h2 id="Conclution" key="Conclution" title="Conclusion" >KẾT&nbsp; LUẬN</h3>
            <div>
                <asp:Label ID="lblKetLuanFR" key="KetLuanFR" onclick="editField(this)" CssClass="label-edit" runat="server" Width="100%" ></asp:Label>
                <asp:Panel ID="panelKetLuanFR" CssClass="panelUpdate hiden" runat="server">
                    <asp:TextBox ID="txtKetLuanFR" CssClass="hiden" TextMode="MultiLine" Height="250px" runat="server" />
                    <div style="margin-top:10px">
                        <asp:Button ID="Button22" key="KetLuanFR"  onclick="btnUpdate_Click" Text="Update" runat="server"/>
                        <input key="KetLuanFR"  type="button" value="Cancel" onclick="cancel(this)" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        </div>
    </div>
    </form>
</body>
</html>
