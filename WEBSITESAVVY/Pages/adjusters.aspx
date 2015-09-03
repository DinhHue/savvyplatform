<%@ Page Title="Claim" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="adjusters.aspx.cs" Inherits="WEBSITESAVVY.adjusters" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family:Times New Roman;
        }
        .style3
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    
        
        &nbsp;&nbsp;&nbsp;&nbsp;
                
        
        <table class="style1">
            <tr>
                <td align="right" class="style3">
                   
                    <br />
                   
        <asp:Label ID="Label1" runat="server" Text="Mã Claim :" 
            style="font-size: large" Font-Bold="False"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtThamChieu" runat="server" Width="225px"></asp:TextBox></td>
                <td align="left" class="style3">
                    </td>
            </tr>
            <tr>
                <td align="right">
                   
        <asp:Label ID="Label2" runat="server" Text="Loại báo cáo :" 
            style="font-size: large" Font-Bold="False"></asp:Label> &nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="drLoaiBaoCao" runat="server" Height="20px" Width="225px" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">[Chọn Giai Đoạn Báo Cáo]</asp:ListItem>
                    </asp:DropDownList></td>
                <td align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnTimClaim" runat="server" Height="30px" Text="Tìm Claim" 
            Width="197px" onclick="btnTimClaim_Click" />
        
        
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                   
                    <div class="main">
                        <div class="menu" 
                            style="text-align: left; vertical-align: top; width: 238px; float: left;">
                            <asp:Menu ID="menu" runat="server">
                                <Items>
                                    <asp:MenuItem Text="Báo Cáo Đầu Tiên" Value="BCDT"></asp:MenuItem>
                                    <asp:MenuItem Text="Báo Cáo Sơ Bộ" Value="BCSB"></asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/Manage/QuanLyClaim.aspx" Text="Báo Cáo Cuối Cùng" 
                                        Value="BCCC"></asp:MenuItem>
                                    <asp:MenuItem Text="Tiến Độ Xử Lý" Value="TDXL"></asp:MenuItem>
                                    <asp:MenuItem Text="Chi Tiết Thiệt Hại" Value="CTTH"></asp:MenuItem>
                                    <asp:MenuItem Text="Đề Xuất Bồi Thường" Value="DXBT"></asp:MenuItem>
               <%-- <asp:MenuItem Text="Quản Lý Danh Mục Tài Sản" Value="Quản Lý Danh Mục Tài Sản">
                </asp:MenuItem>--%>
                                </Items>
                            </asp:Menu>
                        </div>
                        <div class="mainchild" 
                            style="text-align:left; vertical-align:top;float: left;width: 910px;">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                   
                    &nbsp;</td>
            </tr>
            
        </table>

   </asp:Content>
