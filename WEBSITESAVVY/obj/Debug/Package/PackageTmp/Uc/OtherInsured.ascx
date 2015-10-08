<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OtherInsured.ascx.cs" Inherits="WEBSITESAVVY.Uc.OtherInsured" %>
<%--<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>--%>
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
<table width="100%"><tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    OTHER INSURED</td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtOI" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">ĐƠN BẢO HIỂM KH&Aacute;C </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Suốt thời gian l&agrave;m việc cũng như theo khai b&aacute;o của đại diện của NĐBH, cho đến hiện tại, ch&uacute;ng t&ocirc;i ghi nhận kh&ocirc;ng c&oacute; sự hiện diện của bất kỳ Đơn Bảo Hiểm n&agrave;o kh&aacute;c li&ecirc;n quan đến đối tượng bị thiệt hại trong vụ tổn thất n&agrave;y. Ch&uacute;ng t&ocirc;i sẽ tiếp tục lưu &yacute; v&agrave; b&aacute;o c&aacute;o cho Nh&agrave; Bảo Hiểm nếu c&oacute; bất kỳ th&ocirc;ng tin mới n&agrave;o về vấn đề n&agrave;y. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">OTHER INSURANCE </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Following our discussion with Insured, we have not acknowledged about any other insurance policy, which has the same cover for same property in this claim.</span></p>
        </asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtOI" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">ĐƠN BẢO HIỂM KHÁC </span>
<p>
 <br />
Suốt thời gian làm việc cũng như theo khai báo của đại diện của NĐBH, cho đến hiện tại, chúng tôi ghi nhận không có sự hiện diện của bất kỳ Đơn Bảo Hiểm nào khác liên quan đến đối tượng bị thiệt hại trong vụ tổn thất này.
Chúng tôi sẽ tiếp tục lưu ý và báo cáo cho Nhà Bảo Hiểm nếu có bất kỳ thông tin mới nào về vấn đề này.<br /><br />
<span style="font-size:20px;">OTHER INSURANCE </span>
<br /><br />
Following our discussion with Insured, we have not acknowledged about any other insurance policy, which has the same cover for same property in this claim.</p>
</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateOI" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateOI_Click" /></td></tr>
</table>



