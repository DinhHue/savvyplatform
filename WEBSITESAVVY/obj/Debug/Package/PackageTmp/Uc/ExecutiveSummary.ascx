<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExecutiveSummary.ascx.cs" Inherits="WEBSITESAVVY.Uc.ExecutiveSummary" %>
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
<table width="100%" id="tblIR">
<tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    EXECUTIVE SUMMARY&nbsp;
    <asp:Label ID="lblIR" runat="server" Text="- IR"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="- FR"></asp:Label>
    </td></tr>
<tr><td>
    <span>
<asp:TextBox ID="txtIR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">KH&Aacute;I QU&Aacute;T VỤ VIỆC V&Agrave; TIẾN TR&Igrave;NH </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Tr&ecirc;n cơ sở y&ecirc;u cầu gi&aacute;m định của Qu&yacute; C&ocirc;ng ty Bảo hiểm li&ecirc;n quan đến , ch&uacute;ng t&ocirc;i đ&atilde; lần lượt cập nhật đến Qu&yacute; C&ocirc;ng ty Bảo hiểm về tiến tr&igrave;nh vụ việc qua B&aacute;o c&aacute;o đầu ti&ecirc;n ng&agrave;y&hellip; v&agrave; B&aacute;o c&aacute;o tiếp theo (nếu c&oacute;) ng&agrave;y&hellip;.  Với mục đ&iacute;ch chuyển tải th&ocirc;ng tin đầy đủ v&agrave; tr&aacute;nh sự tr&ugrave;ng lặp, ch&uacute;ng t&ocirc;i sẽ chỉ tham chiếu hoặc t&oacute;m tắt kết quả gi&aacute;m định / &yacute; kiến ph&acirc;n t&iacute;ch đ&atilde; được đề cập trong B&aacute;o c&aacute;o trước, hoặc cập nhật th&ecirc;m diễn biến mới nhất c&oacute; ảnh hưởng đến &yacute; kiến gi&aacute;m định cho đến thời điểm n&agrave;y. Theo đ&oacute;, kết quả gi&aacute;m định cập nhật cho đến thời điểm n&agrave;y được t&oacute;m tắt như sau:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- * Nguy&ecirc;n nh&acirc;n tổn thất v&agrave; Phạm vi bảo hiểm: vụ tổn thất n&agrave;y li&ecirc;n quan đến m&ocirc; tả vắn tắt đối tượng &amp; nguy&ecirc;n do thiệt hại. Cho đến thời điểm n&agrave;y, kết luận về phạm vi bảo hiểm nếu đ&atilde; x&aacute;c định được nguy&ecirc;n nh&acirc;n tổn thất </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">&ndash; hoặc nếu chưa x&aacute;c định được nguy&ecirc;n nh&acirc;n th&igrave;: &hellip;ch&uacute;ng t&ocirc;i sẽ tiếp tục l&agrave;m r&otilde; vẩn đề n&agrave;y trong B&aacute;o c&aacute;o tiếp theo ngay sau khi nhận được kết quả điều tra nguy&ecirc;n nh&acirc;n ch&aacute;y từ ph&iacute;a Cơ quan chức năng / C&ocirc;ng an PCCC&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">* Phạm vi v&agrave; mức độ thiệt hại: m&ocirc; tả tiến tr&igrave;nh gi&aacute;m định phạm vi / mức độ thiệt hại của Savvy v&agrave; NĐBH, n&ecirc;u t&oacute;m tắt kết quả đạt được về nội dung n&agrave;y. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">* Khiếu nại / Y&ecirc;u cầu bồi thường: vắn tắt khiếu nại của NĐBH &ndash; nếu đ&atilde; c&oacute;, đồng thời ghi r&otilde; cơ sở đưa ra khiếu nại hoặc phạm vi khiếu nại của NĐBH cho đến thời điểm n&agrave;y</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> * Tiến độ t&iacute;nh to&aacute;n: hiện tại c&ograve;n đang chờ th&ocirc;ng tin g&igrave;, hoặc vướng mắc vấn đề g&igrave; dẫn đến chưa thể ho&agrave;n tất t&iacute;nh to&aacute;n / B&aacute;o c&aacute;o cuối c&ugrave;ng&hellip;(?) </span></p>  <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">EXECUTIVE SUMMARY </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">We refer to Insurers&rsquo; instruction dated&hellip; date of instruction regarding Insured&rsquo;s loss / damage of&hellip; due to&hellip; and confirm having arranged the site attendance / survey with concerned Parties at&hellip; hours on&hellip; to investigate the case, where we met and discussed the matter with Insured's contact person, the Insured&rsquo;s &hellip;  This loss / claim of Insured concerns&hellip;  and until now having been determined causing by.</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Following to our review of this claim under the Policy No.&hellip; and attaching, we are of the opinion that the Insured have a valid right of recovery on this occasion. The Insured submitted the claim of VND/USD&hellip; which might have based on their own estimation of this loss and&hellip; &ndash; along with the available supporting documents which have been requested by our loss adjusters. In conclusion, &hellip; LA&rsquo;s opinion in terms of Policy Liability. Accordingly, our claim adjustment / proposed settlement upon completion of our enquiry and available supporting documents will be discussed in details as follows:-</span></p></asp:TextBox>
            
 <%--<CKEditor:CKEditorControl ID="txtIR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">KHÁI QUÁT VỤ VIỆC VÀ TIẾN TRÌNH </span>
<p>
Trên cơ sở yêu cầu giám định của Quý Công ty Bảo hiểm liên quan đến <…>, chúng tôi đã lần lượt cập nhật đến Quý Công ty Bảo hiểm về tiến trình vụ việc qua Báo cáo đầu tiên ngày… và Báo cáo tiếp theo (nếu có) ngày…. 
Với mục đích chuyển tải thông tin đầy đủ và tránh sự trùng lặp, chúng tôi sẽ chỉ tham chiếu hoặc tóm tắt kết quả giám định / ý kiến phân tích đã được đề cập trong Báo cáo trước, hoặc cập nhật thêm diễn biến mới nhất có ảnh hưởng đến ý kiến giám định cho đến thời điểm này. Theo đó, kết quả giám định cập nhật cho đến thời điểm này được tóm tắt như sau:-<br />
* Nguyên nhân tổn thất và Phạm vi bảo hiểm: vụ tổn thất này liên quan đến (mô tả vắn tắt đối tượng & nguyên do thiệt hại). Cho đến thời điểm này, (kết luận về phạm vi bảo hiểm nếu đã xác định được nguyên nhân tổn thất – hoặc nếu chưa xác định được nguyên nhân thì: …chúng tôi sẽ tiếp tục làm rõ vẩn đề này trong Báo cáo tiếp theo ngay sau khi nhận được kết quả điều tra nguyên nhân cháy từ phía Cơ quan chức năng / Công an PCCC…)<br />
* Phạm vi và mức độ thiệt hại: (mô tả tiến trình giám định phạm vi / mức độ thiệt hại của Savvy và NĐBH, nêu tóm tắt kết quả đạt được về nội dung này).<br />
* Khiếu nại / Yêu cầu bồi thường: (vắn tắt khiếu nại của NĐBH – nếu đã có, đồng thời ghi rõ cơ sở đưa ra khiếu nại hoặc phạm vi khiếu nại của NĐBH cho đến thời điểm này)<br />
* Tiến độ tính toán: (hiện tại còn đang chờ thông tin gì, hoặc vướng mắc vấn đề gì dẫn đến chưa thể hoàn tất tính toán / Báo cáo cuối cùng…(?))<br /><br />

 <span style="font-size:20px;">EXECUTIVE SUMMARY  </span>
<br />
<br />
We refer to Insurers’ instruction dated… (date of instruction) regarding Insured’s loss / damage of… due to… and confirm having arranged the site attendance / survey with concerned Parties at… hours on… to investigate the case, where we met and discussed the matter with Insured's contact person, the Insured’s … (job title of contact person).<br />
This loss / claim of Insured concerns… (brief description of loss), and until now having been determined causing by (prescised Cause of Loss). Following to our review of this claim under the Policy No.… and (Policy Type) attaching, we are of the opinion that the Insured have a valid right of recovery on this occasion.<br />
The Insured (initially / officially) submitted the claim of VND/USD… which might have based on their own estimation of this loss and… – along with the available supporting documents which have been requested by our loss adjusters.<br />
In conclusion, … (LA’s opinion in terms of Policy Liability).<br />
Accordingly, our claim adjustment / proposed settlement upon completion of our enquiry and available supporting documents will be discussed in details as follows:-<br />
</p>
</CKEditor:CKEditorControl>--%>
</span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateIR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateIR_Click" /></td></tr>

<tr><td>
    <span>
                <asp:TextBox ID="txtFR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px">
        <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">T&Oacute;M TẮT VỤ VIỆC </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Tr&ecirc;n cơ sở y&ecirc;u cầu gi&aacute;m định của Qu&yacute; C&ocirc;ng ty Bảo hiểm li&ecirc;n quan đến (&hellip;), ch&uacute;ng t&ocirc;i đ&atilde; lần lượt cập nhật đến Qu&yacute; C&ocirc;ng ty Bảo hiểm về tiến tr&igrave;nh vụ việc qua B&aacute;o c&aacute;o đầu ti&ecirc;n ng&agrave;y&hellip; v&agrave; B&aacute;o c&aacute;o tiếp theo (nếu c&oacute;) ng&agrave;y&hellip;.  Với mục đ&iacute;ch chuyển tải th&ocirc;ng tin đầy đủ v&agrave; tr&aacute;nh sự tr&ugrave;ng lặp, ch&uacute;ng t&ocirc;i sẽ chỉ tham chiếu hoặc t&oacute;m tắt kết quả gi&aacute;m định / &yacute; kiến ph&acirc;n t&iacute;ch đ&atilde; được đề cập trong B&aacute;o c&aacute;o trước, hoặc chỉ cập nhật diễn biến mới nhất c&oacute; ảnh hưởng đến &yacute; kiến gi&aacute;m định cho đến thời điểm n&agrave;y. Theo đ&oacute;, kết quả gi&aacute;m định cho đến thời điểm n&agrave;y được t&oacute;m tắt như sau:-</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> * Nguy&ecirc;n nh&acirc;n tổn thất v&agrave; Phạm vi bảo hiểm: vụ tổn thất n&agrave;y li&ecirc;n quan đến (m&ocirc; tả vắn tắt đối tượng &amp; nguy&ecirc;n do thiệt hại). Cho đến thời điểm n&agrave;y, (kết luận về phạm vi bảo hiểm nếu đ&atilde; x&aacute;c định được nguy&ecirc;n nh&acirc;n tổn thất &ndash; hoặc &yacute; kiến kh&aacute;ch quan của GĐV về nguy&ecirc;n nh&acirc;n tổn thất đang xem x&eacute;t). </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">* Phạm vi v&agrave; mức độ thiệt hại: (m&ocirc; tả tiến tr&igrave;nh gi&aacute;m định phạm vi / mức độ thiệt hại của Savvy v&agrave; NĐBH, n&ecirc;u t&oacute;m tắt kết quả đạt được về nội dung n&agrave;y). </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">* Khiếu nại / Y&ecirc;u cầu bồi thường: (vắn tắt khiếu nại của NĐBH &ndash; nếu đ&atilde; c&oacute;, đồng thời ghi r&otilde; cơ sở đưa ra khiếu nại hoặc phạm vi khiếu nại của NĐBH cho đến thời điểm n&agrave;y) Sau c&ugrave;ng, tr&ecirc;n cơ sở c&aacute;c đ&aacute;nh gi&aacute; kh&aacute;ch quan về Nguy&ecirc;n nh&acirc;n / Phạm vi tổn thất v&agrave; tham chiếu c&aacute;c điều kiện / điều khoản của HĐBH n&ecirc;u tr&ecirc;n, ch&uacute;ng t&ocirc;i đề xuất Nh&agrave; Bảo Hiểm tham khảo kết quả gi&aacute;m định sau đ&acirc;y để x&aacute;c định tr&aacute;ch nhiệm bồi thường đối với khiếu nại n&agrave;y: (ghi v&agrave;o đ&acirc;y nếu kết luận gi&aacute;m định l&agrave; từ chối bồi thường hoặc tổn thất dưới mức miễn thường &ndash; kh&ocirc;ng c&oacute; bảng t&iacute;nh to&aacute;n bồi thường). </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><em>(Bảng k&ecirc; 01: t&oacute;m tắt &amp; tổng hợp t&iacute;nh to&aacute;n cuối c&ugrave;ng: (Adjustment_Summary)) </em></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Cụ thể, c&aacute;c hồ sơ do NĐBH cung cấp v&agrave; th&ocirc;ng tin li&ecirc;n quan l&agrave;m cơ sở cho đề xuất của Savvy Adjusters sẽ lần lượt được tr&igrave;nh b&agrave;y ở c&aacute;c phần sau của B&aacute;o c&aacute;o n&agrave;y:- </span></p>  <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">EXECUTIVE SUMMARY</span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> We refer to Insurers&rsquo; instruction dated&hellip; (date of instruction) regarding Insured&rsquo;s loss / damage of&hellip; due to&hellip; and confirm having arranged the site attendance / survey with concerned Parties at&hellip; hours on&hellip; to investigate the case, where we met and discussed the matter with Insured's contact person, the Insured&rsquo;s &hellip; (job title of contact person). This loss / claim of Insured concerns&hellip; (brief description of loss), and until now having been determined causing by (pr&eacute;cised Cause of Loss). </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Following to our review of this claim under the Policy No.&hellip; and (Policy Type) attaching, we are of the opinion that the Insured have a valid right of recovery on this occasion. The Insured (initially / officially) submitted the claim of VND/USD&hellip; which might have based on their own estimation of this loss and&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">&ndash; along with the available supporting documents which have been requested by our loss adjusters. In conclusion, &hellip; (LA&rsquo;s opinion in terms of Policy Liability) + Adjustment_Summary. Accordingly, our claim adjustment / proposed settlement upon completion of our enquiry and available supporting documents will be discussed in details as follows:-  as d as sda</span></p>
        </asp:TextBox>
 <%--<CKEditor:CKEditorControl ID="txtFR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">TÓM TẮT VỤ VIỆC </span>
<p>
 <br />
Trên cơ sở yêu cầu giám định của Quý Công ty Bảo hiểm liên quan đến &lt;…&gt;, chúng tôi đã lần lượt cập nhật đến Quý Công ty Bảo hiểm về tiến trình vụ việc qua Báo cáo đầu tiên ngày… và Báo cáo tiếp theo (nếu có) ngày…. <br />
Với mục đích chuyển tải thông tin đầy đủ và tránh sự trùng lặp, chúng tôi sẽ chỉ tham chiếu hoặc tóm tắt kết quả giám định / ý kiến phân tích đã được đề cập trong Báo cáo trước, hoặc chỉ cập nhật diễn biến mới nhất có ảnh hưởng đến ý kiến giám định cho đến thời điểm này. Theo đó, kết quả giám định cho đến thời điểm này được tóm tắt như sau:-<br /><br />
* Nguyên nhân tổn thất và Phạm vi bảo hiểm: vụ tổn thất này liên quan đến &lt;mô tả vắn tắt đối tượng &amp; nguyên do thiệt hại&gt;. Cho đến thời điểm này, &lt;kết luận về phạm vi bảo hiểm nếu đã xác định được nguyên nhân tổn thất - hoặc ý kiến khách quan của GĐV về nguyên nhân tổn thất đang xem xét&gt;.<br />
* Phạm vi và mức độ thiệt hại: &lt;mô tả tiến trình giám định phạm vi / mức độ thiệt hại của Savvy và NĐBH, nêu tóm tắt kết quả đạt được về nội dung này&gt;.<br />
* Khiếu nại / Yêu cầu bồi thường: &lt;vắn tắt khiếu nại của NĐBH - nếu đã có, đồng thời ghi rõ cơ sở đưa ra khiếu nại hoặc phạm vi khiếu nại của NĐBH cho đến thời điểm này&gt;<br />
Sau cùng, trên cơ sở các đánh giá khách quan về Nguyên nhân / Phạm vi tổn thất và tham chiếu các điều kiện / điều khoản của HĐBH nêu trên, chúng tôi đề xuất Nhà Bảo Hiểm tham khảo kết quả giám định sau đây để xác định trách nhiệm bồi thường đối với khiếu nại này: (ghi vào đây nếu kết luận giám định là từ chối bồi thường hoặc tổn thất dưới mức miễn thường - không có bảng tính toán bồi thường).<br /><br />
&lt;Bảng kê 01: tóm tắt &amp; tổng hợp tính toán cuối cùng: (Adjustment_Summary)&gt;<br />
Cụ thể, các hồ sơ do NĐBH cung cấp và thông tin liên quan làm cơ sở cho đề xuất của Savvy Adjusters sẽ lần lượt được trình bày ở các phần sau của Báo cáo này:-</p>
<br />
<span style="font-size:20px;">EXECUTIVE SUMMARY</span>
 <p>
We refer to Insurers’ instruction dated… (date of instruction) regarding Insured’s loss / damage of… due to… and confirm having arranged the site attendance / survey with concerned Parties at… hours on… to investigate the case, where we met and discussed the matter with Insured's contact person, the Insured’s … (job title of contact person).<br />
This loss / claim of Insured concerns… (brief description of loss), and until now having been determined causing by (précised Cause of Loss). Following to our review of this claim under the Policy No.… and (Policy Type) attaching, we are of the opinion that the Insured have a valid right of recovery on this occasion.<br />
The Insured (initially / officially) submitted the claim of VND/USD… which might have based on their own estimation of this loss and… – along with the available supporting documents which have been requested by our loss adjusters.<br />
In conclusion, … (LA’s opinion in terms of Policy Liability) + Adjustment_Summary.<br />
Accordingly, our claim adjustment / proposed settlement upon completion of our enquiry and available supporting documents will be discussed in details as follows:-<br />

</p>
</CKEditor:CKEditorControl>--%>
            </span>
</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateFR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateFR_Click" /></td></tr>
</table>
