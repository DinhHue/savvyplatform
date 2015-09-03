<%@ Page Title="mHome" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="InformationForm.aspx.cs" Inherits="WEBSITESAVVY.mobile.InformationForm" validateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
     tinyMCE.init({
        mode: "textareas",
        theme: "advanced",
        plugins: "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
        theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
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

  <script language="javascript" type="text/javascript">
      function SetAllStateCheckBoxList(chkID, state) {
          var chk = document.getElementById(chkID);
          var items = chk.getElementsByTagName("input");
          for (var i = 0; i < items.length; i++) {
              items[i].checked = state;
          }
      }
      </script>
    <style type="text/css">
        .style3
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 <asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div align="center">
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
                    oncheckedchanged="ck4_CheckedChanged" Text="4" />--%>&nbsp;&nbsp; <asp:Button ID="btnRate" runat="server" Text="Update Rate" 
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
                    Height="100%" CssClass="style3">
                <Panes>
                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" 
                        CssClass="infoFormTableSubInfoFirst" ContentCssClass="" HeaderCssClass="">
                <Header>INITIAL INFORMATION OF LOSS / DAMAGE</Header>
                <Content >
                <p align="center">
        <table align="center" class="infoFormTableSubInfoFirst">
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label2" runat="server" Text="Reference Number :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReferencenumber" runat="server" CssClass="textEntry" 
                    ReadOnly="False" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="lbGDV1" runat="server" Text="Surveyor :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSurveyor" runat="server" CssClass="textEntry" 
                    ReadOnly="True" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label1" runat="server" Text="Insurer :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtInsurer" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label26" runat="server" Text="Policy No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label3" runat="server" Text="Subsidiary :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubsidiary" runat="server" CssClass="textEntry" 
                    ReadOnly="True" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label27" runat="server" Text="Effective :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEffective" runat="server" CssClass="textEntry" 
                    Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label4" runat="server" Text="Insured :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtInsured" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label28" runat="server" Text="Fax No :"></asp:Label>
            </td>
            <td>
                <span>
                <asp:TextBox ID="txtFaxno" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
                </span>
            </td>
        </tr>
           <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label36" runat="server" Text="Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry" Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label6" runat="server" Text="Date of loss :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDateofloss" runat="server" CssClass="textEntry" 
                    Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label29" runat="server" Text="Address :"></asp:Label>
            </td>
            <td colspan="3" style="padding-left: 17.3%; float: left; text-align: left">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="textEntry" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label5" runat="server" Text="Premises :"></asp:Label>
            </td>
            <td colspan="3" style="padding-left: 17.3%; float: left; text-align: left;">
                <asp:TextBox ID="txtPremises" runat="server" CssClass="textEntry" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label30" runat="server" Text="Contact Person :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContactPerson" runat="server" CssClass="textEntry" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label31" runat="server" Text="Phone No :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
     
        <tr>
            <td class="infoFormLeft">
                <asp:Label ID="Label34" runat="server" Text="Type of Loss :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTypeOfloss" runat="server" CssClass="textEntry" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="infoFormLeft" colspan="1">
                <asp:Label ID="Label35" runat="server" Text="Note :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNote" runat="server" CssClass="textEntry" Width="242px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="infoFormLeftMulti" colspan="4">
                &nbsp;</td>
        </tr>
    </table>
                </p>
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>INTRODUCTION</Header>
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
                <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>CIRCUMSTANCE</Header>
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
                  <ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>DETAIL LOSS EXTENT</Header>
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
                            <table class="infoFormTableSub">
                                <tr>
                                    <td class="headermanager">
                                        LOSS SUMMARY DETAIL 
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" >
                                    <asp:Label ID="lblThongBaoSumdetail" runat="server" Text="Chưa có summary detail nào !" CssClass="headerTimesheet" Visible="False"></asp:Label><br />
                                    <asp:Label ID="lblbuilding" runat="server" Text="Building" CssClass="headerTimesheet" Visible="False"></asp:Label>
                                        <asp:GridView ID="gvDanhMucBuilding" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px" 
                                        onrowcancelingedit="gvDanhMucBuilding_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucBuilding_RowUpdating" onrowediting="gvDanhMucBuilding_RowEditing" onrowdatabound="gvDanhMucBuilding_RowDataBound" ShowFooter="true" Width="100%" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%"/>
                                                <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" HeaderText="Agreed Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinhToan" HeaderText="Proposed Adjustment" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%" />
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center" />
                                                
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White"/>
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblmachinery" runat="server" Text="Machinery" class="headerTimesheet" Visible="False"></asp:Label>                                        
                                        <asp:GridView ID="gvDanhMucMachinery" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"  onrowcancelingedit="gvDanhMucMachinery_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucMachinery_RowUpdating" onrowediting="gvDanhMucMachinery_RowEditing" Width="100%" onrowdatabound="gvDanhMucMachinery_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%" />
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="100px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment" ItemStyle-Width="120px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%" />
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center"  />
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblstock" runat="server" Text="Stock" class="headerTimesheet" Visible="False"></asp:Label>
                                        <asp:GridView ID="gvDanhMucStock" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"  onrowcancelingedit="gvDanhMucStock_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucStock_RowUpdating" onrowediting="gvDanhMucStock_RowEditing" Width="100%" onrowdatabound="gvDanhMucStock_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%" />
                                                 <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="100px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment" ItemStyle-Width="120px" DataFormatString="{0:###,###}"/>
                                                 <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%" />
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center"  />
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblconstruction" runat="server" Text="Construction" class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucConstruction" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"  onrowcancelingedit="gvDanhMucConstruction_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucConstruction_RowUpdating" onrowediting="gvDanhMucConstruction_RowEditing" Width="100%" onrowdatabound="gvDanhMucConstruction_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%" />
                                                 <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="100px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%" />
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center"  />
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                             <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblliability" runat="server" Text="Liability" class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucLiability" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px" onrowcancelingedit="gvDanhMucLiability_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucLiability_RowUpdating" onrowediting="gvDanhMucLiability_RowEditing" Width="100%"  onrowdatabound="gvDanhMucLiability_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <%--<asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%" />
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="100px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%"/>
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center" />
                                                
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                         <asp:Label ID="lblother" runat="server" Text="Other" class="headerTimesheet" Visible="False"></asp:Label>
                                         <asp:GridView ID="gvDanhMucOther" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px" onrowcancelingedit="gvDanhMucOther_RowCancelingEdit" DataKeyNames="ID_Summary_Detail"
                                        onrowupdating="gvDanhMucOther_RowUpdating" onrowediting="gvDanhMucOther_RowEditing" Width="100%" onrowdatabound="gvDanhMucOther_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TenHangMuc" HeaderText="Description / Item of loss" ItemStyle-Width="30%"/>
                                                  <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="100px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinhToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment"  ItemStyle-Width="120px" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="50px"/>
                                                <asp:BoundField DataField="GhiChu" HeaderText="Note / Remark" ItemStyle-Width="20%" />
                                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-HorizontalAlign="Center"  />
                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                        <asp:Label ID="Label24" runat="server" Text="CLAIM SUMMARY" class="headerTimesheet"></asp:Label>
                                        <asp:GridView ID="gvTotal" runat="server" AutoGenerateColumns="False" Font-Names="Times New Roman" Font-Size="14px"
                                        Width="100%" onrowdatabound="gvTotal_RowDataBound" ShowFooter="true">
                                            <Columns>
                                                <%--<asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                                                    <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%-- <asp:BoundField DataField="ID_Summary_Detail" HeaderText="ID" ItemStyle-Width="0%" />--%>
                                                <asp:BoundField DataField="TheLoai" HeaderText="Thể Loại" ItemStyle-Width="10%"/>
                                                <asp:BoundField DataField="GiaTriKhieuNai" HeaderText="QTy." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" DataFormatString="{0:###,###}"/>
                                                <asp:BoundField DataField="SoLuong" HeaderText=" Claim Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="ThietHaiHopLy" ItemStyle-HorizontalAlign="Right" HeaderText="Agreed Amount" ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="DeXuatTinToan" ItemStyle-HorizontalAlign="Right" HeaderText="Proposed Adjustment"  ItemStyle-Width="20%" DataFormatString="{0:###,###}" />
                                                <asp:BoundField DataField="MenhGia" ItemStyle-HorizontalAlign="Center" HeaderText="Rate" ItemStyle-Width="10%"/>                                               
                                            </Columns>
                                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                                            <FooterStyle BackColor="#006600" ForeColor="White"  HorizontalAlign="Right" />
                                        </asp:GridView>
                                        <br />
                                        <asp:Button ID="btnSaveSummarydetail" runat="server" Text="Save" CssClass="btn" onclick="btnSaveSummarydetail_Click" />
                                    </td>
                                </tr>
                            </table>
                            <table class="infoFormTableSub">
                                <tr>
                                    <td class="headermanager" colspan="2">
                                        Chi Tiết Thiệt Hại
                                        <asp:Label ID="lblMaSum" runat="server" Text="" Visible="False"></asp:Label>
                                     </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager" >
                                        <asp:Label ID="Label14" runat="server" Text="Loại tổn thất :"></asp:Label>
                            
                                    </td>
                                    <td class="rightmanager">
                                        <asp:DropDownList ID="drDSLoaiThietHai" runat="server"                                
                                            Width="300px" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">[Choose field of loss]</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="Label21" runat="server" Text="Mệnh giá :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                         <asp:DropDownList ID="drMenhGia" runat="server"                                
                                            Width="200px" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">[Choose rate]</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblDienGiai" runat="server" Text="Diễn giải :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtDienGiai" runat="server" CssClass="textmananger" 
                                              Width="600px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblGiaTriKhieuNai" runat="server" Text="QTy. :" 
                                            ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtGiaTriKhieuNai" runat="server" CssClass="textmananger" 
                                           ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblThietHaiHopLy" runat="server" Text="Agreed Amount :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">                           
                                        <asp:TextBox ID="txtThietHaiHopLy" runat="server" CssClass="textmananger" 
                                            Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="Label22" runat="server" Text="Claim Amount :"></asp:Label>
                                    </td>
                                    <td class="rightmanager">                           
                                        <asp:TextBox ID="txtSoLuong" runat="server" CssClass="textmananger" 
                                            Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblDeXuatTinhToan" runat="server" Text="Proposed Adjustment :" 
                                            ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtDeXuatTinhToan" runat="server" CssClass="textmananger" 
                                             Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="leftmanager">
                                        <asp:Label ID="lblGhiChu" runat="server" Text="Note / Remark :" ></asp:Label>
                                    </td>
                                    <td class="rightmanager">
                                        <asp:TextBox ID="txtGhiChu" runat="server" CssClass="textmananger" 
                                            Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="colleft">
                                        &nbsp;</td>
                                    <td class="rightmanager">
                                        <asp:Button ID="btnCapNhat" runat="server" CssClass="btn" 
                                            Text="Insert"  Width="100px" onclick="btnCapNhat_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>POLICY LIABILITY</Header>
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
                <ajaxToolkit:AccordionPane ID="AccordionPane10" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>LOSS HISTORY</Header>
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
                 <ajaxToolkit:AccordionPane ID="AccordionPane6" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>OTHER INSURANCE</Header>
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
                 <ajaxToolkit:AccordionPane ID="AccordionPane7" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>SALVAGE</Header>
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
                 <ajaxToolkit:AccordionPane ID="AccordionPane8" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>ADEQUACY</Header>
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
                <ajaxToolkit:AccordionPane ID="AccordionPane9" runat="server" ContentCssClass="" 
                        HeaderCssClass="">
                <Header>CLAIM HANDING SUMMARY</Header>
                <Content>
                   <table class="infoFormTableSub">
                    <tr>
                        <td class="infoFormLeft">
                            <asp:Label ID="Label20" runat="server" Text="K"></asp:Label>
                        </td>
                        <td style="vertical-align: top; text-align: left">
                         <%--  <CKEditor:CKEditorControl ID="txtK" runat="server" 
                BasePath="~/ckeditor" Width="100%" Height="300px"></CKEditor:CKEditorControl>    --%>      
                 <%--           <FCKeditorV2:FCKeditor ID="ckK" runat="server" BasePath="~/fckeditor/" ToolbarSets="hnweb" ></FCKeditorV2:FCKeditor>--%>
                           <%-- <asp:TextBox ID="txtK" runat="server" CssClass="infoFormTextMulti" TextMode="MultiLine"></asp:TextBox> --%>                   
                           <asp:TextBox ID="txtK" runat="server" CssClass="infoFormTextMulti" TextMode="MultiLine"></asp:TextBox>
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
                </Panes>
                </ajaxToolkit:Accordion>
            &nbsp;
            </td>
        </tr>
    </table>
    </div>
    
</asp:Content>
