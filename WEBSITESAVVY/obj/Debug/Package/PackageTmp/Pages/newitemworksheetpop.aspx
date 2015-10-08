<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newitemworksheetpop.aspx.cs" Inherits="WEBSITESAVVY.Pages.newitemworksheetpop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
         <fieldset style="width:90%">
            <legend>Insert Items</legend>
          <asp:Panel ID="typeitems" runat="server">       
     <table width="100%">
              <tr>
                  <td class="leftpop">
                      <asp:Label ID="lblID_Claim" runat="server"></asp:Label>
                      <asp:Label ID="Label2" runat="server" Text="Name: " Font-Bold="True" 
                          Font-Size="16px" ForeColor="#006600"></asp:Label></td>
                  <td class="rightpop">
                      <asp:TextBox ID="txtNameType" runat="server" CssClass="input"></asp:TextBox>
                  &nbsp;
                      <asp:Button ID="btnInsert" runat="server" CssClass="btn" Text="+" 
                          Width="40px" onclick="btnInsert_Click" />
                  &nbsp;&nbsp;&nbsp;
                      <asp:Button ID="btnHide" runat="server" CssClass="btn" onclick="btnHide_Click" 
                          Text="Hide Insert New Type" />
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
       </asp:Panel>
      
          <table align="center">
              <tr>
                  <td class="leftpop">
                      <asp:Label ID="lblIDClaim" runat="server"></asp:Label>
&nbsp;
                      <asp:Label ID="Label6" runat="server" Text="Item Type :"></asp:Label>
                  </td>
                  <td class="rightpop">
                      <asp:DropDownList ID="drTypeItem" runat="server" CssClass="input">
                      </asp:DropDownList>
                  &nbsp;<asp:Button ID="btnNewType" runat="server" CssClass="btn" Text="+" 
                          onclick="btnNewType_Click" />
                      (*)</td>
              </tr>
              <tr>
                  <td class="leftpop">
&nbsp;<asp:Label ID="Label1" runat="server" Text="Description :"></asp:Label>
                  </td>
                  <td class="rightpop">
                      <asp:TextBox ID="txtDescription" runat="server" CssClass="input" Width="98%"></asp:TextBox>
                      (*)</td>
              </tr>
              <tr>
                  <td class="leftpop">
                      <asp:Label ID="Label3" runat="server" Text="Quality :"></asp:Label>
                  </td>
                  <td class="rightpop">
                      <asp:TextBox ID="txtSoLuong" runat="server" CssClass="input" Width="10%"></asp:TextBox>
                      (*)
                      <asp:Label ID="Label7" runat="server" Font-Italic="True" ForeColor="#999999" 
                          Text="Nhập dấu chấm nếu số lẻ (1.5)"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td class="leftpop">
                      <asp:Label ID="Label4" runat="server" Text="Unit :"></asp:Label>
                  </td>
                  <td class="rightpop">
                      <asp:DropDownList ID="drUnit" runat="server" CssClass="input">
                      </asp:DropDownList>
                      (*)</td>
              </tr>
              <tr>
                  <td class="leftpop">
                      <asp:Label ID="Label5" runat="server" Text="Remark :"></asp:Label>
                  </td>
                  <td class="rightpop">
                      <asp:TextBox ID="txtGhiChu" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td class="leftpop">
                      &nbsp;</td>
                  <td class="rightpop">
                      <asp:Button ID="Button1" runat="server" CssClass="btn" 
                          onclick="btnInsertItem_Click" Text="Insert" Width="15%" /></td>
              </tr>
          </table>
             </fieldset>
           
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
    </form>
</body>
</html>
