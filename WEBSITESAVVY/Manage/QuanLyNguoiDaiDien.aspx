<%@ Page Title="Đại Diện NBH" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDaiDien.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyNguoiDaiDien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
        <tr>
            <td class="headermanager" colspan="2">
                QUẢN LÝ NGƯỜI ĐẠI DIỆN</td>
        </tr>
        <tr>
            <td class="leftmanager" width="20%">
                <asp:Label ID="Label2" runat="server" Text="Tên đại diện :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textEntry"></asp:TextBox>
&nbsp;<asp:Button ID="btntimkiem" runat="server" CssClass="btn" Text="Tìm" Width="60px" />
            &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Pages/DaiDienDonViBaoHiem.aspx">Đại Diện Mới</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
               <table align="center" width="100%">
                        <tr>
                            <td  class="leftmanager" width="30%">
                                <asp:Label ID="Label1" runat="server" Text="Bảo hiểm :" Font-Bold="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="left" class="rightmanager">
                                <asp:DropDownList ID="drBH" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="drBH_SelectedIndexChanged" Width="300px">
                                </asp:DropDownList>
                            &nbsp; </td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td  class="leftmanager" >
                                <asp:Label ID="Label6" runat="server" Text="Đơn vị bảo hiểm :" 
                                    Font-Bold="False"></asp:Label>
                            </td>
                            <td align="left" class="rightmanager">
                                <asp:DropDownList ID="drDV" runat="server" Width="300px">
                                </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnXem" runat="server" onclick="btnXem_Click" Text="Xem" 
                                    Width="68px" CssClass="btn"/>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                       
                        <tr >
                            <td colspan="3" align="center">
                                <asp:GridView ID="grDaiDienBH" runat="server" AutoGenerateColumns="False" 
                                    Width="80%" Font-Size="16px" Font-Underline="False" 
                                    DataKeyNames="ID_DaiDien" onrowdeleting="grDaiDienBH_RowDeleting" 
                                    onselectedindexchanged="grDaiDienBH_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="ID_DaiDien" HeaderText="ID" />
                                        <asp:BoundField DataField="TenNguoiDaiDien" HeaderText="Họ Tên" 
                                            ItemStyle-Width="30%" >
<ItemStyle Width="30%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PhongBan" HeaderText="Phòng Ban" 
                                            ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ChucVu" HeaderText="Chức Vụ" ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" 
                                            ItemStyle-Width="10%" >
<ItemStyle Width="10%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <HeaderStyle BackColor="#006600" ForeColor="White" Font-Bold="False" 
                                        Font-Names="Times New Roman" />
                                    <RowStyle Font-Bold="False" Font-Names="Times New Roman" />
                                </asp:GridView>
                            </td>
                        </tr>                      
                      
                    </table>
                
                </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Panel ID="Panel1" runat="server">
              
                <table id="tblCapNhat" class="tablemanager">
                    <tr>
                        <td align="center" class="headermanager" colspan="2">
                            <asp:Label ID="Label9" runat="server" Text="Cập nhật thông tin đại diện"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager" width="20%">
                            <asp:Label ID="Label8" runat="server" Text="ID :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:Label ID="lblID" runat="server" Font-Bold="True" Font-Italic="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label3" runat="server" Text="Họ tên :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtHoTen" runat="server" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label4" runat="server" Text="Phòng ban :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtphongban" runat="server" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label5" runat="server" Text="Chức vụ :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtchucvu" runat="server" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label11" runat="server" Text="Điện thoại :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtdienthoai" runat="server" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label7" runat="server" Text="Email :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtemail" runat="server" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="left" class="rightmanager">
                            <asp:Button ID="btnCapNhat" runat="server" CssClass="btn" Text="Cập nhật" 
                                onclick="btnCapNhat_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
