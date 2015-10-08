<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcThongTinDVBHVANDBHKSRR.ascx.cs" Inherits="WEBSITESAVVY.Uc.UcThongTinDVBHVANDBHKSRR" %>
 <table align="center" class="style1">
        <tr>
            <td>
                <asp:Label ID="Label408" runat="server" Text="Số Thứ Tự :"></asp:Label>
                <asp:Label ID="lblSTT" runat="server"></asp:Label>
            </td>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="MẪU KHẢO SÁT RỦI RO"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr bgcolor="#EDEFF4" >
            <td rowspan="5">
                <asp:Label ID="Label2" runat="server" Text="Tham Chiếu"></asp:Label>
            </td>
            <td rowspan="5">
                
                <asp:TextBox ID="txtThamChieu" runat="server" Width="209px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="(Chưa có tham chiếu)" ControlToValidate="txtThamChieu" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblThongBaoLoiThamChieu" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label406" runat="server" Text="Số lượng GĐV :"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drSoLuong" runat="server" AutoPostBack="True" Height="24px" 
                    onselectedindexchanged="drSoLuong_SelectedIndexChanged" Width="182px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="lbGDV1" runat="server" Text="Giám định viên 1" Visible="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV1" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="lbGDV2" runat="server" Text="Giám định viên 2" Visible="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV2" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="lbGDV3" runat="server" Text="Giám định viên 3" Visible="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV3" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="lbGDV4" runat="server" Text="Giám định viên 4" Visible="False"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:DropDownList ID="drGDV4" runat="server" CssClass="style2" Height="25px" 
                    Visible="False" Width="214px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Nhà bảo hiểm"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drNBH" runat="server" Height="25px" Width="216px" 
                    onselectedindexchanged="drNBH_SelectedIndexChanged" 
                    CausesValidation="True" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Số HĐBH"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoHDBH" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" rowspan="2" bgcolor="#EDEFF4">
                <asp:Label ID="Label5" runat="server" Text="Đơn vị"></asp:Label>
            </td>
            <td class="style2" rowspan="2" bgcolor="#EDEFF4">
                <asp:DropDownList ID="drDVBH" runat="server" Height="25px" Width="213px">
                </asp:DropDownList>
            </td>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:Label ID="Label6" runat="server" Text="Bắt đầu hiệu lực :"></asp:Label>
            </td>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:TextBox ID="txtBDHieuLuc" runat="server" Width="209px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtBDHieuLuc_CalendarExtender" runat="server" 
                    TargetControlID="txtBDHieuLuc" Enabled="True">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:Label ID="Label409" runat="server" Text="Kết thúc hiệu lực :"></asp:Label>
            </td>
            <td class="style2" bgcolor="#EDEFF4">
                <asp:TextBox ID="txtKTHieuLuc" runat="server" Width="209px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtKTHieuLuc_CalendarExtender" runat="server" 
                    TargetControlID="txtKTHieuLuc" Enabled="True">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label410" runat="server" Text="Người được bảo hiểm"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtNguoiDuocBH" runat="server" Height="25px" Width="335px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtNguoiDuocBH" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblThongBaoNguoiDuocBH" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="Label8" runat="server" Text="Địa chỉ"></asp:Label>
            </td>
            <td colspan="3" bgcolor="#EDEFF4">
                <asp:TextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="398px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Người liên hệ"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="txtNguoiLienHe" runat="server" Width="209px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="(*)" ControlToValidate="txtNguoiLienHe" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblThongBaoNguoiLienHe" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Số Fax :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSoFax" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="Label12" runat="server" Text="Email :"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                
                <asp:TextBox ID="txtEmail" runat="server" Width="209px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="(*)" ControlToValidate="txtDienThoai" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Label ID="lblThongBaoSoDT" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:Label ID="Label407" runat="server" Text="Điện Thoại"></asp:Label>
            </td>
            <td bgcolor="#EDEFF4">
                <asp:TextBox ID="txtDienThoai" runat="server" Width="209px"></asp:TextBox>
            </td>
        </tr>
         <tr>
         <td></td>
            <td>
                
                <asp:Label ID="lblThongBaoBaoHiem" runat="server"></asp:Label>
            </td>
        </tr>
    </table>