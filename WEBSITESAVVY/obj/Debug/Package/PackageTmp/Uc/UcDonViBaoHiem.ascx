<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcDonViBaoHiem.ascx.cs" Inherits="WEBSITESAVVY.Uc.DonViBaoHiem" %>
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

   <asp:GridView ID="grDS" runat="server" AutoGenerateColumns="False" 
                EnableCaching="True" CacheDuration="600" 
                BackColor="White" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" Font-Names="Times New Roman" 
                DataKeyNames="MaHoa" 
                Width="90%" CssClass="gridtable">
                <Columns>
                    
                  
                    <asp:TemplateField HeaderText="STT"> <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        <ItemStyle Width="5%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenDonVi" HeaderText="Tên Đơn Vị" >
                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" >
                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MST" HeaderText="Mã Số Thuế" >
                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle Font-Names="Times New Roman" />
                <FooterStyle BackColor="White" BorderColor="#003300" ForeColor="#000066" />
                <HeaderStyle BackColor="#006600" BorderColor="#003300" Font-Bold="False" 
                    ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" 
                    VerticalAlign="Top" />
                <RowStyle Font-Bold="False" Font-Names="Times New Roman" />
                <SelectedRowStyle Font-Bold="True" />
            </asp:GridView><br />
            <asp:Label ID="lblthongbao" runat="server"></asp:Label>
<%--<table class="tablemanager">
    <tr>
        <td align="center" colspan="2" class="headermanager">
            <asp:Label ID="Label1" runat="server" Text="Danh Sách Đơn Vị Bảo Hiểm"></asp:Label>
        </td>
    </tr>
    <tr>
        <%--<td align="right" class="leftmanager">
            <asp:Label ID="Label2" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
        </td>
        <td class="rightmanager">
            <asp:DropDownList ID="drNBH" runat="server" AutoPostBack="True" 
                AppendDataBoundItems="True">
                <asp:ListItem Value="0">[Chọn Đon Vị BH]</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnXem" runat="server" CssClass="btn" onclick="btnXem_Click" 
                Text="Xem" Width="100px" />
            </td>
    </tr>
    <tr>
        <td align="center" colspan="2" class="colmanager1">
          
            <br />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>--%>

