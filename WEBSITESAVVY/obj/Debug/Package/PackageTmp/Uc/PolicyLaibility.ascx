<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PolicyLaibility.ascx.cs" Inherits="WEBSITESAVVY.Uc.PolicyLaibility" %>
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
    POLICY LIABILTY&nbsp;
    <asp:Label ID="lblIR" runat="server" Text="- PR"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="- FR"></asp:Label>
    </td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtIR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p><span style="font-family: 'times new roman', times; font-size: large;"><strong>PHẠM VI HĐBH (BCSB) </strong></span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;">Hợp Đồng Bảo Hiểm (HĐBH) số &hellip; được căn cứ theo Quy tắc &hellip; .  Với quan điểm về nguy&ecirc;n nh&acirc;n tổn thất như đ&atilde; đề cập ở phần tr&ecirc;n: , &lt;&yacute; kiến đ&aacute;nh gi&aacute; của GĐV về việc tổn thất thuộc phạm vi hay bị loại trừ, theo &hellip; (?)&gt; Một số điều khoản bổ sung c&oacute; li&ecirc;n quan đến t&iacute;nh to&aacute;n số tiền bồi thường trong vụ tổn thất n&agrave;y - được tr&iacute;ch dẫn v&agrave; diễn giải cụ thể như sau: </span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;">&lt;&hellip;Extension Clause&hellip;&gt; </span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;">Ph&acirc;n t&iacute;ch từng điều khoản bổ sung c&oacute; hiệu lực &aacute;p dụng. </span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;">Mức miễn thường đối với mỗi vụ tổn thất do&hellip; l&agrave; &hellip; . </span></p>  <p><em><span style="font-family: 'times new roman', times; font-size: large;">***  nhằm l&agrave;m r&otilde; cho c&aacute;c &yacute; kiến / nhận định / ph&acirc;n t&iacute;ch của Savvy ở phần tr&ecirc;n được đ&iacute;nh k&egrave;m tại Phụ lục A-3.2. </span></em></p>  <p><span style="font-family: 'times new roman', times; font-size: large;"><strong>POLICY COVERAGE (Preliminary Report) </strong></span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;">The Insurance Contract (Policy) No.&hellip; is agreed with term and condition based on . We also noted extension cover is provided for  &ldquo;Machinery Breakdown and Boiler and Pressure Vessels Clause - Limit: US$&hellip; any one loss and in the aggregate&rdquo;. </span></p>  <p><span style="font-family: 'times new roman', times; font-size: large;"> Following to our conclusive opinion as outlined earlier in this report, the machine&rsquo;s damage was identified as a result of&hellip;.  At this stage, our consideration in regards of this claim&rsquo;s Policy Liability is a subject of&hellip;. Any admissible claim would be subjected to a deductible of VND/US$&hellip;. </span></p>  <p><em><span style="font-family: 'times new roman', times; font-size: large;"> *** Copy of the Insurance Contract originally provided by Insurer is attached as Appendix A-3.2.</span></em></p>

</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtIR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">PHẠM VI HĐBH (BCSB) </span>
<p>
 <br />
Hợp Đồng Bảo Hiểm (HĐBH) số … được căn cứ theo Quy tắc … (Policy Type). <br />
Với quan điểm về nguyên nhân tổn thất như đã đề cập ở phần trên: (trích dẫn lại), (ý kiến đánh giá của GĐV về việc tổn thất thuộc phạm vi hay bị loại trừ, theo … (?))<br />
Một số điều khoản bổ sung có liên quan đến tính toán số tiền bồi thường trong vụ tổn thất này - được trích dẫn và diễn giải cụ thể như sau:<br />
(…Extension Clause…) Phân tích từng điều khoản bổ sung có hiệu lực áp dụng.<br />
Mức miễn thường đối với mỗi vụ tổn thất do… là … (Applicable Deductible).<br />
*** (Tên hồ sơ / tài liệu đính kèm) nhằm làm rõ cho các ý kiến / nhận định / phân tích của Savvy ở phần trên được đính kèm tại Phụ lục A-3.2.<br /><br />
 <span style="font-size:20px;">POLICY COVERAGE (Preliminary Report) </span>
<br />
The Insurance Contract (Policy) No.… is agreed with term and condition based on (Policy Type & attached Wording). We also noted extension cover is provided for  “Machinery Breakdown and Boiler and Pressure Vessels Clause - Limit: US$… any one loss and in the aggregate”. <br />
Following to our conclusive opinion as outlined earlier in this report, the machine’s damage was identified as a result of…. <br />
At this stage, our consideration in regards of this claim’s Policy Liability is a subject of….<br />
Any admissible claim would be subjected to a deductible of VND/US$…. <br />
*** Copy of the Insurance Contract originally provided by Insurer is attached as Appendix A-3.2.
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
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">PH&Acirc;N T&Iacute;CH PHẠM VI HĐBH (BCCC) </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Hợp Đồng Bảo Hiểm (HĐBH) số &hellip; được căn cứ theo Quy tắc &hellip; .  Với quan điểm về nguy&ecirc;n nh&acirc;n tổn thất như đ&atilde; đề cập ở phần tr&ecirc;n: , &lt;&yacute; kiến đ&aacute;nh gi&aacute; của GĐV về việc tổn thất thuộc phạm vi hay bị loại trừ, theo &hellip; (?)&gt; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Một số điều khoản bổ sung c&oacute; li&ecirc;n quan đến t&iacute;nh to&aacute;n số tiền bồi thường trong vụ tổn thất n&agrave;y - được tr&iacute;ch dẫn v&agrave; diễn giải cụ thể như sau: </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">&lt;&hellip;Extension Clause&hellip;&gt; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Ph&acirc;n t&iacute;ch từng điều khoản bổ sung c&oacute; hiệu lực &aacute;p dụng. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Mức miễn thường đối với mỗi vụ tổn thất do&hellip; l&agrave; &hellip; . </span></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">***  nhằm l&agrave;m r&otilde; cho c&aacute;c &yacute; kiến / nhận định / ph&acirc;n t&iacute;ch của Savvy ở phần tr&ecirc;n được đ&iacute;nh k&egrave;m tại Phụ lục A-3.2 </span></em></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> POLICY LIABILITY </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">The Policy No. &hellip; is granted under the  - issued by INSURANCE COMPANY (HEAD-OFFICE) / INSURER. Following completion of our initial investigation we are satisfied that this loss has been entirely fortuitous as far as the Insured are concerned, We have now been afforded the opportunity of considering the terms of the policy wording and are of the opinion that the Insured have a valid right of recovery on this occasion. Or... Exclusion ........ states :-</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> &ldquo;Quote exclusion wording in full...&rdquo; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Given the circumstances surrounding this loss, we have formed the view that the claim falls within exclusion and therefore recommend that liability in this case is repudiated. We would however be grateful to receive Insurers comments and instructions prior to proceeding. In consideration to an admissible claim&rsquo;s adjustment, some extension clauses provided by the Policy which may fall into consideration and quoted as below:  ... to bring to Insurers attention to any Extension Clauses or Warranties which may apply and require consideration Any admissible claim due to define the type of loss will be subjected to a deductible of Deductible per each occurrence.</span></p>
</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtFR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">PHÂN TÍCH PHẠM VI HĐBH (BCCC) </span>
<p>
<br />
Hợp Đồng Bảo Hiểm (HĐBH) số … được căn cứ theo Quy tắc … (Policy Type). <br />
Với quan điểm về nguyên nhân tổn thất như đã đề cập ở phần trên: (trích dẫn lại), (ý kiến đánh giá của GĐV về việc tổn thất thuộc phạm vi hay bị loại trừ, theo … (?))<br />
Một số điều khoản bổ sung có liên quan đến tính toán số tiền bồi thường trong vụ tổn thất này - được trích dẫn và diễn giải cụ thể như sau:<br />
(…Extension Clause…) Phân tích từng điều khoản bổ sung có hiệu lực áp dụng.<br />
Mức miễn thường đối với mỗi vụ tổn thất do… là … (Applicable Deductible).<br />
*** (Tên hồ sơ / tài liệu đính kèm) nhằm làm rõ cho các ý kiến / nhận định / phân tích của Savvy ở phần trên được đính kèm tại Phụ lục A-3.2 <br /><br />

 <span style="font-size:20px;">POLICY LIABILITY</span>
<br /><br />
The Policy No. … is granted under the (Policy Type & attached Wording) - issued by INSURANCE COMPANY (HEAD-OFFICE) / INSURER.<br />
Following completion of our initial investigation we are satisfied that this loss has been entirely fortuitous as far as the Insured are concerned, We have now been afforded the opportunity of considering the terms of the policy wording and are of the opinion that the Insured have a valid right of recovery on this occasion.
Or...<br />
Exclusion ........ states :- <br />
	“Quote exclusion wording in full...” <br />
Given the circumstances surrounding this loss, we have formed the view that the claim falls within exclusion and therefore recommend that liability in this case is repudiated. We would however be grateful to receive Insurers comments and instructions prior to proceeding.<br />
In consideration to an admissible claim’s adjustment, some extension clauses provided by the Policy which may fall into consideration and quoted as below:<br />
(Extension Clause)... to bring to Insurers attention to any Extension Clauses or Warranties which may apply and require consideration
Any admissible claim due to define the type of loss will be subjected to a deductible of Deductible per each occurrence.
</p>
</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateFR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateFR_Click" /></td></tr>

</table>

