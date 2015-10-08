<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LossHistory.ascx.cs" Inherits="WEBSITESAVVY.Uc.LossHistory" %>
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
<table width="100%"><tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    LOSS HISTORY</td></tr>
<tr><td>
    <span>
<asp:TextBox ID="txtLH" runat="server" CssClass="textbox" 
    TextMode="MultiLine" Enabled="True" Height="750px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><strong><span style="font-family: 'times new roman', times; font-size: large;">LOSS HISTORY / LỊCH SỬ TỔN THẤT </span></strong></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Trường hợp chưa c&oacute; lịch sử tổn thất: </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Theo khai b&aacute;o của NĐBH cũng như th&ocirc;ng tin m&agrave; GĐV Savvy thu thập được cho đến hiện tại, ch&uacute;ng t&ocirc;i được biết chưa c&oacute; bất kỳ tổn thất n&agrave;o tương tự vụ tổn thất n&agrave;y đ&atilde; xảy ra trước đ&oacute;. </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Trường hợp đ&atilde; c&oacute; lịch sử tổn thất: : </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- Thời gian, địa điểm, đối tượng tổn thất / loại h&igrave;nh tổn thất của từng vụ;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- Tổng gi&aacute; trị thiệt hại, số tiền &amp; thời gian được bồi thường, Nh&agrave; bảo hiểm n&agrave;o đ&atilde; bồi thường; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- C&aacute;c biện ph&aacute;p đ&atilde; thực hiện (nếu c&oacute;) để đề ph&ograve;ng / hạn chế (r&uacute;t kinh nghiệm) sau khi xảy ra c&aacute;c tổn thất trong qu&aacute; khứ; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">- C&aacute;c th&ocirc;ng tin li&ecirc;n quan cần thiết kh&aacute;c (nếu c&oacute;). </span></p>  <p style="text-align: justify;"><em><span style="font-family: 'times new roman', times; font-size: small;">*** Bi&ecirc;n bản ghi nhận th&ocirc;ng tin v&agrave; tường tr&igrave;nh của NĐBH về lịch sử tổn thất được đ&iacute;nh k&egrave;m tại Phụ lục A-1.3.2.</span></em></p>
</asp:TextBox>
            <%--<CKEditor:CKEditorControl ID="txtLH" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">LOSS HISTORY / LỊCH SỬ TỔN THẤT </span> <br /> <br />
 
 <span style="font-size:16px">Trường hợp chưa có lịch sử tổn thất:<br/><br />
khai báo của NĐBH cũng như thông tin mà GĐV Savvy thu thập được cho đến hiện tại, chúng tôi được biết chưa có 
bất kỳ tổn thất nào tương tự vụ tổn thất này đã xảy ra trước đó.<br /><br />

 Trường hợp đã có lịch sử tổn thất:<br/><br />

(Trình bày đầy đủ, chi tiết tất cả các vụ tổn thất đã xảy ra trong quá khứ bao gồm các nội dung sau):<br />
-	Thời gian, địa điểm, đối tượng tổn thất / loại hình tổn thất của từng vụ;<br />
-	Tổng giá trị thiệt hại, số tiền & thời gian được bồi thường, Nhà bảo hiểm nào đã bồi thường;<br />
-	Các biện pháp đã thực hiện (nếu có) để đề phòng / hạn chế (rút kinh nghiệm) sau khi xảy ra các tổn thất trong quá khứ;<br />
-	Các thông tin liên quan cần thiết khác (nếu có).</span><br />
<q style="font-style:italic"><br />
*** Biên bản ghi nhận thông tin và tường trình của NĐBH về lịch sử tổn thất được đính kèm tại Phụ lục A-1.3.2.
</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateLH" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateH_Click" /></td></tr>
</table>



