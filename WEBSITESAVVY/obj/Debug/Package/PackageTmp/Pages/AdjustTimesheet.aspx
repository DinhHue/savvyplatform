<%@ Page Title="AdjustTimesheet" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="AdjustTimesheet.aspx.cs" Inherits="WEBSITESAVVY.Pages.AdjustTimesheet" %>
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
          <h1 class="ambitios_uppercase">Adjust Timesheet</h1>
        </div>
       
      </div>
    </div>
  </div>
    <%-- content main --%>
  <div class="ambitios_container_16">
       <div class="ambitios_content">   
            <div class="ambitios_wrapper" align="center">
                <table align="center" width="95%">
                    <tr>
                        <td align="center" 
                            style="font-family: 'Times New Roman', Times, serif; font-size: 18px">
                            <asp:Label ID="Label3" runat="server" Text="Date:"></asp:Label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="input"></asp:TextBox>
                             <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
            TargetControlID="txtDate" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>                     
                            <asp:Label ID="Label2" runat="server" Text="Case No."></asp:Label>
                            <asp:TextBox ID="txtMaClaim" runat="server" CssClass="input"></asp:TextBox>                     
       &nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="LA:"></asp:Label>
                            &nbsp;
                            <asp:DropDownList ID="drGDV" runat="server" AppendDataBoundItems="True" 
                                Width="15%" CssClass="input">
                                <asp:ListItem Value="0">Select LA ...</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="View Timesheet" 
                                CssClass="btn" Height="30px" />  
                            &nbsp;&nbsp;
                            <asp:Label ID="lblID_Claim" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>

    <asp:GridView ID="gvDSTimeSheet" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" 
                        onrowdatabound="gvDSTimeSheet_RowDataBound" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="gvDSTimeSheet_RowCancelingEdit" 
                                onrowdeleting="gvDSTimeSheet_RowDeleting" 
                                onrowediting="gvDSTimeSheet_RowEditing" 
                                onrowupdating="gvDSTimeSheet_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>                         

    <asp:GridView ID="gvDSTimeSheetDate" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="gvDSTimeSheetDate_RowCancelingEdit" 
                                onrowdeleting="gvDSTimeSheetDate_RowDeleting" 
                                onrowediting="gvDSTimeSheetDate_RowEditing" 
                                onrowupdating="gvDSTimeSheetDate_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Case No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>                         
                    <asp:GridView ID="gvTimesheetCaseDate" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="gvTimesheetCaseDate_RowCancelingEdit" 
                                onrowdeleting="gvTimesheetCaseDate_RowDeleting" 
                                onrowediting="gvTimesheetCaseDate_RowEditing" 
                                onrowupdating="gvTimesheetCaseDate_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Case No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
                    <asp:GridView ID="grTSGDVDate" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="grTSGDVDate_RowCancelingEdit" 
                                onrowdeleting="grTSGDVDate_RowDeleting" 
                                onrowediting="grTSGDVDate_RowEditing" 
                                onrowupdating="grTSGDVDate_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Case No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
                                        <asp:GridView ID="grTSGDVCase" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="grTSGDVCase_RowCancelingEdit" 
                                onrowdeleting="grTSGDVCase_RowDeleting" 
                                onrowediting="grTSGDVCase_RowEditing" 
                                onrowupdating="grTSGDVCase_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Case No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
                    <asp:GridView ID="grTSGDVDateCase" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet" PageSize="20" 
                        Font-Names="Times New Roman" Font-Size="16px" ShowFooter="True" Width="100%" 
                                onrowcancelingedit="grTSGDVDateCase_RowCancelingEdit" 
                                onrowdeleting="grTSGDVDateCase_RowDeleting" 
                                onrowediting="grTSGDVDateCase_RowEditing" 
                                onrowupdating="grTSGDVDateCase_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ThamChieu" HeaderText="Case No.">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay1" HeaderText="Date Update" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngay" HeaderText="Date" 
                                DataFormatString="{0:yyyy-MM-dd}" >
                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CongTac" HeaderText="Type TS" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DienGiaiChiTiet" 
                                HeaderText="Description" >
                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenGDV" HeaderText="LA" >
                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                                HeaderText="Update" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                HeaderText="Delete" ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#006600" ForeColor="White" />
                        <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" 
                            ForeColor="White" />
                        <RowStyle Font-Names="Times New Roman" />
                    </asp:GridView>
                        </td>
                    </tr>
                </table>
             </div>
      </div>
  </div>
</asp:Content>
