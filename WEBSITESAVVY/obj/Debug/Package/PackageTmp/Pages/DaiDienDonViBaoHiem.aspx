<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaiDienDonViBaoHiem.aspx.cs" Inherits="WEBSITESAVVY.Pages.DaiDienDonViBaoHiem" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">New&nbsp; Contact&nbsp; Person</h1>
        </div>
      </div>
    </div>
  </div>
     <%-- content main --%>
  <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table class="tablemanager">
        <tr>
            <td align="center" colspan="2" class="headermanager">
                <asp:Label ID="Label1" runat="server" Text="ĐẠI DIỆN ĐƠN VỊ BẢO HIỂM"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftmanager" width="20%">
                <asp:Label ID="Label8" runat="server" Text="Nhà bảo hiểm :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drNBH" runat="server" AutoPostBack="True" 
                    CausesValidation="True" onselectedindexchanged="drNBH_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label2" runat="server" Text="Đơn vị :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:DropDownList ID="drDV" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label3" runat="server" Text="Họ tên :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtHoTen" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label4" runat="server" Text="Phòng ban :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtphongban" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label5" runat="server" Text="Chức vụ :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtchucvu" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label6" runat="server" Text="Điện thoại :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtdienthoai" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="leftmanager">
                <asp:Label ID="Label7" runat="server" Text="Email :"></asp:Label>
            </td>
            <td class="rightmanager">
                <asp:TextBox ID="txtemail" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td align="left" class="rightmanager">
                <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" 
                    CssClass="btn" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
