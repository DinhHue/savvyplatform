<%@ Page Title="REPORT" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="InformationForm.aspx.cs" Inherits="WEBSITESAVVY.Pages.InfomationForm" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <%--     <script type="text/javascript">
    window.onbeforeunload = function (evt) {
        var message = 'Are you sure you want to continue your action ?';
        if (typeof evt == 'undefined') {
        evt = window.event;
        }
        if (evt) {
        evt.returnValue = message;
        }
        return message;
        }
   </script>--%>
   <script language="javascript" type="text/javascript">
       function SetAllStateCheckBoxList(chkID, state) {
           var chk = document.getElementById(chkID);
           var items = chk.getElementsByTagName("input");
           for (var i = 0; i < items.length; i++) {
               items[i].checked = state;
           }
       }  
</script>  
      
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
        <asp:Label ID="lblGDV" runat="server" Visible="False"></asp:Label>
    <table class="accordionTable">
        <%--  <tr>
            <td colspan="2" >
           
                <asp:GridView ID="gvclaimxuat"  Visible="False">
                    <HeaderStyle BackColor="#006600" ForeColor="White" />
                    <RowStyle BackColor="White" HorizontalAlign="Justify" VerticalAlign="Top" />
                </asp:GridView>
               
            </td>
        </tr>--%>
        <tr>
            <td class="infomFormHeader" colspan="2">
                COLLECT INFORMATION &amp; ANALYZE CLAIM<br />
                <asp:Label ID="lblThamChieuHead" runat="server"></asp:Label>
&nbsp;-&nbsp;
                <asp:Label ID="lblinsured" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="headermanager" colspan="2">
                <asp:Panel ID="Panel1" runat="server">
                 &nbsp;<asp:Label ID="Label37" runat="server" Text="Select period :"></asp:Label>
&nbsp;<asp:RadioButton ID="rdILA" runat="server" Text="ILA/PR" 
                    oncheckedchanged="rdILA_CheckedChanged" GroupName="radiobutton" Checked="true" 
                    AutoPostBack="True" />
                <asp:RadioButton ID="rdFR" runat="server" Text="IR/FR" 
                    oncheckedchanged="rdFR_CheckedChanged" GroupName="radiobutton" 
                    AutoPostBack="True" />
                </asp:Panel> 
                <%--<asp:Panel ID="Panel2" runat="server" CssClass="headermanager">
                </asp:Panel>--%>              
            </td>
        </tr>
        <tr>
            <td class="headerinfoleft">
                Status :</td>
            <td class="headerinforight">
               <asp:DropDownList ID="drStatus" runat="server" Width="300px" 
                        AppendDataBoundItems="true">
                    <asp:ListItem>[Update Status Claim ...]</asp:ListItem>
                    </asp:DropDownList>
                   
                    &nbsp;<asp:Button ID="btnUpdateStatus" runat="server" Text="Update Status" 
                        CssClass="btn" onclick="btnUpdateStatus_Click" Width="150px" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnExportExcel" runat="server" CssClass="btn" 
                        onclick="btnExportExcel_Click" Text="Export to Excel" Width="150px" />
            </td>
        </tr>
        <tr>
            <td class="headerinfoleft">
                <asp:Label ID="Label38" runat="server" Text="Brief :"></asp:Label>         
            </td>
            <td class="headerinforight">
               <asp:TextBox ID="txtbrief" runat="server" ReadOnly="False" Width="300px" 
                    CssClass="textEntry"></asp:TextBox>
                &nbsp;<asp:Button ID="btnUpdatebrief" runat="server" Text="Update Frief" 
                        CssClass="btn" onclick="btnUpdateFrief_Click" Width="150px" />                              
            </td>
        </tr>
        <tr>
            <td class="headerinfoleft">
                <asp:Label ID="Label40" runat="server" Text="Follower:"></asp:Label>         
            </td>
            <td class="headerinforight">
               <asp:DropDownList ID="drGDV" runat="server" Width="300px" 
                        AppendDataBoundItems="true">
                    <asp:ListItem Value="0">[Choose follower ...]</asp:ListItem>
                    </asp:DropDownList>
                   
                    &nbsp;<asp:Button ID="btnfollower" runat="server" Text="Follower" 
                        CssClass="btn" onclick="btnfollower_Click" Width="150px" />                              
            </td>
        </tr>
        <tr>
            <td class="headerinfoleft">
                <asp:Label ID="Label39" runat="server" Text="Rate :"></asp:Label>         
            </td>
            <td class="headerinforight">
                <asp:DropDownList ID="drRate" runat="server" 
                        AppendDataBoundItems="true">
                    <asp:ListItem Value="0">[Update rate ...]</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
               <%-- <asp:CheckBox ID="ck1" runat="server" AutoPostBack="True" 
                    oncheckedchanged="ck1_CheckedChanged" Text="1" />
&nbsp;
                <asp:CheckBox ID="ck2" runat="server" AutoPostBack="True" 
                    oncheckedchanged="ck2_CheckedChanged" Text="2" />
&nbsp;&nbsp;
                <asp:CheckBox ID="ck3" runat="server" AutoPostBack="True" 
                    oncheckedchanged="ck3_CheckedChanged" Text="3" />
&nbsp;&nbsp;
                   
                    &nbsp;<asp:CheckBox ID="ck4" runat="server" AutoPostBack="True" 
                    oncheckedchanged="ck4_CheckedChanged" Text="4" />--%>
&nbsp;&nbsp; <asp:Button ID="btnRate" runat="server" Text="Update Rate" 
                        CssClass="btn" onclick="btnRate_Click" Width="150px" />                              
            </td>
        </tr>
        <tr>
            <td colspan="2">
                
                <ajaxToolkit:Accordion ID="Accordion1" runat="server" SelectedIndex="0" 
                    AutoSize="None" FadeTransitions="true"  
    TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" 
                    SuppressHeaderPostbacks="true" 
                    HeaderCssClass="accordionHeader" 
                    HeaderSelectedCssClass="accordionHeaderSelected" Width="100%" 
                    Height="100%">
                <Panes>
                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" CssClass="infoFormTableSubInfoFirst">
                <Header>INITIAL INFORMATION OF LOSS / DAMAGE [THÔNG TIN TỔN THẤT ĐẦU TIÊN]</Header>
                <Content >
                <p align="center">
                
                 <table class="infoFormTableSubInfoFirst" align="center">
             <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label2" runat="server" Text="Reference Number :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtReferencenumber" runat="server" ReadOnly="False" Width="300px" 
                    CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="lbGDV1" runat="server" Text="Surveyor :"></asp:Label>
            </td>
            <td colspan="4">
            <asp:TextBox ID="txtSurveyor" runat="server" ReadOnly="True" Width="242px" 
                    CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label1" runat="server" Text="Insurer :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtInsurer" runat="server" Width="300px" CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label26" runat="server" Text="Policy No :"></asp:Label>
            </td>
            <td colspan="4">
            <asp:TextBox ID="txtPolicyNo" runat="server"  Width="242px" CssClass="textEntry"></asp:TextBox>
            
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label3" runat="server" Text="Subsidiary :"></asp:Label>
            </td>
            <td>
             <asp:TextBox ID="txtSubsidiary" runat="server" ReadOnly="True" Width="300px" 
                    CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label27" runat="server" Text="Effective :"></asp:Label>
            </td>
            <td colspan="4">
            <asp:TextBox ID="txtEffective" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>
            
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label4" runat="server" Text="Insured :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtInsured" runat="server" Width="300px" CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label28" runat="server" Text="Fax No :"></asp:Label>
            </td>
            <td colspan="4">
                <span>
            <asp:TextBox ID="txtFaxno" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>
            
            </span></td>
        </tr>
        <tr >
            <td class="infoFormLeft">
            <asp:Label ID="Label29" runat="server" Text="Address :"></asp:Label>
            </td>
            <td >
            <asp:TextBox ID="txtAddress" runat="server" Width="300px" Height="50px" CssClass="textEntry" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1" >
            <asp:Label ID="Label36" runat="server" Text="Email :"></asp:Label>
            </td>
            <td colspan="2" style="vertical-align: top">
            <asp:TextBox ID="txtEmail" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label30" runat="server" Text="Contact Person :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtContactPerson" runat="server" Width="300px" CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label31" runat="server" Text="Phone No :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtPhone" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>
            </td>
            
        </tr>
          <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label5" runat="server" Text="Premises :"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtPremises" runat="server" Width="300px" Height="50px" CssClass="textEntry" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label6" runat="server" Text="Date of loss :"></asp:Label>
            </td>
            <td colspan="4" style="vertical-align: top">               
            <asp:TextBox ID="txtDateofloss" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>  
                 
           </td>
        </tr>
    
        <tr>
            <td class="infoFormLeft">
            <asp:Label ID="Label34" runat="server" Text="Type of Loss :"></asp:Label>
            </td>
            <td>
             <asp:TextBox ID="txtTypeOfloss" runat="server" Width="300px" CssClass="textEntry"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
            <asp:Label ID="Label35" runat="server" Text="Note :"></asp:Label>
            </td>
            <td colspan="4">
            <asp:TextBox ID="txtNote" runat="server" Width="242px" CssClass="textEntry"></asp:TextBox>            
            </td>
        </tr>
        
        <td class="infoFormLeftMulti" colspan="4">
            <asp:Button ID="btnCapNhatInfoBasic" runat="server" Text="Update" CssClass="btn" onclick="btnCapNhatInfoBasic_Click"/> </td>
        </tr>
    </table>
                </p>
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                <Header>INTRODUCTION / GIỚI THIỆU CHUNG</Header>
                <Content>
                 <table class="infoFormTableSub">
        <tr>
            <td class="infoFormLeftMultiHeader">
                <asp:Label ID="Label7" runat="server" Text="A1 (*)"></asp:Label>
            </td>
            <td class="infoFormLeftMultiHeader">
                <asp:Label ID="Label8" runat="server" Text="A1(**)"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeftMulti">
                <asp:TextBox ID="txtA1" runat="server" CssClass="infoFormTextMulti" 
                    TextMode="MultiLine" Enabled="True"></asp:TextBox>
            </td>
            <td class="infoFormLeftMulti">
                <asp:TextBox ID="txtA2" runat="server" CssClass="infoFormTextMulti" 
                    ReadOnly="True" TextMode="MultiLine" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td class="infoFormLeft"> 
            <%--<asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn" onclick="btnEdit_Click" />--%>
            <asp:Button ID="btnSaveA1" runat="server" Text="Save" CssClass="btn" onclick="btnSaveA1_Click" />
        </td>
        <td class="infoFormLeft">
            <asp:Button ID="btnSaveA2" runat="server" Text="Save" CssClass="btn" onclick="btnSaveA2_Click"/> </td>
        </tr>
    </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                 <ajaxToolkit:AccordionPane ID="AccordionPane13" runat="server">
                <Header>INSURED / NGƯỜI ĐƯỢC BẢO HIỂM</Header>
                <Content>
                          <table class="infoFormTableSub">
                <tr>
                    <td class="infoFormLeft">
                        <asp:Label ID="Label43" runat="server" Text="INSURED"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGioiThieu" runat="server" CssClass="infoFormTextMulti" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        </td>
                    <td class="inforFormRight">
            
                        <asp:Button ID="btn_UpdateGioiThieuNDBH" runat="server" CssClass="btn" Text="Update" OnClick="btn_UpdateGioiThieuNDBH_Click" />
            
                    </td>
                </tr>
       
            </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                <Header>CIRCUMSTANCE / DIỄN BIẾN TỔN THẤT</Header>
                <Content>
                   <table class="infoFormTableSub">
                <tr>
                    <td class="infoFormLeft">
                        <asp:Label ID="Label9" runat="server" Text="C1 - Brief"></asp:Label>
                    </td>
                    <td class="">
                        <asp:TextBox ID="txtC1" runat="server" CssClass="infoFormTextMulti" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                         
                </tr>
                <tr>
                <td></td>
                <td class="inforFormRight">
                    <asp:Button ID="btnSaveC1" runat="server" Text="Save" CssClass="btn" onclick="btnSaveC1_Click" />
                    </td>  
                </tr>
                <tr>
                    <td class="infoFormLeft">
                        <asp:Label ID="Label10" runat="server" Text="C2 - Details"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="txtC2" runat="server" CssClass="infoFormTextMulti" 
                             TextMode="MultiLine"></asp:TextBox>
                    </td>
                   
                </tr>
                <td></td>
                 <td class="inforFormRight">
                    <asp:Button ID="btnSaveC2" runat="server" Text="Save" CssClass="btn" onclick="btnSaveC2_Click"/>
                    </td> 
                <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label11" runat="server" Text="C3 - Cause of loss"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="txtC3" runat="server" CssClass="infoFormTextMulti" 
                     TextMode="MultiLine"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
        <td></td>
        <td class="inforFormRight">
            <asp:Button ID="btnSaveC3" runat="server" Text="Save" CssClass="btn" onclick="btnSaveC3_Click" />
            </td> 
        </tr>
    </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server">
                <Header>DETAIL LOSS EXTENT / CHI TIẾT PHẠM VI TỔN THẤT</Header>
                <Content>
                   <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeftGroup">
                            <asp:Label ID="Label12" runat="server" Text="D1 - BRIEF DESCRIPTION"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            <asp:TextBox ID="txtD1" runat="server" CssClass="infoFormTextMulti" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    
                    <td class="inforFormLeft">
                        <asp:Button ID="btnSaveD1" runat="server" Text="Save" CssClass="btn" onclick="btnSaveD1_Click" /> </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="infoFormLeftGroup" align="left">
                            <asp:Label ID="Label13" runat="server" Text="D2 - LOSS EXTENT &amp; ADJUSTMENT"></asp:Label>
                        </td>
                    </tr>
                    <tr class="infoFormLeftGroupContent">
                        <td>
                          <asp:HyperLink Font-Bold="true" Font-Size="18px" ForeColor="" ID="HyperLink1" NavigateUrl="~/Pages/ChiTietThietHai.aspx" runat="server">CHI TIẾT THIỆT HẠI</asp:HyperLink>
                        </td>
                    </tr>
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server">
                <Header>POLICY LIABILITY / PHẠM VI BẢO HIỂM</Header>
                <Content>
                    <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label15" runat="server" Text="(*) E1 - POLICY TYPE"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtE1" runat="server" CssClass="infoFormTextMulti" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    </tr>
                   <td></td>
                    <td class="inforFormRight">
                        <asp:Button ID="btnSaveE1" runat="server" Text="Save" CssClass="btn" OnClick="btnSaveE1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label16" runat="server" 
                                Text="(**)E2 - CONCLUSION (BASED ON CAUSE OF LOSS)"></asp:Label>
                        </td>
                        <td>
            
                            <asp:TextBox ID="txtE2" runat="server" CssClass="infoFormTextMulti" 
                                TextMode="MultiLine" Enabled="false"></asp:TextBox>
            
                        </td>
                    </tr>
                   <td></td>
                    <td class="inforFormRight">
                        <asp:Button ID="btnSaveE2" runat="server" Text="Save" CssClass="btn" OnClick="btnSaveE2_Click" />
                         </td>
                    </tr>
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane10" runat="server">
                <Header>LOSS HISTORY / LỊCH SỬ TỔN THẤT</Header>
                <Content>
                <table class="infoFormTableSub">
                <tr>
                    <td class="infoFormLeft">
                        <asp:Label ID="Label23" runat="server" Text="LH"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLossHistory" runat="server" CssClass="infoFormTextMulti" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        </td>
                    <td class="inforFormRight">
            
                        <asp:Button ID="btnUpdateLH" runat="server" CssClass="btn" Text="Update" OnClick="btnUpdateLH_Click" />
            
                    </td>
                </tr>
       
            </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                 <ajaxToolkit:AccordionPane ID="AccordionPane6" runat="server">
                <Header>OTHER INSURANCE / ĐƠN BẢO HIỂM KHÁC</Header>
                <Content>
                <table class="infoFormTableSub">
                <tr>
                    <td class="infoFormLeft">
                        <asp:Label ID="Label17" runat="server" Text="G"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtG" runat="server" CssClass="infoFormTextMulti" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="inforFormRight">
            
                        <asp:Button ID="btnSaveG" runat="server" CssClass="btn" Text="Update" OnClick="btnSaveG_Click" />
            
                    </td>
                </tr>
       
            </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                 <ajaxToolkit:AccordionPane ID="AccordionPane7" runat="server">
                <Header>SALVAGE / GIÁ TRỊ THU HỒI</Header>
                <Content>
                    <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label18" runat="server" Text="H"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtH" runat="server" CssClass="infoFormTextMulti" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="inforFormRight">
            
                            <asp:Button ID="btnSaveH" runat="server" CssClass="btn" Text="Update" onclick="btnSaveH_Click"  />
            
                        </td>
                    </tr>       
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                 <ajaxToolkit:AccordionPane ID="AccordionPane8" runat="server">
                <Header>ADEQUACY / XEM XÉT SỐ TIỀN BẢO HIỂM</Header>
                <Content>
                   <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label19" runat="server" Text="I"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtI" runat="server" CssClass="infoFormTextMulti" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="inforFormRight">
            
                            <asp:Button ID="btnSaveI" runat="server" CssClass="btn" Text="Update" OnClick="btnSaveI_Click" />
            
                        </td>
                    </tr>       
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane9" runat="server">
                <Header>CLAIM HANDING SUMMARY / QUẢN LÝ KHIẾU NẠI</Header>
                <Content>
                   <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label20" runat="server" Text="K"></asp:Label>
                        </td>
                        <td style="vertical-align: top; text-align: left">
                           <CKEditor:CKEditorControl ID="txtK" runat="server" 
                BasePath="~/ckeditor" Width="100%" Height="300px"></CKEditor:CKEditorControl>          
                            <%--<FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server">
                            </FCKeditorV2:FCKeditor>--%>                       
                        </td>
                        <td style="font-family: 'times New Roman', Times, serif; vertical-align: top; width: 20%" align="center">
                        <asp:Label ID="Label25" runat="server" Text="Tag Name" Font-Bold="True"></asp:Label><br />
                        <input type="button" value="Select All"  onclick="SetAllStateCheckBoxList('<%=cklistGDV.ClientID %>',true)" />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button"  value="UnSelect All" onclick="SetAllStateCheckBoxList('<%=cklistGDV.ClientID %>',false)" />
                         
                           <br />
                            <asp:CheckBoxList ID="cklistGDV" runat="server" onselectedindexchanged="cklistGDV_SelectedIndexChanged">
                            </asp:CheckBoxList >
                           <%-- <asp:Label ID="lblTagName" runat="server" Text="" Visible="False"></asp:Label>--%>
                           <%-- <asp:Button ID="btnsendmail" runat="server" CssClass="btn" Text="Send" OnClick="btnsendmail_Click"  />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="inforFormRight">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSaveK" runat="server" CssClass="btn" Text="Update" onclick="btnSaveK_Click" />
            
                        </td>
                    </tr>      
                     
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                   <ajaxToolkit:AccordionPane ID="AccordionPane11" runat="server">
                <Header>CLAIM DISCUSSION / THẢO LUẬN KHIẾU NẠI</Header>
                <Content>
                   <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label32" runat="server" Text="K"></asp:Label>
                        </td>
                        <td style="vertical-align: top; text-align: left">
                           <CKEditor:CKEditorControl ID="ckDiscuss" runat="server" 
                BasePath="~/ckeditor" Width="100%" Height="300px"></CKEditor:CKEditorControl>          
                            <%--<FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server">
                            </FCKeditorV2:FCKeditor>--%>                       
                        </td>
                        <td style="font-family: 'times New Roman', Times, serif; vertical-align: top; width: 20%" align="center">
                        <asp:Label ID="Label33" runat="server" Text="Tag Name" Font-Bold="True"></asp:Label><br />
                        <input type="button" value="Select All"  onclick="SetAllStateCheckBoxList('<%=ckDSEmailtag.ClientID %>',true)" />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button"  value="UnSelect All" onclick="SetAllStateCheckBoxList('<%=ckDSEmailtag.ClientID %>',false)" />
                         
                           <br />
                            <asp:CheckBoxList ID="ckDSEmailtag" runat="server" onselectedindexchanged="ckDSEmailtag_SelectedIndexChanged">
                            </asp:CheckBoxList >
                           <%-- <asp:Label ID="lblTagName" runat="server" Text="" Visible="False"></asp:Label>--%>
                           <%-- <asp:Button ID="btnsendmail" runat="server" CssClass="btn" Text="Send" OnClick="btnsendmail_Click"  />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="inforFormRight">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSaveDiscuss" runat="server" CssClass="btn" Text="Update" onclick="btnSaveDiscuss_Click" />
            
                        </td>
                    </tr>      
                     
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane12" runat="server">
                <Header>TASK ASSIGED / NHIỆM VỤ ĐƯỢC GIAO</Header>
                <Content>
                <p></p>
                  <asp:GridView ID="gvDSDuocNhan" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="MaDaiLy" Font-Names="Times New Roman" Font-Size="16px" Width="100%">
                    <Columns>
                        <%--<asp:BoundField DataField="MaDaiLy" HeaderText=".">
                        <ItemStyle ForeColor="White" HorizontalAlign="Center" Width="0%" />
                        </asp:BoundField>--%>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                        <ItemStyle Width="35%" HorizontalAlign="left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ngay" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Date Assigned">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Deadline">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deliver" HeaderText="Deliver">
                        <ItemStyle HorizontalAlign="Center" Width="15%"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Receiver" HeaderText="Receiver">
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Done" HeaderText="Done">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <%--<asp:CommandField ButtonType="Button" HeaderText="Edit" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>--%>
                    </Columns>
                    <HeaderStyle BackColor="#CC0000" Font-Names="Times New Roman" Font-Size="18px" 
                        ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
                </Content>
                </ajaxToolkit:AccordionPane>
                </Panes>
                </ajaxToolkit:Accordion>
            &nbsp;
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
