<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NhaBaoHiem.ascx.cs" Inherits="WEBSITESAVVY.Uc.NhaBaoHiem" %>

        <asp:GridView ID="grDS" runat="server" Width="500px" 
            BackColor="White" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" AutoGenerateColumns="False" 
        EnableCaching="True" CacheDuration="3600" Font-Names="Times New Roman" 
        ForeColor="#003300" CssClass="gridtable"> 
            <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField DataField="TenNhaBH" HeaderText="Nhà Bảo Hiểm" >
                <ControlStyle Width="100px" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="SoDonVi" HeaderText="Số Đơn Vị" >
                <ControlStyle Width="150px" />
                <ItemStyle Width="40px" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle Font-Names="Tahoma" ForeColor="#003300" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006600" Font-Bold="False" 
                ForeColor="White" Font-Names="Times New Roman" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#003300" HorizontalAlign="Left" 
                Font-Names="Times New Roman" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
           <asp:Label ID="lblThongBao" runat="server"></asp:Label>
<%--<table class="style1">
    <tr>
        <td align="center">
        <br />
        </td>
    </tr>
    <tr>
        <td align="center">
         
        </td>
    </tr>
</table>--%>

