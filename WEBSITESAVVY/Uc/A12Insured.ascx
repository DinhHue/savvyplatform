<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="A12Insured.ascx.cs" Inherits="WEBSITESAVVY.Uc.A12Insured" %>
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
    INSURED</td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtGioiThieu" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True"  
        Width="650px" Font-Names="Times New Roman"  Font-Size="14pt" Rows="40">
        <p style="text-align: justify;"><span><span style="font-family: 'times new roman', times; font-size: large;"><strong><span style="font-size: large;">NGƯỜI ĐƯỢC BẢO HIỂM</span></strong></span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-size: large;">Ghi r&otilde; t&ecirc;n Cty của NĐBH / tiền th&acirc;n / thời gian th&agrave;nh lập từ năm n&agrave;o, hoạt động trong lĩnh vực g&igrave; v&agrave; vốn ban đầu / hiện tại l&agrave; bao nhi&ecirc;u&hellip; M&ocirc; tả khu&ocirc;n vi&ecirc;n nh&agrave; xưởng / địa điểm rủi ro:</span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-size: large;"> - Diện t&iacute;ch khu vực / x&acirc;y dựng; </span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-size: large;">- Bố tr&iacute; mặt bằng: c&aacute;c d&acirc;y chuyền / nh&agrave; xưởng / nh&agrave; kho&hellip; M&ocirc; tả hoạt động: - Giờ / ca l&agrave;m việc; </span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-size: large;">- Số c&ocirc;ng nh&acirc;n / nh&acirc;n vi&ecirc;n b&igrave;nh qu&acirc;n;</span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-size: large;"> - Sản lượng b&igrave;nh qu&acirc;n th&aacute;ng / năm;</span></span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"><span><strong><span style="font-size: large;">INSURED</span></strong></span></span></p>  <p style="text-align: justify;"><span style="font-size: large;"><span style="font-family: 'times new roman', times; font-size: x-large;">The Insured</span><span style="font-family: 'times new roman', times; font-size: large;"><span style="font-family: 'times new roman', times; font-size: x-large;">,</span><span style="font-family: 'times new roman', times; font-size: x-large;">&nbsp;</span>original &amp; current registered capital / time since establishment &amp; field of business / trade. The principal of the company is&nbsp;. The loss address is located&hellip; in its own grounds / a terrace of buildings of similar / varying construction. The building is a detached / adjoining&hellip;&nbsp;story(es) structure, which dates from&hellip; . It is constructed of timber frame and clad / timber frame and metal clad / brick and block work / a reinforced concrete frame with glass infill panels and a concrete roof, off a concrete floor slab. Internally the building is (or not) partitioned by reinforced concrete load bearing walls / timber frame and plasterboard / block work / brickwork&hellip; construction with(out*) plaster rendering. Currently,</span></span></p>
        </asp:TextBox>
      <%--  <CKEditor:CKEditorControl ID="txtGioiThieu" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> <span style="font-size:20px;">NGƯỜI ĐƯỢC BẢO HIỂM </span>
<p>
 <br />
Ghi rõ tên Cty của NĐBH / tiền thân / thời gian thành lập từ năm nào, hoạt động trong lĩnh vực gì và vốn ban đầu / hiện tại là bao nhiêu…
Mô tả khuôn viên nhà xưởng / địa điểm rủi ro: - Diện tích khu vực / xây dựng; - Bố trí mặt bằng: các dây chuyền / nhà xưởng / nhà kho…
Mô tả hoạt động: - Giờ / ca làm việc; - Số công nhân / nhân viên bình quân; - Sản lượng bình quân tháng / năm;
</p>
<span style="font-size:20px;">
 <br />
INSURED
</span>
 <br />
 <p>
The Insured, &lt;Insured&#39;s Company Name&gt; original &amp; current registered capital / time since establishment &amp; field of business / trade. The principal of the company is &lt;insert owners name&gt;.
The loss address is located… in its own grounds / a terrace of buildings of similar / varying construction. The building is a detached / adjoining… &lt;number&gt; story(es) structure, which dates from… . It is constructed of timber frame and clad / timber frame and metal clad / brick and block work / a reinforced concrete frame with glass infill panels and a concrete roof, off a concrete floor slab.
Internally the building is (or not) partitioned by reinforced concrete load bearing walls / timber frame and plasterboard / block work / brickwork… construction with(out*) plaster rendering.
Currently, &lt;insert Insured&#39;s name&gt; retain approximately… employees in the fields of &lt;insert main jobs e.g. sales, administration, manufacturing&gt;… Normal trading hours are from… until… and… days per week.
The Insured have traded from this address for some… years.
 </p></CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateGioiThieu" runat="server" CssClass="btn" 
        Text="Update" onclick="btnUpdateGioiThieu_Click" /></td></tr>
</table>
