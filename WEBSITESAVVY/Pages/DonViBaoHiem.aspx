<%@ Page Title="Subsidiary - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="DonViBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Pages.DonViBaoHiem" %>
<%@ Register src="../Uc/UcDaiDienDonViBaoHiemMoi.ascx" tagname="UcDaiDienDonViBaoHiemMoi" tagprefix="uc1" %>
<%@ Register src="../Uc/UcDonViBaoHiem.ascx" tagname="UcDonViBaoHiem" tagprefix="uc2" %>
<%@ Register src="../Uc/NhaBaoHiem.ascx" tagname="NhaBaoHiem" tagprefix="uc3" %>
<%@ Register src="../Uc/UcDonViBaoHiemMoi.ascx" tagname="UcDonViBaoHiemMoi" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <%--<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />--%>
    <%--<style type="text/css">
        .TabContainer1
    {
        font-family: 'Times New Roman', Times, serif;
        width:100%;
        text-align:center;
    }
   
    </style>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span runat="server" id="tabid" style="display:none">insurer</span>
    <%--<div style="font-family: 'Times New Roman', Times, serif; font-size: 16px; text-align: left; padding-left: 30px; padding-right: 30px;" 
        align="left">--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">insurer&nbsp; infomation</h1>
        </div>
      </div>
    </div>
  </div>
     <%-- content main --%>
     <div align="center">
&nbsp;<ajaxToolkit:TabContainer ID="TabContainer1" runat="server" 
        ActiveTabIndex="1" Width="90%" >
                    <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                        <HeaderTemplate>
                            Nhà Bảo Hiểm                            
                        </HeaderTemplate>
                        <ContentTemplate>
                         <div class="input-group ill-input initialised" style="padding: 10px">
                             <uc3:NhaBaoHiem ID="NhaBaoHiem1" runat="server" />
                        </div>
                       
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
                        <HeaderTemplate>
                            Đơn Vị Bảo Hiểm
                        </HeaderTemplate>
                        <ContentTemplate>
                        <p align="right" style="padding-right: 50px">
                            <asp:HyperLink ID="HyperLink3" runat="server" Font-Italic="True" 
                                Font-Underline="True" NavigateUrl="~/Pages/DonViBaoHiemMoi.aspx">Thêm đơn vị bảo hiểm mới hoặc khách hàng cá nhân</asp:HyperLink>
                            </p>
                         <uc2:UcDonViBaoHiem ID="UcDonViBaoHiem1" runat="server" />
                         <uc4:UcDonViBaoHiemMoi ID="UcDonViBaoHiemMoi2" runat="server" />
                            
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                     <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel3" Width="100%">
                        <HeaderTemplate>
                            Đại Diện Bảo Hiểm
                        </HeaderTemplate>
                        <ContentTemplate>
                        <div class="input-group ill-input initialised" style="padding: 10px">
                         <asp:Label ID="Label1" runat="server" Text="Bảo hiểm :" Font-Bold="False"></asp:Label> <asp:DropDownList ID="drBH" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="drBH_SelectedIndexChanged" Width="300px">
                                </asp:DropDownList>
                                  <asp:Label ID="Label2" runat="server" Text="Đơn vị bảo hiểm :" Font-Bold="False"></asp:Label>
                                  <asp:DropDownList ID="drDV" runat="server" Width="300px">
                                </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnXem" runat="server" onclick="btnXem_Click" Text="Xem" 
                                    Width="68px" CssClass="btn"/></div>
                        <div class="input-group ill-input initialised" style="padding: 10px">
                            <asp:GridView ID="grDaiDienBH" runat="server" AutoGenerateColumns="False" 
                        Width="80%" Font-Size="16px" Font-Underline="False" CssClass="gridtable">
                        <Columns>
                            <asp:BoundField DataField="TenNguoiDaiDien" HeaderText="Họ Tên" >
                            <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PhongBan" HeaderText="Phòng Ban" >
                            <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ChucVu" HeaderText="Chức Vụ" >
                            <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" >
                            <ItemStyle Width="20%" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#006600" ForeColor="White" Font-Bold="False" 
                            Font-Names="Times New Roman" />
                        <RowStyle Font-Bold="False" Font-Names="Times New Roman" />
                    </asp:GridView></div>
                        <div class="input-group ill-input initialised" style="padding: 10px">
                            <uc1:UcDaiDienDonViBaoHiemMoi ID="UcDaiDienDonViBaoHiemMoi1" runat="server" />
                        </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
	</div>
</asp:Content>
