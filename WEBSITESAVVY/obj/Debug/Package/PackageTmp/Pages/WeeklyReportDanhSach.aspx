<%@ Page Title="List Weekly Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WeeklyReportDanhSach.aspx.cs" Inherits="WEBSITESAVVY.Pages.WeeklyReportDanhSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
           <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
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
    <table align="center" width="100%"  >
    <tr>
        <td align="center" colspan="2">
            <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click1" 
                Text="Thêm Weekly Report Mới" BackColor="#003300" ForeColor="White" />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
                    <asp:GridView ID="gvDSWR" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="ID_WeekLyReport" 
                        onpageindexchanging="gvDSTimeSheet_PageIndexChanging" 
                        onrowcommand="gvDSWR_RowCommand" onrowupdating="gvDSWR_RowUpdating" 
                        onselectedindexchanged="gvDSWR_SelectedIndexChanged" 
                        Font-Names="Times New Roman" Font-Size="16px" PageSize="25" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                             <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
<asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
</asp:BoundField>
                            <asp:BoundField DataField="TenClaim" HeaderText="Case Name" >
                            </asp:BoundField>
                            <asp:BoundField DataField="TenKhachHang" HeaderText="Insured">
                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="Loss Adjuster" >
                            <ItemStyle Width="300px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GioTichLuy" HeaderText="Time Spent">
                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="Update" HeaderText="Update" 
                                Text="Select" >
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:ButtonField>
                            <asp:CommandField HeaderText="Detail" ShowSelectButton="True" 
                                SelectText="Chi Tiết" >
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" Font-Size="16px" Height="30px" 
                            HorizontalAlign="Center" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
                </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</div>
</div>
</div>
</asp:Content>
