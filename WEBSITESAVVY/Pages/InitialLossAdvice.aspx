<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialLossAdvice.aspx.cs" Inherits="WEBSITESAVVY.Pages.InitialLossAdvice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .tbsitesurvey
        {
            width: 70%;
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
       
        .colNgayThucHienSiteSurvey
        {
            padding-right:10%;   
            text-align:right; 
            color:#006600;
        }
               
        .title
        {
            color:#006600;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        } 
        .thamchieusitesurvey
        {
            width:13%;
            padding-left:2%;
            padding-right:5%;
            text-align:right;
        }
        .colthamchieu
        {
           
            text-align: left;
            vertical-align: top;
            width:20%;
        }
        .leftsitesurvey
        {
            width: 15%;            
          
            text-align: right;
            vertical-align: top;
            padding-right: 1%; 
            background-color: #F4F4F4;
        }
        .rightsitesurvey
        {
            width: 15%;   
            padding-left: 2%;
            padding-right: 5px;
            text-align: left;
            vertical-align: top;
            color:#000099;
        }
        .contentsitesurvey
        {
            padding-left: 2%;
            text-align: left;
            vertical-align: top;
            width: 25%;
            color:#000099;
        }
        .onecolumnsitesurvey
        {
            text-align: left;
            vertical-align: top;
            padding-left: 2%;
            color:#000099;
        }
        .colphone
        {
            width:15%;
            vertical-align:top;
            text-align:left;
        }
    
        .subtitle
        {
            background-color:#E4E4E4;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }
        .colchuky
        {
            width:20%;
            text-align:center;
            vertical-align:top;
        }
        .Chukyleft
        {
            text-align:center;
            padding-left:5%;
            vertical-align:top;
            width:30%;    
        }
        .Chukyright
        {
            text-align:center;
            padding-right:5%;
            vertical-align:top;
            width:30%;    
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Panel ID="Panel2" runat="server">
        <table class="tbsitesurvey" align="center" 
             style="border: thin groove #CCCCCC;">
            <tr>
                <td colspan="7"class="header">
                    </td>
            </tr>
            <tr>
                <td colspan="7" class="colNgayThucHienSiteSurvey" height="60px">
                    &nbsp;<asp:Label ID="Label79" runat="server" Text="Ngày "></asp:Label>
&nbsp;
                    <asp:Label ID="lblNgayThucHien" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7" class="title">
                    <asp:Label ID="Label1" runat="server" Text="BÁO CÁO ĐẦU TIÊN"></asp:Label>
                    <br />
                    <strong>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
                        Text="INITIAL LOSS ADVICE"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="thamchieusitesurvey">
                    <strong>
                    <asp:Label ID="Label3" runat="server" Text="Tham chiếu Hồ sơ Giám định"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Claim File's Reference Number" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td class="colthamchieu" style="color: #006600" colspan="2">
                    <strong>
                    <asp:Label ID="lblThamChieu" runat="server"></asp:Label>
                    </strong>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label5" runat="server" Text="Giám định viên"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Surveyor" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey" style="color: #006600">
                    <strong>
                    <asp:Label ID="lblGDV" runat="server"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label7" runat="server" Text="Nhà bảo hiểm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Insurer" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <strong>
                    <asp:Label ID="lblInsurer" runat="server"></asp:Label>
                    </strong>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label9" runat="server" Text="Số HĐBH"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Policy No." Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblSoHDBH" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label21" runat="server" Text="Đơn vị"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label22" runat="server" Text="Subsidiary" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <strong>
                    <asp:Label ID="lblSubsidiary" runat="server"></asp:Label>
                    </strong>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label13" runat="server" Text="Hiệu lực"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Effective" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblEffective" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label11" runat="server" Text="Người được BH"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Insured" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <strong>
                    <asp:Label ID="lblInsured" runat="server"></asp:Label>
                    </strong>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label17" runat="server" Text="Số Fax"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label18" runat="server" Text="Fax No." Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label15" runat="server" Text="Địa chỉ"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="Address" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="6" class="onecolumnsitesurvey">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label19" runat="server" Text="Người liên hệ"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label20" runat="server" Text="Contact Person" Font-Italic="True"></asp:Label>
                </td>
                <td class="contentsitesurvey" colspan="2">
                    <asp:Label ID="lblContectPerson" runat="server"></asp:Label>
                </td>
                <td class="colphone">
                    <strong>
                    <asp:Label ID="Label23" runat="server" Text="Số điện thoại"></asp:Label>
                    </strong>&nbsp;
                    <br />
                    <asp:Label ID="Label24" runat="server" Text="Phone No." Font-Italic="True"></asp:Label>
                </td>
                <td class="colphone">
                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label25" runat="server" Text="Thư điện tử"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label26" runat="server" Text="Email" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7" class="subtitle">
                    <strong>
                    <asp:Label ID="Label27" runat="server" Text="THÔNG TIN SƠ BỘ VỀ TỔN THẤT"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label28" runat="server" Text="INTIAL INFOMATION OF LOSS" 
                        Font-Bold="False" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label29" runat="server" Text="Địa điểm tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label30" runat="server" Text="Premises" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <asp:Label ID="lblPremises" runat="server"></asp:Label>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label31" runat="server" Text="Ngày tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label32" runat="server" Text="Date of loss" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblDateofloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label33" runat="server" Text="Loại hình tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label34" runat="server" Text="Type Of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <asp:Label ID="lblTypeofloss" runat="server"></asp:Label>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label35" runat="server" Text="Ghi chu"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label36" runat="server" Text="Note Others" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblNoteOthers" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label37" runat="server" Text="Diễn biến tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label38" runat="server" Text="Circumstances" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="6" class="contentsitesurvey">
                    <asp:Label ID="lblCircumstances" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label39" runat="server" Text="Thông báo CQCN"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label40" runat="server" 
                        Text="Report to the Local Authority (Police) ?" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <asp:Label ID="lblTBCQCN" runat="server"></asp:Label>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label41" runat="server" Text="Ghi chú thêm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label42" runat="server" Text="Further notes" Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblFurtherNotes" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label43" runat="server" Text="Phạm vi tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label44" runat="server" Text="Extent of Loss" Font-Italic="True"></asp:Label>
                </td>
                <td colspan="6" class="contentsitesurvey">
                    <asp:Label ID="lblExtentOfloss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label45" runat="server" Text="Dự phòng tổn thất"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label46" runat="server" Text="Initial Reserve" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td colspan="4" class="contentsitesurvey">
                    <asp:Label ID="lblInitialReserve" runat="server"></asp:Label>
                </td>
                <td class="leftsitesurvey">
                    <strong>
                    <asp:Label ID="Label47" runat="server" Text="Phụ lục đính kèm"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label48" runat="server" Text="Appendix Attached" 
                        Font-Italic="True"></asp:Label>
                </td>
                <td class="rightsitesurvey">
                    <asp:Label ID="lblAppendixAttached" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7" class="onecolumnsitesurvey" style="color: #000000">
                    <strong style="color: #000000">
                    <asp:Label ID="Label49" runat="server" 
                        Text="Đề phòng, hạn chế tổn thất và khuyến cáo của Giám định viên"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label50" runat="server" 
                        Text="Loss Mitigating Actions &amp; Recommendation" Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="contentsitesurvey" colspan="7">
                    <asp:Label ID="lblKhuyenCao" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <strong>
                    <asp:Label ID="Label51" runat="server" 
                        Text="TỔNG HỢP THIỆT HẠI VÀ PHƯƠNG HƯỚNG KHẮC PHỤC"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label52" runat="server" 
                        Text="SUMMARY OF LOSS / DAMAGE &amp; INITIAL MEASURES" Font-Bold="False" 
                        Font-Italic="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center" height="auto">
                    <asp:GridView ID="gvDanhSachHangMucThietHai" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ID" Font-Names="Times New Roman" 
                        Font-Size="14px" PageSize="20" Width="90%">
                        <Columns>
                            <asp:BoundField DataField="TenHangMuc" 
                                HeaderText="HẠNG MỤC TÀI SẢN (PROPERTY'S ITEMS)">
                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TrangThai" 
                                HeaderText="Mô tả tình trạng thiệt hại / Phương án khắc phục       (Brief description of damage / Available measurements)">
                            <ItemStyle HorizontalAlign="Left" Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TinhTrang" 
                                HeaderText="Thiệt hại hoàn toàn (Destroyed)">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="YKienGDV" HeaderText="Ý kiến của GĐV (Remark)">
                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#EEEEEE" ForeColor="Black" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="7" class="onecolumnsitesurvey" style="color: #000000">
                    <strong>
                    <asp:Label ID="Label53" runat="server" Text="Ý kiến của Giám định viên"></asp:Label>
                    </strong>&nbsp;(<asp:Label ID="Label54" runat="server" Text="Loss Adjuster's Remark" Font-Italic="True"></asp:Label>
                    )</td>
            </tr>
            <tr>
                <td class="contentsitesurvey" colspan="7">
                    <asp:Label ID="lblYKien" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="7" class="onecolumnsitesurvey" style="color: #000000">
                <asp:Label ID="Label58" runat="server" Text="Biên bản kết thúc lúc "></asp:Label>
                 <asp:Label ID="lblNgayGioKetThuc" runat="server" ForeColor="#000099"></asp:Label>
                &nbsp;<asp:Label ID="Label55" runat="server" 
                        Text="Nội dung được các bên tham dự đọc rõ, cùng nghe và xác nhận toàn bộ nội dung nêu trên là trung thực và chính xác. Đại diện các bên cùng ký tên xác nhận dưới đây. "></asp:Label>
                    <em>
                    <asp:Label ID="Label56" runat="server" 
                        
                        Text="This site-survey minutes was completed at ______ hours on ________ and had been under careful review of all involved participants before agreeing to sign here below as declaration of truthfulness of the written contents above. "></asp:Label>
                    
                   
                    </em>
                    
                   
                </td>
            </tr>
            <tr>
                <td class="Chukyleft" colspan="2" style="color: #000000">
                    <strong>
                    <asp:Label ID="Label80" runat="server" Text="Người báo cáo"></asp:Label>
                    </strong><em>
                    <br />
                    <asp:Label ID="Label81" runat="server" Text="Prepared by "></asp:Label>
                    </em>
                </td>
                <td colspan="2" style="color: #000000" width="40%">
                    &nbsp;</td>
                <td colspan="3" style="color: #000000" class="Chukyright">
                    <em><strong>
                    <asp:Label ID="Label83" runat="server" Text="Phê duyệt bởi"></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label82" runat="server" Text="Checked &amp; Approved by"></asp:Label>
                    </em>
                </td>
            </tr>
            <tr>
                <td class="Chukyleft" colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td class="Chukyright" colspan="3" style="color: #000000">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="Chukyleft" colspan="2" style="color: #000000">
                    <asp:Label ID="Label84" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                </td>
                <td colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td class="Chukyright" colspan="3" style="color: #000000">
                    <asp:Label ID="Label85" runat="server" Text="(Chữ ký / Signature)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="Chukyleft" colspan="2" style="color: #000000">
                    <asp:Label ID="Label86" runat="server" Text="Chức vụ (Job Title):"></asp:Label>
                </td>
                <td colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td class="Chukyright" colspan="3" style="color: #000000">
                    <asp:Label ID="Label87" runat="server" Text="Chức vụ (Job Title):"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="Chukyleft" colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td colspan="2" style="color: #000000">
                    &nbsp;</td>
                <td class="Chukyright" colspan="3" style="color: #000000">
                    &nbsp;</td>
            </tr>
            </table>
        </asp:Panel>
    </div>
     <div align="center">
        <asp:Button ID="btnIn" runat="server" Text="Print" onclick="btnIn_Click" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnXemDS" runat="server" Text="Back Home Page" onclick="btnXemDS_Click" 
                   />
    
    </div>
    </form>
</body>
</html>
