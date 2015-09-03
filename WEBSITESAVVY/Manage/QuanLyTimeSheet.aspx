<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyTimeSheet.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyTimeSheet" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>    
              <table align="center" width="70%" class="tablemanager">
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Label ID="Label9" runat="server" Text="THÊM DIARY MỚI"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager" width="15%">
                <asp:Label ID="Label11" runat="server" Text="Giám Định Viên"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drGDV" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Tham chiếu :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:Label ID="lbllThongBao" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label12" runat="server" Text="Ngày :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtNgay" runat="server" CssClass="textEntry"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
                    TargetControlID="txtNgay" Format="yyyy-MM-dd">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Diễn Giải :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDienGiai" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Số Giờ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtSoGio" runat="server" CssClass="textEntry"></asp:TextBox>
                <asp:Label ID="Label13" runat="server" Font-Italic="True" ForeColor="#999999" 
                    Text="(Nhập dấu chấm nếu giờ lẻ: 0.5)"></asp:Label>
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
<table class="tablemanager">
    <tr>
        <td class="headermanager" colspan="2">          
                <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ TIMESHEET"></asp:Label>
         
        </td>
    </tr>
    <tr>
        <td class="headermanager" colspan="2">
          
                Tìm TimeSheet Theo:</td>
    </tr>
    <tr>
        <td class="leftmanager" width="15%">
          
               
                Giám Định Viên:
         
        </td>
        <td class="rightmanager">
          
                <asp:DropDownList ID="drGDV0" runat="server">
                </asp:DropDownList>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                &nbsp;Mã
          
                Tham Chiếu: </td>
        <td class="rightmanager">
          
                <asp:TextBox ID="txtMaThamChieuT" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:AutoCompleteExtender ID="autoCompleteExtender3" runat="server" 
                    CompletionInterval="0" CompletionSetCount="10" EnableCaching="false" 
                    FirstRowSelected="false" MinimumPrefixLength="1" ServiceMethod="LayDSThamChieu" 
                    TargetControlID="txtMaThamChieuT">
                </ajaxToolkit:AutoCompleteExtender>
         
        </td>
    </tr>
    <tr>
        <td>
          
                &nbsp;</td>
        <td class="rightmanager">
          
                <asp:Button ID="btnTim" runat="server" onclick="btnTim_Click" Text="Tìm" 
                    CssClass="btn" />
         
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
                    <asp:GridView ID="gvDSTimeSheet" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" 
                        onrowdeleting="gvDSTimeSheet_RowDeleting" 
                        onselectedindexchanged="gvDSTimeSheet_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ID_TimeSheet" HeaderText="ID" />
                            <asp:BoundField DataField="TenGDV" HeaderText="GĐV" >
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Tham Chiếu" >
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Ngày" >
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Diễn Giải" >
                            <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" 
                                HeaderText="Time-Spent" >
                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField HeaderText="Edit" ShowSelectButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
        </td>
    </tr>
   <%-- <tr>
        <td class="colmanager1" colspan="2">
            <asp:DropDownList ID="ddlFile" runat="server" Visible="false" Width="100px">
                <asp:ListItem Selected="True" Value="Excel">Excel</asp:ListItem>
                <asp:ListItem Value="Word">Word</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" 
                Visible="false" Width="73px" CssClass="btn" />
        </td>
    </tr>--%>
    <tr>
        <td colspan="2" align="center">
    <table id="all" runat="server" dir="ltr" enableviewstate="True" align="center" width="100%" 
                        clientidmode="Inherit">
    <tr>
        <td align="center">
                    <asp:Button ID="btnXem" runat="server" onclick="btnXem_Click" 
                        Text="Show All" Width="94px" CssClass="btn" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnXuatExcel" runat="server" CssClass="btn" 
                        onclick="btnXuatExcel_Click" Text="Export to Excel" />
        </td>
    </tr>
    <tr>
        <td align="center">
                    <asp:GridView ID="gvDSTimeSheet0" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" 
                        onrowdatabound="gvDSTimeSheet0_RowDataBound" ShowFooter="True" 
                Width="85%">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Claim No" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="RealTime" />
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Units">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="Adjusters" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
        </td>
    </tr>
</table>

<table id="sua" runat="server" visible="false" dir="ltr" 
        enableviewstate="True" align="center" class="tablemanager">
    <tr>
        <td class="leftmanager" width="15%">           
                Mã TimeSheet :
        </td>
        <td class="rightmanager">          
                <asp:TextBox ID="txtMaS" runat="server" ReadOnly="true" CssClass="textmananger"></asp:TextBox>           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">         
                Giám Định Viên :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtGDVS" runat="server" ReadOnly="True" 
                    CssClass="textmananger"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
        
                Tham Chiếu :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtThamChieuS" runat="server" CssClass="textmananger"></asp:TextBox>
                <ajaxToolkit:AutoCompleteExtender ID="autoCompleteExtender1" runat="server" 
                    CompletionInterval="0" CompletionSetCount="10" EnableCaching="false" 
                    FirstRowSelected="false" MinimumPrefixLength="1" ServiceMethod="LayDSThamChieu" 
                    TargetControlID="txtThamChieuS">
                </ajaxToolkit:AutoCompleteExtender>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
            Ngày :</td>
        <td class="rightmanager">
                        <asp:TextBox ID="txtNgayS" runat="server" CssClass="textmananger"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                            TargetControlID="txtNgayS"  Format="yyyy-MM-dd">
                        </ajaxToolkit:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td class="leftmanager">           
                Loại Công Tác :
        </td>
        <td class="rightmanager">
            
                <asp:DropDownList ID="drType" runat="server" Height="26px" Width="250px">
                </asp:DropDownList>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Diễn giải chi tiết:
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtDienGiaiS" runat="server" TextMode="MultiLine" 
                    Width="400px"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
            
                Thời Lượng Phát Sinh :
        </td>
        <td class="rightmanager">            
                <asp:TextBox ID="txtPhatSinhS" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td class="buttonmananger">
          
                <asp:Button ID="btnCapNhat" runat="server" onclick="btnCapNhat_Click" 
                    Text="Cập Nhật" CssClass="btn" />
          
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="buttonmananger">
          
                &nbsp;</td>
    </tr>
    </table>
    
</asp:Content>
