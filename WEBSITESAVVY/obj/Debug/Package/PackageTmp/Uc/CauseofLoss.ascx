<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CauseofLoss.ascx.cs" Inherits="WEBSITESAVVY.Uc.CauseofLoss" %>
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
<table width="100%" id="tblIR"><tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    CAUSE OF LOSS&nbsp;
    <asp:Label ID="lblIR" runat="server" Text="- IR"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="- FR"></asp:Label>
    </td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtIR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="885px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px">
        <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">NGUY&Ecirc;N NH&Acirc;N TỔN THẤT (BCSB)</span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> (Dẫn nhập phần đ&aacute;nh gi&aacute; nguy&ecirc;n nh&acirc;n của Savvy:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Dựa tr&ecirc;n kh&aacute;m nghiệm hiện trường;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Dựa tr&ecirc;n tường tr&igrave;nh / khai b&aacute;o của NĐBH;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> - Dựa tr&ecirc;n #&hellip;)</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> (Triển khai c&aacute;c hướng ph&acirc;n t&iacute;ch để đi đến kết luận (hoặc nhận định) về c&aacute;c khả năng x&aacute;c định nguy&ecirc;n nh&acirc;n tổn thất của Savvy) Với nhận định v&agrave; ph&acirc;n t&iacute;ch sơ bộ của gi&aacute;m định vi&ecirc;n tại thời điểm n&agrave;y, (&hellip;). </span></p>  <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;"> CAUSE OF LOSS</span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Case 01 (fire): </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">The precise cause of (fire) is currently the subject of further investigation and we shall report further in due course. A number of possible causes are being considered as follows:- Due to the serious nature of damage, it is unlikely that the precise cause can be established.  However, a number of possible causes exist as follows:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- &hellip;&hellip;&hellip;&hellip; Following completion of our site inspection and discussions with the Experts / Fire Police Officers / Forensic, we can confirm that this loss was caused by: an electrical fault occurring in the&hellip; /carelessly discarded smoking materials /the actions of as yet unidentified persons who started the blaze deliberately by pouring accelerants around the premises and setting light to them&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Case 02 (MB):</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Based on our site survey records and other information obtained from Insured&rsquo;s representative which relate to the incident, the cause of loss could be identified under our opinion as follows:&hellip;&hellip;&hellip;&hellip; Accordingly, in combination with: the Insured&rsquo;s statement, the mechanism of damage incident as well as our observation of the damage situation of&hellip;, we are of opinion that the&hellip; (subject of loss / damaged items) was damaged as a result of&hellip; and due to&hellip;.   s d asdasd</span></p>
        </asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtIR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">NGUYÊN NHÂN TỔN THẤT (BCSB) </span>
<p>
 <br />
(Dẫn nhập phần đánh giá nguyên nhân của Savvy:
- Dựa trên khám nghiệm hiện trường; - Dựa trên tường trình / khai báo của NĐBH; - Dựa trên #…)<br />
(Triển khai các hướng phân tích để đi đến kết luận (hoặc nhận định) về các khả năng xác định nguyên nhân tổn thất của Savvy)<br />
Với nhận định và phân tích sơ bộ của giám định viên tại thời điểm này, <…>.
</p>
<span style="font-size:20px;">
 <br />
CAUSE OF LOSS
</span>
 <br />
 <p>
Case 01 (fire):</p> <br /><q>
The precise cause of &lt;fire&gt; is currently the subject of further investigation and we shall report further in due course. A number of possible causes are being considered as follows:-
Due to the serious nature of damage, it is unlikely that the precise cause can be established.  However, a number of possible causes exist as follows:-<br />
…………<br />
Following completion of our site inspection and discussions with the Experts / Fire Police Officers / Forensic, we can confirm that this loss was caused by: an electrical fault occurring in the… /carelessly discarded smoking materials /the actions of as yet unidentified persons who started the blaze deliberately by pouring accelerants around the premises and setting light to them…
<br /></q>
<q>
Case 02 (MB):</q><br/>
<p>
Based on our site survey records and other information obtained from Insured’s representative which relate to the incident, the cause of loss could be identified under our opinion as follows:<br />
…………<br />
Accordingly, in combination with: the Insured’s statement, the mechanism of damage incident as well as our observation of the damage situation of…, we are of opinion that the… (subject of loss / damaged items) was damaged as a result of… and due to….
</p></CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateIR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateIR_Click" /></td></tr>

<tr><td>
    <span>
                <asp:TextBox ID="txtFR" runat="server" CssClass="textbox"
                    TextMode="MultiLine" Enabled="True" Height="885px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">NGUY&Ecirc;N NH&Acirc;N TỔN THẤT (BCCC) </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Như đ&atilde; n&ecirc;u trong B&aacute;o c&aacute;o sơ bộ /B&aacute;o c&aacute;o trước, ng&agrave;y&hellip;, vụ tổn thất được x&aacute;c định l&agrave; do&hellip; (ghi loại h&igrave;nh tổn thất). V&agrave; đến thời điểm n&agrave;y th&igrave; cơ quan điều tra / C&ocirc;ng an đ&atilde; (hoặc vẫn chưa) đưa ra kết luận về nguy&ecirc;n nh&acirc;n g&acirc;y ra&hellip; Cụ thể:&hellip; Nhắc lại vắn tắt ph&acirc;n t&iacute;ch để đi đến kết luận (hoặc nhận định của Savvy) về c&aacute;c khả năng dẫn đến nguy&ecirc;n nh&acirc;n cơ bản đ&atilde; g&acirc;y ra tổn thất&hellip; X&eacute;t bản chất vụ việc v&agrave; theo đ&aacute;nh gi&aacute; kh&aacute;ch quan của gi&aacute;m định vi&ecirc;n như đ&atilde; n&ecirc;u tr&ecirc;n, &hellip; (kết luận của Savvy về nguy&ecirc;n nh&acirc;n tổn thất đang xem x&eacute;t). </span></p>  <p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;"> CAUSE OF LOSS (FINAL REPORT)</span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Case 01 (fire):</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> The precise cause of (fire) is currently the subject of further investigation and we shall report further in due course. A number of possible causes are being considered as follows:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- Due to the serious nature of damage, it is unlikely that the precise cause can be established.  However, a number of possible causes exist as follows:</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- &hellip;&hellip;&hellip;&hellip; Following completion of our site inspection and discussions with the Experts / Fire Police Officers / Forensic, we can confirm that this loss was caused by: an electrical fault occurring in the&hellip; /carelessly discarded smoking materials /the actions of as yet unidentified persons who started the blaze deliberately by pouring accelerants around the premises and setting light to them&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Case 02 (MB): </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Based on our site survey records and other information obtained from Insured&rsquo;s representative which relate to the incident, the cause of loss could be identified under our opinion as follows: &hellip;&hellip;&hellip;&hellip; Accordingly, in combination with: the Insured&rsquo;s statement, the mechanism of damage incident as well as our observation of the damage situation of&hellip;, we are of opinion that the&hellip; (subject of loss / damaged items) was damaged as a result of&hellip; and due to&hellip;.  a sd as d as da ssdf e w  twt</span></p>
        </asp:TextBox>
            

        <%--  <CKEditor:CKEditorControl ID="txtFR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">NGUYÊN NHÂN TỔN THẤT (BCCC) </span>
<p>
 <br />
Như đã nêu trong Báo cáo sơ bộ /Báo cáo trước, ngày…, vụ tổn thất được xác định là do… (ghi loại hình tổn thất). Và đến thời điểm này thì cơ quan điều tra / Công an đã (hoặc vẫn chưa) đưa ra kết luận về nguyên nhân gây ra… Cụ thể:…<br />
Nhắc lại vắn tắt phân tích để đi đến kết luận (hoặc nhận định của Savvy) về các khả năng dẫn đến nguyên nhân cơ bản đã gây ra tổn thất…<br />
Xét bản chất vụ việc và theo đánh giá khách quan của giám định viên như đã nêu trên, … &lt;kết luận của Savvy về nguyên nhân tổn thất đang xem xét&gt;. 
</p>
<span style="font-size:20px;">
 <br />
CAUSE OF LOSS (FINAL REPORT)
</span>
 <br />
 <p>
Case 01 (fire): <br />
The precise cause of (fire) is currently the subject of further investigation and we shall report further in due course. A number of possible causes are being considered as follows:-
Due to the serious nature of damage, it is unlikely that the precise cause can be established.  However, a number of possible causes exist as follows:-<br />
…………<br />
Following completion of our site inspection and discussions with the Experts / Fire Police Officers / Forensic, we can confirm that this loss was caused by: an electrical fault occurring in the… /carelessly discarded smoking materials /the actions of as yet unidentified persons who started the blaze deliberately by pouring accelerants around the premises and setting light to them…<br />
</p>
<p>Case 02 (MB):</p><br />
<q>
Based on our site survey records and other information obtained from Insured’s representative which relate to the incident, the cause of loss could be identified under our opinion as follows:<br />
…………<br />
Accordingly, in combination with: the Insured’s statement, the mechanism of damage incident as well as our observation of the damage situation of…, we are of opinion that the… (subject of loss / damaged items) was damaged as a result of… and due to….
</p></CKEditor:CKEditorControl>--%>
</span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateFR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateFR_Click" /></td></tr>

</table>

