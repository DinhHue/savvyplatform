<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailLossExtent.ascx.cs" Inherits="WEBSITESAVVY.Uc.DetailLossExtent" %>
<%--<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>--%>
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
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
    DETAIL LOSS EXTENT&nbsp;
    <asp:Label ID="lblIR" runat="server" Text="- PR"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="- FR"></asp:Label>
    </td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtIR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">PHẠM VI TỔN THẤT (BCSB) </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Trong (A11.1) Ghi khoảng thời gian kiểm đếm / x&aacute;c định tổn thất tại hiện trường,(A11.2) "ch&uacute;ng t&ocirc;i đ&atilde; c&ugrave;ng đại diện NĐBH / Đơn vị kỹ thuật / Nh&agrave; thầu sửa chữa độc lập... hoặc c&aacute;c b&ecirc;n kh&aacute;c c&oacute; li&ecirc;n quan"</span><span style="font-family: 'times new roman', times; font-size: x-large;">(A11.3) </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: x-large;">- "tiến h&agrave;nh đo đạc khu vực NX / kho bị thiệt hại, hoặc th&aacute;o rời/kiểm tra chi tiết c&aacute;c MMTB, hoặc kiểm đếm/ph&acirc;n loại h&agrave;ng tổn thất", kết quả x&aacute;c định phạm vi thiệt hại tổng thể như sau:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- (Phạm vi thiệt hại) (vắn tắt hạng mục - kh&ocirc;ng cần chi tiết qu&aacute;);</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: small;"> *** Bi&ecirc;n bản gi&aacute;m định / thống k&ecirc; c&aacute;c hạng mục tổn thất được đ&iacute;nh k&egrave;m tại Phụ lục A-3. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: small;"> (Ghi r&otilde; hiện trạng thiệt hại v&agrave; c&ocirc;ng t&aacute;c sửa chữa khắc phục của NĐBH - tiến tr&igrave;nh tiếp theo của Savvy để x&aacute;c định gi&aacute; trị tổn thất)</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: small;"> *** "C&ocirc;ng văn y&ecirc;u cầu hồ sơ hoặc c&aacute;c email / bi&ecirc;n bản l&agrave;m việc với NĐBH về kế hoạch x&aacute;c định gi&aacute; trị thiệt hại..." được đ&iacute;nh k&egrave;m tại Phụ lục A-3.</span></p>  <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;"> EXTENT OF LOSS / DAMAGE</span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> During our first site survey and damage inspection on 4th March 2014, it was noted about the damage extent as below:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - &hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- &hellip; Having discussed with Insured&rsquo;s representative, we are considering replacement for all the affected parts and components as those witnessed during the above inspection is necessary &ndash; with the following reasons:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - &hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- &hellip; We will continue following up with this pending process and update to Insurer later in the next reports.</span></p>
</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtIR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">PHẠM VI TỔN THẤT (BCSB) </span>
<p>
 <br />
Trong (A11.1) Ghi khoảng thời gian kiểm đếm / xác định tổn thất tại hiện trường, (A11.2) &quot;chúng tôi đã cùng đại diện NĐBH / Đơn vị kỹ thuật / Nhà thầu sửa chữa độc lập... hoặc các bên khác có liên quan&quot; (A11.3) - &quot;tiến hành đo đạc khu vực NX / kho bị thiệt hại, hoặc tháo rời/kiểm tra chi tiết các MMTB, hoặc kiểm đếm/phân loại hàng tổn thất&quot;, kết quả xác định phạm vi thiệt hại tổng thể như sau: <br />
- &lt;Phạm vi thiệt hại&gt; (vắn tắt hạng mục - không cần chi tiết quá); <br />
<q style="font-style:italic">*** Biên bản giám định / thống kê các hạng mục tổn thất được đính kèm tại Phụ lục A-3.</q>  <br />
(Ghi rõ hiện trạng thiệt hại và công tác sửa chữa khắc phục của NĐBH - tiến trình tiếp theo của Savvy để xác định giá trị tổn thất) <br />
<q style="font-style:italic">*** "Công văn yêu cầu hồ sơ hoặc các email / biên bản làm việc với NĐBH về kế hoạch xác định giá trị thiệt hại..." được đính kèm tại Phụ lục A-3.</q><br />
 <br />
 <span style="font-size:20px;">EXTENT OF LOSS / DAMAGE  </span><br /><br />
<q>
During our first site survey and damage inspection on 4th March 2014, it was noted about the damage extent as below: <br />
- … <br />
- … <br />
Having discussed with Insured’s representative, we are considering replacement for all the affected parts and components as those witnessed during the above inspection is necessary - with the following reasons: <br />
- … <br />
- … <br />
We will continue following up with this pending process and update to Insurer later in the next reports. <br />

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
        <p style="text-align: justify;"><span><strong><span style="font-family: 'times new roman', times; font-size: large;"><strong>PHẠM VI TỔN THẤT (BCTT &amp; BCCC)</strong></span></strong></span></p>  <p style="text-align: justify;">&nbsp;</p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">NĐBH đ&atilde; đệ tr&igrave;nh khiếu nại cho vụ tổn thất n&agrave;y với tổng số tiền l&agrave;:&hellip;...............<br />- trong đ&oacute;, &hellip; (liệt k&ecirc; c&aacute;c hạng mục t&agrave;i sản / thiệt hại theo khiếu nại của NĐBH, hoặc cơ sở đưa ra khiếu nại của NĐBH).<br />Cho đến thời điểm n&agrave;y, kết quả gi&aacute;m định về phạm vi v&agrave; khối lượng thiệt hại trong vụ tổn thất n&agrave;y đ&atilde; được c&aacute;c b&ecirc;n thống nhất như sau: ...<br />&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;...........................................<br /><br /><strong><strong>DETAILS OF LOSS / DAMAGE EXTENT&nbsp;</strong></strong><br /><br />&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.....................................................</span></p>
        </asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtFR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">PHẠM VI TỔN THẤT (BCTT & BCCC) </span>
<p>
 <br />
NĐBH đã đệ trình khiếu nại cho vụ tổn thất này với tổng số tiền là:…<br />
 - trong đó, … (liệt kê các hạng mục tài sản / thiệt hại theo khiếu nại của NĐBH, hoặc cơ sở đưa ra khiếu nại của NĐBH).<br />
Cho đến thời điểm này, kết quả giám định về phạm vi và khối lượng thiệt hại trong vụ tổn thất này đã được các bên thống nhất như sau: ...<br />
……………………………………………………………………………………………<br /><br />
 <span style="font-size:20px;">DETAILS OF LOSS / DAMAGE EXTENT </span>
 <br /><br />
……………………………………………………………………………………………
</p></CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateFR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateFR_Click" /></td></tr>

</table>


