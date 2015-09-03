<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyLoaiHinhTonThat.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyLoaiHinhTonThat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
       <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
    <tr>
        <td colspan="2" class="headermanager">
            <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ LOẠI HÌNH TỔN THẤT"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="leftmanager" width="20%">
            <asp:Label ID="Label2" runat="server" Text="Loại tổn thất :"></asp:Label>
        </td>
        <td class="rightmanager">
            <asp:TextBox ID="txtLoaiTonThat" runat="server" CssClass="textmananger"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                Text="Thêm mới" CssClass="btn" />
&nbsp;<asp:Label ID="lblThongBao" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:GridView ID="grDSLoaiHinhTT" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_LoaiHinhTonThat" 
                onrowcancelingedit="grDSLoaiHinhTT_RowCancelingEdit" 
                onrowdeleting="grDSLoaiHinhTT_RowDeleting" 
                onrowediting="grDSLoaiHinhTT_RowEditing" 
                onrowupdating="grDSLoaiHinhTT_RowUpdating" Font-Names="Times New Roman" 
                Font-Size="16px">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LoaiHinhTonThat" HeaderText="Tên" >
                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Update" ShowEditButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
