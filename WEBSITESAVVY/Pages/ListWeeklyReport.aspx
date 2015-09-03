<%@ Page Title="List Weekly Report - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="ListWeeklyReport.aspx.cs" Inherits="WEBSITESAVVY.Pages.ListWeeklyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<span runat="server" id="tabid" style="display:none">weekly</span>

    <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">LIST Weekly&nbsp; Report</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
<table align="center"  >    
    <tr>
        <td align="center" colspan="2">
            <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click1" 
                Text="Thêm Weekly Report Mới" CssClass="btn" />
        &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/Pages/BordereauClaim.aspx" CssClass="input">Show Claim Bodereau</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
                    <asp:GridView ID="gvDSWR" runat="server" CssClass="gridtable" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="ID_WeekLyReport" 
                        onpageindexchanging="gvDSTimeSheet_PageIndexChanging" 
                        onrowcommand="gvDSWR_RowCommand" onrowupdating="gvDSWR_RowUpdating" 
                        onselectedindexchanged="gvDSWR_SelectedIndexChanged" 
                        Font-Names="Times New Roman" Font-Size="16px" PageSize="25">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                             <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenClaim" HeaderText="Tham Chiếu" >
                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenKhachHang" HeaderText="NĐBH">
                            <ItemStyle Width="300px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="GĐV Chính" >
                            <ItemStyle Width="200px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GioTichLuy" HeaderText="Thời Lượng">
                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="Update" HeaderText="Cập nhật" 
                                Text="Select" >
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:ButtonField>
                            <asp:CommandField HeaderText="Chi Tiết" ShowSelectButton="True" 
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
