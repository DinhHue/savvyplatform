<%@ Page Title="Staticstics TimeSheet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaticsticsTimeSheet.aspx.cs" Inherits="WEBSITESAVVY.Pages.StaticsticsTimeSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table class="tableweekly" align="center">
        <tr>
            <td colspan="3" class="headerViewform">
                THỐNG KÊ TIME SHEET THEO THỜI GIAN</td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Period"></asp:Label>
            </td>
            <td class="righttimesheet">
                Từ :
                <asp:TextBox ID="txtTimeStart" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtTimeStart_CalendarExtender" runat="server" 
                    TargetControlID="txtTimeStart">
                </ajaxToolkit:CalendarExtender>
&nbsp;đến :
                <asp:TextBox ID="txtTimeEnd" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtTimeEnd_CalendarExtender" runat="server" 
                    TargetControlID="txtTimeEnd">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td class="righttimesheet">
                <asp:Button ID="btnXem" runat="server" Text="Xem" CssClass="btn" 
                    onclick="btnXem_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr class="infoFormText">
            <td colspan="3">
                <asp:GridView ID="gvDS" runat="server" AutoGenerateColumns="False" 
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="STT"> <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                         </asp:TemplateField>
                        <asp:BoundField HeaderText="Loss Adjuster" DataField="TenGDV" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Total Time" DataField="SoGio" />
                    </Columns>
                    <HeaderStyle BackColor="#003300" Font-Bold="True" Font-Size="18px" 
                        ForeColor="White" />
                    <RowStyle Font-Size="16px" />
                </asp:GridView>
            </td>
        </tr>
         <%--<tr>
            <td colspan="3" class="headerViewform">
                &nbsp;</td>
        </tr>
         <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>--%>
    </table>
</asp:Content>
