<%@ Page Title="Events - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="trackinglog.aspx.cs" Inherits="WEBSITESAVVY.Pages.trackinglog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div id="db_top" class="db_top">
        <asp:Label ID="Label1" runat="server" Text="Events "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="txtDate" runat="server" CssClass="input" AutoPostBack="True" 
            ontextchanged="txtDate_TextChanged"></asp:TextBox>
                             <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
            TargetControlID="txtDate" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>                     
    </div>
    <div id="bd_content" class="db_content" align="center">
        <asp:Repeater ID="rp_Tracking" runat="server" EnableTheming="True">
        <HeaderTemplate>
                                 
            </HeaderTemplate>
            <ItemTemplate>
             <table width="70%"> 
                <tr>
                    <td style="text-align: left; padding-left: 50px; width: 70%;">                    
                     In case <%# DataBinder.Eval(Container.DataItem, "ID_Claim").ToString()%>,   <%# DataBinder.Eval(Container.DataItem, "ActionDes").ToString()%>
                    </td>                
                     <td style="text-align: center; padding-right: 30px;width: 20%; padding-right: 10px;">
                      <%# DataBinder.Eval(Container.DataItem, "TimeReal").ToString()%>
                    </td>
                </tr>                          
              </table>
            </ItemTemplate>
            <FooterTemplate>
               
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
