<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submitreport.aspx.cs" Inherits="WEBSITESAVVY.Messages.submitreport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />   
     <script type="text/javascript" src="../tinymce/tinymce.min.js"></script>

    <script type="text/javascript">
        tinymce.init({
            selector: "textarea",
            plugins: [
                    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                    "table contextmenu directionality emoticons textcolor paste fullpage textcolor colorpicker textpattern example"
            ],

            toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
            toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent | undo redo | image media code preview | forecolor backcolor",
            toolbar3: "",

            menubar: false,
            toolbar_items_size: 'small',

            image_advtab: true,


        });</script>

</head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
    
        <table class="table_input" align="center" width="100%">
            <tr>
                <td colspan="2" class="headbaocao">
                    Submit to SrLA check report</td>
            </tr>
            <tr>
                <td class="leftedit">
                    To email:</td>
                <td class="righttdr">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftedit">
                    Content</td>
                <td class="righttdr">
                    <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine"></asp:TextBox>
&nbsp;<asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
