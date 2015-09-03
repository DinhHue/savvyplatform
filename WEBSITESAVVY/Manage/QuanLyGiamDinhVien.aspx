<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyGiamDinhVien.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyGiamDinhVien" %>
<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div align="center">
   
    <table cellpadding="1" cellspacing="1" class="tablemanager" align="center">
    <tr>
        <td class="headermanager">
            <asp:Label ID="Label1" runat="server" Text="QUẢN LÝ GIÁM ĐỊNH VIÊN"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colmanager1">
            <asp:Button ID="btnHienThem" runat="server" onclick="btnHienThem_Click" 
                Text="Giám Định Viên Mới" CssClass="btn" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnXem" runat="server" onclick="btnXem_Click" 
                Text="Xem Danh Sách" CssClass="btn" />
        </td>
    </tr>
</table>
<table id="them" runat="server" visible="false" class="tablemanager" align="center">
    <tr>
        <td class="leftmanager" width="15%">
          
                Họ và tên :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtFullName" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager" width="15%">
          
                Tên viết tắt :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtTen" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Điện Thoại :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtDienThoai" runat="server" CssClass="textmananger"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
            
                Email :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textmananger"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Ngày Sinh :
        </td>
        <td class="rightmanager">
          
                    <asp:TextBox ID="txtNgay" runat="server" Height="23px" CssClass="textmananger"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                        TargetControlID="txtNgay">
                    </ajaxToolkit:CalendarExtender>
               
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Địa Chỉ :
        </td>
        <td class="rightmanager">
            
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="textmananger"></asp:TextBox>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Chức Vụ :
        </td>
        <td class="rightmanager">
           
                <asp:DropDownList ID="drChucVu" runat="server" AutoPostBack="false" 
                    CausesValidation="True" Height="25px" Width="245px">
                </asp:DropDownList>
          
        </td>
    </tr>
     <tr>
        <td class="leftmanager">
          
                Mã Tên :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtMaTenN" runat="server" CssClass="textmananger"></asp:TextBox>
            
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
        <td class="leftmanager">
         
                Tên Đăng Nhập :
        </td>
        <td class="rightmanager">
          
                <asp:TextBox ID="txtuser" runat="server" CssClass="textmananger"></asp:TextBox>
         
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Mật Khẩu :
        </td>
        <td class="rightmanager">
          
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" 
                    CssClass="textmananger"></asp:TextBox>
         
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="buttonmananger">
           
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm" 
                    Width="73px" CssClass="btn" />
      
        </td>
    </tr>
</table>
<table id="sua" runat="server" visible="false" class="tablemanager" align="right">
    <tr>
        <td class="leftmanager" width="15%">
           
                Mã Giám Định Viên : 
        </td>
        <td class="rightmanager">
          
                <asp:TextBox ID="txtMaS" runat="server" ReadOnly="true" CssClass="textmananger"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Tên đầy đủ:</td>
        <td class="rightmanager">
         
                <asp:TextBox ID="txtFullnameS" runat="server" CssClass="textmananger"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Tên viết tắt : 
        </td>
        <td class="rightmanager">
         
                <asp:TextBox ID="txtTenS" runat="server" CssClass="textmananger"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Điện Thoại :
        </td>
        <td class="rightmanager">
          
                <asp:TextBox ID="txtDtS" runat="server" CssClass="textmananger"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Email :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtEmailS" runat="server" CssClass="textmananger"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
           
                Địa Chỉ :
        </td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtDiaChiS" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Chức Vụ :
        </td>
        <td class="rightmanager">
           
                <asp:DropDownList ID="drChucVuS" runat="server" AutoPostBack="false" 
                    CausesValidation="True" Height="25px" Width="245px">
                </asp:DropDownList>
           
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                User Name :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtUsernameS" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
     <tr>
        <td class="leftmanager">
          
                Rate :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtRateU" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Mã Tên :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtMaTenS" runat="server" CssClass="textmananger"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Kích hoạt :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtKichHoat" runat="server" CssClass="textmananger" 
                    Width="10%"></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td class="leftmanager">
          
                Public :</td>
        <td class="rightmanager">
           
                <asp:TextBox ID="txtPublic" runat="server" CssClass="textmananger" Width="10%"></asp:TextBox>
            
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
</table>
<table id="danhsach" runat="server" class="tablemanager" align="center">
    <tr>
        <td class="colmanager1" width="100%">
            <asp:GridView ID="gvDSGDV" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="ID_GDV" ForeColor="#333333" Width="100%" AllowPaging="True" 
                onpageindexchanging="gvDSGDV_PageIndexChanging" 
                onselectedindexchanged="gvDSGDV_SelectedIndexChanged" PageSize="20" 
                onrowdeleting="gvDSGDV_RowDeleting1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_GDV" HeaderText="ID" />
                    <asp:BoundField DataField="TenGDV" HeaderText="Tên " ReadOnly="True" />
                    <asp:BoundField DataField="FullName" HeaderText="FullName" />
                    <asp:BoundField DataField="TenChucVu" HeaderText="Chức vụ" ReadOnly="True" />
                    <asp:BoundField DataField="DienThoai" HeaderText="Điện thoại" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Rate" DataFormatString="{0:#,##0}" 
                        HeaderText="Rate" />
                    <asp:BoundField DataField="MaTen" HeaderText="Mã Tên" />
                    <asp:BoundField DataField="KH" HeaderText="K/H">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PUB" HeaderText="Permission">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Edit" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Names="Times New Roman" 
                    ForeColor="White" HorizontalAlign="Left" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Left" 
                    Font-Names="Times New Roman" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </td>
    </tr>
</table>

</div>
</asp:Content>
