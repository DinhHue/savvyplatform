<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submitreport.aspx.cs" Inherits="WEBSITESAVVY.Messages.submitreport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />   
     <script type="text/javascript" src="../tinymce/tinymce.min.js"></script>

    <%--<script type="text/javascript">
        tinymce.init({
            selector: "textarea",
            plugins: [
                    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                    "table contextmenu directionality emoticons textcolor paste fullpage textcolor colorpicker textpattern example"
            ],

            toolbar1: " forecolor backcolor | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
            toolbar2: "",
            toolbar3: "",

            menubar: false,
            toolbar_items_size: 'small',

            image_advtab: true,


        });</script>--%>
    <style type="text/css">

* {
	margin:0;
	padding:0;
}
*{
	font-size:16px;
}
    </style>

</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
     <table class="table_notification" align="center" width="100%">
            <tr>
                <td class="leftedit">
                   <asp:Label ID="lblGDV" runat="server"></asp:Label> </td>
                   <td class="right">
                   <asp:TextBox ID="txtNgay" runat="server" 
                           Enabled="False" CssClass="textTB"></asp:TextBox><br />
                       <asp:TextBox ID="txtThongBao" runat="server" CssClass="textTB" 
                           Enabled="False" Width="80%"></asp:TextBox>
                </td>
            </tr>
            </table><br />
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
    
    </div>
    </form>
</body>
</html>
