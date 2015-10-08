<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="DanhMucThietHai.aspx.cs" Inherits="WEBSITESAVVY.Pages.DanhMucThietHai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">SUMMARY&nbsp; OF&nbsp; LOSS</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
                                  
                        
    <table class="tablemanager">
    <tr>
            
            <td align="center" 
                style="font-family: 'Times New Roman', Times, serif">
                <table class="tablemanager">
                    <tr>
                        <td colspan="2" align="center" class="headermanager">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                Text="Thêm Danh Mục Thiệt Hại"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager">
                            <asp:Label ID="Label4" runat="server" Text="Hạng mục tài sản :"></asp:Label>
                        </td>
                        <td align="left" class="rightmanager">
                            <asp:DropDownList ID="drHangMucTaiSan" runat="server" 
                                AppendDataBoundItems="True">
                                <asp:ListItem>[Choose Property&#39;s Items]</asp:ListItem>
                            </asp:DropDownList>
                            (*)<asp:Label ID="lblThongBaoNhomHangMuc" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager">
                            <asp:Label ID="Label5" runat="server" 
                                Text="Mô tả tình trạng thiệt hại / Phương án khắc phục :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtTrangThai" runat="server" Height="70px" 
                                style="margin-left: 0px" Width="400px" TextMode="MultiLine" 
                                CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager">
                            <asp:Label ID="Label6" runat="server" Text="Thiệt hại hoàn toàn :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:CheckBox ID="ckTinhTrang" runat="server" Text="Yes" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager">
                            <asp:Label ID="Label7" runat="server" Text="Ý kiến của Giám định viên :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtYKienGDV" runat="server" Height="70px" 
                                style="margin-left: 0px" Width="400px" TextMode="MultiLine" 
                                CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="200px">
                            <asp:Button ID="btnThem0" runat="server" CssClass="btn" 
                                PostBackUrl="~/Pages/ClaimDetail1.aspx?Ref=Cover" Text="Back Detail Claim" />
                        </td>
                        <td class="rightmanager">
&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnThem" runat="server" Text="Thêm Danh Mục" 
                                onclick="btnThem_Click" CssClass="btn" />
                        &nbsp;&nbsp;
                            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                        &nbsp;<%--<asp:Button ID="btnHoanTat" runat="server" Text="Hoàn Tất" 
                                onclick="btnHoanTat_Click" CssClass="btn" />--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-family: 'Times New Roman', Times, serif">
                &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="18px" 
                    Text="QUẢN LÝ DANH MỤC THIỆT HẠI CỦA "></asp:Label>
                <asp:Label ID="lblThamChieu" runat="server" Font-Size="18px" 
                    style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" 
                style="font-family: 'Times New Roman', Times, serif">
                <asp:GridView ID="gvDanhSachHangMucThietHai" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" PageSize="20" DataKeyNames="ID" 
                    onpageindexchanging="gvDanhSachHangMucThietHai_PageIndexChanging" 
                    onrowcancelingedit="gvDanhSachHangMucThietHai_RowCancelingEdit" 
                    onrowdeleting="gvDanhSachHangMucThietHai_RowDeleting" 
                    onrowediting="gvDanhSachHangMucThietHai_RowEditing" 
                    onrowupdating="gvDanhSachHangMucThietHai_RowUpdating" 
                    Font-Names="Times New Roman" Font-Size="14px" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="TenHangMuc" 
                            HeaderText="Nhóm Hạng Mục Tổn Thất">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ThietHaiHoanToan" 
                            HeaderText="Thiệt Hại Hoàn Toàn ">
                        <HeaderStyle Font-Bold="True" Font-Italic="False" HorizontalAlign="Center" />
                        <ItemStyle Width="25%" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrangThai" 
                            HeaderText="Thiệt Hại Một Phần">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle Width="25%" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="YKienGDV" HeaderText="Ý Kiến GĐV">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Chỉnh sửa" ShowEditButton="True" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#003300" ForeColor="White" Font-Bold="True" 
                        HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
                <asp:Label ID="lbllblGridview" runat="server" Font-Names="Times New Roman" 
                    Font-Size="16px" ForeColor="#003300"></asp:Label>
            </td>
        </tr>
        
    </table>
    </div>
    </div>
    </div>
</div>
</asp:Content>
