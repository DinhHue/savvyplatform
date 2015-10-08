<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="typedocsrequest.aspx.cs" Inherits="WEBSITESAVVY.Pages.typedocsrequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<div align="center">
    <table class="tablemanager">
        <tr>
            <td colspan="2" class="headerViewform">
                PHÂN LOẠI HỒ SƠ YÊU CẦU - TYPE OF DOCS REUQETS</td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label41" runat="server" Text="Type Name :" CssClass="labelbold"></asp:Label>
            </td>
            <td class="righttimesheet">
                <asp:TextBox ID="txtTenLoai" runat="server" CssClass="input"></asp:TextBox>
&nbsp;<asp:Button ID="btnThem" runat="server" CssClass="btn" Text="Add" 
                    onclick="btnThem_Click" />
            &nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Manage/ManageItemDR.aspx">New Items List</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="leftCol">
                &nbsp;</td>
            <td class="righttimesheet">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvLoaiDR" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemStyle  HorizontalAlign="Center" Width="5%" />                            
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenLoai" HeaderText="Type Name" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                            HeaderText="Delete" ShowDeleteButton="True" >
                        <ItemStyle Width="5%" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BorderColor="Black" 
                        HorizontalAlign="Center" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
