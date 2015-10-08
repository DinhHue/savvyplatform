<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyTaskAssiged.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyTaskAssiged" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style4
    {
        font-family: "Times New Roman", Times, serif;
        font-size: 20px;
        font-weight: bold;
        color: #006600;
        background-color: #E5E5E5;
        vertical-align: top;
        height: 27px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table align="center" width="80%">
        <tr>
            <td class="style4">
                <asp:Label ID="Label2" runat="server" Text="QUẢN LÝ TASK ASSIGED"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: 14px">
                <asp:Label ID="Label3" runat="server" Font-Size="16px" Text="Loss Adjuster :"></asp:Label>
                <asp:DropDownList ID="drDSGDV" runat="server">
                </asp:DropDownList>
&nbsp;
                <asp:Button ID="btnXemTask" runat="server" onclick="btnXemTask_Click" 
                    Text="View task lisk" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="MaDaiLy" 
                    Font-Names="Times New Roman" Font-Size="16px" Width="100%" ID="gvDSDaGiao">
                    <Columns>
                        <asp:BoundField DataField="MaDaiLy" HeaderText=".">
                        <ItemStyle HorizontalAlign="Center" ForeColor="White" Width="0%"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                        <ItemStyle HorizontalAlign="Center" Width="8%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                        <ItemStyle Width="30%" HorizontalAlign="Left"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ngay" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Date Assigned">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Deadline">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Deliver" HeaderText="Deliver">
                        <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Receiver" HeaderText="Receiver">
                        <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Done" HeaderText="Done">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" HeaderText="Edix">
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" BackColor="#006600" 
                        Font-Names="Times New Roman" Font-Size="18px" ForeColor="White">
                    </HeaderStyle>
                    <SortedAscendingCellStyle BackColor="#99CCFF" />
                    <SortedAscendingHeaderStyle BackColor="#00CC66" />
                    <SortedDescendingCellStyle BackColor="#FF6666" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
