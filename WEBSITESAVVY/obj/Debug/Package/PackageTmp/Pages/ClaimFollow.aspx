<%@ Page Title="Follow Claim" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="ClaimFollow.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimFollow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function editClaim(obj) {
            var idClaim = $(obj).attr("idClaim");
            //            alert(idClaim);
            var param = "?idClaim=" + idClaim;
            var contentPage = '<iframe src="../Pages/updatecoverhome.aspx' + param + '"></iframe>'
            $("#w_UpdateClaim").html(contentPage);
            $('#w_UpdateClaim').window('open')
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span runat="server" id="tabid" style="display:none">home</span>
    <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">LIST&nbsp; CLAIM&nbsp; FOLLOWING&nbsp; -&nbsp; 
              <asp:Label ID="lblGDV" 
                  runat="server" Font-Size="30px"></asp:Label></h1>
        </div>
      </div>
    </div>
  </div>
     <%-- content main --%>
<div class="ambitios_container_16">
    <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
	 <%-- <div class="headerweekly"><p>
    
    </p></div>--%>
          <asp:GridView ID="DSClaimFollow" runat="server" Width="95%" BackColor="White" BorderColor="#003300"
              BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center"
              AutoGenerateColumns="False" EnableCaching="True" CacheDuration="3600" Font-Names="Tahoma"
              CssClass="gridtable center" PageSize="20" DataKeyNames="ID_Claim" OnRowCancelingEdit="DSClaimFollow_RowCancelingEdit"
              OnRowEditing="DSClaimFollow_RowEditing" OnRowUpdating="DSClaimFollow_RowUpdating"
              OnSelectedIndexChanged="DSClaimFollow_SelectedIndexChanged" 
              OnRowDataBound="DSClaimFollow_RowDataBound">
              <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
              <Columns>
                  <asp:TemplateField HeaderText="No.">
                      <ItemTemplate>
                          <%#Container.DataItemIndex+1 %>
                           <asp:Label ID="lblID_Claim" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_Claim") %>'></asp:Label>
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
                  <asp:BoundField DataField="Docs" HeaderText="Pending Issues">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="7%" />
                  </asp:BoundField>
                  <asp:BoundField DataField="nextA" HeaderText="Weekly Reviews &amp; Solutions">
                      <ControlStyle Width="50px" />
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle Width="18%" HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:TemplateField HeaderText="Status">
                      <HeaderStyle HorizontalAlign="Left" Width="10%" />
                      <ItemStyle HorizontalAlign="Left" />
                      <ItemTemplate>
                          <%#Eval("TenGiaiDoan")%></ItemTemplate>
                      <EditItemTemplate>
                          <asp:DropDownList ID="drStatus" runat="server">
                          </asp:DropDownList>
                      </EditItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Rate" HeaderText="Rate">
                      <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" />
                  </asp:BoundField>
                  <asp:CommandField HeaderText="Detail" ShowSelectButton="True" ButtonType="Image"
                      SelectImageUrl="~/images/detail_icon.png">
                      <ItemStyle Width="50px" HorizontalAlign="Center" />
                  </asp:CommandField>
                  <asp:TemplateField HeaderText="Updated">
                <ItemTemplate>
                    <input type="button" class="btn" value="Click" idClaim="<%#DataBinder.Eval(Container.DataItem, "ID_Claim") %>" onclick="editClaim(this)" />         
                </ItemTemplate>
                </asp:TemplateField>
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
 <div id="w_UpdateClaim" class="easyui-window" title="Update Case Cover" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;"></div>
</asp:Content>
