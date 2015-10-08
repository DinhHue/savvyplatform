<%@ Page Title="New Subsidiary - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="DonViBaoHiemMoi.aspx.cs" Inherits="WEBSITESAVVY.Pages.NhaBaoHiemMoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="ambitios_container_16">
    <div class="ambitios_content">        
        <div class="ambitios_wrapper" align="center">
            <div align="center">
                 <asp:Panel ID="Panel1" runat="server" GroupingText="New Subsidiary" Width="60%">   
                <table align="center" class="tablemanager">
                    <tr>
                        <td width="30%" align="left" colspan="3" 
                            style="color: #CC0000; font-style: italic; padding-left: 10px; font-size: 12px; font-family: 'Times New Roman', Times, serif;">
                            (*) : Bắt buộc phải chọn hoặc nhập thông tin</td>
                    </tr>
                    <tr>
                        <td class="leftmanager" width="30%">
                            <asp:Label ID="Label2" runat="server" Font-Bold="False" Text="Tên đơn vị :"></asp:Label>
                        </td>
                        <td class="rightmanager" colspan="2">
                            <asp:TextBox ID="txtTendonvi" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                            (*)</td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label3" runat="server" Text="Nhà bảo hiểm :" Font-Bold="False"></asp:Label>
                        </td>
                        <td class="rightmanager" colspan="2">
                            <asp:DropDownList ID="drCTYTong" runat="server" Width="100%" 
                                CssClass="input">
                            </asp:DropDownList>
                            &nbsp;(*)</td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label4" runat="server" Text="Địa chỉ :" Font-Bold="False"></asp:Label>
                        </td>
                        <td colspan="2" class="rightmanager">
                            <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label5" runat="server" Text="Điện thoại :" Font-Bold="False"></asp:Label>
                        </td>
                        <td colspan="2" class="rightmanager">
                            <asp:TextBox ID="txtDienThoai" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label6" runat="server" Text="Fax :" Font-Bold="False"></asp:Label>
                        </td>
                        <td colspan="2" class="rightmanager">
                            <asp:TextBox ID="txtFax" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label7" runat="server" Text="WebSite :" Font-Bold="False"></asp:Label>
                        </td>
                        <td colspan="2" class="rightmanager">
                            <asp:TextBox ID="txtWebsite" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label8" runat="server" Text="Mã Hóa :" Font-Bold="False"></asp:Label>
                        </td>
                        <td colspan="2" class="rightmanager">
                            <asp:TextBox ID="txtMaHoa" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                            <asp:Label ID="txtThongBaoLoiMaHoa" runat="server" ForeColor="Red" 
                                Font-Bold="False"></asp:Label>
                            (*)</td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label9" runat="server" Text="Mã Số Thuế :" Font-Bold="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtMaSoThue" runat="server" 
                                CssClass="input" Width="80%"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            &nbsp;</td>
                        <td class="rightmanager">
                            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" 
                                Width="132px" CssClass="btn" />
                            <asp:Label ID="txtThemThanhCong" runat="server" Font-Bold="False"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </asp:Panel>
  </div>
  </div>
  </div>
  </div>
</asp:Content>
