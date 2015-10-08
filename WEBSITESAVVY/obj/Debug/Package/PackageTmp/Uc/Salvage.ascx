<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Salvage.ascx.cs" Inherits="WEBSITESAVVY.Uc.Salvage" %>
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
    SALVAGE</td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtH" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">PHẾ LIỆU THU HỒI </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">For Preliminary report (BCSB) hoặc Interim report / BCTT C&oacute; thể tham khảo / sử dụng c&aacute;c c&acirc;u mẫu sau (t&ugrave;y từng trường hợp v&agrave; loại h&igrave;nh tổn thất):</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> 1. Sau khi ho&agrave;n tất c&ocirc;ng t&aacute;c gi&aacute;m định hiện trường, ch&uacute;ng t&ocirc;i đ&atilde; hướng dẫn NĐBH thu gom, bảo quản c&aacute;c t&agrave;i sản bị thiệt hại, chờ thống nhất với Nh&agrave; Bảo Hiểm phương &aacute;n xử l&yacute; / thanh l&yacute; thu hồi. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">2. Hiện tại, ch&uacute;ng t&ocirc;i vẫn chưa x&aacute;c định được khối lượng v&agrave; số lượng c&aacute;c hạng mục c&oacute; gi&aacute; trị thu hồi do NĐBH vẫn chưa tiến h&agrave;nh sửa chữa / khắc phục c&aacute;c t&agrave;i sản bị thiệt hại trong vụ tổn thất n&agrave;y. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i cũng đ&atilde; lưu &yacute; NĐBH trong C&ocirc;ng văn y&ecirc;u cầu hồ sơ gửi ng&agrave;y &hellip; về việc cần bảo quản số phế liệu / vật tư vẫn c&ograve;n gi&aacute; trị thu hồi, chờ thống nhất với Nh&agrave; Bảo Hiểm về phương &aacute;n xử l&yacute;. 3. M&ocirc; tả những phế liệu c&ograve;n lại sau tổn thất: c&ograve;n gi&aacute; trị thu hồi hay kh&ocirc;ng? </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">For Final report / FFR (BCCC)</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> 1. M&ocirc; tả những phế liệu c&ograve;n lại sau tổn thất (nếu c&ograve;n gi&aacute; trị thu hồi) hoặc khẳng định nếu phế liệu kh&ocirc;ng c&oacute; gi&aacute; trị thu hồi; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">2. Tr&igrave;nh b&agrave;y phương &aacute;n / hướng xử l&yacute; đ&atilde; được c&aacute;c b&ecirc;n (Nh&agrave; Bảo Hiểm, NĐBH&hellip;) thống nhất (đối với phế liệu c&ograve;n gi&aacute; trị thu hồi): Số lượng / khối lượng gi&aacute; trị c&oacute; thể thu hồi hoặc đ&atilde; được thanh l&yacute; (c&aacute;ch t&iacute;nh to&aacute;n, thu thập b&aacute;o gi&aacute;&hellip;) Lưu &yacute;: Trong trường hợp c&oacute; &aacute;p dụng t&iacute;nh to&aacute;n điều chỉnh dưới gi&aacute; trị theo HĐBH cho số tiền bồi thường th&igrave; phần phế liệu cũng phải được điều chỉnh dưới gi&aacute; trị theo tỷ lệ tương ứng. </span></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">*** "C&ocirc;ng văn YCHS hoặc c&aacute;c email / bi&ecirc;n bản l&agrave;m việc với NDBH về phương &aacute;n / gi&aacute; trị thanh l&yacute; thu hồi..." được đ&iacute;nh k&egrave;m tại Phụ lục U-2.1 </span></em></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">*** Bản sao c&aacute;c B&aacute;o gi&aacute; mua phế liệu thu hồi của vụ tổn thất n&agrave;y được đ&iacute;nh k&egrave;m tại Phụ lục U-2.2</span></em></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> SALVAGE</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Following completion of our site survey, the Insured was requested to well maintain the damaged items and should seek Insurer&rsquo;s consent before proceeding with any salvage sale. We will keep Insurer informed of any development about the salvage process.</span></p>
</asp:TextBox>

 <%--<CKEditor:CKEditorControl ID="txtH" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">PHẾ LIỆU THU HỒI </span>
 <span style="font-size:16px;">
 <br /><br />
For Preliminary report (BCSB) hoặc Interim report / BCTT<br /><br />
Có thể tham khảo / sử dụng các câu mẫu sau (tùy từng trường hợp và loại hình tổn thất):<br />
1.	Sau khi hoàn tất công tác giám định hiện trường, chúng tôi đã hướng dẫn NĐBH thu gom, bảo quản các tài sản bị thiệt hại, chờ thống nhất với Nhà Bảo Hiểm phương án xử lý / thanh lý thu hồi.<br />
2.	Hiện tại, chúng tôi vẫn chưa xác định được khối lượng và số lượng các hạng mục có giá trị thu hồi do NĐBH vẫn chưa tiến hành sửa chữa / khắc phục các tài sản bị thiệt hại trong vụ tổn thất này. Tuy nhiên, chúng tôi cũng đã lưu ý NĐBH trong Công văn yêu cầu hồ sơ gửi ngày … về việc cần bảo quản số phế liệu / vật tư vẫn còn giá trị thu hồi, chờ thống nhất với Nhà Bảo Hiểm về phương án xử lý.<br />
3.	Mô tả những phế liệu còn lại sau tổn thất: còn giá trị thu hồi hay không?<br /><br />
For Final report / FFR (BCCC)<br /><br />
1.	Mô tả những phế liệu còn lại sau tổn thất (nếu còn giá trị thu hồi) hoặc khẳng định nếu phế liệu không có giá trị thu hồi;<br />
2.	Trình bày phương án / hướng xử lý đã được các bên (Nhà Bảo Hiểm, NĐBH…) thống nhất (đối với phế liệu còn giá trị thu hồi): Số lượng / khối lượng giá trị có thể thu hồi hoặc đã được thanh lý (cách tính toán, thu thập báo giá…)</span><br /><br />
 <span style="font-style:italic">Lưu ý: Trong trường hợp có áp dụng tính toán điều chỉnh dưới giá trị theo HĐBH cho số tiền bồi thường thì phần phế liệu cũng phải được điều chỉnh dưới giá trị theo tỷ lệ tương ứng.<br />
*** "Công văn YCHS hoặc các email / biên bản làm việc với NDBH về phương án / giá trị thanh lý thu hồi..." được đính kèm tại Phụ lục U-2.1<br />
*** Bản sao các Báo giá mua phế liệu thu hồi của vụ tổn thất này được đính kèm tại Phụ lục U-2.2
</span><br /><br /><br />
 <span style="font-size:20px;">SALVAGE 
 <br /><br />
Following completion of our site survey, the Insured was requested to well maintain the damaged items and should seek Insurer’s consent before proceeding with any salvage sale.<br />
We will keep Insurer informed of any development about the salvage process.
</span>
</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateH" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateH_Click" /></td></tr>
</table>



