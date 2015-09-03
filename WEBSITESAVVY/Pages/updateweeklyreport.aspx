<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateweeklyreport.aspx.cs" Inherits="WEBSITESAVVY.Pages.updateweeklyreport" %>
<%--<%@Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor"%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            forced_root_block: "",
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
//            template_external_list_url: "js/template_list.js",
//            external_link_list_url: "js/link_list.js",
//            external_image_list_url: "js/image_list.js",
//            media_external_list_url: "js/media_list.js"
        });

   </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div>
       <table align="center" width="100%">
        <tr>
            <td class="leftweekly">
                <asp:Label ID="Label2" runat="server" Text="Claim Ref(Tham Chiếu)" 
                    Font-Bold="False"></asp:Label>
            &nbsp;:
                &nbsp;<asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textbox" Width="20%"></asp:TextBox>
            </td>
            <td align="right" style="padding-right: 50px">
                &nbsp;</td>
        </tr>
        
        <tr class="lblNoiDungWeekly">
            <td class="leftweekly" colspan="2">
                <asp:Label ID="Label8" runat="server" Text="ĐỀ XUẤT CỦA GĐV (ADJUSTER'S PROPOSAL)" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftweekly" colspan="2">
           
            <%--<CKEditor:CKEditorControl ID="ckDeXuatGiamDinh" runat="server" 
                BasePath="~/ckeditor" Height="390px"></CKEditor:CKEditorControl>--%>
           <asp:TextBox ID="txtDeXuatGiamDinh" runat="server" TextMode="MultiLine"  Width="65%" Height="300px" CssClass="top input" >  </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="rightweekly">
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" Width="75px" 
                    onclick="btnCapNhat_Click" OnClientClick="aspnetForm.target='_blank';" 
                    CssClass="btn" />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
