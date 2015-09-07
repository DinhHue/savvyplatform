<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploads.aspx.cs" Inherits="WEBSITESAVVY.Pages.Uploads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload file</title>

    <script type="text/javascript">

        function selectImage(src) {
            window.opener.setValue(src);
            window.close();
        }

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server"  />

        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
        <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
        <hr />

        <asp:Repeater ID="repeaterView" runat="server" >
            <ItemTemplate>
                <div style="float:left; max-height:120px; height:120px; vertical-align:middle; margin:5px; padding:2px; background:#CDCDCD">
                     <table style="height:100%">
                        <tr valign="middle"><td>
                            <img alt="../Uploads/Images/<%# Eval("Name") %>" src="../Uploads/Images/Thumb/<%# Eval("Name") %>" ondblclick="selectImage(this.alt)" style="max-height:115px" />
                        </td></tr>
                     </table>
                     
                </div>
            </ItemTemplate>
         </asp:Repeater>
    </div>
    </form>
</body>
</html>
