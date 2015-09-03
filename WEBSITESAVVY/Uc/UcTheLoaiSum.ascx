<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcTheLoaiSum.ascx.cs" Inherits="WEBSITESAVVY.Uc.UcTheLoaiSum" %>
<style type="text/css">
    .style1
    {
        width: 400px;
        text-align:center;
        vertical-align:top;
    }
    .lable
    {
        vertical-align:top;
    }
</style>
<asp:Panel ID="Panel1" runat="server" Width="400px">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ THỂ LOẠI SUMMARY"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Tên :" CssClass="lable"></asp:Label>
                &nbsp;
                <asp:TextBox ID="txtTenTheLoai" runat="server" Width="200px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThemMoi" runat="server" Text="Thêm" 
                    onclick="btnThemMoi_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Width="400px">
    <asp:GridView ID="grDSTheLoai" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ID_TheLoaiSum" HeaderText="ID" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="TheLoai" HeaderText="Thể Loại" >
            <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:CommandField HeaderText="Sửa" ShowCancelButton="False" 
                ShowEditButton="True" >
            <ItemStyle Width="50px" />
            </asp:CommandField>
            <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True" >
            <ItemStyle Width="50px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    </asp:Panel>

