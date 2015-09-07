<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimUpdateFieldPop.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimUpdateFieldPopUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>   

    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            forced_root_block : "",
            mode: "textareas",
            theme: "advanced",
            plugins: "safari,style,layer,table,save,advhr,advimage,advlink,emotions,inlinepopups,preview,contextmenu,paste,directionality,fullscreen,noneditable,filemanager",
            theme_advanced_buttons1: "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,formatselect,fontselect,fontsizeselect|,bullist,numlist,|,undo,redo,|,forecolor,backcolor,|, image, |, code, |, fullscreen",
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

   <style type="text/css">
        .top
        {   
            vertical-align:top;
        }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

    <div>
        <asp:HiddenField id="hiddenClaimID" runat="server" />
        <asp:HiddenField id="hiddenKey" runat="server" />
        <asp:HiddenField id="HiddenTitle" runat="server" />
        <asp:TextBox ID="txtValue" runat="server" TextMode="MultiLine"  Width="98%" Height="370px" CssClass="top input" >  </asp:TextBox> <br />

            <ajaxToolkit:CalendarExtender ID="CalendarExtenderInput" runat="server" 
              Enabled="false" Format="yyyy-MM-dd" TargetControlID="txtValue">
                </ajaxToolkit:CalendarExtender>
    </div>
    <div >
        <asp:Button ID="btnUpdate" runat="server" CssClass="btn" Text="Update" 
            onclick="btnUpdate_Click" />
    </div>
    </form>
</body>
</html>
