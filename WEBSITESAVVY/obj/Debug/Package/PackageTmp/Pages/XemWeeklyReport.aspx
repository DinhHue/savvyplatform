<%@ Page Title="View Weekly Report - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="XemWeeklyReport.aspx.cs" Inherits="WEBSITESAVVY.Pages.XemWeeklyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>WEEKLY REPORT</title>
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <%-- <script type="text/javascript">
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
    </script>--%>
    <style type="text/css">
                             
    .header
    {      
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
        </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Weekly&nbsp; Report</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">

            <table align="center">
                <tr>
                    <td colspan="3" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: 22px; text-align: center; font-weight: bold">
                        <asp:Label ID="Label1" runat="server" Text="CLAIM SUMMARY WEEKLY REPORT"></asp:Label>
                        <br />
                        <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Vụ Việc (Description of Loss)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        GĐV Thụ Lý (<em>Adjusters in charge</em>) </td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px" 
                        rowspan="1">
                        <strong>Vụ việc (Brief):</strong>
                        <asp:Label ID="lblVuViec" runat="server"></asp:Label>
                        <br />
                        <strong>Địa điểm tổn thất (Location of loss):</strong>&nbsp;<asp:Label ID="lblDiaChi" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px" 
                        rowspan="1">
                        <asp:Label ID="lblGDV" runat="server"></asp:Label>
                        &nbsp;/&nbsp;<em>Mobile</em> :&nbsp;
                        <asp:Label ID="lblDienThoaiGDV" runat="server" Font-Italic="True" 
                            Font-Underline="True" ForeColor="#0000CC"></asp:Label>
                        <br />
                        <em>Email</em> :
                        <asp:Label ID="lblEmailGDV" runat="server" Font-Italic="True" 
                            Font-Underline="True" ForeColor="#0000CC"></asp:Label>
                    </td>
                </tr>
               <%--<tr>
                    <td height="5px">
                        &nbsp;</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td height="5px">
                        &nbsp;</td>
                </tr>--%>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px ; font-weight: bold;">
                        HĐBH (Policy No.)</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        NĐBH <em>(Insured&#39;s Contact Person) </em></td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                          <strong>Số HĐBH (Policy Number)</strong> :
                          <asp:Label ID="lblsoHDBH" runat="server"></asp:Label>
                          <br />
                          <strong>Hiệu lực (Period)</strong> :
                        <asp:Label ID="lblHieuLuc" runat="server"></asp:Label>
                        <br />
                        <br />
                        
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                        <strong>NĐBH (Insured) </strong>:&nbsp;<asp:Label ID="lblNDBH" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblDaiDienNDBH" runat="server"></asp:Label>
                        &nbsp;<br /> <em>Email</em> :
                        <asp:Label ID="lblEmailNguoiLienHe" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                        &nbsp;/ <em>Mobile</em> :
                        <asp:Label ID="lblDienThoaiDaiDien" runat="server" Font-Italic="True" 
                            Font-Underline="False" ForeColor="#0000CC"></asp:Label>
                    </td>
                </tr>
            <%--  <tr>
                    <td height="5px">
                        &nbsp;</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td height="5px">
                        &nbsp;</td>
                </tr>--%>
               
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Tiến Trình Giám Định (<em>Pending issues</em>)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Đề Xuất Của GĐV (<em>Adjuster&#39;s Proposal</em>)</td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                        <asp:Label ID="lblTienTrinhVaVuongMac" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                        <asp:Label ID="lblDeXuatGDV" runat="server"></asp:Label>
                    </td>
                </tr>
               <%-- <tr>
                    <td height="5px">
                        &nbsp;</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td height="5px">
                        &nbsp;</td>
                </tr>--%>
                 <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Dự Phòng Tổn Thất&nbsp; (<em>Loss reserve</em>)</td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; color: #FFFFFF; text-align: left; background-color: #006600; width: 450px; padding-left: 10px; font-weight: bold;">
                        Thời Lượng Phát Sinh (<em>Gross Timespent</em>)</td>
                </tr>
                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                        <asp:Label ID="lblDuPhongTonThat" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; padding-left: 10px; width: 450px">
                        <asp:Label ID="lblThoiLuongPhatSinh" runat="server"></asp:Label>
                        &nbsp;giờ (hour)</td>
                </tr>
               <%--<tr>
                    <td height="5px">
                        &nbsp;</td>
                    <td width="5px">
                        &nbsp;</td>
                    <td height="5px">
                        &nbsp;</td>
                </tr>
         --%>
            
                       <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;" 
                               colspan="3" align="left">
                        Công Tác Yêu Cầu Hồ Sơ <em>(Requested documents)</em></td>
                </tr>

                <tr>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: justify; vertical-align: top; border: thin solid #CCCCCC; " 
                        colspan="3">
                        <asp:GridView ID="gvDRList" runat="server" AutoGenerateColumns="False" 
                            onrowcreated="gvDRList_RowCreated" onrowdatabound="gvDRList_RowDataBound" 
                            ShowHeader="False" Width="930px">
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
                <table align="center">
                <tr>
                <td align="left" 
                        
                        style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;"> 
                    Chi Tiết Timesheet giám định <em>(Detail Timesheet Adjust)</em></td>
                </tr>
                    <tr>
                        <td align="center" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: 10px;">
                            <asp:Label ID="lblThongBaoTS" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
            <tr>
            <td>
                <asp:GridView ID="gvDSTimeSheet" runat="server" AutoGenerateColumns="False" 
                    Width="930px" ShowFooter="True">
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
                        <ItemStyle Width="250px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DienGiaiChiTiet" HeaderText="Diễn Giải">
                        <ItemStyle Width="250px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TimeIssue" HeaderText="Time-Spent">
                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenGDV" HeaderText="Giám Định Viên">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#006600" ForeColor="White" />
                    <HeaderStyle BackColor="Green" Font-Names="Times New Roman" 
                        ForeColor="White" Font-Size="16px" BorderStyle="None" />
                    <RowStyle Font-Names="Times New Roman" Font-Size="14px" />
                </asp:GridView>
            </td>
            </tr>
            </table>
        </asp:Panel>
    
    </div>
     <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
        <asp:Button ID="btnIn" runat="server" Text="Print" onclick="btnIn_Click" 
             CssClass="btn" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnXemDS" runat="server" Text="Xem Report Khác" 
                    onclick="btnXemDS_Click" CssClass="btn" />
    
    </div>
    </div>
    </div>
    </div>
</asp:Content>
