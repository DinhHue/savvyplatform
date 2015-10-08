<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewItemWorkSheet.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewItemWorkSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">DamageD items</h1>
        </div>
       
      </div>
    </div>
  </div>
    <%-- content main --%>
  <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
          <table align="center" class="tablemanager">
              <tr>
                  <td class="leftmanager">
                      <asp:Label ID="lblIDClaim" runat="server"></asp:Label>
&nbsp;
                      <asp:Label ID="Label6" runat="server" Text="Item Type :"></asp:Label>
                  </td>
                  <td class="rightmanager">
                      <asp:DropDownList ID="drTypeItem" runat="server">
                      </asp:DropDownList>
                  &nbsp;(*)</td>
              </tr>
              <tr>
                  <td class="leftmanager">
&nbsp;<asp:Label ID="Label2" runat="server" Text="Description :"></asp:Label>
                  </td>
                  <td class="rightmanager">
                      <asp:TextBox ID="txtDescription" runat="server" CssClass="textbox" Width="98%"></asp:TextBox>
                      (*)</td>
              </tr>
              <tr>
                  <td class="leftmanager">
                      <asp:Label ID="Label3" runat="server" Text="Quality :"></asp:Label>
                  </td>
                  <td class="rightmanager">
                      <asp:TextBox ID="txtSoLuong" runat="server" CssClass="textbox" Width="10%"></asp:TextBox>
                      (*)
                      <asp:Label ID="Label7" runat="server" Font-Italic="True" ForeColor="#999999" 
                          Text="Nhập dấu chấm nếu số lẻ (1.5)"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td class="leftmanager">
                      <asp:Label ID="Label4" runat="server" Text="Unit :"></asp:Label>
                  </td>
                  <td class="rightmanager">
                      <asp:DropDownList ID="drUnit" runat="server">
                      </asp:DropDownList>
                      (*)</td>
              </tr>
              <tr>
                  <td class="leftmanager">
                      <asp:Label ID="Label5" runat="server" Text="Remark :"></asp:Label>
                  </td>
                  <td class="rightmanager">
                      <asp:TextBox ID="txtGhiChu" runat="server" CssClass="textbox" Width="100%"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td class="leftmanager">
                      &nbsp;</td>
                  <td class="rightmanager">
                      <asp:Button ID="btnInsert" runat="server" CssClass="btn" 
                          onclick="btnInsert_Click" Text="Insert" Width="15%" />
&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:HyperLink ID="HyperLink3" runat="server" 
                          NavigateUrl="~/Pages/ListAssessmentWorkSheet.aspx">List Assessment WorkSheet</asp:HyperLink>
&nbsp;</td>
              </tr>
             
          </table>
           <asp:GridView ID="grDSItem" runat="server" AutoGenerateColumns="False" 
              Width="90%" DataKeyNames="ID_LossList" 
              onrowcancelingedit="grDSItem_RowCancelingEdit" 
              onrowdeleting="grDSItem_RowDeleting" onrowediting="grDSItem_RowEditing" 
              onrowupdating="grDSItem_RowUpdating">
               <Columns>
                   <asp:TemplateField HeaderText="No.">
                     <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                     </ItemTemplate> 
                   </asp:TemplateField>
                   <asp:BoundField DataField="TenHangMuc" HeaderText="Description">
                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="40%" />
                   </asp:BoundField>
                   <asp:BoundField DataField="SoLuong" HeaderText="Qty." DataFormatString="{0:N}">
                   <ItemStyle VerticalAlign="Top" />
                   </asp:BoundField>
                   <asp:BoundField DataField="TenDonVi" HeaderText="Unit">
                   <ItemStyle VerticalAlign="Top" />
                   </asp:BoundField>
                   <asp:BoundField DataField="TenLoaiHangMuc" HeaderText="Type Item">
                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="20%" />
                   </asp:BoundField>
                   <asp:BoundField DataField="GhiChu" HeaderText="Remark">
                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="30%" />
                   </asp:BoundField>
                   <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                       HeaderText="Update" ShowEditButton="True" />
                   <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                       HeaderText="Delete" ShowDeleteButton="True" />
               </Columns>
               <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Size="16px" 
                   ForeColor="White" />
              </asp:GridView>
      </div>
      </div>
      </div>
</asp:Content>
