<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="TienDoXuLy.aspx.cs" Inherits="WEBSITESAVVY.Pages.TienDoXuLy" %>
<asp:Content ID="Content2" runat="server" contentplaceholderid="HeadContent">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            width: 100%;
            font-family:Times New Roman;
            font-size:16px;
            text-align:center;
            
        }
        .style4
        {
            width: 700px;
        }
        .colleft
        {
            padding-right:10px;
            text-align:right;  
            width:30%; 
            background:#E1E1E1;
        }
         .colright
        {
            padding-left:10px;
            text-align:left;   
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div align="center">
    <table class="tablemanager">
        <tr>
            <td class="headermanager">
                Tiến Độ Xử Lý Của
                <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvDanhSachTienDo" runat="server" AutoGenerateColumns="False" 
                    Font-Names="Times New Roman" AllowPaging="True" DataKeyNames="ID_TienDo" 
                    onpageindexchanging="gvDanhSachTienDo_PageIndexChanging" 
                    onrowcancelingedit="gvDanhSachTienDo_RowCancelingEdit" 
                    onrowdeleting="gvDanhSachTienDo_RowDeleting" 
                    onselectedindexchanged="gvDanhSachTienDo_SelectedIndexChanged" 
                    PageSize="20" Font-Size="14px">
                    <Columns>
                        <%--<asp:BoundField DataField="ID_TienDo" HeaderText="ID" />--%>
                         <asp:BoundField DataField="ID_TienDo" HeaderText="ID" />
                        <asp:BoundField DataField="HoSoYeuCau" HeaderText="Hồ sơ yêu cầu" >
                        <ItemStyle Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                            Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" >
                        <ItemStyle Width="130px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PhuongAnDeXuat" HeaderText="Phương án đề xuất" >
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Cập Nhật" ShowSelectButton="True" />
                        <asp:CommandField HeaderText="Xoá" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center">

               
            </td>
        </tr>
    </table>
     <table align="center" width="67%">
            <tr>
                <td colspan="2" class="headermanager" align="center">
                    Cập Nhật Tiến Độ&nbsp; 
                    <asp:Label ID="lblSoThuTu" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label4" runat="server" Text="Hồ sơ yêu cầu :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtHoSoYeuCau" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label5" runat="server" Text="Tình trạng :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtTinhTrang" runat="server" CssClass="textmananger" 
                        Font-Size="14px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label6" runat="server" Text="Phương án đề xuất :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtPhuongAnDeXuat" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="rightmanager">
                    <asp:Button ID="btnCapNhat" runat="server" Text="Thêm Mới" Width="100px" 
                        onclick="btnCapNhat_Click" CssClass="btn" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCapNhatLai" runat="server" Text="Cập Nhật" Width="100px" 
                        onclick="btnCapNhatLai_Click" CssClass="btn" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


