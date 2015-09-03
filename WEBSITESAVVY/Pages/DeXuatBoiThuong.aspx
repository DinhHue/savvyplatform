<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="DeXuatBoiThuong.aspx.cs" Inherits="WEBSITESAVVY.Pages.DeXuatBoiThuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

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
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<div align="center">
    <table class="tablemanager">
        <tr>
            <td class="headermanager">
                Đề Xuất Bồi Thường Của
                <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvDanhSachTienDo" runat="server" AutoGenerateColumns="False" 
                    Font-Names="Times New Roman" AllowPaging="True" 
                    DataKeyNames="ID_DeXuatBoiThuong" 
                    onpageindexchanging="gvDanhSachTienDo_PageIndexChanging" 
                    onrowdatabound="gvDanhSachTienDo_RowDataBound" 
                    onrowdeleting="gvDanhSachTienDo_RowDeleting" PageSize="20" 
                    ShowFooter="True" onrowcancelingedit="gvDanhSachTienDo_RowCancelingEdit" 
                    onrowediting="gvDanhSachTienDo_RowEditing" 
                    onrowupdating="gvDanhSachTienDo_RowUpdating" Font-Size="14px" Width="100%">
                    <Columns>
                     <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Diễn giãi" >
                        <ItemStyle Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                            Width="450px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="Giá trị khiếu nại" 
                            DataFormatString="{0:0,000}" >
                        <ItemStyle Width="130px" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Đề xuất tính toán" 
                            DataFormatString="{0:0,000}" >
                        <ItemStyle Width="130px" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Edit" ShowEditButton="True" ButtonType="Button" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                            ButtonType="Button" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#006600" Font-Bold="False" ForeColor="White" />
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
       
    </table>
                <table class="tablemanager" style="border: thin groove #999999" 
        width="70%">
                    <tr>
                        <td colspan="2" class="headermanager">
                            Hạng mục đề xuất bồi thường mới </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label4" runat="server" Text="Diễn giải :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtDienGiai" runat="server" Height="100px" 
                                TextMode="MultiLine" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label5" runat="server" Text="Giá trị khiếu nại :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtGiaTriKhieuNai" runat="server" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="Label6" runat="server" Text="Đề xuất tính toán :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtDeXuatTinhToan" runat="server" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="rightmanager">
                            <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" Width="100px" 
                                onclick="btnCapNhat_Click" CssClass="btn" />
                        </td>
                    </tr>
                </table>
           </div>
            </asp:Content>
