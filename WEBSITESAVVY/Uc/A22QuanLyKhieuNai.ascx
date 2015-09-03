<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="A22QuanLyKhieuNai.ascx.cs" Inherits="WEBSITESAVVY.Uc.A22QuanLyKhieuNai" %>
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
<table width="100%">
<tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    CLAIM HANDLING SUMMARY</td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtCircum" runat="server" CssClass="textbox"
                    TextMode="MultiLine" Enabled="True" Height="885px" 
        Width="789px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt">
        <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><strong>QU&Aacute; TR&Igrave;NH QUẢN L&Yacute; KHIẾU NẠI </strong></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Ch&uacute;ng t&ocirc;i lần lượt điểm qua diễn biến trong suốt qu&aacute; tr&igrave;nh thụ l&yacute; gi&aacute;m định vụ tổn thất n&agrave;y cho đến thời điểm hiện tại để Nh&agrave; Bảo Hiểm nắm r&otilde; về tiến tr&igrave;nh tổng thể, cụ thể như sau:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Ng&agrave;y &hellip;, &hellip;&hellip;&hellip;&hellip;;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Ng&agrave;y &hellip;, &hellip;&hellip;&hellip;&hellip;; </span></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">*** Bản sao c&aacute;c c&ocirc;ng văn / email trao đổi ... được đ&iacute;nh k&egrave;m tại Phụ lục A-2. </span></em></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><strong> CLAIM HANDING SUMMARY </strong></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">For Insurers&rsquo; records in respect of this claim&rsquo;s handling progress, we now list some milestone as below:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Date: (Claim Handling Progress); </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- Date: (Claim Handling Progress);&nbsp;</span></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">** Copy of correspondences between concerned parties is attached as Appendix A-2.</span></em></p>
</asp:TextBox>
                             <%--   <CKEditor:CKEditorControl ID="txtCircum" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> <span style="font-size:20px;">QUÁ TRÌNH QUẢN LÝ KHIẾU NẠI </span>
<p>
 <br />
Chúng tôi lần lượt điểm qua diễn biến trong suốt quá trình thụ lý giám định vụ tổn thất này cho đến thời điểm hiện tại để Nhà Bảo Hiểm nắm rõ về tiến trình tổng thể, cụ thể như sau:
<br />
- Ngày …, …………;<br />
- Ngày …, …………;<br />
*** Bản sao các công văn / email trao đổi ... được đính kèm tại Phụ lục A-2.</p>
<span style="font-size:20px;">
 <br />
CLAIM HANDING SUMMARY
</span>
 <br />
 <p>
For Insurers’ records in respect of this claim’s handling progress, we now list some milestone as below:<br />
- Date: &lt;Claim Handling Progress&gt;;<br />
- Date: &lt;Claim Handling Progress&gt;;<br />
…………………………………………………………………………………………<br />
*** Copy of correspondences between concerned parties is attached as Appendix A-2. 
</p></CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateK" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateK_Click" /></td></tr>
</table>



