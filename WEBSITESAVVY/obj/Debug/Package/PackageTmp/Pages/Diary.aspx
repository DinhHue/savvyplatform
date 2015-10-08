<%@ Page Title="Diary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Diary.aspx.cs" Inherits="WEBSITESAVVY.Pages.Diary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Claim Diary</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table align="center" style="font-size: 16px; font-family: 'Times New Roman', Times, serif; text-align: center; vertical-align: top;" 
        width="98%">       
        <tr>
            <td align="right" width="40%" >
                
                <asp:Label ID="Label6" runat="server" Text="Tham chiếu :" Font-Bold="True" 
                    Font-Size="16px"></asp:Label>
                
            </td>
            <td align="left" width="60%" >
                
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textmananger"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td align="right" >
                
                <asp:Label ID="Label7" runat="server" Text="Giám Định Viên :" Font-Bold="True" 
                    Font-Size="16px"></asp:Label>
                
            </td>
            <td align="left" width="60%" >
                
                <asp:DropDownList ID="drGDV" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" Width="200px" Height="20px">
                    <asp:ListItem Value="0">[Chọn GĐV]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" >                
               
            </td>
            <td align="left" >
                 <asp:Button ID="btnDiaryMoi" runat="server" CssClass="btnThem" Text="Add" 
                    PostBackUrl="~/Pages/DiaryMoi.aspx" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnXemDiary" runat="server" CssClass="btnThem" 
                    onclick="btnXemDiary_Click" Text="Search" />
                
            &nbsp;
                
            </td>
        </tr>
        <tr>
            <td class="leftDiary" >
                
                <asp:Label ID="Insured" runat="server" Text="Insured :"></asp:Label>
                <asp:Label ID="lblNguoiDuocBaoHiem" runat="server"></asp:Label>
                <br />
&nbsp;&nbsp;
                <asp:Label ID="DOL" runat="server" Text="DOL   :"></asp:Label>
                <asp:Label ID="lblNgayTonThat" runat="server"></asp:Label>
                
            </td>
            <td class="rightDiary" >
                
                <asp:Label ID="Case_reference" runat="server" Text="Case Reference No :"></asp:Label>
&nbsp;<asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Assiged" runat="server" Text="Assigned Date :"></asp:Label>
&nbsp;<asp:Label ID="lblNgayYeuCauGiamDinh" runat="server"></asp:Label>
                
            </td>
        </tr>
       
        <tr>
            <td colspan="2" align="center" >
                <asp:GridView ID="gvDSDiary" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID_Diary" AllowPaging="True" 
                    onpageindexchanging="gvDSDiary_PageIndexChanging" PageSize="50" 
                    onrowcancelingedit="gvDSDiary_RowCancelingEdit" 
                    onrowediting="gvDSDiary_RowEditing" onrowupdating="gvDSDiary_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                             <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
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
                        <asp:BoundField DataField="NgayGioBatDau" HeaderText="Starting" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayGioKetThuc" HeaderText="Ended" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="KetQua" HeaderText="Note &amp; Results">
                        <ItemStyle Width="250px" HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                        Font-Size="16px" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" >
                <asp:Label ID="lblThongBao" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
                
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
