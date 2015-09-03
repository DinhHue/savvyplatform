<%@ Page Title="Chi Tiết Thiệt Hại" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="ChiTietThietHai.aspx.cs" Inherits="WEBSITESAVVY.Pages.ChiTietThietHai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .colleft
        {
            padding-right:10px;
            text-align:right;  
            width:30%; 
           
        }
         .colright
        {
            padding-left:10px;
            text-align:left;   
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <%--   <table class="infoFormTableSub">
        <tr>
            <td class="headermanager">
                Danh Mục Thiệt Hại Của
                <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="gvDanhSachChiTietThietHai1" runat="server" 
                    Font-Names="Times New Roman" AutoGenerateColumns="False" 
                    AllowPaging="True" 
                    onpageindexchanging="gvDanhSachChiTietThietHai1_PageIndexChanging" 
                    PageSize="20" Width="800px" Font-Size="14px">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                             <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Diễn giải" />
                        <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="Giá trị khiếu nại" />
                        <asp:BoundField DataField="ChiPhiKhoiPhuc" HeaderText="Chi phí khôi phục" />
                        <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Đề xuất tính toán" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" />
                        <asp:CommandField HeaderText="Chỉnh sửa" ShowEditButton="True" />
                        <asp:CommandField HeaderText="Xoá" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView><br />
                <asp:GridView ID="gvDanhSachChiTietThietHai2" runat="server" 
                    Font-Names="Times New Roman" AutoGenerateColumns="False" 
                    AllowPaging="True" 
                    onpageindexchanging="gvDanhSachChiTietThietHai2_PageIndexChanging" 
                    PageSize="20" Width="800px" Font-Size="14px">
                    <Columns>
                         <asp:TemplateField HeaderText="STT">
                            <ItemTemplate>
                             <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Diễn giải" />
                        <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="Giá trị khiếu nại" />
                        <asp:BoundField DataField="ThietHaiHopLy" HeaderText="Thiệt hại hợp lý" />
                        <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Đề xuất tính toán" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" />
                        <asp:CommandField HeaderText="Chỉnh sửa" ShowEditButton="True" />
                        <asp:CommandField HeaderText="Xoá" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        </table>
                <table class="infoFormTableSub">
                    <tr>
                        <td colspan="2" class="headermanager">
                            Chi Tiết Thiệt Hại Mới</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="colmanager1">
                            <asp:Label ID="Label8" runat="server" Text="Thể loại tổn thất :"></asp:Label>
                            <asp:DropDownList ID="drDSLoaiThietHai" runat="server" 
                                onselectedindexchanged="drDSLoaiThietHai_SelectedIndexChanged" 
                                Width="200px" AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem Value="0">[Chọn lĩnh vực tổn thất]</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="lblDienGiai" runat="server" Text="Diễn giải :" Visible="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtDienGiai" runat="server" Height="100px" TextMode="MultiLine" 
                                Width="400px" Visible="False" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="lblGiaTriKhieuNai" runat="server" Text="Giá trị khiếu nại :" 
                                Visible="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtGiaTriKhieuNai" runat="server" 
                                Visible="False" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="lblChiPhiKhoiPhuc" runat="server" Text="Chi phí khôi phục :" 
                                Visible="False"></asp:Label>
                            <asp:Label ID="lblThietHaiHopLy" runat="server" Text="Thiệt hại hợp lý :" 
                                Visible="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtChiPhiKhoiPhuc" runat="server" Wrap="False" 
                                Visible="False" CssClass="textmananger"></asp:TextBox>
                            <asp:TextBox ID="txtThietHaiHopLy" runat="server" Wrap="False" Visible="False" 
                                CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="lblDeXuatTinhToan" runat="server" Text="Đề xuất tính toán :" 
                                Visible="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtDeXuatTinhToan" runat="server" Wrap="False" 
                                Visible="False" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftmanager">
                            <asp:Label ID="lblGhiChu" runat="server" Text="Ghi chú :" Visible="False"></asp:Label>
                        </td>
                        <td class="rightmanager">
                            <asp:TextBox ID="txtGhiChu" runat="server" Height="100px" TextMode="MultiLine" 
                                Width="400px" Visible="False" CssClass="textmananger"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="colleft">
                            &nbsp;</td>
                        <td class="rightmanager">
                            <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" Width="100px" 
                                onclick="btnCapNhat_Click" Visible="False" CssClass="btn" />
                        </td>
                    </tr>
                </table>--%>
                 <table class="infoFormTableSub">
                                <tr>
                                    <td class="headermanager">
                                        LOSS SUMMARY DETAIL  
                                        
                                        CỦA
                                        <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                    <asp:Label ID="lblThongBaoSumdetail" runat="server" Text="Chưa có summary detail nào !" CssClass="headerTimesheet" Visible="False"></asp:Label><br />
                                    <asp:Label ID="lblbuilding" runat="server" Text="Property (Building)" CssClass="headerTimesheet" Visible="False"></asp:Label>
                                        <asp:GridView ID="gvDanhMucBuilding" runat="server" AutoGenerateColumns="False" 
                                            Font-Names="Times New Roman" Font-Size="14px" 
                                        onrowcancelingedit="gvDanhMucBuilding_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucBuilding_RowUpdating" 
                                            onrowediting="gvDanhMucBuilding_RowEditing" 
                                            onrowdatabound="gvDanhMucBuilding_RowDataBound" ShowFooter="True" Width="100%" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%">
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" HeaderText="Agreed Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Proposed Adjus" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center" >
                                                
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                                
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White"/>
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblmachinery" runat="server" Text="Property (Machinery)" class="headerTimesheet" Visible="False"></asp:Label>                                        
                                        <asp:GridView ID="gvDanhMucMachinery" runat="server" 
                                            AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"  
                                            onrowcancelingedit="gvDanhMucMachinery_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucMachinery_RowUpdating" 
                                            onrowediting="gvDanhMucMachinery_RowEditing" Width="100%" 
                                            onrowdatabound="gvDanhMucMachinery_RowDataBound" ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%" >
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Agreed Amount" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Proposed Adjus" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center"  >
                                               
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblstock" runat="server" Text="Property (Stock)" class="headerTimesheet" Visible="False"></asp:Label>
                                        <asp:GridView ID="gvDanhMucStock" runat="server" AutoGenerateColumns="False" 
                                            Font-Names="Times New Roman" Font-Size="14px"  
                                            onrowcancelingedit="gvDanhMucStock_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucStock_RowUpdating" 
                                            onrowediting="gvDanhMucStock_RowEditing" Width="100%" 
                                            onrowdatabound="gvDanhMucStock_RowDataBound" ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                 <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%" >
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Agreed Amount" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Proposed Adjus" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center"  >
                                               
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblconstruction" runat="server" Text="CAR (Construction Work)" class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucConstruction" runat="server" 
                                            AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"  
                                            onrowcancelingedit="gvDanhMucConstruction_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucConstruction_RowUpdating" 
                                            onrowediting="gvDanhMucConstruction_RowEditing" Width="100%" 
                                            onrowdatabound="gvDanhMucConstruction_RowDataBound" ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%" >
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Agreed Amount" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Proposed Adjus" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center"  >
                                               
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                             <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblliability" runat="server" Text="3rd Party Liability" class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucLiability" runat="server" 
                                            AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px" 
                                            onrowcancelingedit="gvDanhMucLiability_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucLiability_RowUpdating" 
                                            onrowediting="gvDanhMucLiability_RowEditing" Width="100%"  
                                            onrowdatabound="gvDanhMucLiability_RowDataBound" ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                 <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%" >
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Agreed Amount" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Proposed Adjus" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%">
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center" >
                                                
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                                
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblother" runat="server" Text="Property (Extension Clause) " class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucOther" runat="server" AutoGenerateColumns="False" 
                                            Font-Names="Times New Roman" Font-Size="14px" 
                                            onrowcancelingedit="gvDanhMucOther_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucOther_RowUpdating" 
                                            onrowediting="gvDanhMucOther_RowEditing" Width="100%" 
                                            onrowdatabound="gvDanhMucOther_RowDataBound" ShowFooter="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" 
                                                    ItemStyle-Width="30%">
<ItemStyle Width="30%"></ItemStyle>
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." 
                                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" 
                                                    DataFormatString="{0:###,###}">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" 
                                                    ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Agreed Amount" ItemStyle-Width="100px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" 
                                                    HeaderText="Proposed Adjus"  ItemStyle-Width="120px" 
                                                    DataFormatString="{0:###,###}" >
<ItemStyle HorizontalAlign="Right" Width="120px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" 
                                                    HeaderText="Rate" ItemStyle-Width="50px">
<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" 
                                                    ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" 
                                                    ItemStyle-HorizontalAlign="Center"  >
                                               
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:CommandField>
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                        <asp:Label ID="Label24" runat="server" Text="CLAIM SUMMARY" class="headerTimesheet"></asp:Label>
                                        <asp:GridView ID="gvTotal" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"
                                        Width="100%" onrowdatabound="gvTotal_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <%--<asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TheLoai" HeaderText="Thể Loại" ItemStyle-Width="10%"/>
                                                <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment"  ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="10%"/>                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                        <asp:Button ID="btnSaveSummarydetail" runat="server" Text="Save" CssClass="btn" onclick="btnSaveSummarydetail_Click" />
                                    </td>
                                </tr>
                            </table>
                            <table class="infoFormTableSub">
                                <tr>
                                    <td class="headermanager" colspan="2">
                                        Chi Tiết Thiệt Hại
                                        <asp:Label ID="lblMaSum" runat="server" Text="" Visible="False"></asp:Label>
                                     </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager" >
                                        <asp:Label ID="Label14" runat="server" Text="Loại tổn thất :"></asp:Label>
                            
                                    </td>
                                    <td class="rightmanager">
                                        <asp:DropDownList ID="drDSLoaiThietHai" runat="server"                                
                                            Width="300px" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">[Choose field of loss]</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="Label21" runat="server" Text="Mệnh giá :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                         <asp:DropDownList ID="drMenhGia" runat="server"                                
                                            Width="200px" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">[Choose rate]</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblDienGiai" runat="server" Text="Diễn giải :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtDienGiai" runat="server" CssClass="textmananger" 
                                              Width="600px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblGiaTriKhieuNai" runat="server" Text="QTy. :" 
                                            ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtGiaTriKhieuNai" runat="server" CssClass="textmananger" 
                                           ></asp:TextBox>
                                        <asp:Label ID="Label41" runat="server" 
                                            Text="Chỉ nhập số không nhập dấu '.' or ','" Font-Italic="True" 
                                            ForeColor="#00CC66"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblThietHaiHopLy" runat="server" Text="Agreed Amount :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">                           
                                        <asp:TextBox ID="txtThietHaiHopLy" runat="server" CssClass="textmananger" 
                                            Wrap="False"></asp:TextBox> 
                                        <asp:Label ID="Label45" runat="server" 
                                            Text="Chỉ nhập số không nhập dấu '.' or ','" Font-Italic="True" 
                                            ForeColor="#00CC66"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="Label22" runat="server" Text="Claim Amount :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">                           
                                        <asp:TextBox ID="txtSoLuong" runat="server" CssClass="textmananger" 
                                            Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblDeXuatTinhToan" runat="server" Text="Proposed Adjustment :" 
                                            ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtDeXuatTinhToan" runat="server" CssClass="textmananger" 
                                             Wrap="False"></asp:TextBox> 
                                        <asp:Label ID="Label46" runat="server" 
                                            Text="Chỉ nhập số không nhập dấu '.' or ','" Font-Italic="True" 
                                            ForeColor="#00CC66"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblGhiChu" runat="server" Text="Note / Remark :" ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtGhiChu" runat="server" CssClass="textmananger" 
                                            Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="colleft">
                                        &nbsp;</td>
                                    <td class="rightmanager">
                                        <asp:Button ID="btnCapNhat" runat="server" CssClass="btn" 
                                            Text="Insert"  Width="100px" onclick="btnCapNhat_Click" />
                                    </td>
                                </tr>
                            </table>
            </asp:Content>
