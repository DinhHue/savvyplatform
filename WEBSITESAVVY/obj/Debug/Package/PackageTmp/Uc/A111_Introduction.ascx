<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="A111_Introduction.ascx.cs" Inherits="WEBSITESAVVY.Uc.A111_Introduction" %>
<%--<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>--%>
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
 <script language="javascript" type="text-javascript">
     function DoFocus(txt) 
     {
         txt.className = 'focus';
     }    
   </script>
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
    INTRODUCTION</td></tr>
<tr><td>
    <span>
      
<asp:TextBox ID="txtA1" runat="server" CssClass="textbox" TextMode="MultiLine" Enabled="True" Width="650px" Rows="40" Font-Size="14pt" Font-Names="Times New Roman">&lt;p&gt;&lt;span style=&quot;font-family: &#39;times new roman&#39;, times; font-size: small;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: large;&quot;&gt;GIỚI THIỆU CHUNG &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;  &lt;p&gt;&lt;span style=&quot;font-family: &#39;times new roman&#39;, times; font-size: small;&quot;&gt;&lt;span style=&quot;font-size: large;&quot;&gt;Ch&amp;uacute;ng t&amp;ocirc;i nhận được chỉ định / th&amp;ocirc;ng b&amp;aacute;o của Qu&amp;yacute; C&amp;ocirc;ng ty Bảo hiểm v&amp;agrave;o l&amp;uacute;c &amp;hellip;h&amp;hellip;, ng&amp;agrave;y &amp;hellip;&amp;hellip; về vụ tổn thất do &amp;hellip;&amp;hellip; của C&amp;ocirc;ng ty &amp;hellip;&amp;hellip; tại &amp;hellip;&amp;hellip; v&amp;agrave; đ&amp;atilde; &amp;hellip;&amp;hellip;&amp;hellip;&amp;hellip; (để khảo s&amp;aacute;t v&amp;agrave; thu thập th&amp;ocirc;ng tin về vụ tổn thất tại địa điểm theo chỉ dẫn). Trong suốt thời gian gi&amp;aacute;m định hiện trường (ng&amp;agrave;y &amp;hellip;&amp;hellip;), ch&amp;uacute;ng t&amp;ocirc;i đ&amp;atilde; &amp;hellip;&amp;hellip; (l&amp;agrave;m việc / phối hợp) c&amp;ugrave;ng với đại diện của Người được bảo hiểm (NĐBH) l&amp;agrave;: &amp;hellip;&amp;hellip;&amp;hellip; v&amp;agrave; c&amp;aacute;c nh&amp;acirc;n sự li&amp;ecirc;n quan kh&amp;aacute;c để chốt hồ sơ ban đầu cũng như ghi nhận c&amp;aacute;c th&amp;ocirc;ng tin li&amp;ecirc;n quan gi&amp;uacute;p x&amp;aacute;c định phạm vi / mức độ thiệt hại của vụ tổn thất n&amp;agrave;y. Trong thời gian chờ NĐBH chuẩn bị hồ sơ y&amp;ecirc;u cầu bồi thường v&amp;agrave; chứng minh gi&amp;aacute; trị thiệt hại, ch&amp;uacute;ng t&amp;ocirc;i sau đ&amp;acirc;y đệ tr&amp;igrave;nh B&amp;aacute;o C&amp;aacute;o Sơ Bộ (hoặc tiếp theo) v&amp;agrave; cập nhật tiến tr&amp;igrave;nh cho đến thời điểm hiện tại để Qu&amp;yacute; C&amp;ocirc;ng ty Bảo hiểm nắm th&amp;ocirc;ng tin, cụ thể như sau:- &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;  &lt;p&gt;&lt;span style=&quot;font-family: &#39;times new roman&#39;, times; font-size: small;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: large;&quot;&gt; INTRODUCTION &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;  &lt;p&gt;&lt;span style=&quot;font-family: &#39;times new roman&#39;, times; font-size: small;&quot;&gt;&lt;span style=&quot;font-size: large;&quot;&gt;We refer to Insurers&amp;rsquo; claim appointment regarding , and had arranged to attend at Insured&amp;rsquo;s premises on  to investigate the case. During our site survey, we had worked with Insured&amp;rsquo;s representative whose name was&amp;hellip; () and other Insured&amp;rsquo;s employees to undertake initial enquiries as to the loss circumstances and the cause of loss as well. Following to our Initial Loss Advice dated&amp;hellip; we now submit this Preliminary Report for Insurer&amp;rsquo;s updated information while awaiting the Insured&amp;rsquo;s claim, as follows:-&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;</asp:TextBox>
            </span>
             <span>
               <%--            <CKEditor:CKEditorControl ID="txtA1" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> <span style="font-size:20px;"><p>GIỚI THIỆU CHUNG</p> </span>
<p>
 <br />
Chúng tôi nhận được chỉ định / thông báo của Quý Công ty Bảo hiểm vào lúc …h…, ngày …… về vụ tổn thất do …… của Công ty …… tại …… và đã ………… (để khảo sát và thu thập thông tin về vụ tổn thất tại địa điểm theo chỉ dẫn). Trong suốt thời gian giám định hiện trường (ngày ……), chúng tôi đã …… (làm việc / phối hợp) cùng với đại diện của Người được bảo hiểm (NĐBH) là: ……… và các nhân sự liên quan khác để chốt hồ sơ ban đầu cũng như ghi nhận các thông tin liên quan giúp xác định phạm vi / mức độ thiệt hại của vụ tổn thất này. Trong thời gian chờ NĐBH chuẩn bị hồ sơ yêu cầu bồi thường và chứng minh giá trị thiệt hại, chúng tôi sau đây đệ trình Báo Cáo Sơ Bộ (hoặc tiếp theo) và cập nhật tiến trình cho đến thời điểm hiện tại để Quý Công ty Bảo hiểm nắm thông tin, cụ thể như sau:-
</p>
<span style="font-size:20px;">
<p>
 <br />
INTRODUCTION
</p></span>
 <br />
 <p>
We refer to Insurers’ claim appointment regarding , and had arranged to attend at Insured’s premises onto investigate the case. During our site survey, we had worked with Insured’s representative whose name was… () and other Insured’s employees to undertake initial enquiries as to the loss circumstances and the cause of loss as well. Following to our Initial Loss Advice dated… we now submit this Preliminary Report for Insurer’s updated information while awaiting the Insured’s claim, as follows:-
 </p></CKEditor:CKEditorControl>          
                           --%>
 <br /></span>
</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateA1" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateA1_Click" /></td></tr>
</table>
