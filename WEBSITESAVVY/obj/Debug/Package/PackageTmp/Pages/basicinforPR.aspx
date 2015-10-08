<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basicinforPR.aspx.cs" Inherits="WEBSITESAVVY.Pages.basicinforPR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-family: "Times New Roman" , Times, serif;
            font-weight: bold;
            font-size: 16px;
            vertical-align: top;
            text-align: right;
            padding-right: 10px;
            width: 20%;
            height: 27px;
        }
        .style3
        {
            height: 27px;
        }
    </style>
     <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            forced_root_block: "",
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
            theme_advanced_resizing: "both",
            apply_source_formatting: false,
            template_external_list_url: "js/template_list.js",
            external_link_list_url: "js/link_list.js",
            external_image_list_url: "js/image_list.js",
            media_external_list_url: "js/media_list.js",
            encoding: "xml"
        });

   </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label1" runat="server" Text="Case name "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTenClaim" runat="server" CssClass="input" Enabled="False" 
                        Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label2" runat="server" Text="Previous report "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDateILA" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label3" runat="server" Text="Policy no. "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label4" runat="server" Text="Insured "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTenKhachHang" runat="server" CssClass="input" 
                        Enabled="False" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label5" runat="server" Text="Address "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDiachi" runat="server" CssClass="input" Enabled="False" 
                        Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label6" runat="server" Text="Trade "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTrade" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label7" runat="server" Text="Date of loss "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDOL" runat="server" CssClass="input" Width="25%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label8" runat="server" Text="Cause of loss "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCauseloss" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label9" runat="server" Text="Extent of loss "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtExtendofloss" runat="server" CssClass="input" Height="100px" 
                        TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label10" runat="server" Text="Type of policy "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTypepolicy" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label11" runat="server" Text="Sum insured "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSuminsured" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label12" runat="server" Text="Effective period "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtperiod" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label13" runat="server" Text="Deductible "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDeductible" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label14" runat="server" Text="Extension clause "></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtExtensionclaise" runat="server" CssClass="input" 
                        Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label15" runat="server" Text="Insured's claim "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtKhieuNai" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label16" runat="server" Text="Interim reserve "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtInterimreserve" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                &nbsp;<asp:Label ID="Label17" runat="server" Font-Italic="True" ForeColor="#999999" 
                        Text="(Enter Number, Example:2000000)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                        onclick="btnUpdate_Click" Text="Update" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
