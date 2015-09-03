<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyCongTacTimeSheet.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyCongTacTimeSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table class="tablemanager">
    <tr>
        <td class="headermanager">
            <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ CÔNG TÁC TIMESHEET"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colmanager1">
            <asp:Label ID="Label2" runat="server" Text="Type:"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtTypeTimkiem" runat="server" CssClass="textmananger"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnTimKiem" runat="server" onclick="btnTimKiem_Click" 
                Text="Tìm kiếm" CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="grDSCongTacTS" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="ID" 
                onpageindexchanging="grDSCongTacTS_PageIndexChanging" 
                onrowcancelingedit="grDSCongTacTS_RowCancelingEdit" 
                onrowdeleting="grDSCongTacTS_RowDeleting" 
                onrowediting="grDSCongTacTS_RowEditing" 
                onrowupdating="grDSCongTacTS_RowUpdating" Font-Names="Times New Roman" 
                Font-Size="16px">
                <Columns>
                    <asp:TemplateField HeaderText="STT"> 
                    <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="Mã" >
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CongTac" HeaderText="Type" >
                    <ItemStyle Width="450px" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Rate" DataFormatString="{0:#,##0}" 
                        HeaderText="Rate" >
                    <ItemStyle HorizontalAlign="Right" Width="100px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Update" ShowEditButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" >
                    <ItemStyle Width="50px" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <PagerSettings FirstPageText="10" LastPageText="10" Mode="NumericFirstLast" 
                    NextPageText="10" PreviousPageText="10" />
                <PagerStyle Font-Names="Times New Roman" HorizontalAlign="Right" />
                <RowStyle Font-Names="Times New Roman" HorizontalAlign="Left" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="PnThem" runat="server">
                <table class="style3">
                    <tr>
                        <td colspan="2" class="headermanager">
                            <asp:Label ID="Label5" runat="server" Text="CÔNG TÁC TIMESHEET MỚI"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager" width="20%">
                            <asp:Label ID="Label3" runat="server" Text="Mã :"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtMa" runat="server" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="leftmanager">
                            <asp:Label ID="Label4" runat="server" Text="Type:"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtType" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
        <td class="leftmanager">
          
                Rate :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtRate" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="buttonmananger">
                            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" 
                                CssClass="btn" />
                            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
        </td>
    </tr>
</table>
</asp:Content>
