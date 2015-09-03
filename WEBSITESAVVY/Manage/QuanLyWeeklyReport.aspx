<%@ Page Title="Quản Lý Weekly Report" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyWeeklyReport.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyWeeklyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
    <tr>
        <td class="headermanager" colspan="2">
            <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ WEEKLY REPORT"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="leftmanager" width="20%">
            <asp:Label ID="Label2" runat="server" Text="Mã tham chiếu :"></asp:Label>
&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;</td>
        <td class="rightmanager">
            <asp:TextBox ID="txtMaThamChieu" runat="server" CssClass="textmananger"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnTimKiem" runat="server" Text="Tìm " CssClass="btn" 
                onclick="btnTimKiem_Click" />
            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colmanager1" colspan="2">
            <asp:Button ID="btnAll" runat="server" onclick="btnAll_Click" 
                Text="Danh sách tất cả các weekly report" CssClass="btn" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnDangThucHien" runat="server" onclick="btnDangThucHien_Click" 
                Text="Danh Sách weekly report các vụ đang thực hiện" CssClass="btn" />
        </td>
    </tr>
    <tr class="colmanager1">
        <td align="center" colspan="2">
            <asp:GridView ID="grDSWeeklyAll" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_WeeklyReport" onrowdeleting="grDSWeeklyAll_RowDeleting" 
                onselectedindexchanging="grDSWeeklyAll_SelectedIndexChanging" 
                AllowPaging="True" onpageindexchanging="grDSWeeklyAll_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenClaim" HeaderText="Tham chiếu" >
                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Update" ShowSelectButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" />
            </asp:GridView>
            <asp:GridView ID="grDSWRDangThucHien" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_WeeklyReport" 
                onrowdeleting="grDSWRDangThucHien_RowDeleting" 
                AllowPaging="True" onpageindexchanging="grDSWRDangThucHien_PageIndexChanging" 
                onselectedindexchanging="grDSWRDangThucHien_SelectedIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenClaim" HeaderText="Tham chiếu" >
                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Update" ShowSelectButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" />
            </asp:GridView>

            <asp:GridView ID="grTimeKiemWR" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID_WeeklyReport" 
                onrowdeleting="grTimeKiemWR_RowDeleting" 
                onselectedindexchanging="grTimeKiemWR_SelectedIndexChanging" 
                Visible="False">
                <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                         <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenClaim" HeaderText="Tham chiếu" >
                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Update" ShowSelectButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <RowStyle Font-Names="Times New Roman" />
            </asp:GridView>

        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click" 
                Text="Thêm Mới" CssClass="btn" />
        </td>
    </tr>
</table>
</asp:Content>
