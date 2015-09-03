<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bordereauclaimprint.aspx.cs" Inherits="WEBSITESAVVY.Pages.bordereauclaimprint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bordereau Claim - SA Platform</title>
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
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
* {
	margin:0;
	padding:0;
}
           .headergrid
{
    color: White;
    text-align: center;
    font-weight: bold;
    border: 1px solid #CDCDCD;
    background-color: #006600;
}
      .headergrid
{
    color: White;
    text-align: center;
    font-weight: bold;
    border: 1px solid #CDCDCD;
    background-color: #006600;
}
        
    .col
    {
        padding-left: 5px; 
        vertical-align: top; 
        text-align: left
     }
      .col_giua
     {
       
        vertical-align: top; 
        text-align: center;
     }
           .col_so
     {
         padding-right: 5px; 
        vertical-align: top; 
        text-align: right;
     }
      </style>
</head>
<body>  
    <form id="form1" runat="server">
      <asp:Panel ID="Panel1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td align="right" colspan="2" style="padding-right: 15px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/header page.jpg" 
                            Height="70px"></asp:Image>   
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 16px; font-weight: bold">
                    BÁO CÁO TỔNG QUÁT TIẾN TRÌNH GIẢI QUYẾT HỒ SƠ GIÁM ĐỊNH&nbsp;<br />
                    NGÀY
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                      <asp:GridView ID="grDS" runat="server" AutoGenerateColumns="False" Width="99%" 
                          Font-Names="Times New Roman" Font-Size="14px">
                          <Columns>
                              <asp:TemplateField HeaderText="No.">
                              <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" 
                             VerticalAlign="Middle" />
                            <ItemStyle Width="3%" CssClass="col" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Claim Ref">
                               <ItemTemplate >
                            <div style="text-align:left">
                           <table style="padding-top: 1px; vertical-align: top">
                           <tr>
                           <td class="col"><strong><%# "* Tham chiếu: " %></strong> <%# Eval("TenClaim")%></td>
                           </tr>
                           <tr>
                           <td class="col"><strong><%# "* NĐBH: " %></strong> <%# Eval("TenKhachHang") %></td>
                           </tr>
                           <tr>
                           <td class="col"><strong><%# "* Vụ việc: " %></strong><%#  Eval("Brief ") %> </td>
                           </tr>
                           <tr>
                           <td class="col"><strong><%# "* Ngày tổn thất: " %></strong> <%#  Eval("DOL ") %> </td>
                           </tr>
                           </table>
                             </div>
                              </ItemTemplate>
                            <ItemStyle Width="18%" CssClass="col" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="Follower" HeaderText="Loss Adjusters" >
                              <ItemStyle CssClass="col" Width="7%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="GioTichLuy" HeaderText="Time Spent" >
                              <ItemStyle CssClass="col_giua" Width="5%" />
                              </asp:BoundField>
                              <%--<asp:BoundField DataField="K" HeaderText="Claim Review" >
                              <ItemStyle HorizontalAlign="Left" />
                              </asp:BoundField>--%>
                              <asp:TemplateField HeaderText="Claim Review">
                               <ItemTemplate >
                                <div style="text-align:left">                          
                                <asp:Label ID="lblmaLoaiDR" Visible="true" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "K") %>'></asp:Label>
                            </div>
                            </ItemTemplate> 
                                  <ItemStyle CssClass="col" Width="30%" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="DuPhongBoiThuong" HeaderText="Update Reserve">
                              <ItemStyle CssClass="col_so" Width="10%" />
                              </asp:BoundField>
                              <%--<asp:BoundField DataField="DeXuatGiamDinh" HeaderText="LA's remark" >
                              <ItemStyle HorizontalAlign="Left" />
                              </asp:BoundField>--%>
                              <asp:TemplateField HeaderText="LA's Remark">
                              <ItemTemplate >
                                <div style="text-align:left">                          
                                <asp:Label ID="lblmaLoaiDR0" Visible="true" runat="server" 
                                        Text='<%#DataBinder.Eval(Container.DataItem, "DeXuatGiamDinh") %>'></asp:Label>
                            </div>
                         </ItemTemplate>                           
                                  <ItemStyle CssClass="col" />
                              </asp:TemplateField>
                          </Columns>
                          <HeaderStyle CssClass="headergrid" Font-Size="16px" />
                          <RowStyle BorderColor="#E4E4E4" BorderStyle="None" BorderWidth="1px" />
                      </asp:GridView>
                  </td>
            </tr>
            <tr>
                <td colspan="2">
                      &nbsp;</td>
            </tr>
        </table>
    
    </div>   
     </asp:Panel>
     <div align="center">
        <asp:Button ID="btnIn" runat="server" Text="Print" onclientclick="print()" 
             CssClass="btn" />
        </div>
    </form>
</body>
</html>
