<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClaimDisscusion.ascx.cs" Inherits="WEBSITESAVVY.Uc.ClaimDisscusion" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            mode: "textareas",
            theme: "advanced",
            plugins: "safari,style,layer,table",
            theme_advanced_buttons1: "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,formatselect,fontselect,fontsizeselect|,bullist,numlist,|,undo,redo,|,forecolor,backcolor",
            theme_advanced_buttons2: "",
            theme_advanced_buttons3: "",
            theme_advanced_buttons4: "",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: false,
            template_external_list_url: "js/template_list.js",
            external_link_list_url: "js/link_list.js",
            external_image_list_url: "js/image_list.js",
            media_external_list_url: "js/media_list.js"
        });
   </script>
<table width="100%">
<tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    CLAIM DISSCUSION</td></tr>
<tr><td>
    <span>
        <asp:TextBox ID="txtK" runat="server" Height="300px" TextMode="MultiLine" 
        Width="80%"></asp:TextBox>
                          <%-- <CKEditor:CKEditorControl ID="txtK" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px">CLAIM DISCUSSION / THẢO LUẬN NỘI BỘ (SAVVY)
</CKEditor:CKEditorControl>          
                            </span>--%>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateDisscusion" runat="server" CssClass="btn" 
        Text="Update" onclick="btnUpdateDisscusion_Click" /></td></tr>
</table>



