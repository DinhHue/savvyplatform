<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkedreport.aspx.cs" Inherits="WEBSITESAVVY.Messages.checkedreport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />   
     <script type="text/javascript" src="../tinymce/tinymce.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
     <asp:Panel ID="panelthongbao" runat="server">
     <table class="table_notification" align="center" width="100%" id="ThongBao">
            <tr>
                <td class="leftpop" rowspan="2">
                   <asp:Label ID="lblGDV" runat="server"></asp:Label></td>
                   <td align="left" class="right">                                         
                        <asp:Label ID="txtThongBao" runat="server" Text="" CssClass="labelTBNoiDng"></asp:Label>  <br/>
                </td>
            </tr>
            <tr>
                   <td align="right">
                        <asp:Label ID="txtNgay" runat="server" Text="" CssClass="labelTBNgay"></asp:Label>
                      
                       
                </td>
            </tr>
            </table>
            </asp:Panel>
            <br />
           <asp:Panel ID="panelchecked" runat="server">       
     <table class="table_notification" align="center" width="100%" id="Table1" style="margin-top: 20px">
            <tr>
                <td align="center">
                        <asp:Label ID="lblYKien" runat="server" CssClass="labelbold" 
                            ForeColor="#006600"></asp:Label>  <br/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="txtngayxong" runat="server" CssClass="labelTBNgay"></asp:Label>
                </td>
            </tr>
            </table> 
            </asp:Panel>
         
            <br />
             <asp:Panel ID="panelSubmit" runat="server" >
        <table class="table_notification" align="center" width="100%">
            <tr>
                <td class="leftedit">
                   <asp:Label ID="Label1" runat="server" Text="To :"></asp:Label> </td>
                   <td class="right">
                    &nbsp;<asp:DropDownList runat="server" AppendDataBoundItems="True" 
                           CssClass="input" ID="drDSGDV">
                           <asp:ListItem Value="0">[Select LA recieve task]</asp:ListItem>
                       </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="leftedit">
                    Content</td>
                <td class="right">
                    <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Height="50px" 
                        Width="300px"></asp:TextBox>
&nbsp;</td>
            </tr>
            <tr>
                <td class="leftedit">
                    &nbsp;</td>
                <td class="right">
                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn" onclick="btnSend_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
