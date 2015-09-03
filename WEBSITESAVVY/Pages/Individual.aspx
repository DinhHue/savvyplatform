<%@ Page Title="INDIVIDUAL" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Individual.aspx.cs" Inherits="WEBSITESAVVY.Pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="tablemanager">
        <tr>
            <td class="headermanager" colspan="2">
                
                QUẢN LÝ CÁ NHÂN</td>
        </tr>
        <tr>
            <td class="labelleftlong" colspan="2">
                1. DANH SÁCH CÁC VỤ ĐÃ THAM GIA VÀ TỔNG TIMESHEET</td>
        </tr>
       
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Font-Names="Times New Roman" Font-Size="14px">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                         <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenClaim" HeaderText="CASE NAME">
                        <ItemStyle HorizontalAlign="Left" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoGio" HeaderText="TOTAL TIME">
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
       
        <tr>
            <td class="labelleftlong" colspan="2">
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
