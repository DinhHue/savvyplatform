<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicFR.aspx.cs" Inherits="WEBSITESAVVY.Pages.BasicFR" %>

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
   <script type="text/javascript">
       function closeWin() {
           Window.close();   // Closes the new window
       }
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
                    <asp:TextBox ID="txtDateFR" runat="server" CssClass="input" Width="80%" 
                        TextMode="MultiLine" Height="100px"></asp:TextBox>
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
                    <asp:Label ID="Label16" runat="server" Text="Accept loss amount"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTonThatHopLy" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label11" runat="server" Text="Coverablle amount"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtThuocPhamViBH" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label12" runat="server" Text="Less savalge"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTruGiaTriThuHoi" runat="server" CssClass="input" 
                        Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label18" runat="server" Text="Interim payment"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTamUngBT" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    <asp:Label ID="Label13" runat="server" Text="Less deductible "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTruMucMienThuong" runat="server" CssClass="input" 
                        Width="50%"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td class="leftpop">
                    <asp:Label ID="Label10" runat="server" Text="Proposed settlement"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDeXuatBoiThuong" runat="server" CssClass="input" 
                        Width="50%"></asp:TextBox>
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
