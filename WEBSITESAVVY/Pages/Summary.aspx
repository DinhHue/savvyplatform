<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WEBSITESAVVY.Pages.Summary" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .panel
        {
            width:700px;
            text-align:center;
            vertical-align:top;
            padding-left:40px;
        }
        .col
        {
            text-align:left;
            vertical-align:top;
            padding-left:20px;
        }
        .colright
        {
            text-align:right;
            vertical-align:top;
            float:right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                Summary mới
            
</HeaderTemplate>
            
<ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" CssClass="panel">
        <asp:Label ID="Label1" runat="server" Text="Tham chiếu :"></asp:Label>

        &nbsp;&nbsp;
        <asp:TextBox ID="txtThamChieu" runat="server" Width="200px"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnThemMoi" runat="server" Text="Summary Mới" 
            onclick="btnThemMoi_Click" />

        &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="Xem" />

                <br />
                <br />
                <asp:GridView ID="grDSSumTong" runat="server" Font-Names=".VnArial" 
                    ForeColor="Black">
<EditRowStyle ForeColor="#006600" />

<HeaderStyle BackColor="#003300" Font-Bold="False" Font-Names=".VnTime" 
                        ForeColor="White" HorizontalAlign="Center" />

<RowStyle Font-Names=".VnArial" HorizontalAlign="Left" />
</asp:GridView>

                <br />
                <br />
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" CssClass="panel">
        <table class="style1" align="center">
            <tr>
                <td colspan="1" class="col">
                    <asp:Label ID="Label2" runat="server" Text="Loại :"></asp:Label>

                </td>
                <td class="col" colspan="2">
                    <asp:DropDownList ID="drTheLoaiSum" runat="server" Width="150px" 
                        onselectedindexchanged="drTheLoaiSum_SelectedIndexChanged" 
                        AutoPostBack="True" CausesValidation="True"></asp:DropDownList>

                    
                </td>
                <td class="col" colspan="1">
                    <asp:Label ID="lblThamChieu" runat="server" CssClass="leftCol"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="col" colspan="1">
                    <asp:Label ID="lblhangmuc" runat="server" Text="Hạng mục :"></asp:Label>

                </td>
                <td class="col" colspan="3">
                    <asp:TextBox ID="txtHangMuc" runat="server" Width="450px"></asp:TextBox>

                    <br />
                    <asp:Label ID="lblthongbaohangmuc" runat="server"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="col">
                    <asp:Label ID="lblGiaTriKhieuNai" runat="server" Text="Giá trị khiếu nại :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtGTKhieuNai" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblSoTienBaoHiem" runat="server" Text="Số tiển bảo hiểm :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtSoTienBH" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="col">
                    
                    <asp:Label ID="lblNguyenGia" runat="server" Text="Nguyên giá :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtNguyenGia" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblGiaTriConLai" runat="server" Text="Giá trị còn lại :"></asp:Label>

                    &nbsp;</td>
                <td class="col">
                    <asp:TextBox ID="txtGiaTriConLai" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="col">
                    <asp:Label ID="lblChiPhiKhoiPhuc" runat="server"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtChiPhiKhoiPhuc" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblSoTienBoiThuong" runat="server" Text="Số tiền bồi thường"></asp:Label>

                    &nbsp;</td>
                <td class="col">
                    <asp:TextBox ID="txtSoTienBoiThuong" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="col">
                    <asp:Label ID="lblSoLuong" runat="server" Text="Số Lượng :"></asp:Label>

                    </td>
                <td class="col">
                    <asp:TextBox ID="txtSoLuong" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblDonGia" runat="server" Text="Đơn giá :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtDonGia" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="col">
                    <asp:Label ID="lblMucBoiThuong" runat="server" Text="Mức bồi thường :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtMucBoiThuong" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblPhamVi" runat="server" Text="Phạm vi :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtPhamVi" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="col">
                    <asp:Label ID="lblBaoGia" runat="server" Text="Báo Giá :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtBaoGia" runat="server" Width="150px"></asp:TextBox>

                </td>
                <td class="col">
                    <asp:Label ID="lblDeXuatHopLy" runat="server" Text="Đề xuất hợp lý :"></asp:Label>

                </td>
                <td class="col">
                    <asp:TextBox ID="txtDeXuatHopLy" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td colspan="1" class="col">
                    <asp:Label ID="lblGhiChu" runat="server" Text="Ghi chú :"></asp:Label>

                    &nbsp;</td>
                <td colspan="3" class="col">
                    <asp:TextBox ID="txtGhiChu" runat="server" Width="450px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td colspan="4">
                    
                    <asp:Button ID="btnThemSum" runat="server" onclick="btnThemSum_Click" 
                        Text="Thêm" />

                    
                    &nbsp;&nbsp;
                    <asp:Label ID="lblThongbaothem" runat="server"></asp:Label>

                    
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" CssClass="" />

                </td>
            </tr>
        </table>
    </asp:Panel>

            
</ContentTemplate>
        
</ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
        <HeaderTemplate>
        Xem danh sách Summary chi tiết.
        
</HeaderTemplate>
        
<ContentTemplate>
        
    <asp:Panel ID="Panel3" runat="server" CssClass="panel">
        <asp:Label ID="Label3" runat="server" Text="Tham chiếu :"></asp:Label>
        <asp:TextBox ID="txtThamChieuView" runat="server" Width="200px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:DropDownList ID="drTheLoaiSum1" runat="server" Width="150px">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnXem" runat="server" 
                        style="height: 26px" Text="Xem" onclick="btnXem_Click" />
    <br />
    
        <asp:GridView ID="grDSSum" runat="server" 
            Font-Names=".VnArial" ForeColor="Black">
            <EditRowStyle ForeColor="#006600" />
            <HeaderStyle BackColor="#003300" Font-Bold="False" Font-Names=".VnTime" 
                ForeColor="White" HorizontalAlign="Center" />
            <RowStyle Font-Names=".VnArial" HorizontalAlign="Left" />
        </asp:GridView>
        
        <br />
        <asp:Button ID="btnExcel" runat="server" onclick="btnExcel_Click" 
            Text="Excel" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnPDF" runat="server" Text="PDF" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnWord" runat="server" Text="Word" onclick="btnWord_Click" />
    </asp:Panel>
        
</ContentTemplate>
        
</ajaxToolkit:TabPanel>
       
    </ajaxToolkit:TabContainer>
    
</asp:Content>
