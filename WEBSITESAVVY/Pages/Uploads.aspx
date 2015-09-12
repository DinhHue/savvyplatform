<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploads.aspx.cs" Inherits="WEBSITESAVVY.Pages.Uploads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload file</title>

    <script type="text/javascript" src="../js/jquery-1.4.min.js"></script>
    <script type="text/javascript">

        function selectUrl(obj) {
            $('.item').removeClass('active');
            $(obj).addClass('active');

            var url = $(obj).attr('tag');
            $('#url').val(url);
        }

        function onViewTypeChange() {
            var type = $('#view_type').val();
            if (type == 'List') {
                $('#display_thumb').hide();
                $('#display_grid').show();
            }
            else if (type == 'Thumb') {
                $('#display_thumb').show();
                $('#display_grid').hide();
            }
        }


    </script>

    <style type="text/css">
    .itemThumb
    {
        float:left; max-height:120px; height:120px; vertical-align:middle; margin:2px; padding:2px;
    }  
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
<body >
    <form id="form1" runat="server">
    <div>
        

        <table width="100%">
            <tr valign="top">
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server"  />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" /> <br />
                </td>
                <td>
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search" Width="100px" 
                        ontextchanged="btnSearch_Click"  ></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" 
                        onclick="btnSearch_Click"  /> </td>
                <td style="text-align:right">View: 
                    <select id="view_type" onchange="onViewTypeChange()">
                        <option value="Thumb">Thumb</option>
                        <option value="List">List</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3"><asp:Label runat="server" id="StatusLabel" text=" " />
                    <input id="url" type="hidden" value="" />
                </td>
            </tr>
        </table>
        
        <hr />

        <div id="display_thumb">
            <asp:Repeater ID="repeaterView" runat="server" >
                <ItemTemplate>
                    <div class="item itemThumb" tag="../Uploads/Images/<%# Eval("Name") %>" onclick="selectUrl(this)" title="<%# Eval("Name") %>" >
                         <table style="height:100%">
                            <tr valign="middle"><td>
                                <img alt="../Uploads/Images/Thumb/<%# Eval("Name") %>" src="../Uploads/Images/Thumb/<%# Eval("Name") %>"  style="max-height:115px" />
                            </td></tr>
                         </table>
                    </div>
                </ItemTemplate>
             </asp:Repeater>

             <div style="clear:both;"></div>
         </div>

         <div id="display_grid" style="display:none">
            <table width="100%" cellpadding="5px">
                <tr style="background:#f5f5f5">
                    <th>Name</th>
                    <th>Size</th>
                    <th>Type</th>
                    <th>Modification Date</th>
                </tr>
            
                <asp:Repeater ID="repeaterList" runat="server" >
                    <ItemTemplate>

                        <tr class="item" tag="../Uploads/Images/<%# Eval("Name") %>" onclick="selectUrl(this)" >
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
