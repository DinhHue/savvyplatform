<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSiteSurveyRecord.aspx.cs" Inherits="WEBSITESAVVY.Pages.ViewSiteSurverRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .tbsitesurvey
        {
            width: 100%;
            text-align:center;
            vertical-align:top;
            font-family:Times New Roman;
            font-size:16px;
        }
        .header
        {
            width:100%;
            height:130px;
            background-image: url('../images/header.jpg'); 
            background-repeat: no-repeat;
            text-align:center;
            background-position: center center
        }
       
        .title
        {
            background-color: #E4E4E4;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        } 
        lable.labletiteleeng
        {
            font-style: italic;
            font-weight: normal;
        }
        .leftsitesurvey
        {
            width: 10%;            
            padding-right: 5px;
            text-align: right;
            vertical-align: top;
        }
        .rightsitesurvey
        {
            width: 15%;   
            padding-right: 5px;
            padding-left:5px;
            text-align: left;
            vertical-align: top;
        }
        .thamchieusitesurvey
        {
            width:13%;
            padding-left:2%;
            padding-right:5%;
            text-align:right;
        }
        .contentsitesurvey
        {
            padding-left: 2%;
            text-align: left;
            vertical-align: top;
            width: 30%;
        }
        .onecolumnsitesurvey
        {
            text-align: left;
            vertical-align: top;
            padding-left: 2%;
        }
        .colthamchieu
        {
            padding-left: 2%;
            text-align: left;
            vertical-align: top;
        }
        .colNgayThucHienSiteSurvey
        {
            padding-right:10%;   
            text-align:right; 
        }
        .style1
        {
            width: 10%;
            padding-right: 5px;
            text-align: right;
            vertical-align: top;
            height: 42px;
        }
        .style2
        {
            padding-left: 2%;
            text-align: left;
            vertical-align: top;
            width: 30%;
            height: 42px;
        }
        .style3
        {
            width: 15%;
            padding-right: 5px;
            padding-left: 5px;
            text-align: left;
            vertical-align: top;
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="tbsitesurvey">
            <tr>
                <td colspan="8"class="header">
                    </td>
            </tr>
            <tr>
                <td colspan="8" class="colNgayThucHienSiteSurvey">
                    &nbsp;<asp:Label ID="Label79" runat="server" Text="Ngày "></asp:Label>
&nbsp;
                    <asp:Label ID="lblNgayThucHien" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="title">
                    <asp:Label ID="Label1" runat="server" Text="BIÊN BẢN GIÁM ĐỊNH HIỆN TRƯỜNG"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="SITE SURVEY RECORD" 
                        Font-Bold="False" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="thamchieusitesurvey">
                    <asp:Label ID="Label3" runat="server" Text="Tham chiếu Hồ sơ Giám định"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Claim File's Reference Number" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td class="colthamchieu">
                    <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label5" runat="server" Text="Giám định viên"></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Surveyor" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblGDV" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="style1">
                    <asp:Label ID="Label7" runat="server" Text="Nhà bảo hiểm"></asp:Label>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Insurer" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="style2">
                    <asp:Label ID="lblInsurer" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="style1">
                    <asp:Label ID="Label9" runat="server" Text="Số HĐBH"></asp:Label>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Policy No." Font-Italic="True"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Label ID="lblSoHDBH" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label21" runat="server" Text="Đơn vị"></asp:Label>
                    <br />
                    <asp:Label ID="Label22" runat="server" Text="Subsidiary" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblSubsidiary" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label13" runat="server" Text="Hiệu lực"></asp:Label>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Effective" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblEffective" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label11" runat="server" Text="Người được BH"></asp:Label>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Insured" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblInsured" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label17" runat="server" Text="Số Fax"></asp:Label>
                    <br />
                    <asp:Label ID="Label18" runat="server" Text="Fax No." Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label15" runat="server" Text="Địa chỉ"></asp:Label>
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="Address" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" class="onecolumnsitesurvey">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label19" runat="server" Text="Người liên hệ"></asp:Label>
                    <br />
                    <asp:Label ID="Label20" runat="server" Text="Contact Person" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblContectPerson" runat="server"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="Label23" runat="server" Text="Số điện thoại"></asp:Label>
                    &nbsp;
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="Label24" runat="server" Text="Phone No." Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label25" runat="server" Text="Thư điện tử"></asp:Label>
                    <br />
                    <asp:Label ID="Label26" runat="server" Text="Email" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="title">
                    <asp:Label ID="Label27" runat="server" Text="THÔNG TIN SƠ BỘ VỀ TỔN THẤT"></asp:Label>
                    <br />
                    <asp:Label ID="Label28" runat="server" Text="INTIAL INFOMATION OF LOSS" 
                        Font-Bold="False" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label29" runat="server" Text="Địa điểm tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label30" runat="server" Text="Premises" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblPremises" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label31" runat="server" Text="Ngày tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label32" runat="server" Text="Date of loss" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblDateofloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label33" runat="server" Text="Loại hình tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label34" runat="server" Text="Type Of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblTypeofloss" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label35" runat="server" Text="Ghi chu"></asp:Label>
                    <br />
                    <asp:Label ID="Label36" runat="server" Text="Note Others" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblNoteOthers" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label37" runat="server" Text="Diễn biến tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label38" runat="server" Text="Circumstances" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" class="contentsitesurvey">
                    <asp:Label ID="lblCircumstances" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label39" runat="server" Text="Thông báo CQCN"></asp:Label>
                    <br />
                    <asp:Label ID="Label40" runat="server" 
                        Text="Report to the Local Authority (Police) ?" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblTBCQCN" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label41" runat="server" Text="Ghi chú thêm"></asp:Label>
                    <br />
                    <asp:Label ID="Label42" runat="server" Text="Further notes" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblFurtherNotes" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label43" runat="server" Text="Phạm vi tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label44" runat="server" Text="Extent of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="5" class="contentsitesurvey">
                    <asp:Label ID="lblExtentOfloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="leftsitesurvey">
                    <asp:Label ID="Label45" runat="server" Text="Dự phòng tổn thất"></asp:Label>
                    <br />
                    <asp:Label ID="Label46" runat="server" Text="Initial Reserve" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td colspan="2" class="contentsitesurvey">
                    <asp:Label ID="lblInitialReserve" runat="server"></asp:Label>
                </td>
                <td colspan="2" class="leftsitesurvey">
                    <asp:Label ID="Label47" runat="server" Text="Phụ lục đính kèm"></asp:Label>
                    <br />
                    <asp:Label ID="Label48" runat="server" Text="Appendix Attached" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblAppendixAttached" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="onecolumnsitesurvey">
                    <asp:Label ID="Label49" runat="server" 
                        Text="Đề phòng, hạn chế tổn thất và khuyến cáo của Giám định viên"></asp:Label>
                    <br />
                    <asp:Label ID="Label50" runat="server" 
                        Text="Loss Mitigating Actions &amp; Recommendation" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="contentsitesurvey" colspan="8">
                    <asp:Label ID="lblKhuyenCao" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="title">
                    <asp:Label ID="Label51" runat="server" 
                        Text="TỔNG HỢP THIỆT HẠI VÀ PHƯƠNG HƯỚNG KHẮC PHỤC"></asp:Label>
                    <br />
                    <asp:Label ID="Label52" runat="server" 
                        Text="SUMMARY OF LOSS / DAMAGE &amp; INITIAL MEASURES" Font-Bold="False" 
                        Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" align="center" height="auto">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width="90%">
                        <Columns>
                            <asp:BoundField HeaderText="HẠNG MỤC TÀI SẢN">
                            <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Thiệt hại hoàn toàn">
                            <ItemStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Thiệt hại một phần">
                            <ItemStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Không ảnh hưởng">
                            <ItemStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Ý kiến của GĐV">
                            <ItemStyle Width="10%" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#E4E4E4" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="onecolumnsitesurvey">
                    <asp:Label ID="Label53" runat="server" Text="Ý kiến của Giám định viên"></asp:Label>
&nbsp;(<asp:Label ID="Label54" runat="server" Text="Loss Adjuster's Remark" Font-Italic="True"></asp:Label>
                    )</td>
            </tr>
            <tr>
                <td class="contentsitesurvey" colspan="8">
                    <asp:Label ID="lblYKien" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="8" class="onecolumnsitesurvey">
                <asp:Label ID="Label58" runat="server" Text="Biên bản kết thúc lúc "></asp:Label>
                 <asp:Label ID="lblNgayGioKetThuc" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="Label55" runat="server" 
                        Text="Nội dung được các bên tham dự đọc rõ, cùng nghe và xác nhận toàn bộ nội dung nêu trên là trung thực và chính xác. Đại diện các bên cùng ký tên xác nhận dưới đây. "></asp:Label>
                    <asp:Label ID="Label56" runat="server" 
                        
                        Text="This site-survey minutes was completed at ______ hours on ________ and had been under careful review of all involved participants before agreeing to sign here below as declaration of truthfulness of the written contents above. "></asp:Label>
                    
                   
                </td>
            </tr>
            </table>
            <table class="tbsitesurvey">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label59" runat="server" Text="Đại diện cho"></asp:Label>
                    <br />
                    <asp:Label ID="Label60" runat="server" Text="(On behaft of )"></asp:Label>
                </td>
                <td class="style2">
                    </td>
                <td class="style2">
                    <asp:Label ID="Label61" runat="server" Text="Đại diện cho"></asp:Label>
                    <br />
                    <asp:Label ID="Label62" runat="server" Text="(On behaft of )"></asp:Label>
                </td>
                <td class="style2">
                    </td>
                <td class="style2">
                    <asp:Label ID="Label63" runat="server" Text="Đại diện cho"></asp:Label>
                    <br />
                    <asp:Label ID="Label64" runat="server" Text="(On behaft of )"></asp:Label>
                </td>
                <td class="style2">
                    </td>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label65" runat="server" Text="Đại diện cho"></asp:Label>
                    <br />
                    <asp:Label ID="Label66" runat="server" Text="(On behaft of )"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" height="60px">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2" height="60px">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2" height="60px">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2" height="60px">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label67" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                    
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label68" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label69" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label70" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label71" runat="server" Text="Họ và Tên (Full-Name)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label72" runat="server" Text="Họ và Tên (Full-Name)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label73" runat="server" Text="Họ và Tên (Full-Name)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label74" runat="server" Text="Họ và Tên (Full-Name)"></asp:Label>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label75" runat="server" Text="Chức vụ (Job Title)"></asp:Label>
                    
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label76" runat="server" Text="Chức vụ (Job Title)"></asp:Label>
                    
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label77" runat="server" Text="Chức vụ (Job Title)"></asp:Label>
                    
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="Label78" runat="server" Text="Chức vụ (Job Title)"></asp:Label>
                    
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
