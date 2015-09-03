<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyMemos.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyMemos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:GridView ID="gvDSQuiTrinh" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ID_QuiTrinh" Width="80%">
    <Columns>
        <asp:BoundField DataField="ID_QuiTrinh" HeaderText="Mã" />
        <asp:BoundField DataField="ID_TieuDe" HeaderText="Tiêu Đề">
        <ItemStyle Width="30%" />
        </asp:BoundField>
        <asp:BoundField DataField="TomTat" HeaderText="Tóm Tắt">
        <ItemStyle Width="50%" />
        </asp:BoundField>
    </Columns>
</asp:GridView>
</asp:Content>
