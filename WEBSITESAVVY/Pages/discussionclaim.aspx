<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussionclaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.discussionclaim" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../css/claim.css"/>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../Content/themes/default/linkbutton.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery.min.js"></script>
	<script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../Content/themes/default/menu.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function closeDialog() {
                $('.panel-tool-close').trigger("click");
            }

            $(document).ready(function () {
                var tabID = $("#MainContent_tabid").html();
                $("#" + tabID).addClass("active");
            });

        </script>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            mode: "textareas",
            theme: "advanced",
            plugins: "safari,style,layer,table",
            theme_advanced_buttons1: "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,formatselect,fontselect,fontsizeselect|,bullist,numlist,|,undo,redo,|,forecolor,backcolor",
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table width="100%" bgcolor="White">
            <tr>
                <td colspan="2" class="headerViewform">
                    CLAIM DISCUSSION - THẢO LUẬN NỘI BỘ</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="right"  
                    style="padding-right: 50px; color: #003300;">
                   <a href="javascript:void(0)" onclick="$('#w_NewComment').window('open')" >New Comment</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-right: 50px; padding-left: 50px;">
                <div align="center"  style="text-align: justify;" class="labelcontent">
                <asp:Label ID="lblK" runat="server" Font-Names="Times New Roman" Font-Size="14px" 
                       ></asp:Label>
                </div>
                  
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    <div id="w_NewComment" class="easyui-window" title="New comment discussion" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Pages/newdiscussion.aspx" ></iframe>
    </div>
    </div>
    </form>
    
</body>
</html>
