<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManageUnit.aspx.cs" Inherits="WEBSITESAVVY.Manage.ManageUnit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
        <tr>
            <td colspan="2" class="headermanager">
                QUẢN LÝ ĐƠN VỊ TÍNH HẠNG MỤC TỔN THẤT</td>
        </tr>
        <tr>
            <td align="right" class="leftmanager" width="30%">
                <asp:Label ID="Label2" runat="server" Text="Tên đơn vị :"></asp:Label>
            </td>
            <td align="left" class="rightmanager">
                <asp:TextBox ID="txtDonVi" runat="server" CssClass="textClaim"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThem" runat="server" CssClass="btnThem" 
                    onclick="btnThem_Click" Text="Insert" />
            </td>
        </tr>
        <tr>
            <td align="center" class="register" colspan="2">
                <asp:GridView ID="gvDS" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID_DonViTinh" onrowdeleting="gvDS_RowDeleting" Width="50%">
                    <Columns>
                        <asp:BoundField DataField="ID_DonViTinh" HeaderText="Ma" />
                        <asp:BoundField DataField="TenDonVi" HeaderText="Đơn Vị" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                            ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
