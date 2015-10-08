<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CoverInfomation.ascx.cs" Inherits="WEBSITESAVVY.Uc.CoverInfomation" %>
<link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
       .textbox:active
    {
        background-color: #BCC7E2;
        font-size: 16px;
    }
      .textbox:selected
    {
        background-color: #BCC7E2;
        font-size: 16px;
    }
      .textbox:focus
    {
        background-color: #BCC7E2;
        font-size: 16px;
    }
        </style>
    <table width="100%" 
    style="font-family: 'Times New Roman', Times, serif; font-size: 14px" >
        <%--  <tr>
        <td 
            
            
            style="font-size: 22px; font-weight: bold; vertical-align: top; text-align: center; padding-left: 5px; font-family: 'Times New Roman', Times, serif; color: #003300;" 
            colspan="4">
            COVER INFORMATION</td>
    </tr>--%>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label41" runat="server" Text="PREVIOUS REPORT"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtBaoCaoTruoc" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="100%" Rows="3" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label1" runat="server" Text="POLICY NO."></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtHDBH" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label2" runat="server" Text="INSURED"></asp:Label>
            <br />
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtTenInsured" runat="server" CssClass="textbox" Width="100%" 
                Font-Names="Times New Roman" Font-Size="14pt"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="100%" Rows="2" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label4" runat="server" Text="TRADE"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
            :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtLinhVucKinhDoanh" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="100%" Rows="2" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label5" runat="server" Text="LOCATION OF LOSS"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
            :</td>
        <td class="Colrightclaim" colspan="2" 
            
            style="vertical-align: top; text-align: left; font-size: 14px; margin-left: 40px;">
            <asp:TextBox ID="txtDiaDiemTonThat" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="100%" Rows="2" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label6" runat="server" Text="DATE OF LOSS"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
            :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtNgayTonThat" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label7" runat="server" Text="CAUSE OF LOSS"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtNguyenNhan" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="90%" Rows="2" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label8" runat="server" Text="EXTENT OF LOSS"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            
            style="vertical-align: top; text-align: left; font-size: 14px; margin-left: 40px;">
            <asp:TextBox ID="txtPhamViTT" runat="server" CssClass="textbox" 
                                    TextMode="MultiLine" Width="100%" Rows="8" 
                Font-Names="Times New Roman" Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td rowspan="4" 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label9" runat="server" Text="TYPE OF POLICY &amp;"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text=" COVERAGE"></asp:Label>
        </td>
        <td rowspan="4" 
            style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td 
            
            
            
            style="font-weight: bold; text-decoration: underline; vertical-align: top; text-align: left; " 
            colspan="2" >
            <asp:TextBox ID="txtTypePolicy" runat="server" CssClass="textbox" Width="400px" Font-Bold="True" 
                                    Font-Names="Times New Roman" Font-Size="16px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-weight: bold; text-decoration: underline; vertical-align: top; text-align: left; width: 160px;" >
                                1. Total Sum Insured:</td>
        <td class="Colrightclaimsubright" 
            style="vertical-align: top; text-align: left; font-size: 14px;" >
            <asp:TextBox ID="txtSumInsured" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-weight: bold; text-decoration: underline; vertical-align: top; text-align: left; width: 160px;" >
                                2. Insurance Period: 
        </td>
        <td class="Colrightclaimsubright" 
            style="vertical-align: top; text-align: left; font-size: 14px;" >
            <asp:TextBox ID="txtThoiHanBH" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-weight: bold; text-decoration: underline; vertical-align: top; text-align: left; width: 160px;" >
                                3. Applicable Deductible :</td>
        <td class="Colrightclaimsubright" 
            style="vertical-align: top; text-align: left; font-size: 14px;" >
            <asp:TextBox ID="txtMucMienThuong" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label11" runat="server" Text="EXTENSION CLAUSE"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtDieuKhoanBoSung" runat="server" CssClass="textbox" 
                TextMode="MultiLine" Width="100%" Rows="5" Font-Names="Times New Roman" 
                Font-Size="14pt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label12" runat="server" Text="INSURED’S CLAIM"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtKhieuNaiNDBH" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label13" runat="server" Text="RESERVE FOR INSURERS"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                  :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtDuPhongBoiThuong" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label14" runat="server" Text="PROPOSED ADJUSTMENT"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                 :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtTinhToanDieuChinh" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label15" runat="server" Text="DEDUCTIBLE"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtTruMucMienThuong" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td 
            
            
            style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
            <asp:Label ID="Label16" runat="server" Text="PROPOSED SETTLEMENT"></asp:Label>
        </td>
        <td style="font-weight: bold; vertical-align: top; text-align: left;">
                                :</td>
        <td class="Colrightclaim" colspan="2" 
            style="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:TextBox ID="txtDeXuatBoiThuong" runat="server" CssClass="textbox"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="200px">
                                &nbsp;</td>
        <td class="Colcenterclaim">
                                &nbsp;</td>
        <td class="Colrightclaim" colspan="2">
                                &nbsp;</td>
    </tr>
    <tr>
        <td style="font-size: 14px; font-weight: bold; vertical-align: top; text-align: left; padding-left: 5px" 
            width="200px">
                                &nbsp;</td>
        <td class="Colcenterclaim" 
            style="font-weight: bold; vertical-align: top; text-align: left;">
                                &nbsp;</td>
        <td class="Colrightclaim" colspan="2" 
            scope="vertical-align: top; text-align: left; font-size: 14px;">
            <asp:Button ID="btnUpdate" runat="server" CssClass="btnThem" Text="Update" 
                onclick="btnUpdate_Click" />
        </td>
    </tr>
</table>

