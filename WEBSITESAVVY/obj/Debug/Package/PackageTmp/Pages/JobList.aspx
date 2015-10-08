<%@ Page Title="Work List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="WEBSITESAVVY.Pages.JobList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase"> MANAGEMENT OF WORK DAILY</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
        <table align="center" width="95%">
          
            <tr>
                <td align="right" 
                    
                    style="font-size: 18px; font-family: 'Times New Roman', Times, serif; vertical-align: top; text-align: right; width: 25%;">
                    <b>
                    <asp:Label ID="Label2" runat="server" Text="Select Case:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                </b>
                </td>
                <td align="left" colspan="3">
                    <asp:DropDownList ID="drDSCase" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" 
                    
                    style="font-size: 18px; font-family: 'Times New Roman', Times, serif; vertical-align: top; text-align: right; width: 25%;">
                    <b>
                    <asp:Label ID="Label3" runat="server" Text="Nội dung :"></asp:Label>
&nbsp;&nbsp;&nbsp;
                </b>
                </td>
                <td align="left" width="30%">
                    <asp:TextBox ID="txtNameJob" runat="server" CssClass="textClaim" 
                        TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td style="vertical-align: top; text-align: center;" width="15%">
                    <asp:Button ID="btnNewJob" runat="server" CssClass="btnThem" Height="30px" 
                        onclick="btnNewJob_Click" Text="Add" />
                </td>
                <td align="right" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold; width: 20%;">
                    <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="~/Pages/ListviewJob.aspx">View All for Manager</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblNotification" runat="server" Font-Bold="True" 
                        Font-Size="18px" ForeColor="#003300"></asp:Label>

                    <asp:GridView ID="grDSJobList" runat="server" AutoGenerateColumns="False" Font-Size="16px" 
                        Width="100%" DataKeyNames="ID_Job" onrowdeleting="grDSJobList_RowDeleting" 
                        HorizontalAlign="Center">
                        <AlternatingRowStyle BorderStyle="None" />
                        <Columns>
                         <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                             <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                            <asp:BoundField DataField="ID_Claim" HeaderText="Case">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <ItemStyle Width="8%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenKhachHang" HeaderText="Name'Insured">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" Width="35%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NameJob" HeaderText="Job Description">
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Left" Width="52%" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" HeaderText="Delete" 
                                ShowDeleteButton="True" DeleteImageUrl="~/images/delete_icon.jpg">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Size="18px" 
                            ForeColor="White" HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </div>
    </div>
</asp:Content>
