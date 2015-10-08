<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyHangMuc.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyHangMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            font-family: "Times New Roman", Times, serif;
            font-weight: bold;
            font-size: 16px;
            vertical-align: top;
            text-align: right;
            width: 17%;
            padding-right: 10px;
            height: 34px;
        }
        .style6
        {
            font-family: "Times New Roman", Times, serif;
            font-size: 14px;
            vertical-align: top;
            text-align: left;
            padding-left: 10px;
            padding-right: 10px;
            width: 33%;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table width="60%">
    <tr>
        <td>
            QUẢN LÝ HẠNG MỤC TỔN THẤT</td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="gvDSHangMuc" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_HangMuc" Font-Size="16px" 
                onrowcancelingedit="gvDSHangMuc_RowCancelingEdit" 
                onrowdeleting="gvDSHangMuc_RowDeleting" onrowediting="gvDSHangMuc_RowEditing" 
                onrowupdating="gvDSHangMuc_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="ID_HangMuc" HeaderText="ID" />
                    <asp:BoundField DataField="TenHangMuc" HeaderText="Tên Hạng Mục" />
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <table class="style4">
                <tr>
                    <td colspan="2">
                        <strong>THÊM HẠNG MỤC MỚI</strong></td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label2" runat="server" Text="ID :"></asp:Label>
                    </td>
                    <td class="rightmanager">
                        <asp:TextBox ID="txtMa" runat="server" Enabled="False" Height="23px" 
                            Width="44px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label3" runat="server" Text="Tên Hạng Mục :"></asp:Label>
                    </td>
                    <td class="rightmanager">
                        <asp:TextBox ID="txtTenHangMuc" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                    </td>
                    <td class="rightmanager">
                        <asp:Button ID="btnThem" runat="server" CssClass="btn" onclick="btnThem_Click" 
                            Text="Insert" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
</asp:Content>
