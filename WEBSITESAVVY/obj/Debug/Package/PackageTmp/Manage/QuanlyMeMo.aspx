<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanlyMeMo.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanlyMeMo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style4
    {
        width: 80%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="style4">
    <tr>
        <td class="headermanager" colspan="2">
            QUẢN LÝ MEMO</td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:GridView ID="gvQuiTrinh" runat="server" AutoGenerateColumns="False" 
                Font-Size="14px" DataKeyNames="ID_QuiTrinh" 
                onrowdeleting="gvQuiTrinh_RowDeleting" Width="80%" 
                onselectedindexchanged="gvQuiTrinh_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ID_QuiTrinh" HeaderText="ID" >
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" >
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                        ButtonType="Button" >
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    <ItemStyle Width="5%" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Edit" ButtonType="Button" 
                        ShowSelectButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                    <ItemStyle Width="5%" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle ForeColor="#006600" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
