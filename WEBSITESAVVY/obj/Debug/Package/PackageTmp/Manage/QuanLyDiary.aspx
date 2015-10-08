<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyDiary.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyDiary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <table class="tablemanager">
    <tr>
        <td class="headermanager">
            QUẢN LÝ DIARY</td>
    </tr>
    <tr>
        <td>
    <table align="center">
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Label ID="Label9" runat="server" Text="THÊM DIARY MỚI"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager" width="20%">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên"></asp:Label>
            </td>
            <td class="rightmanager">
                
                <asp:DropDownList ID="drGDV0" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" Width="200px" Height="20px">
                    <asp:ListItem Value="0">[Chọn GĐV]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tham chiếu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textmananger"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Chỉ nhập mã đầu tham chiếu, ví dụ: 1301)"></asp:Label>
                <asp:Label ID="lbllThongBao" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label12" runat="server" Text="Ngày :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgay" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
                    TargetControlID="txtNgay">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Diễn Giải :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtDienGiai" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Số Giờ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtSoGio" runat="server" CssClass="textmananger"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Ngày Bắt Đầu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgayBatDau" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgayBatDau_CalendarExtender" 
                    runat="server" TargetControlID="txtNgayBatDau">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label7" runat="server" Text="Ngày Kết Thúc :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgayKetThuc" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgayKetThuc_CalendarExtender" 
                    runat="server" TargetControlID="txtNgayKetThuc">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label8" runat="server" Text="Kết Quả Ghi Nhận"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtKetQuaGhiNhan" runat="server" CssClass="textmananger" 
                    TextMode="MultiLine" Width="300px">(Được cập nhật sau ngày kết thúc)</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightmanager">
                <asp:Button ID="btnThem" runat="server" CssClass="btn" onclick="btnThem_Click" 
                    Text="Thêm" />
            &nbsp;<asp:Label ID="lblThongBaoThem" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
        </td>
    </tr>
    <tr>
        <td>
                
                <asp:Label ID="Label13" runat="server" Text="Tham chiếu :" Font-Bold="True" 
                    Font-Size="16px"></asp:Label>
                
                <asp:TextBox ID="txtThamChieu0" runat="server" CssClass="textmananger"></asp:TextBox>
                
                <asp:Label ID="Label14" runat="server" Text="Giám Định Viên :" Font-Bold="True" 
                    Font-Size="16px"></asp:Label>
                
                <asp:DropDownList ID="drGDV" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" Width="200px" Height="20px">
                    <asp:ListItem Value="0">[Chọn GĐV]</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnXemDiary" runat="server" CssClass="btn" 
                    onclick="btnXemDiary_Click" Text="Xem" />
                
            </td>
    </tr>
    <tr>
        <td align="center" class="colmanager1">
                <asp:GridView ID="gvDSDiary" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID_Diary" AllowPaging="True" 
                    onpageindexchanging="gvDSDiary_PageIndexChanging" PageSize="50" 
                    onrowcancelingedit="gvDSDiary_RowCancelingEdit" 
                    onrowdeleting="gvDSDiary_RowDeleting" onrowediting="gvDSDiary_RowEditing" 
                    onrowupdating="gvDSDiary_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="ID_Diary" HeaderText="ID" />
                        <asp:BoundField DataField="ID_Claim" HeaderText="Reference">
                        <ItemStyle Width="70px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenGDV" HeaderText="Adjuster">
                        <ItemStyle Width="200px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DienGiai" 
                            HeaderText="Task's Description / Word-done ">
                        <ItemStyle Width="300px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoGio" HeaderText="TimeSheet" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ngay" HeaderText="Date" />
                        <asp:BoundField DataField="NgayGioBatDau" HeaderText="Start" />
                        <asp:BoundField DataField="NgayGioKetThuc" HeaderText="End" />
                        <asp:BoundField DataField="KetQua" HeaderText="Results" />
                        <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                        Font-Size="16px" ForeColor="White" />
                </asp:GridView>
            </td>
    </tr>
</table>
</asp:Content>
