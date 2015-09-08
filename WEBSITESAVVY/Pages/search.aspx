<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WEBSITESAVVY.Pages.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td align="center" colspan="2">
                        <asp:TextBox ID="txtThamChieu" runat="server" CssClass="input" 
                        Width="350px"></asp:TextBox>
                    &nbsp;&nbsp;                   
                        <asp:Button ID="btnTiemKiem" runat="server" Height="30px" 
                            onclick="btnTiemKiem_Click" CssClass="ambitios_submit_button" />
                        </td>
            </tr>
            <tr>
                <td align="right" width="20%">
                    <asp:Label ID="Label1" runat="server" Text="Tìm theo :"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdTimKiem" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="NDBH">Tên NĐBH</asp:ListItem>
                        <asp:ListItem Value="PolicyName">Quy tắt BH</asp:ListItem>
                        <asp:ListItem Value="LHTT">Loại hình tổn thất</asp:ListItem>
                        <asp:ListItem Value="DienGiaiVanTat">Trường hợp tổn thất</asp:ListItem>
                        <asp:ListItem Value="DKBS">ĐKBS</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
