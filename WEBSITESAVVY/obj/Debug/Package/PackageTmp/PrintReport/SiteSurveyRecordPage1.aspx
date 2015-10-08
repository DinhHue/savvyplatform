<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteSurveyRecordPage1.aspx.cs" Inherits="WEBSITESAVVY.PrintReport.SiteSurveyRecordPage1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SiteSurveyRecordPage1</title>
     <script type="text/javascript">
         function print() {
             var prtContent = document.getElementById('<%= Panel1.ClientID %>');
             prtContent.border = 0; //set no border here
             var WinPrint = window.open('', '', 'letf=100,top=100,width=900,height=500,toolbar=0,scrollbars=1,status=0,resizable=1');
             WinPrint.document.write(prtContent.outerHTML);

             WinPrint.document.close();
             WinPrint.focus();
             WinPrint.print();
             WinPrint.close();
         }
      </script>
    <style type="text/css">

        .rightsitesurvey
        {
            width: 15%;   
            padding-left: 2%;
            padding-right: 5px;
            text-align: left;
            vertical-align: top;
        }
               
        .title
        {
            background-color: #E4E4E4;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        } 
         .colchuky
        {
            width:15%;
            text-align:center;
            vertical-align:top;
        }
        .style1
        {
            text-decoration: underline;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server">
        <table align="center" style="font-family: 'Times New Roman', Times, serif; font-size: 10px; vertical-align: top; text-align: justify; width: 17.5cm;">
            <tr>
                <td colspan="4">
                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/images/Savvy LetterHead (Cover).jpg" Height="2.5cm" 
                        Width="15.7cm" CssClass="style10" />
                    </td>
            </tr>
            <tr>
                <td colspan="4" height="40px" 
                    
                    
                    style="text-align: right; vertical-align: bottom; padding-right: 10%; color: #006600; font-size: 12px;">
                    &nbsp;<asp:Label ID="Label79" runat="server" Text="Ngày "></asp:Label>
&nbsp;
                    <asp:Label ID="lblNgayThucHien" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" 
                    style="text-align: center; font-size: 18px; color: #006600;">
                    <asp:Label ID="Label1" runat="server" Text="BIÊN BẢN GIÁM ĐỊNH HIỆN TRƯỜNG" 
                        Font-Bold="True"></asp:Label>
                    <br />
                    <strong>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
                        Text="SITE SURVEY RECORD"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 30%; padding-right: 1%; background-color: #FFFFFF; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label3" runat="server" Text="Tham chiếu Hồ sơ Giám định"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Claim File's Reference Number" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td style="text-align: left; width: 30%; color: #006600;">
                    <asp:Label ID="lblThamChieu" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label5" runat="server" Text="Giám định viên"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Surveyor" Font-Italic="True"></asp:Label>
                </td>
                <td style="text-align: left; width: 20%; vertical-align: top; color: #006600;">
                    <asp:Label ID="lblGDV" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            </table>
              <table align="center"
            style="font-family: 'Times New Roman', Times, serif; font-size: 11px; vertical-align: top; text-align: justify; width: 17.5cm;">
            <tr>
                <td colspan="1" 
                    
                    style="background-color: #F4F4F4; text-align: right; vertical-align: top; padding-right: 1%; width: 15%;">
                    <strong style="text-align: right; padding-right: 2%; width: 15%">
                    <asp:Label ID="Label7" runat="server" Text="Nhà bảo hiểm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Insurer" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" 
                    style="color: #000099;">
                    <strong>
                    <asp:Label ID="lblInsurer" runat="server"></asp:Label>
                    </strong>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; background-color: #F4F4F4; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label9" runat="server" Text="Số HĐBH"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Policy No." Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblSoHDBH" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;" 
                    colspan="1">
                    <strong>
                    <asp:Label ID="Label21" runat="server" Text="Đơn vị"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label22" runat="server" Text="Subsidiary" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" 
                    style="color: #000099;">
                    <strong>
                    <asp:Label ID="lblSubsidiary" runat="server"></asp:Label>
                    </strong>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; background-color: #F4F4F4; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label13" runat="server" Text="Hiệu lực"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Effective" Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblEffective" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;" 
                    colspan="1">
                    <strong>
                    <asp:Label ID="Label11" runat="server" Text="Người được BH"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Insured" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" 
                    style="color: #000099;">
                    <strong>
                    <asp:Label ID="lblInsured" runat="server"></asp:Label>
                    </strong>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; background-color: #F4F4F4; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label17" runat="server" Text="Số Fax"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label18" runat="server" Text="Fax No." Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="1" 
                    
                    style="background-color: #F4F4F4; text-align: right; vertical-align: top; padding-right: 1%; width: 15%;">
                    <strong>
                    <asp:Label ID="Label15" runat="server" Text="Địa chỉ"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="Address" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" 
                    style="color: #000099;">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;" 
                    colspan="1">
                    <strong>
                    <asp:Label ID="Label19" runat="server" Text="Người liên hệ"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label20" runat="server" Text="Contact Person" Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblContectPerson" runat="server"></asp:Label>
                </td>
                <td style="text-align: right; width: 15%; vertical-align: top;">
                    <strong style="text-align: right; width: 15%; vertical-align: top;">
                    <asp:Label ID="Label23" runat="server" Text="Số điện thoại"></asp:Label>
                    </strong>&nbsp;
                    <br />
                    <asp:Label ID="Label24" runat="server" Text="Phone No." Font-Italic="True"></asp:Label>
                    &nbsp;
                </td>
                <td style="text-align: left; width: 15%; vertical-align: top;">
                    <asp:Label ID="lblPhone" runat="server" ForeColor="#000099"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; background-color: #F4F4F4; vertical-align: top;">
                    <strong>
                    <asp:Label ID="Label25" runat="server" Text="Thư điện tử"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label26" runat="server" Text="Email" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey" style="color: #000099">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="6" class="title" 
                    style="background-color: #E5E5E5; text-align: center; font-size: 16px">
                    <asp:Label ID="Label27" runat="server" Text="THÔNG TIN SƠ BỘ VỀ TỔN THẤT"></asp:Label>
                    <br />
                    <asp:Label ID="Label28" runat="server" Text="INTIAL INFOMATION OF LOSS" 
                        Font-Bold="False" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label29" runat="server" Text="Địa điểm tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label30" runat="server" Text="Premises" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" style="color: #000099;">
                    <asp:Label ID="lblPremises" runat="server"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; vertical-align: top; background-color: #F4F4F4;">
                    <strong>
                    <asp:Label ID="Label31" runat="server" Text="Ngày tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label32" runat="server" Text="Date of loss" Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblDateofloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label33" runat="server" Text="Loại hình tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label34" runat="server" Text="Type Of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" style="color: #000099;">
                    <asp:Label ID="lblTypeofloss" runat="server"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; vertical-align: top; background-color: #F4F4F4;">
                    <strong>
                    <asp:Label ID="Label35" runat="server" Text="Ghi chu"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label36" runat="server" Text="Note Others" Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblNoteOthers" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label37" runat="server" Text="Diễn biến tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label38" runat="server" Text="Circumstances" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" 
                    style="color: #000099; vertical-align: top;" height="5cm">
                    <asp:Label ID="lblCircumstances" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label39" runat="server" Text="Thông báo CQCN"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label40" runat="server" 
                        Text="Report to the Local Authority (Police) ?" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" style="color: #000099;">
                    <asp:Label ID="lblTBCQCN" runat="server"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; vertical-align: top; background-color: #F4F4F4;">
                    <strong>
                    <asp:Label ID="Label41" runat="server" Text="Ghi chú thêm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label42" runat="server" Text="Further notes" Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblFurtherNotes" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label43" runat="server" Text="Phạm vi tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label44" runat="server" Text="Extent of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" 
                    style="color: #000099;">
                    <asp:Label ID="lblExtentOfloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 1%; background-color: #F4F4F4; vertical-align: top; width: 15%;">
                    <strong>
                    <asp:Label ID="Label45" runat="server" Text="Dự phòng tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label46" runat="server" Text="Initial Reserve" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td colspan="3" style="color: #006600;">
                    <asp:Label ID="lblInitialReserve" runat="server"></asp:Label>
                </td>
                <td style="text-align: right; padding-right: 1%; width: 15%; vertical-align: top; background-color: #F4F4F4;">
                    <strong>
                    <asp:Label ID="Label47" runat="server" Text="Phụ lục đính kèm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label48" runat="server" Text="Appendix Attached" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td style="color: #000099;">
                    <asp:Label ID="lblAppendixAttached" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="6" height="4cm">
                    &nbsp;</td>
            </tr>
                  <tr>
                      <td colspan="4" align="left" 
                          
                          style="border-style: inherit; border-width: medium; padding: 10px; background-color: #D7E3BD; font-size: 12px; font-family: 'Times New Roman', Times, serif;">
                          <span class="style1"><strong>VPGD</strong></span>:&nbsp;&nbsp;&nbsp; 7th Floor -&nbsp; PDD Building, 
                          162 Pasteur St., District 1, HCM City<br /> <span class="style1"><strong>Website</strong></span>:&nbsp;&nbsp;
                          <a href="http://www.savvyadjusters.com.vn">http://www.savvyadjusters.com.vn</a></td>
                      <td align="left" colspan="2" 
                          
                          style="border-style: inherit; border-width: medium; padding: 10px; background-color: #D7E3BD; font-size: 12px; font-family: 'Times New Roman', Times, serif;">
                          <span class="style1"><strong>Fax</strong></span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (08) 3823 9634<br />
                          <span class="style1"><strong>Mobile</strong></span>:&nbsp;&nbsp;&nbsp; 0907 229686</td>
                  </tr>
            </table>
         </asp:Panel>
    </div>
    <div align="center">
        <asp:Button ID="btnIn" runat="server" Text="Print" onclientclick="print()" 
              />    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnXemDS" runat="server" Text="Back Home Page" onclick="btnXemDS_Click" />
    </div>
    </form>
</body>
</html>
