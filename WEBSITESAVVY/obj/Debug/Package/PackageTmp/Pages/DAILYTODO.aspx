<%@ Page Title="Daily To Do - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="DAILYTODO.aspx.cs" Inherits="WEBSITESAVVY.Pages.DAILYTODO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

        <style type="text/css">
    .header
    {      
         color:White;
         text-align:center;      
         font-weight: bold; 
         font-size: 18px;  
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
        font-size: 20px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<span runat="server" id="tabid" style="display:none">task</span>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>   
    <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">DAILY TO-DO-LIST</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
            <table align="center"  Width="95%">
           
                <tr>
                    <td>
   
        <asp:Panel ID="pnEdit" runat="server" Visible="False">
          <table align="center" width="70%">
    <tr>
        <td align="center" colspan="5">
         <asp:GridView runat="server" AutoGenerateColumns="False" 
                Font-Names="Times New Roman" Font-Size="16px" Width="80%" ID="gvLoadEdit" 
                onrowcancelingedit="gvLoadEdit_RowCancelingEdit" 
                onrowediting="gvLoadEdit_RowEditing" onrowupdating="gvLoadEdit_RowUpdating">
             <Columns>
<asp:BoundField DataField="MaDaiLy" HeaderText="ID"></asp:BoundField>
<asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
<ItemStyle Width="40%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Rate" HeaderText="Rate">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
                 <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                 <ItemStyle HorizontalAlign="Center" />
                 </asp:CommandField>
</Columns>

<HeaderStyle HorizontalAlign="Center" BackColor="#006600" Font-Names="Times New Roman" 
                 Font-Size="18px" ForeColor="White"></HeaderStyle>
</asp:GridView>

            <asp:Label ID="lblMaDaily0" runat="server" Visible="False"></asp:Label>

        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnClose" runat="server" CssClass="btn" 
                onclick="btnClose_Click" Text="Close" />
        </td>
        <td align="center">
            <asp:Button ID="btnUprate0" runat="server" CssClass="btn" Text="+ Rate" 
                onclick="btnUprate_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnDownrate0" runat="server" CssClass="btn" 
                onclick="btnDownrate_Click" Text="- Rate" />
        </td>
        <td align="center">
            <asp:Button ID="btnImportant" runat="server" CssClass="btn" 
                onclick="btnImportant_Click" Text="Important" />
        </td>
        <td align="center">
            <asp:Button ID="btnWaitting" runat="server" CssClass="btn" Text="Waitting" 
                onclick="btnWaitting_Click" />
        </td>
        <td align="center">
            <asp:Button ID="btnDone" runat="server" CssClass="btn" onclick="btnDone_Click" 
                Text="Done" />
        </td>
    </tr>
</table>  
        </asp:Panel>
         
                    </td>
                </tr>
                <tr align="center" style="font-family: 'Times New Roman', Times, serif">
                    <td>

    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" Width="100%" 
                            Font-Names="Times New Roman">
        <ajaxToolkit:TabPanel runat="server" HeaderText="DaiLy To-Do List" ID="TabPanel4">
        <HeaderTemplate>
Daily To-Do List
</HeaderTemplate>        
<ContentTemplate>
           <p align="center">
               <asp:Label ID="Label7" runat="server" Text="Important To-Do (Quan trọng)" 
                Font-Size="20px" ForeColor="#003300" Font-Bold="True" 
                   Font-Names="Times New Roman" Font-Underline="True"></asp:Label></p> 
        <asp:GridView ID="gvDSImportant" runat="server" AutoGenerateColumns="False" 
                Font-Names="Times New Roman" Font-Size="16px" Width="100%" 
                DataKeyNames="MaDaiLy" 
                onselectedindexchanged="gvDSImportant_SelectedIndexChanged"><Columns>
                <asp:BoundField DataField="MaDaiLy" HeaderText="ID" >
                <ItemStyle HorizontalAlign="Center" Width="0%" /></asp:BoundField>
                <asp:TemplateField HeaderText="No.">
                            <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                <asp:BoundField DataField="ID_Claim" 
                    HeaderText="Case No.">
                <ItemStyle HorizontalAlign="Center" Width="8%" />
                </asp:BoundField>
                <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                <ItemStyle Width="35%" />
                </asp:BoundField>
                <asp:BoundField DataField="Ngay" HeaderText="Date Assigned" 
                    DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Rate" HeaderText="Rate"><ItemStyle Width="10%" 
                    HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Done" HeaderText="Done" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" HeaderText="Edit" 
                     ShowSelectButton="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField></Columns><HeaderStyle BackColor="#006600" Font-Names="Times New Roman" Font-Size="18px" 
                 ForeColor="White" HorizontalAlign="Center" /></asp:GridView>
                 <p align="center">
                     <asp:Label ID="Label10" runat="server" Font-Bold="True" 
                         Font-Names="Times New Roman" Font-Size="20px" ForeColor="#003300" 
                         Text="Watting(Thứ yếu)" Font-Underline="True"></asp:Label>
            </p>
                 <p align="center">
                     <asp:GridView ID="gvDSWaiting" runat="server" AutoGenerateColumns="False" 
                         DataKeyNames="MaDaiLy" Font-Names="Times New Roman" Font-Size="16px" 
                         OnSelectedIndexChanged="gvDSWaiting_SelectedIndexChanged" Width="100%">
                         <Columns>
                             <asp:BoundField DataField="MaDaiLy" HeaderText="ID">
                             <ItemStyle HorizontalAlign="Center" Width="0%" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="No.">
                                 <ItemTemplate>
                                     <%#Container.DataItemIndex+1 %>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                             <ItemStyle HorizontalAlign="Center" Width="8%" />
                             </asp:BoundField>
                             <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                             <ItemStyle Width="35%" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Ngay" DataFormatString="{0:dd-MM-yyyy}" 
                                 HeaderText="Date Assigned">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Rate" HeaderText="Rate">
                             <ItemStyle HorizontalAlign="Center" Width="10%" />
                             </asp:BoundField>
                             <asp:BoundField DataField="Done" HeaderText="Done">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowSelectButton="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:CommandField>
                         </Columns>
                         <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" Font-Size="18px" 
                             ForeColor="White" HorizontalAlign="Center" />
                     </asp:GridView>
                     <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                         Font-Names="Times New Roman" Font-Size="20px" ForeColor="#003300" 
                         Text="-----Done-----" Font-Underline="True"></asp:Label>
            </p>
                  <asp:GridView ID="gvDSDone" runat="server" AutoGenerateColumns="False" 
                Font-Names="Times New Roman" Font-Size="16px" Width="100%" 
                 DataKeyNames="MaDaiLy" 
                 OnSelectedIndexChanged="gvDSDone_SelectedIndexChanged" 
                onrowdeleting="gvDSDone_RowDeleting"><Columns>
                     <asp:BoundField DataField="MaDaiLy" HeaderText="ID">
                     <ItemStyle HorizontalAlign="Center" Width="0%" /></asp:BoundField>
                          <asp:TemplateField HeaderText="No."><ItemTemplate>
                     <%#Container.DataItemIndex+1 %></ItemTemplate><ItemStyle HorizontalAlign="Center" /></asp:TemplateField>
                     <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                          <ItemStyle Width="40%" />
                          </asp:BoundField><asp:BoundField DataField="Rate" HeaderText="Rate">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                     <asp:CommandField ButtonType="Button" HeaderText="Edit" 
                         ShowSelectButton="True" >
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:CommandField>
                          <asp:CommandField ButtonType="Button" HeaderText="Delete" 
                              ShowDeleteButton="True">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:CommandField>
                      </Columns><HeaderStyle BackColor="#006600" Font-Names="Times New Roman" Font-Size="18px" 
                 ForeColor="White" HorizontalAlign="Center" /></asp:GridView>
                 <br />
                 
</ContentTemplate>
</ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1"><HeaderTemplate>
Add New
</HeaderTemplate>
<ContentTemplate>
        <table class="TableClaimMoi"><tr><td colspan="2" class="headermanager"><asp:Label ID="Label1" runat="server" Text="NEW DAILY TO DO"></asp:Label>
        </td></tr><tr><td class="leftdr">
                <asp:Label ID="Label15" runat="server" Text="Case No."></asp:Label>
                </td><td class="right">
                    <asp:TextBox ID="txtClaim" runat="server" CssClass="input"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="Label16" runat="server" Font-Italic="True" ForeColor="#339933" 
                        Text="Chỉ nhập số Claim ( ví dụ: 1401)"></asp:Label>
                </td></tr>
            <tr>
                <td class="leftdr">
                    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="right">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="input" 
                        TextMode="MultiLine" Width="70%"></asp:TextBox>
                </td>
            </tr>
            <tr><td class="leftdr">
                        <asp:Label ID="Label12" runat="server" Text="Date"></asp:Label></td><td class="right">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="input"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                            TargetControlID="txtDate" Enabled="True" Format="yyyy-MM-dd">
                        </ajaxToolkit:CalendarExtender>
                        </td></tr>
            <tr>
                <td class="leftdr">
                    <asp:Label ID="Label14" runat="server" Text="Deadline"></asp:Label>
                </td>
                <td class="right">
                    <asp:TextBox ID="txtDeadline" runat="server" CssClass="input"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDeadline_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txtDeadline" Format="yyyy-MM-dd">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="leftdr">
                    <asp:Label ID="Label3" runat="server" Text="Rate"></asp:Label>
                </td>
                <td class="right">
                    <asp:DropDownList ID="drRate" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Label ID="Label18" runat="server" Font-Italic="True" ForeColor="#339933" 
                        Text="Chọn mức độ quan trọng giảm dần"></asp:Label>
                </td>
            </tr>
            <tr><td class="leftdr"><asp:Label ID="Label4" runat="server" Text="Level "></asp:Label></td><td class="right">
                <asp:DropDownList ID="drLevel" runat="server" CssClass="input">
                        <asp:ListItem Value="0">Important To-Do</asp:ListItem><asp:ListItem Value="1">Waiting</asp:ListItem></asp:DropDownList></td></tr><tr>
                <td class="leftdr">
                <asp:Label ID="Label13" runat="server" Text="Người được giao"></asp:Label>
                </td><td class="right">
                    <asp:DropDownList ID="drDSGDV" runat="server" AppendDataBoundItems="True" 
                        CssClass="input">
                        <asp:ListItem Value="0">[Select LA recieve task]</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Label ID="Label17" runat="server" Font-Italic="True" ForeColor="#339933" 
                        Text="Chỉ thêm &quot;daily to do list&quot; thì không chọn"></asp:Label>
                </td></tr>
            <tr>
                <td class="leftdr">
                    &nbsp;</td>
                <td class="right">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn" OnClick="btnAdd_Click" 
                        Text="Add" Width="50px" />
                </td>
            </tr>
            </table>
</ContentTemplate>
</ajaxToolkit:TabPanel>
       
        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <HeaderTemplate>
                Share
            
</HeaderTemplate>
            
<ContentTemplate>
                &nbsp;
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="14px" 
                    Text="Email to Share"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry" 
                    Font-Italic="True"></asp:TextBox>
                &nbsp;
                <asp:Button ID="btnSendMail" runat="server" CssClass="btn" 
                    onclick="btnSendMail_Click" Text="Share via Email" />
                <br />
                <asp:GridView ID="gvShare" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                          <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Descriptions" >
                        <ItemStyle Width="70%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ngay" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="Date">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Size="14px" 
                        ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Font-Size="12px" />
                </asp:GridView>
            
</ContentTemplate>
        
</ajaxToolkit:TabPanel>
       
        <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
            <HeaderTemplate>
                Task Assigned
            
</HeaderTemplate>
            
<ContentTemplate>
            <p class="rowheader"> NHIỆM VỤ ĐƯỢC NHẬN</p>
            <p style="vertical-align: middle; text-align: center; font-size: 16px">
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label19" runat="server" CssClass="labelbold" Text="Task:"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblNoiDungTask" runat="server" Width="30%"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label20" runat="server" CssClass="labelbold" 
                    Text="Ý kiến phản hồi task:"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtFeedback" runat="server" CssClass="input" Width="30%"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                    onclick="btnUpdate_Click" Text="Update" />
            </p>
                <asp:GridView ID="gvDSDuocNhan" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="MaDaiLy" Font-Names="Times New Roman" Font-Size="16px" 
                    OnSelectedIndexChanged="gvDSDuocNhan_SelectedIndexChanged" 
        Width="100%" onrowdeleting="gvDSDuocNhan_RowDeleting" ForeColor="#003300"><Columns>
<asp:BoundField DataField="MaDaiLy" HeaderText="ID">
<ItemStyle HorizontalAlign="Center" Width="1px" />
</asp:BoundField>
<asp:TemplateField HeaderText="No.">
    <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            
</ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="4%" />
</asp:TemplateField>
<asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
<ItemStyle HorizontalAlign="Center" Width="7%" />
</asp:BoundField>
<asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
<ItemStyle Width="30%" />
</asp:BoundField>
                        <asp:BoundField DataField="YKien" HeaderText="Feedback">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle Width="30%" />
                        </asp:BoundField>
<asp:BoundField DataField="Ngay" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="D.A">
<ItemStyle HorizontalAlign="Center" Width="8%" />
</asp:BoundField>
<asp:BoundField DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Deadline">
<ItemStyle HorizontalAlign="Center" Width="8%" />
</asp:BoundField>
<asp:BoundField DataField="TenGDV" HeaderText="LA giao Task">
<ItemStyle HorizontalAlign="Center" Width="10%" />
</asp:BoundField>
<asp:CommandField ButtonType="Image" HeaderText="Y/N?" ShowSelectButton="True" SelectText="Change" 
                            SelectImageUrl="~/images/change_icon.jpg">
<ItemStyle HorizontalAlign="Center" Width="3%" />
</asp:CommandField>
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/edit_icon.png" 
                            HeaderText="Edit" ShowDeleteButton="True" />
</Columns>

<HeaderStyle BackColor="#006600" Font-Names="Times New Roman" Font-Size="18px" 
                        ForeColor="White" HorizontalAlign="Center" />
</asp:GridView>
 <br />
                <p class="rowheader">NHIỆM VỤ ĐÃ GIAO</p>
          
            <asp:GridView ID="gvDaGiao" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="MaDaiLy" Width="100%" Font-Names="Times New Roman" 
                Font-Size="16px" ForeColor="#000066" 
                onrowcancelingedit="gvDaGiao_RowCancelingEdit" 
                onrowdeleting="gvDaGiao_RowDeleting" onrowediting="gvDaGiao_RowEditing" 
                onrowupdating="gvDaGiao_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="MaDaiLy" HeaderText="ID" >
                    <ItemStyle Width="1px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="4%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Claim" HeaderText="Case No." >
                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                    </asp:BoundField>
                    <asp:BoundField  DataField="DienGiai" HeaderText="Descriptions" >
                    <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="YKien" HeaderText="Feedback" >
                    <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField  DataField="Ngay"  DataFormatString="{0:yyyy-MM-dd}"  HeaderText="D.A" >
                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                    </asp:BoundField>
                    <asp:BoundField  DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                        HeaderText="Deadline" >
                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                    </asp:BoundField>
                    <asp:BoundField  DataField="TenGDV" HeaderText="LA nhận task" >
                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                        HeaderText="Edit" ShowEditButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                        HeaderText="Cancel" ShowDeleteButton="True" >
                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#0000CC" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Center" />
            </asp:GridView>
            <br />
<p class="rowheader">CÁC TASK ĐÃ HOÀN THÀNH GẦN ĐÂY</p>
  <asp:GridView ID="gvTaskDone" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="MaDaiLy" Font-Names="Times New Roman" Font-Size="16px" 
                Width="100%" onrowdeleting="gvTaskDone_RowDeleting" ForeColor="#006666"><Columns>
<asp:TemplateField HeaderText="No.">
    <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            
</ItemTemplate>

<ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
<ItemStyle HorizontalAlign="Center" Width="8%" />
</asp:BoundField>
<asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
<ItemStyle Width="35%" />
</asp:BoundField>
<asp:BoundField DataField="Ngay" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Date Assigned">
<ItemStyle HorizontalAlign="Center"/>
</asp:BoundField>
<asp:BoundField DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Deadline">
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
<asp:BoundField DataField="Rate" HeaderText="Rate">
<ItemStyle HorizontalAlign="Center" Width="5%" />
</asp:BoundField>
<asp:BoundField DataField="TenGDV" HeaderText="Receiver">
<ItemStyle HorizontalAlign="Center" Width="15%" />
</asp:BoundField>
<asp:BoundField DataField="Done" HeaderText="Done">
<ItemStyle HorizontalAlign="Center" />
</asp:BoundField>
</Columns>

<HeaderStyle BackColor="#669999" Font-Names="Times New Roman" Font-Size="18px" 
                        ForeColor="White" HorizontalAlign="Center" />
</asp:GridView>          
</ContentTemplate>
        
</ajaxToolkit:TabPanel>
        
         
        <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel3">
            <HeaderTemplate>
                All Task
            
</HeaderTemplate>
            
<ContentTemplate>

                 <asp:GridView ID="gvAlltasktodo" runat="server" AutoGenerateColumns="False" 
                            onrowdatabound="gvAlltasktodo_RowDataBound" Width="100%" 
                            onrowcreated="gvAlltasktodo_RowCreated" ShowHeader="False" 
                            Font-Size="16px" Font-Names="Times New Roman">
                            <Columns>
                                <asp:TemplateField>
                                <ItemTemplate >
                                <div style="text-align:center">
                                    <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                                    <asp:Label ID="lblmaGDV" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_GDV") %>'></asp:Label>
                                </div>
                                </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                 <ItemTemplate >
                                <span><b><%#DataBinder.Eval(Container.DataItem, "TenGDV")%></b></span>
                                 </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField />
                                <asp:BoundField />
                                <asp:BoundField />
                                <asp:TemplateField></asp:TemplateField>
                                <asp:TemplateField>
                                <ItemTemplate>
                                <asp:Repeater ID="repeaterChild" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td align="center"><%# Container.ItemIndex + 1 %></td>                                        
                                        <td align="center"><%# Eval("ID_Claim") %></td>
                                        <td align="left"><%#  Eval("DienGiai") %></td>
                                        <td align="left"><%#  Eval("YKien") %></td>
                                        <td align="center"><%#  Eval("Ngay", "{0:dd/MM/yyyy}")%></td>
                                        <td align="center"><%#  Eval("Deadline", "{0:dd/MM/yyyy}")%></td>
                                        <td align="center"><%#  Eval("TenGDV")%></td>
                                    </tr>
                                </ItemTemplate>
                                </asp:Repeater>
                                </ItemTemplate>
                                    <ItemStyle Font-Size="20px" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle Font-Size="18px" />
                        </asp:GridView>
</ContentTemplate>
        
</ajaxToolkit:TabPanel>
        
    </ajaxToolkit:TabContainer>
                    </td>
                </tr>
    </table>
   
  </div>
  </div>
  </div>
</asp:Content>
