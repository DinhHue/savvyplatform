<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClaimSettlement.ascx.cs" Inherits="WEBSITESAVVY.Uc.ClaimSettlement" %>
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
    CLAIM SETTLEMENT</td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtSettlement" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="885px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times;"><span style="font-size: x-large;"><strong>CẬP NHẬT DỰ PH&Ograve;NG</strong>&nbsp;</span><span><br /><br /><span style="font-size: large;">Hiện tại, c&ocirc;ng t&aacute;c chuẩn bị hồ sơ của NĐBH li&ecirc;n quan đến vụ tổn thất n&agrave;y vẫn đang được tiến h&agrave;nh. C&ocirc;ng t&aacute;c hướng dẫn NĐBH về nguy&ecirc;n tắc t&iacute;nh to&aacute;n thiệt hại theo tinh thần của Đơn Bảo hiểm sẽ được gi&aacute;m định vi&ecirc;n của Savvy Adjusters tiếp tục cập nhật đến Nh&agrave; Bảo Hiểm trong c&aacute;c b&aacute;o c&aacute;o sau. Tại thời điểm n&agrave;y, ch&uacute;ng t&ocirc;i đề xuất Nh&agrave; Bảo Hiểm tạm lập mức dự ph&ograve;ng ban đầu cho vụ tổn thất n&agrave;y l&agrave;: Reserve (Số tiền bằng chữ).</span><br /><span style="font-size: large;">Hoặc:</span><br /><span style="font-size: large;">Với c&aacute;c th&ocirc;ng tin n&ecirc;u tr&ecirc;n v&agrave; diễn tiến khiếu nại của NĐBH cho đến thời điểm n&agrave;y, ch&uacute;ng t&ocirc;i đề xuất Nh&agrave; Bảo Hiểm vẫn duy tr&igrave; dự ph&ograve;ng bồi thường cho vụ tổn thất n&agrave;y cho đến khi c&oacute; đầy đủ cơ sở v&agrave; hồ sơ li&ecirc;n quan đến khiếu nại n&agrave;y. Theo đ&oacute;, mức dự ph&ograve;ng cập nhật do ch&uacute;ng t&ocirc;i đề xuất l&agrave;: Reserve (Số tiền bằng chữ: ).</span><br /><br /><span style="font-size: x-large;"><strong>ĐỀ XUẤT CHUNG CUỘC&nbsp;</strong></span><br /><br /><span style="font-size: large;">Căn cứ theo t&iacute;nh to&aacute;n của Savvy Adjusters ở phần tr&ecirc;n về gi&aacute; trị tổn thất hợp l&yacute; v&agrave; sau khi đ&atilde; &aacute;p dụng c&aacute;c điều kiện / điều khoản theo HĐBH đang xem x&eacute;t, ch&uacute;ng t&ocirc;i đệ tr&igrave;nh Nh&agrave; Bảo Hiểm tham khảo kết quả t&iacute;nh to&aacute;n bồi thường do ch&uacute;ng t&ocirc;i đề xuất như sau: Bảng k&ecirc; 01: T&oacute;m tắt &amp; Tổng hợp t&iacute;nh to&aacute;n cuối c&ugrave;ng: (Adjustment_Summary) của Savvy</span></span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times;"><span><br /><span style="font-size: small;"><em>*** Số tiền nguy&ecirc;n tệ (USD) đ&atilde; được qui đổi theo tỉ gi&aacute; tại ng&agrave;y thanh to&aacute;n bồi thường - căn cứ theo ĐK về tiền tệ theo GCNBH đ&atilde; cấp (hoặc ng&agrave;y cấp HĐBH - căn cứ theo&hellip;.), theo đ&oacute; 1 USD = &hellip; VNĐ) </em></span></span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times;"><span><span style="font-size: small;"><em>*** Số tiền đề xuất bồi thường n&ecirc;u tr&ecirc;n kh&ocirc;ng bao gồm thuế GTGT.</em></span><br /><br /><span style="font-size: x-large;"><strong>RESERVE FOR INSURER&nbsp;</strong></span><br /><br /><span style="font-size: large;">Given the Insured&rsquo;s claim document preparation is undergoing, our claim adjustment is not available at the moment, and we will keep Insurer updated of any further information in this regard in our next reports. In the interim, a provisional loss reserve of VND/US$&hellip; (in words) is recommended, pending for consideration of this claim&rsquo;s Policy Liability. Should our further investigation reveal that an alteration is required to this figure we shall of course immediately inform you.&nbsp;</span></span><br /></span></p>
</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtSettlement" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">CẬP NHẬT DỰ PHÒNG </span>
 <span style="font-size:16px;">
 <br /><br />
Hiện tại, công tác chuẩn bị hồ sơ của NĐBH liên quan đến vụ tổn thất này vẫn đang được tiến hành. Công tác hướng dẫn NĐBH về nguyên tắc tính toán thiệt hại theo tinh thần của Đơn Bảo hiểm sẽ được giám định viên của Savvy Adjusters tiếp tục cập nhật đến Nhà Bảo Hiểm trong các báo cáo sau.
Tại thời điểm này, chúng tôi đề xuất Nhà Bảo Hiểm tạm lập mức dự phòng ban đầu cho vụ tổn thất này là: Reserve (Số tiền bằng chữ).<br />
Hoặc:<br />
Với các thông tin nêu trên và diễn tiến khiếu nại của NĐBH cho đến thời điểm này, chúng tôi đề xuất Nhà Bảo Hiểm vẫn duy trì dự phòng bồi thường cho vụ tổn thất này cho đến khi có đầy đủ cơ sở và hồ sơ liên quan đến khiếu nại này. Theo đó, mức dự phòng cập nhật do chúng tôi đề xuất là: Reserve (Số tiền bằng chữ: ). <br /><br />
<span style="font-size:20px;">ĐỀ XUẤT CHUNG CUỘC </span>
<br /><br />
Căn cứ theo tính toán của Savvy Adjusters ở phần trên về giá trị tổn thất hợp lý và sau khi đã áp dụng các điều kiện / điều khoản theo HĐBH đang xem xét, chúng tôi đệ trình Nhà Bảo Hiểm tham khảo kết quả tính toán bồi thường do chúng tôi đề xuất như sau:
Bảng kê 01: Tóm tắt & Tổng hợp tính toán cuối cùng: (Adjustment_Summary) của Savvy<br />
*** Số tiền nguyên tệ (USD) đã được qui đổi theo tỉ giá tại ngày thanh toán bồi thường - căn cứ theo ĐK về tiền tệ theo GCNBH đã cấp (hoặc ngày cấp HĐBH - căn cứ theo….), theo đó 1 USD = … VNĐ) </q>
*** Số tiền đề xuất bồi thường nêu trên không bao gồm thuế GTGT.
<br /><br />
<span style="font-size:20px;">RESERVE FOR INSURER </span>
<br /><br />
Given the Insured’s claim document preparation is undergoing, our claim adjustment is not available at the moment, and we will keep Insurer updated of any further information in this regard in our next reports.
In the interim, a provisional loss reserve of VND/US$… (in words) is recommended, pending for consideration of this claim’s Policy Liability. Should our further investigation reveal that an alteration is required to this figure we shall of course immediately inform you.
<br />
<br /></span>
<span style="font-size:20px;">CLAIM SETTLEMENT </span>

</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateSettlement" runat="server" CssClass="btn" 
        Text="Update" onclick="btnUpdateSettlement_Click" /></td></tr>
</table>



