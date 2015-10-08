<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="EditMemos.aspx.cs" Inherits="WEBSITESAVVY.Manage.EditMemos" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table align="center" width="70%">
        <tr>
            <td class="headerViewform" colspan="2">
                CHỈNH SỬA NỘI DUNG MEMO
            </td>
        </tr>
        <tr>
            <td style="font-size: large; font-weight: bold" width="10%">
                Tiêu đề</td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTieuDe" runat="server" CssClass="textEntry"></asp:TextBox>
&nbsp;<asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; font-weight: bold" width="10%">
                Tóm tắt</td>
            <td class="rightmanager">
                <asp:TextBox ID="txtTomTat" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="70%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; font-weight: bold" width="10%">
                Nội dung</td>
            <td class="rightmanager">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="10%">
                &nbsp;</td>
            <td class="rightmanager">
            <CKEditor:CKEditorControl ID="ckNoiDung" runat="server" BasePath="~/ckeditor" 
                Height="498px" Width="744px"></CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                    onclick="btnUpdate_Click" Text="Chỉnh sửa" />
            </td>
        </tr>
    </table>
</asp:Content>
