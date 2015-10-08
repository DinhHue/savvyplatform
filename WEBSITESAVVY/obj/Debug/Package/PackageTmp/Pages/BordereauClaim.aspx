<%@ Page Title="Bordereau Claim - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="BordereauClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.BordereauClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .col
    {
        padding-left: 5px; 
        vertical-align: top; 
        text-align: left
     }
     .col_so
     {
         padding-right: 5px; 
        vertical-align: top; 
        text-align: right;
     }
      .col_giua
     {
       
        vertical-align: top; 
        text-align: center;
     }
           .headergrid
{
    color: White;
    text-align: center;
    font-weight: bold;
    border: 1px solid #CDCDCD;
    background-color: #006600;
}
    </style>
    <style type="text/css">
    .header
    {      
         color:White;
         background:#060;
         text-align:center;      
         font-weight: bold;   
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
    
    .tDnD_whileDrag {
        background-color: #DCDCDC;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">CLAIM&nbsp; BORDEREAU</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
          <table width="100%">             
              <tr>
                  <td class="lefthome">
                      <asp:Label ID="Label2" runat="server" Text="Select Insurer :"></asp:Label>
                  </td>
                  <td class="righthome">
                      <asp:DropDownList ID="drNBH" runat="server">
                      </asp:DropDownList>
&nbsp;&nbsp;
                      <asp:Button ID="btnView" runat="server" CssClass="btn" Text="View" 
                          onclick="btnView_Click" />
                  &nbsp;<asp:Button ID="btnXuatPDF" runat="server" CssClass="btn" Text="Export PDF" 
                          onclick="btnXuatPDF_Click" />
                  </td>
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
                                <asp:Label ID="lblmaLoaiDR" Visible="true" runat="server" 
                                        Text='<%#DataBinder.Eval(Container.DataItem, "K") %>'></asp:Label>
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
          </table>
      </div></div>
      </div>
</asp:Content>
