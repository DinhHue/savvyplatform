<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sitephoto.aspx.cs" Inherits="WEBSITESAVVY.Pages.sitephoto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table width="100%">
          
            <tr valign="top">
                <td class="leftedit">
                    Description</td>
                <td class="right">
                    <asp:TextBox ID="txtDienGiai" runat="server" TextMode="MultiLine" Height="60px" Width="50%"></asp:TextBox>
                &nbsp; <asp:TextBox ID="txtClaimNo" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr valign="top">
                <td colspan="2">
                    <asp:FileUpload ID="imgUpload" runat="server"  />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                        onclick="btnUpload_Click" CssClass="btn" /> &nbsp;
                    &nbsp;<asp:Label ID="lblThongBao" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label runat="server" id="StatusLabel" text=" " />
                    <input id="url" type="hidden" value="" />
                </td>
            </tr>
        </table>
        
        <hr />    

             <div style="clear:both;">
                 <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatColumns="2" 
                     DataKeyField="ID_SP" oncancelcommand="DataList1_CancelCommand" 
                     oneditcommand="DataList1_EditCommand" 
                     onupdatecommand="DataList1_UpdateCommand" 
                     ondeletecommand="DataList1_DeleteCommand">
                    
                 <ItemTemplate>
            <table width="80%" align="center">
                <tr>
                    <td align = "center" style="padding: 5px">
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("LinkHinh") %>' Height="300px" Width="300px" /><br />
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("DienGiai") %>' Font-Size="16px" ForeColor="Navy"/><br />
                        <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="edit" CssClass="btn" />  <asp:Button ID="Button4" runat="server" Text="Delete" CommandName="delete" CssClass="btn" />
                  
                    </td>                
                </tr>
               
            </table>
            </ItemTemplate>
             <EditItemTemplate>
             <div align="center" id="EditImage">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("LinkHinh") %>' Height="300px" Width="300px" /> <br />
                <asp:TextBox ID="txtDienGiaiEdit" runat="server" Text='<%# Eval("DienGiai") %>' TextMode="MultiLine" Height="60px" Width="85%" ForeColor="#000066"></asp:TextBox><br />
                <asp:Button ID="Button2" runat="server" Text="Update" CommandName="update" CssClass="btn" />
                 &nbsp;
                <asp:Button ID="Button3" runat="server" Text="Cancel" CommandName="cancel" CssClass="btn" />
                  </div>  
                </EditItemTemplate>
            </asp:DataList>
            </div>       
    </div>
    </form>
</body>
</html>
