<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClaimAdjustment.ascx.cs" Inherits="WEBSITESAVVY.Uc.ClaimAdjustment" %>
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
<table width="100%" id="tblIR">
<tr><td style="font-size: 26px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #006600;">
    CLAIM ADJUSTMENT&nbsp;
    <asp:Label ID="lblIR" runat="server" Text="- IR"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="- FR"></asp:Label>
    </td></tr>
<tr><td>
    <span>
                <asp:TextBox ID="txtIR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="885px"  Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">CLAIM &amp; OUTLINE ADJUSTMENT / KHIẾU NẠI &amp; CẬP NHẬT T&Iacute;NH TO&Aacute;N</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">Nội dung &hellip; (Cập nhật t&iacute;nh to&aacute;n BCTT)&hellip;</span></p>
</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtIR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px"> 
 <span style="font-size:20px;">CLAIM &amp; OUTLINE ADJUSTMENT / KHIẾU NẠI &amp; CẬP NHẬT TÍNH TOÁN </span>
<p>
 <br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)… <br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)…<br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)…<br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)…<br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)…<br />
Nội dung … (Cập nhật tính toán BCTT)… Nội dung … (Cập nhật tính toán BCTT)…<br />
</p>
</CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateIR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateIR_Click" /></td></tr>

<tr><td>
    <span>
                <asp:TextBox ID="txtFR" runat="server" CssClass="textbox" 
                    TextMode="MultiLine" Enabled="True" Height="885px" Font-Names="Times New Roman" Rows="40" Font-Size="14pt"
        Width="789px"><p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">CLAIM &amp; PROPOSED ADJUSTMENT / KHIẾU NẠI &amp; T&Iacute;NH TO&Aacute;N </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">1. Khiếu nại của NĐBH: &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;</span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> 2. T&iacute;nh to&aacute;n gi&aacute; trị thiệt hại hợp l&yacute;: &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> 3. Điều chỉnh khấu hao (nếu c&oacute;): &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;"> 4. Xem x&eacute;t số tiền bảo hiểm: </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">4-1. Kiểm tra số tiền bảo hiểm chi tiết (nếu c&oacute;) theo từng hạng mục tổn thất: &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; </span></p>  <p style="text-align: justify;"><span style="font-family: 'times new roman', times; font-size: large;">4-2. T&iacute;nh to&aacute;n tỉ lệ / bảo hiểm dưới gi&aacute; trị (nếu c&oacute;): &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;</span></p>

</asp:TextBox>
<%--<CKEditor:CKEditorControl ID="txtFR" runat="server" 
                BasePath="~/ckeditor" Width="750px" Height="500px">
 <span style="font-size:20px;">CLAIM &amp; PROPOSED ADJUSTMENT / KHIẾU NẠI &amp; TÍNH TOÁN</span>
<%--<p>
 <br />
1. Khiếu nại của NĐBH: <br />
…………………………… <br />

2. Tính toán giá trị thiệt hại hợp lý: <br />
…………………………… <br />

3. Điều chỉnh khấu hao (nếu có): <br />
…………………………… <br />

4. Xem xét số tiền bảo hiểm: <br />
4-1. Kiểm tra số tiền bảo hiểm chi tiết (nếu có) theo từng hạng mục tổn thất: <br />
…………………………… <br />

4-2. Tính toán tỉ lệ / bảo hiểm dưới giá trị (nếu có): <br />
…………………………… <br />
</p>--  <br />
1. Khiếu nại của NĐBH:<br /><br />
……………………………<br /><br />

2. Tính toán giá trị thiệt hại hợp lý:<br /><br />
……………………………<br /><br />

3. Điều chỉnh khấu hao (nếu có):<br /><br />
……………………………<br /><br />

4. Xem xét số tiền bảo hiểm:<br /><br />
4-1. Kiểm tra số tiền bảo hiểm chi tiết (nếu có) theo từng hạng mục tổn thất:<br /><br />
……………………………<br /><br />

4-2. Tính toán tỉ lệ / bảo hiểm dưới giá trị (nếu có):<br /><br />
……………………………<br /><br />

            
            </CKEditor:CKEditorControl>--%>
            </span>

</td></tr>
<tr><td align="center"><asp:Button ID="btnUpdateFR" runat="server" CssClass="btn" Text="Update" 
        onclick="btnUpdateFR_Click" /></td></tr>

</table>



