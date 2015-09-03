<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="A131Circumstance.ascx.cs" Inherits="WEBSITESAVVY.Uc.A131Circumstance" %>
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
    CIRCUMSTANCE</td></tr>
<tr><td>
    <span>
<asp:TextBox ID="txtCircum" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" 
        Width="750px" Font-Size="14pt" Font-Names="Times New Roman" Rows="40" >
        <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><strong>DIỄN BIẾN TỔN THẤT </strong></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Theo lời tường thuật của đại diện NĐBH (hoặc Bi&ecirc;n bản tường tr&igrave;nh vụ việc của nh&acirc;n chứng đầu ti&ecirc;n), diễn biến sự cố / vụ tổn thất n&agrave;y được ghi nhận t&oacute;m lược như sau: &hellip;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">M&ocirc; tả diễn biến theo tr&igrave;nh tự: - Tổn thất do ai ph&aacute;t hiện? - Khi n&agrave;o v&agrave; ở đ&acirc;u? - Phản ứng / diễn tiến sau đ&oacute; ra sao&hellip;&rdquo; &hellip;M&ocirc; tả diễn biến tiếp theo sau khi GĐV đ&atilde; c&oacute; mặt tại hiện trường, những c&ocirc;ng việc n&agrave;o đ&atilde; được tiến h&agrave;nh / triển khai v&agrave; kết quả đạt được&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: small;"><em>*** Bi&ecirc;n bản ghi nhận tường tr&igrave;nh về vụ việc (hoặc bản sao của B&aacute;o c&aacute;o sự cố&hellip; của nh&acirc;n chứng / nh&acirc;n vi&ecirc;n&hellip; của NĐBH) được đ&iacute;nh k&egrave;m tại Phụ lục A-1.3.</em></span></p>  <p style="text-align: justify;">&nbsp;</p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><strong>CIRCUMSTANCES </strong></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">According to Insured&rsquo;s representative, circumstances of this loss was noted as follows: On&hellip; date &amp; time of loss incident&hellip;&hellip;&hellip;. The incident was then immediately reported to the shift&rsquo;s managers in charge. At the time of our site attendance (&hellip;), the subject of damage / loss items was being dismantled by Insured&rsquo;s technician for damage checking of the affected parts&hellip;. Some of those broken / damaged items were then removed to temporary warehouse, while other items (suspected to be damaged) were still remained inside awaiting further inspection. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">We have been advised by Insured&rsquo;s technician that the dismantling &amp; damage inspection work would take extensive time, pending for advices and recommendation from the machine&rsquo;s maker / manufacturer. Thus, we are still pushing the Insured to </span><span style="font-family: 'times new roman', times; font-size: large;">complete this process for full account of the incident&rsquo;s damage extent.</span></p>
        </asp:TextBox>
                <%--    <CKEditor:CKEditorControl ID="txtCircum" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> <span style="font-size:20px;">DIỄN BIẾN TỔN THẤT </span>
<p>
 <br />
Theo lời tường thuật của đại diện NĐBH (hoặc Biên bản tường trình vụ việc của nhân chứng đầu tiên), diễn biến sự cố / vụ tổn thất này được ghi nhận tóm lược như sau:
&lt;…Mô tả diễn biến theo trình tự: - Tổn thất do ai phát hiện? - Khi nào và ở đâu? - Phản ứng / diễn tiến sau đó ra sao…&gt;”
&lt;…Mô tả diễn biến tiếp theo sau khi GĐV đã có mặt tại hiện trường, những công việc nào đã được tiến hành / triển khai và kết quả đạt được…&gt;
*** Biên bản ghi nhận tường trình về vụ việc (hoặc bản sao của Báo cáo sự cố… của nhân chứng / nhân viên… của NĐBH) được đính kèm tại Phụ lục A-1.3.
</p>
<span style="font-size:20px;">
 <br />
CIRCUMSTANCES
</span>
 <br />
 <p>
According to Insured’s representative, circumstances of this loss was noted as follows:<br />
On… &lt;date &amp; time of loss incident&gt;………. <br />The incident was then immediately reported to the shift’s managers in charge.<br />
At the time of our site attendance (…), the &lt;subject of damage / loss items&gt; was being dismantled by Insured’s technician for damage checking of the affected parts…. Some of those broken / damaged items were then removed to temporary warehouse, while other items (suspected to be damaged) were still remained inside awaiting further inspection. <br />
We have been advised by Insured’s technician that the dismantling &amp; damage inspection work would take extensive time, pending for advices and recommendation from the machine’s maker / manufacturer. Thus, we are still pushing the Insured to complete this process for full account of the incident’s damage extent.<br />
</p></CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateInsured" runat="server" CssClass="btn" 
        Text="Update" onclick="btnUpdateInsured_Click" /></td></tr>
</table>



