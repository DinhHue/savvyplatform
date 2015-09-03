<%@ Page Title="" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WEBSITESAVVY.mobile.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
     tinyMCE.init({
        mode: "textareas",
        theme: "advanced",
        plugins: "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
        theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <table align="center" class="infoFormTableSubInfoFirst">
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label2" runat="server" Text="Reference Number :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReferencenumber" runat="server" CssClass="textEntry" 
                    ReadOnly="False" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="lbGDV1" runat="server" Text="Surveyor :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSurveyor" runat="server" CssClass="textEntry" 
                    ReadOnly="True" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label1" runat="server" Text="Insurer :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtInsurer" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label26" runat="server" Text="Policy No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label3" runat="server" Text="Subsidiary :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubsidiary" runat="server" CssClass="textEntry" 
                    ReadOnly="True" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label27" runat="server" Text="Effective :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEffective" runat="server" CssClass="textEntry" 
                    Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label4" runat="server" Text="Insured :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtInsured" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label28" runat="server" Text="Fax No :"></asp:Label>
            </td>
            <td>
                <span>
                <asp:TextBox ID="txtFaxno" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
                </span>
            </td>
        </tr>
           <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label36" runat="server" Text="Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label6" runat="server" Text="Date of loss :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDateofloss" runat="server" CssClass="textEntry" 
                    Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label29" runat="server" Text="Address :"></asp:Label>
            </td>
            <td colspan="3" style="padding-left: 17%; float: left; text-align: left">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="textEntry" Width="450px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label5" runat="server" Text="Premises :"></asp:Label>
            </td>
            <td colspan="3" style="padding-left: 17%; float: left; text-align: left;">
                <asp:TextBox ID="txtPremises" runat="server" CssClass="textEntry" Width="450px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label30" runat="server" Text="Contact Person :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContactPerson" runat="server" CssClass="textEntry" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label31" runat="server" Text="Phone No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
     
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label34" runat="server" Text="Type of Loss :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTypeOfloss" runat="server" CssClass="textEntry" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label35" runat="server" Text="Note :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNote" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeftMulti" colspan="4">
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
