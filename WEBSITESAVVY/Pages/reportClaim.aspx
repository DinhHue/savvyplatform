<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reportClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.reportClaim" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title></title>

    <script src="../js/jquery-1.4.min.js"></script>

    <style type="text/css">
        
        @page :first {
              margin: 5mm 7.5mm 0 13mm;   
        }
        @page {
              size: A4 portrait;
              margin: 5mm 7.5mm 0 13mm;
        }
        
        body
        {
            width:980px;
            margin:0px auto;
            font-size:17px;
        }
        
        table
        {
            border: 0px;
        }
             
        .header_number td
        {
             vertical-align:middle;
             height: 10px !important;
             color:Black !important;
             text-align:center;      
             font-weight: bold; 
        }     
        .header td
        {        
             color: Black !important;
             text-align:center;      
             font-weight: bold;   
        }
    
    
        .gridview
        {
            width: 100%;
            border: 0.5px solid #CDCDCD;
            border-collapse: collapse;
        }
    
        .gridview  td 
        {
            border: 1px solid #CDCDCD;
            padding: 12px 5px 2px 5px;
            height: 43px;
            /*color: #004033;*/
            vertical-align:top;
        }
        
        .input
        {
            background: #DCDCDC;
            border: 1px solid #CDCDCD;
            padding:5px;
            color:Blue;
            display:block;
        }
        
        .field_input
        {
            background: #EBF3EB;
            color: #000080;
            padding:4px 5px 0px 7px;
            font-weight:bold;
            border: 1.5px solid #FFFFFF;
            border-bottom-color: #DCDCDC;
        }
        
        .reference
        {
            height:120px;
        }
        .reference td
        {
            font-size:15px;
            border:0px;
            height:auto;
            padding:1px;
            vertical-align:middle;
        }
    
        .center
        {
            text-align:center;
        }
        .align-right
        {
            text-align:right;
        }
        
        .align-center
        {
            text-align:center;
            margin-top: 0px;
        }
        
        .hr
        {
            height: 1px;
            background: none repeat scroll 0% 0% #008000;
            margin-bottom: 10px;
        }
        
    
        .style1
        {
            width: 168px;
        }
    
        .title_2
        {
            font-size:14px;
            font-weight:bold;
            /*text-decoration:underline; */
            font-style:italic;
        }
    
        .style2
        {
            width: 55%;
        }
    
        .footer
        {
            margin-top: 15px;
            page-break-after: always;
        }
    </style>
</head>
<body >

     <div id="exportToExcel" runat="server" style="width:99%">
        
        <div id="header">
            <div style="height:30px"></div>
            <div style="float:left; width:65%"><img src="../images/banner.jpg" width="100%" alt="" /></div>
            <div style="float:right; ">
                <div id="table_ref">
                    <table class="reference" cellpadding="0" width="250px">
                        <tr><td colspan="2"><u><i>Reference No. /Số tham chiếu</i></u></td></tr>
                        <tr><td colspan="2" ><asp:Label ID="lblSoThamChieu" runat="server" Text='RS02_' 
                                CssClass="input" ></asp:Label></td></tr>
                        <tr>
                            <td rowspan="1" class="style1"><u><i>Date of Survey /</i></u> <br /> <u><i>Ngày giám định</i></u> </td>
                            <td rowspan="1">
                                <asp:Label ID="lblNgayGiamDinh" runat="server" 
                                    CssClass="input center" Width="99px" ></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="style1"><u><i>Page No. Trang số</i></u></td>
                            <td><span id="lblTrangSo" class="input center">1/3</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <div style="text-align:center">
            <h2>PROPERTY DAMAGE ASESSMENT WORKSHEET</h2>
            <h3><i>(PHIẾU KIỂM KÊ TÀI SẢN BỊ THIỆT HẠI)</i></h3>
         </div>

         <div style="margin-bottom:30px; margin-top:5px; margin-left:-10px; margin-right:-20px; font-size:18px">
			<table width="100%" cellspacing="3px">
				<tr>
					<td class="style2"> 
                            <asp:Label ID="Label1" runat="server" Text='Policy Number:' Width="126px" ></asp:Label>
                            <asp:Label ID="lblPolicyNo" runat="server" Text='PFM/00580396' 
                            CssClass="field_input" Font-Bold="True" Width="397px" ></asp:Label> <br/> 
                        <span class="title_2">(Số hợp đồng bảo hiểm) </span></td>
					<td style="width:45%">
                        <div style="float:left; width:94px;">
                            Insurer: <br/> 
                            <span class="title_2">(Nhà bảo hiểm)</span>
                        </div>      
                        <asp:Label ID="lblNhaBaoHiem" runat="server" Text='DON VI BAO HIEM' 
                            CssClass="field_input" Width="328px" Font-Size="17px" ></asp:Label>  
                     </td>
				</tr>
				<tr>
					<td class="style2">
                        <div style="float:left; width:138px;">
                            <asp:Label ID="Label2" runat="server" Text='Claimant / Insured' Width="137px" ></asp:Label><br />
                            <span class="title_2">(Người khiếu nại / Người được bảo hiểm)</span>
                        </div> 
                        <asp:Label ID="lblNguoiKhieuNai" runat="server" 
                            Text='NGUOI KHIEU NAI' CssClass="field_input" Font-Size="17px" 
                            Width="390px" ></asp:Label><br/> 
                    </td>
					<td>Loss Adjuster      
                        <asp:Label ID="lblGiamDinhVien" runat="server" 
                            Text='GIAM DINH VIEN' CssClass="field_input" Width="318px" 
                            ForeColor="#006600" ></asp:Label><br/> 
                    <span class="title_2">(Giám định viên)</span> </td>
				</tr>
				<tr>
					<td class="style2">
						<div style="float:left; width:42%">
                            <div style="width:100px; float:left;">Date of Loss <br/> 
                                <span class="title_2">(Ngày tổn thất)</span>   
                            </div>
                            <asp:Label ID="lblNgayTonThat" 
                                    runat="server" Text='5/4/2014' CssClass="field_input align-center" 
                                    Width="110px" ></asp:Label> 
                        </div>
						<div>
                            <div style="float:left; width:168px">
                                Date of 1<span style="color:black"><sup>st</sup></span> Site-Survey<br/>
                                <span class="title_2">(Ngày giám định đầu tiên)</span>
                            </div>
                            <asp:Label ID="lblNgayGiamDinhDauTien" runat="server" Text='NGAY DAU' 
                                CssClass="field_input align-center" Width="125px" ></asp:Label>
                         </div>
					</td>
					<td>
                        <div style="float:left;width:218px;">
                            Danmage Estimate / Reverse:<br />
                            <span class="title_2">(Ước tính thiệt hại / dự phòng)</span>
                        </div>  
                        <asp:Label ID="lblDuPhongTonThat" runat="server" 
                            Text='0' CssClass="field_input align-right" Width="205px" ></asp:Label><br/>
                    </td>
				</tr>
			</table>
		</div>

        <div id="export"></div>

        <asp:GridView ID="gvLoaiHangMucDetails" runat="server" CssClass="gridview"
             AutoGenerateColumns="False" ShowFooter="false" ShowHeader="False" 
            Width="100%" OnRowDataBound="gvgvLoaiHangMucDetails_OnRowDataBound" 
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
                <asp:TemplateField HeaderStyle-Width="35%" ItemStyle-Width="35%" >
                    <ItemTemplate>
                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoaiHangMuc") %></b></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                <asp:BoundField HeaderStyle-Width="8%" ItemStyle-Width="8%" />
            
                <asp:TemplateField>
                    <ItemTemplate>

                        <asp:Repeater ID="repeaterChild" runat="server"  >
                            <ItemTemplate>
                                <tr>
                                    <td align="center"><%# Container.ItemIndex + 1 %></td>
                                    <td style="width:35%" ><%# Eval("TenHangMuc") %></td>
                                    <td style="width:10%" align="center"><%# Eval("SoLuong") %></td>
                                    <td style="width:8%" align="center"><%# Eval("TenDonVi") %></td>
                                    <td ><%# Eval("GhiChu") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#006600" ForeColor="White" />
        </asp:GridView>
    </div>
    


    <script type="text/javascript">

        function prePrintPage() {

            var tableLoad = document.getElementById("gvLoaiHangMucDetails");
            var title1 = tableLoad.rows[0].innerHTML;
            var title2 = tableLoad.rows[1].innerHTML;

            //delete title
            tableLoad.deleteRow(1);
            tableLoad.deleteRow(0);
            //alert(table.rows.length);
            var rowcount  = tableLoad.rows.length;
            var itemPage1 = 14;
            var itemPage  = 20;

            var numtable = Math.ceil((rowcount - itemPage1) / itemPage);

            //Page 1
            var table = $('<table rule="all" cell-padding="0"></table>').addClass('gridview');
            table.append("<tr class='header_number'>" + title1 + "</tr>");
            table.append("<tr class='header'>" + title2 + "</tr>");
            for (var j = 0; j < itemPage1; j++) {
                var row = "";
                if (j < rowcount) {
                    row = $('<tr></tr>').addClass('bar').append(tableLoad.rows[j].innerHTML);
                }
                else {
                    row = $('<tr></tr>').addClass('bar').append("<td></td><td></td><td></td><td></td><td></td>");
                }
                table.append(row);
            }

            $("#export").append(table);

            var footer = '<div class="footer" style="margin-top:20px"><img src="../images/footer_pdf.jpg" width="100%" alt="" /></div>';

            $("#export").append(footer);
            //$("#export").append("<br/>");
            
            //end page 1

            for (var i = 0; i < numtable; i++) {
                var table = $('<table rule="all" cell-padding="0"></table>').addClass('gridview');
                table.append("<tr class='header_number'>" + title1 + "</tr>");
                table.append("<tr class='header'>" + title2 + "</tr>");
                for (var j = 0; j < itemPage; j++) {
                    var row = "";
                    if ((i * itemPage + j) + itemPage1 < rowcount) {
                        row = $('<tr></tr>').addClass('bar').append(tableLoad.rows[(i * itemPage + j) + itemPage1].innerHTML);
                    }
                    else {
                        row = $('<tr></tr>').addClass('bar').append("<td></td><td></td><td></td><td></td><td></td>");
                    }
                    table.append(row);
                }
                var table_ref = document.getElementById("table_ref");
                var num = table_ref.getElementsByTagName("span")[2];
                $(num).html((i+2) + "/" + (numtable+1));

                $("#export").append("<div><table><tr><td style='width:80%; heigth:100px;'>" + table_ref.innerHTML + "</td><td><img src='../images/logo.png'  /></td></tr></table></div>");
                $("#export").append("<div class='hr'></div>");
                $("#export").append(table);
                $("#export").append(footer);
                //$("#export").append("<br/>");
            }

            var lblTrangSo = document.getElementById("lblTrangSo");
            $(lblTrangSo).html("1/" + (1 + numtable));

            $("#gvLoaiHangMucDetails").html('');
        }

        prePrintPage();

        window.print();

    </script>
</body>
</html>