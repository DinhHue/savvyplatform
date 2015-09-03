<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewWR.aspx.cs" Inherits="WEBSITESAVVY.Pages.ViewWR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ViewRP - SA Platform</title>
     <link rel="stylesheet" type="text/css" href="../Styles/CssForm.css" />
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../css/claim.css"/>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../Content/themes/default/linkbutton.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery.min.js"></script>
	<script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../Content/themes/default/menu.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function print() {
                var prtContent = document.getElementById('<%= Panel1.ClientID %>');
                prtContent.border = 0; //set no border here
                var WinPrint = window.open('', '', 'letf=100,top=100,width=900,height=500,toolbar=0,scrollbars=1,status=0,resizable=1');
                WinPrint.document.write(prtContent.outerHTML);
                WinPrint.document.close();
                WinPrint.focus();
                WinPrint.print();
                WinPrint.close();
            }
      </script>
       <script type="text/javascript">
           function closeDialog() {
               $('.panel-tool-close').trigger("click");
           }

           $(document).ready(function () {
               var tabID = $("#MainContent_tabid").html();
               $("#" + tabID).addClass("active");
           });

        </script>
    <style type="text/css">
        .style1
        {
            font-weight: 700;
        }
        .header
        {      
            background-color:#006600;
             color:White;
             text-align:center;      
             font-weight: bold; 
             border: 1px solid #CDCDCD ;  
        }
        
        table .gridtable th {
	        border: 1px solid #CDCDCD ;
            padding: 5px;
        }
        table .gridtable td {
	        border: 1px solid #CDCDCD;
            padding: 5px;
        }
        *{
	    margin:0;
	    padding:0;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
      <div align="center">
    
        <asp:Panel ID="Panel1" runat="server">
            <table align="center">
                <tr>
                    <td colspan="3" align="right" >
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/header page.jpg" 
                            Height="70px"></asp:Image>

                       </td>
                </tr>
                <tr>
                    <td colspan="3" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 22px; text-align: center; font-weight: bold">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 22px; text-align: center; font-weight: bold">
                        <asp:Label ID="Label1" runat="server" Text="CLAIM SUMMARY WEEKLY REPORT"></asp:Label>
                        <br />
                        <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Vụ Việc (Description)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        GĐV Thụ Lý (<em>Adjusters in charge</em>) </td>
                </tr>
                <tr>
                    <td style="border: thin solid #EEEEEE; font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; padding-left: 10px; width: 450px; margin-left: 30px;">
                      
                         <strong>Brief</strong>:
                         <asp:Label ID="lblVuViec" runat="server"></asp:Label>
                         <br />
                         <strong>Location of loss</strong>:
                         <asp:Label ID="lblDiaChi" runat="server"></asp:Label>
                        
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="row" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px">
                        <asp:Label ID="lblGDV" runat="server"></asp:Label>
                        &nbsp;/&nbsp;<em>Mobile</em> :&nbsp;
                        <asp:Label ID="lblDienThoaiGDV" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                        <br />
                        <em>Email</em> :
                        <asp:Label ID="lblEmailGDV" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                    </td>
                </tr>
                </table>
              
                 <table align="center">
                
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Thông Tin HĐBH (Policy)</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Đại Diện NĐBH <em>(Insured&#39;s Contact Person) </em>
                    </td>
                </tr>
                <tr>
                    <td class="row" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px">
                         <strong>Policy No.</strong>:
                        <asp:Label ID="lblsoHDBH" runat="server"></asp:Label>
                        <br />
                        <strong>Period</strong>:
                        <asp:Label ID="lblHieuLuc" runat="server"></asp:Label>
                        <br />
                      
                    </td>
                    <td align="center">
                        &nbsp;</td>
                    <td class="row" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px">
                        <strong>Insured</strong>:
                        <asp:Label ID="lblNDBH" runat="server" CssClass="style1"></asp:Label>
                        <br />
                        <asp:Label ID="lblDaiDienNDBH" runat="server"></asp:Label>
                        &nbsp;<br />
                        <em>Email</em> :
                        <asp:Label ID="lblEmailNguoiLienHe" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                        &nbsp;/ <em>Mobile</em> :
                        <asp:Label ID="lblDienThoaiDaiDien" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                    </td>
                </tr>
                </table>
     
            
                  <table align="center">
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Tiến Trình &amp; Vướng Mắc (<em>Pending issues</em>)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Đề Xuất của GĐV (<em>Adjuster&#39;s Proposal</em>)</td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px;">
                        <asp:Label ID="lblTienTrinhVaVuongMac" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px;">
                        <asp:Label ID="lblDeXuatGDV" runat="server"></asp:Label>
                    </td>
                </tr>
               </table>
                  <table align="center">
                 <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Dự Phòng Tổn Thất (<em>Loss reserve</em>)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 14px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Thời Lượng Phát Sinh (<em>Gross Timespent</em>)</td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px;">
                        <asp:Label ID="lblDuPhongTonThat" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; padding-left: 10px; width: 450px; margin-left: 30px;">
                        <asp:Label ID="lblThoiLuongPhatSinh" runat="server"></asp:Label>
                        &nbsp;giờ (hours)</td>
                </tr>           
            </table>
                  <table align="center" width="940px">          
                       <tr style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;">
                    <td align="left">
                        Công Tác Yêu Cầu Hồ Sơ <em>(Document Request)</em></td>
                </tr>

                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 12px; text-align: justify; vertical-align: top; border: thin solid #EEEEEE; ">
                        <asp:GridView ID="gvDRList" runat="server" AutoGenerateColumns="False" 
                            onrowcreated="gvDRList_RowCreated" 
                            ShowHeader="False" Width="100%" onrowdatabound="gvDRList_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div style="text-align:center">
                                            <asp:Label ID="lblSTT" runat="server" Font-Bold="true" Text=""></asp:Label>
                                            <asp:Label ID="lblmaLoaiDR" runat="server" 
                                                Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiDR") %>' Visible="false"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoai")%></b></span>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Repeater ID="repeaterChild" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td align="center">
                                                        <%# Container.ItemIndex + 1 %>
                                                    </td>
                                                     <td align="left" width="65%"><%# Eval("NameItem")%> <%# "<" %> <%# Eval("TenDR")%> <%# ">" %></td>
                                                    <td align="center">
                                                        <%# "<" %><%#  Eval("TinhTrang ") %><%# " " %><%# Eval(" NgayNhan")%><%# ">" %>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                 </table>
            <br />
                <table >
                <tr>
                <td align="left" 
                        
                        style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;"> 
                    Chi Tiết Timesheet Giám Định <em>(Detail Timesheet&#39; Claim)</em></td>
                </tr>
                    <tr>
                        <td align="center" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: 10px;">
                            <asp:Label ID="lblThongBaoTS" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
            <tr>
            <td  align="center" >
                    <asp:GridView ID="gvDSTimeSheet" runat="server" AutoGenerateColumns="False" 
                        onrowdatabound="gvDSTimeSheet_RowDataBound" Width="930px" 
                        ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" DataFormatString="{0:yyyy-MM-dd}">
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS">
                            <ItemStyle HorizontalAlign="Left" Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" HeaderText="Diễn Giải">
                            <ItemStyle Width="250px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="Giám Định Viên">
                            <ItemStyle Width="150px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time-Spent">
                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="Green" Font-Names="Times New Roman" 
                            ForeColor="White" Font-Size="16px" BorderStyle="None" />
                        <RowStyle Font-Names="Times New Roman" Font-Size="12px" VerticalAlign="Top" />
                    </asp:GridView>
            </td>
            </tr>
            </table>
        </asp:Panel>
    
    </div>
    <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
        <asp:Button ID="btnIn" runat="server" Text="Print" onclientclick="print()" 
            CssClass="btn" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a href="javascript:void(0)" onclick="$('#w_CapNhatWR').window('open')" >Update Adjuster's Proposal </a>
    
    </div>
     <div id="w_CapNhatWR" class="easyui-window" title="Update Adjuster's Proposal" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Pages/updateweeklyreport.aspx" ></iframe>
    </div>
    <div style="height: 50px">
    </div>
    </form>
</body>
</html>
<noembed>