<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="QuanLyNhaBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Manage.QuanLyNhaBaoHiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
<table class="tablemanager">
    <tr>
        <td align="center" colspan="2" >
           <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
            <asp:Label ID="Label3" runat="server" Text="Tên Nhà Bảo Hiểm :" CssClass="left"></asp:Label>
            
        &nbsp;<asp:TextBox ID="txtProductList" runat="server" CssClass="textmananger"></asp:TextBox>
    <ajaxToolkit:AutoCompleteExtender ID="autoCompleteExtender1" runat="server" 
        CompletionInterval="0" CompletionSetCount="10" EnableCaching="false" 
        FirstRowSelected="false" MinimumPrefixLength="1" ServiceMethod="GetProductList" 
        TargetControlID="txtProductList">
    </ajaxToolkit:AutoCompleteExtender>
    <asp:Button ID="txtTim" runat="server" onclick="txtTim_Click" Text="Tìm" 
        Width="41px" CssClass="btn" />
</div></td>
    </tr>
    <tr>
        <td align="center" colspan="2" class="headermanager">
            <asp:Label ID="Label2" runat="server" Text="QUẢN LÝ CÔNG TY BẢO HIỂM"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="left">
            <asp:Label ID="Label1" runat="server" Text="Tên Công Ty :"></asp:Label>
            
        </td>
        <td valign="top" class="right">
            <asp:TextBox ID="txtTenCongTy" runat="server" CssClass="textEntry"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                style="height: 26px" Text="Thêm" CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td align="center" valign="top" colspan="2">
            <asp:GridView ID="gvDSCongTy" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="ID_NhaBH" ForeColor="#333333" 
                onrowcancelingedit="gvDSCongTy_RowCancelingEdit" onrowediting="gvDSCongTy_RowEditing" 
                onrowupdating="gvDSCongTy_RowUpdating" Font-Names="Times New Roman" 
                Font-Size="16px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="STT"> <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenNhaBH" HeaderText="Tên Công Ty">
                    <ItemStyle Width="400px" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Thay Đổi" ShowEditButton="True">
                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Names="Times New Roman" 
                    ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle Font-Names="Times New Roman" Font-Bold="False" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
