<%@ Page Title="Riot Claim" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="SubHome.aspx.cs" Inherits="WEBSITESAVVY.Pages.SubHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.theme.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.structure.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.structure.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span runat="server" id="tabid" style="display:none">home</span>

 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">LIST CLAIM RIOT</h1>
        </div>
      </div>
    </div>
  </div>
     <%-- content main --%>
<div class="ambitios_container_16">
    <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
          <asp:GridView ID="grDSRiotClaim" runat="server" Width="95%" BackColor="White" BorderColor="#003300"
              BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center"
              AutoGenerateColumns="False" EnableCaching="True" CacheDuration="3600" Font-Names="Tahoma"
              CssClass="gridtable center" PageSize="20" DataKeyNames="ID_Claim" OnSelectedIndexChanging="grDSRiotClaim_SelectedIndexChanging"
              OnRowCancelingEdit="grDSRiotClaim_RowCancelingEdit" OnRowEditing="grDSRiotClaim_RowEditing"
              OnRowUpdating="grDSRiotClaim_RowUpdating">
              <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
              <Columns>
                  <asp:TemplateField HeaderText="No.">
                      <ItemTemplate>
                          <%#Container.DataItemIndex+1 %>
                      </ItemTemplate>
                      <ItemStyle Width="3%" HorizontalAlign="Center" />
                  </asp:TemplateField>
                  <asp:BoundField DataField="TenClaim" HeaderText="Case Name">
                      <ControlStyle Width="100px" />
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="12%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Brief" HeaderText="Brief">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="TenKhachHang" HeaderText="Insured">
                      <ControlStyle Width="150px" />
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="15%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="AssignedDate" HeaderText="Assiged Date">
                      <ControlStyle Width="30px" />
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="8%" HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:BoundField DataField="TenGiaiDoan" HeaderText="Progress">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="10%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Docs" HeaderText="Status">
                      <ControlStyle Width="150px" />
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="15%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Follower" HeaderText="Leader">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" Width="10%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Rate" HeaderText="Rate">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:CommandField ButtonType="Image" HeaderText="Edit" ShowEditButton="True" EditImageUrl="~/images/edit_icon.png" />
                  <asp:CommandField HeaderText="Detail" ShowSelectButton="True" ButtonType="Image"
                      SelectImageUrl="~/images/detail_icon.png">
                      <ItemStyle Width="50px" HorizontalAlign="Center" />
                  </asp:CommandField>
              </Columns>
              <EditRowStyle Font-Names="Tahoma" ForeColor="#003300" HorizontalAlign="Left" VerticalAlign="Top" />
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#006600" BorderColor="#003300" Font-Bold="False" ForeColor="White"
                  Font-Names="Times New Roman" Font-Size="18px" />
              <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Font-Bold="False" Font-Names="Times New Roman"
                  Font-Size="14px" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
	  </div>
	</div>
</div>


  
</asp:Content>
