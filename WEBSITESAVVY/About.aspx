<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="WEBSITESAVVY.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table class="style1">
        <tr>
            <td align="center" colspan="2">
                <asp:Label runat="server" 
                    Text="GHI THÊM NHẬN ĐỊNH HOẶC QUAN SÁT CỦA GIÁM ĐỊNH VIÊN NGOÀI NHỮNG Ý NÊU TRÊN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="158px" TextMode="MultiLine" 
                    Width="846px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Thời gian bắt đầu khảo sát :"></asp:Label>
&nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="18px" Width="188px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Thời gian kết thúc  khảo sát :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        </table>
</asp:Content>
