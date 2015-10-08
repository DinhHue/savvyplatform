<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyClaim.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyClaim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
    <tr>
        <td class="colmanager1" align="center">
            <asp:Label ID="Label2" runat="server" Text="Follower :"></asp:Label>
        &nbsp;
            <asp:DropDownList ID="drFollower" runat="server">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFollower" runat="server" onclick="btnFollower_Click" 
                Text="Search" />
        </td>
    </tr>
    <tr>
        <td class="colmanager1" align="center">
        <asp:GridView ID="grDSClaim0" runat="server" Width="90%" 
            BackColor="White" BorderColor="#003300" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" 
        EnableCaching="True" CacheDuration="3600" Font-Names="Tahoma" CssClass="center" AllowPaging="True" 
                PageSize="100" DataKeyNames="TenClaim"> 
            <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <Columns>
             <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="TenClaim" HeaderText="CASE NAME" >
                <ControlStyle Width="100px" />
                <ItemStyle Width="13%" />
                </asp:BoundField>
                <asp:BoundField DataField="Brief" HeaderText="BRIEF"></asp:BoundField>
                <asp:BoundField DataField="TenKhachHang" HeaderText="INSURED" >
                <ControlStyle Width="150px" />
                <ItemStyle Width="20%" />
                </asp:BoundField>
                <asp:BoundField DataField="AssignedDate" HeaderText="ASSIGED DATE" >
                <ControlStyle Width="30px" />
                <ItemStyle Width="8%" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TenGiaiDoan" HeaderText="STATUS">
                <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Follower" HeaderText="Follower">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rate" HeaderText="Rate">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField HeaderText="DETAIL" ShowSelectButton="True" 
                    ButtonType="Button">
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle Font-Names="Tahoma" ForeColor="#003300" HorizontalAlign="Left" 
                VerticalAlign="Top" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#339933" BorderColor="#003300" Font-Bold="False" 
                ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle HorizontalAlign="Left" 
                VerticalAlign="Top" Font-Bold="False" Font-Names="Times New Roman" 
                Font-Size="14px" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        
        </td>
    </tr>
    <tr>
        <td class="colmanager1" align="center">
            <asp:Button ID="btnDSClaimHoanThanh" runat="server" 
                onclick="btnDSClaimHoanThanh_Click" Text="Danh Sách Claim Đã Hoàn Thành" 
                CssClass="btn" />
        &nbsp;&nbsp;
            <asp:Button ID="btnLietKe" runat="server" onclick="btnLietKe_Click" 
                Text="Liệt Kê Các Vụ Tổn Thất Theo Đơn Vị Bảo Hiểm" CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td class="colmanager1">
            <asp:GridView ID="grDSClaim" runat="server" PageSize="2" 
                AutoGenerateColumns="False" Font-Names="Tahoma" HorizontalAlign="Left" 
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="TenClaim" HeaderText="Tham chiếu">
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenDonVi" HeaderText="Đơn vị BH">
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenKhachHang" HeaderText="NĐBH">
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DOL" HeaderText="Ngày tổn thất">
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#006600" ForeColor="White" 
                    Font-Names="Times New Roman" HorizontalAlign="Left" />
                <RowStyle Font-Names="Times New Roman" Font-Bold="False" 
                    HorizontalAlign="Left" />
            </asp:GridView>
        </td>
    </tr>
       <%-- <%#Container.DataItemIndex+1 %>--%>
    <tr>
        <td class="colmanager1">
            <asp:GridView ID="grDSLietKe" runat="server" PageSize="2" 
                AutoGenerateColumns="False" Font-Names="Tahoma" HorizontalAlign="Center" 
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="TenDonVi" HeaderText="Đơn Vị Bảo Hiểm">
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SoVu" HeaderText="Số Vụ">
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#006600" ForeColor="White" 
                    Font-Names="Times New Roman" HorizontalAlign="Left" />
                <RowStyle Font-Names="Times New Roman" Font-Bold="False" 
                    HorizontalAlign="Left" />
                <SelectedRowStyle HorizontalAlign="Left" />
            </asp:GridView>
        </td>
    </tr>
    </table>
</asp:Content>
