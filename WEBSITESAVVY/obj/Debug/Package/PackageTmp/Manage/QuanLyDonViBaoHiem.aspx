<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyDonViBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyDonViBaoHiem" %>
<%@ Register src="../Uc/UcDonViBaoHiem.ascx" tagname="UcDonViBaoHiem" tagprefix="uc1" %>
<%@ Register src="../Uc/UcDonViBaoHiemMoi.ascx" tagname="UcDonViBaoHiemMoi" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
        <tr>
            <td colspan="3" class="headermanager" dir="ltr">
                <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ ĐƠN VỊ BẢO HIỂM"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="headermanager">
                <asp:Label ID="Label3" runat="server" Text="Thiết lập khác"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
            <asp:Label ID="Label2" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
            </td>
            <td class="rightmanager">
            <asp:DropDownList ID="drNBH" runat="server" AutoPostBack="True" 
                onselectedindexchanged="drNBH_SelectedIndexChanged" 
                AppendDataBoundItems="True">
                <asp:ListItem Value="0">[Chọn Đon Vị BH]</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td class="rightmanager" width="250px">
                <asp:Button ID="btnDonViBHMoi" runat="server" onclick="btnDonViBHMoi_Click" 
                    Text="Đơn vị bảo hiểm mới" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
            <asp:GridView ID="grDS" runat="server" AutoGenerateColumns="False" 
                EnableCaching="True" CacheDuration="600" 
                BackColor="White" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" Font-Names="Times New Roman" 
                DataKeyNames="ID_DonVi" 
                    onrowdeleting="grDS_RowDeleting" 
                    onrowcancelingedit="grDS_RowCancelingEdit" onrowediting="grDS_RowEditing" 
                    onrowupdating="grDS_RowUpdating" Width="80%">
                <Columns>
                    <asp:BoundField DataField="ID_DonVi" HeaderText="ID" />
                    <asp:BoundField DataField="MaHoa" HeaderText="Mã Hóa">
                    <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenDonVi" HeaderText="Tên Đơn Vị" >
                    <ItemStyle Width="40%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" >
                    <ItemStyle Width="40%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MST" HeaderText="MST">
                    <ItemStyle Width="5%" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle Font-Names="Times New Roman" />
                <FooterStyle BackColor="White" BorderColor="#003300" ForeColor="#000066" />
                <HeaderStyle BackColor="#006600" BorderColor="#003300" Font-Bold="False" 
                    ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" 
                    VerticalAlign="Top" />
                <RowStyle Font-Bold="False" Font-Names="Times New Roman" Font-Size="14px" />
                <SelectedRowStyle Font-Bold="True" />
            </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
