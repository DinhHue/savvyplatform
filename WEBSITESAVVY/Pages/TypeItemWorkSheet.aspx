<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TypeItemWorkSheet.aspx.cs" Inherits="WEBSITESAVVY.Pages.TypeItemWorkSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">Type&nbsp; Item&nbsp; Damage</h1>
        </div>
       
      </div>
    </div>
  </div>
    <%-- content main --%>
  <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
          <table class="tablemanager" width="60%">
              <tr>
                  <td class="leftmanager">
                      <asp:Label ID="lblID_Claim" runat="server"></asp:Label>
                      <asp:Label ID="Label2" runat="server" Text="Name: " Font-Bold="True" 
                          Font-Size="16px" ForeColor="#006600"></asp:Label></td>
                  <td class="rightmanager">
                      <asp:TextBox ID="txtNameType" runat="server" CssClass="textClaim"></asp:TextBox>
                  &nbsp;
                      <asp:Button ID="btnInsert" runat="server" CssClass="btn" Text="+" 
                          Width="40px" onclick="btnInsert_Click" />
                  &nbsp;&nbsp;&nbsp;
                      <asp:LinkButton ID="LinkButton1" runat="server" 
                          PostBackUrl="~/Pages/ListAssessmentWorkSheet.aspx">List Assessment Work Sheet</asp:LinkButton>
                  </td>
              </tr>
              <tr>
                  <td colspan="2" align="center">
                      <asp:GridView ID="gvDSTypeItem" runat="server" AutoGenerateColumns="False" 
                          DataKeyNames="ID_LoaiHangMuc" HorizontalAlign="Center" Width="70%" 
                          onrowdeleting="gvDSTypeItem_RowDeleting">
                          <Columns>
                              <asp:TemplateField HeaderText="No.">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" Font-Bold="True" />
                                <ItemStyle Width="5%" HorizontalAlign="Center" />
                            </asp:TemplateField>
                              <asp:BoundField DataField="TenLoaiHangMuc" HeaderText="Type Name">
                              <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Top" />
                              <ItemStyle HorizontalAlign="Left" Width="80%" />
                              </asp:BoundField>
                              <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                  HeaderText="Delete" ShowDeleteButton="True" >
                              <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:CommandField>
                          </Columns>
                          <HeaderStyle BackColor="#006600" Font-Bold="False" Font-Italic="False" 
                              Font-Size="16px" Font-Strikeout="False" Font-Underline="False" 
                              ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                      </asp:GridView>
                  </td>
              </tr>
          </table>
      </div>
      </div>
      </div>
</asp:Content>
