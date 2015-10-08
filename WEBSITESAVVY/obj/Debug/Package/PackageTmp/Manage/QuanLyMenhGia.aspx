<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyMenhGia.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyMenhGia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
         .style4
         {
             height: 19px;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table align="center" class="tablemanager">
    <tr>
        <td class="headermanager" colspan="2">
            <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ MỆNH GIÁ"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="leftmanager" width="20%">
            <asp:Label ID="Label2" runat="server" Text="Mệnh giá :"></asp:Label>
        </td>
        <td class="rightmanager">

            <asp:TextBox ID="txtMenhGia" runat="server" CssClass="textmananger"></asp:TextBox>
   
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
            <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" 
                CssClass="btn" />
        &nbsp;
            <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:GridView ID="grDanhSachMenhGia" runat="server" AutoGenerateColumns="False" 
                Font-Names="Times New Roman" Font-Size="16px" 
                onrowcancelingedit="grDanhSachMenhGia_RowCancelingEdit" 
                DataKeyNames="ID_MenhGia" onrowediting="grDanhSachMenhGia_RowEditing" 
                onrowupdating="grDanhSachMenhGia_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="STT"> 
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="MenhGia" HeaderText="Mệnh Giá" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Sửa" 
                        ShowEditButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" Font-Bold="False" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
