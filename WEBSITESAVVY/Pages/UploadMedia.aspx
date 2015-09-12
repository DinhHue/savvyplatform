<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadMedia.aspx.cs" Inherits="WEBSITESAVVY.Pages.UploadMedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Media Manager</title>
    <script type="text/javascript" src="../js/jquery-1.4.min.js"></script>
    <script type="text/javascript">

        function selectUrl(obj) {
            $('.item').removeClass('active');
            $(obj).addClass('active');

            var url = $(obj).attr('tag');
            $('#url').val(url);
        }


    </script>

    <style type="text/css">
 
    .item
    {
        background:#f5f5f5;
        cursor:pointer;
    } 
    .active
    {      
         background:#cdcdcd;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr valign="top">
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server"  />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" /> <br />
                </td>
                <td align="right">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" Width="200px" 
                        ontextchanged="btnSearch_Click"  ></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" 
                        onclick="btnSearch_Click"  /> 
                 </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label runat="server" id="StatusLabel" text=" " />
                    <input id="url" type="hidden" value="" />
                </td>
            </tr>
        </table>

        <hr />

        <div id="display_grid">
            <table width="100%" cellpadding="5px">
                <tr style="background:#f5f5f5">
                    <th>Name</th>
                    <th>Size</th>
                    <th>Type</th>
                    <th>Modification Date</th>
                </tr>
            
                <asp:Repeater ID="repeaterList" runat="server" >
                    <ItemTemplate>

                        <tr class="item" tag="../Uploads/Media/<%# Eval("Name") %>" onclick="selectUrl(this)" >
                            <td valign='middle'> <%# Eval("Name") %> </td>
                            <td><%# (long)Eval("Length")/1024%> KB</td>
                            <td><%# Eval("Extension")%></td>
                            <td><%# Eval("LastWriteTime")%></td>
                        </tr>

                    </ItemTemplate>
                 </asp:Repeater>

             </table>
         </div>

    </div>
    </form>
</body>
</html>
