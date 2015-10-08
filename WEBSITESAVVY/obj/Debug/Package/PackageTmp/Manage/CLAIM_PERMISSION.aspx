<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="CLAIM_PERMISSION.aspx.cs" Inherits="WEBSITESAVVY.Manage.CLAIM_PERMISSION" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 70%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table align="center" class="style4">
        <tr>
            <td style="font-size: 18px; color: #003300; font-weight: bold;">
                QUẢN LÝ PHÂN QUYỀN TRUY CẬP CLAIM</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvDSClaim" runat="server" AutoGenerateColumns="False" 
                    Font-Size="14px" DataKeyNames="ID_Claim" 
                    onrowcancelingedit="gvDSClaim_RowCancelingEdit" 
                    onrowediting="gvDSClaim_RowEditing" onrowupdating="gvDSClaim_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="ID_Claim" HeaderText="No.">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Brief" HeaderText="Diễn giải">
                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenKhachHang" HeaderText="NĐBH">
                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PUB" HeaderText="Truy Cập" />
                        <asp:CommandField ButtonType="Button" HeaderText="Changed" 
                            ShowEditButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" Font-Size="14px" ForeColor="White" />
                    <RowStyle Font-Size="12px" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
