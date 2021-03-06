﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimUpdateFieldPop.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimUpdateFieldPopUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>   

    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../tinymce/tinymce.min.js"></script>

    <script type="text/javascript">
        tinymce.init({
            forced_root_block : '',
            selector: "textarea",
            plugins: [
                    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                    "table contextmenu directionality emoticons textcolor paste textcolor colorpicker textpattern example"
            ],

            toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
            toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent | undo redo | image media code preview | forecolor backcolor",
            toolbar3: "",

            menubar: false,
            toolbar_items_size: 'small',

            image_advtab: true,


        });</script>


   <style type="text/css">
        .top
        {   
            vertical-align:top;
        }
        
        html, body
        {
            padding:0;
            margin:0;
        }
        
        .tool_bottom
        {
	        padding:5px; position: fixed; bottom: 0px; left: 0px; background:#EAEAEA; width:100%; border-top:1px solid #DDD; text-align:center;
        }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

    <div style="margin-bottom:30px">
        <asp:HiddenField id="hiddenClaimID" runat="server" />
        <asp:HiddenField id="hiddenKey" runat="server" />
        <asp:HiddenField id="HiddenTitle" runat="server" />
        <asp:TextBox ID="txtValue" runat="server" TextMode="MultiLine"  Width="98%" Height="290px" CssClass="top input" >  </asp:TextBox> <br />

            <ajaxToolkit:CalendarExtender ID="CalendarExtenderInput" runat="server" 
              Enabled="false" Format="yyyy-MM-dd" TargetControlID="txtValue">
                </ajaxToolkit:CalendarExtender>
    </div>

    <div class="tool_bottom" >
        <asp:Button ID="btnUpdate" runat="server" CssClass="btn" Text="Update" 
            onclick="btnUpdate_Click" />
    </div>
    </form>
</body>
</html>
