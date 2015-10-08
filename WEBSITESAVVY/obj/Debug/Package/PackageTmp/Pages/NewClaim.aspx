<%@ Page Title="NEW CLAIM" Language="C#" MasterPageFile="~/Claim.Master" AutoEventWireup="true" CodeBehind="NewClaim.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewClaim" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style3
        {
            height: 28px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server"/>
     <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">New Claim</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <asp:Panel ID="Panel1" runat="server" GroupingText="New Claim" Width="60%">      
    
        <table width="100%">
            <tr>
                <td colspan="2" align="left" class="style3" 
                    style="color: #FF0000; font-style: italic">
                    (*) : Bắt buộc phải chọn hoặc nhập thông tin</td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label2" runat="server" Text="Surveyor :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drSurveyor" runat="server" AppendDataBoundItems="True" 
                        Width="300px">
                        <asp:ListItem>[Choose Surveyor ...]</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;(*)</td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label3" runat="server" Text="Reference No :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:Label ID="txtMaClaim" runat="server" CssClass="labelleftlong"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label4" runat="server" Text="Insurer :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drInsurer" runat="server" AutoPostBack="True" 
                        CausesValidation="True" onselectedindexchanged="drInsurer_SelectedIndexChanged" 
                        Width="80%">
                        <asp:ListItem>[Choose Insurer]</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;(*)</td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label5" runat="server" Text="Subsidiary :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drSubsidiary" runat="server" AutoPostBack="True" 
                        CausesValidation="True" Width="300px">
                        <asp:ListItem>[Choose Subsidiary]</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;(*) </td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label7" runat="server" Text="Insured :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtInsurerd" runat="server" CssClass="textClaim"></asp:TextBox>
                    &nbsp;(*)</td>
               <%-- <td class="leftmanager">
                    <asp:Label ID="Label6" runat="server" Text="Handler :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtHandler" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>--%>
            </tr>
            <%-- <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label8" runat="server" Text="Address :"></asp:Label>
                </td>
                <td colspan="3" class="rightmanager">
                    <asp:TextBox ID="txtAddress" runat="server" Width="100%" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label9" runat="server" Text="Contact Person :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtContactperson" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label10" runat="server" Text="Phone :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
            </tr>--%>
     <%--       <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label11" runat="server" Text="Email :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label12" runat="server" Text="Fax :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtFax" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
            </tr>--%>
           <%-- <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label13" runat="server" Text="Policy No :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    <asp:Label ID="Label14" runat="server" Text="Effective :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtEffective" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
            </tr>--%>
           <%-- <tr>
                <td class="leftmanager">
                    <asp:Label ID="Label15" runat="server" Text="Premises :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtPresmises" runat="server" CssClass="textClaim"></asp:TextBox>
                    </td>
                <td class="leftmanager">
                    <asp:Label ID="Label16" runat="server" Text="Date of loss :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtDateofloss" runat="server" CssClass="textClaim"></asp:TextBox>
                      <ajaxToolkit:CalendarExtender ID="txtDateofloss_CalendarExtender" runat="server" 
                            TargetControlID="txtDateofloss" Enabled="True" Format="yyyy-MM-dd">
                        </ajaxToolkit:CalendarExtender>   
                </td>
            </tr>--%>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label17" runat="server" Text="Type of loss :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drTypeofloss" runat="server" 
                        Width="300px">
                    </asp:DropDownList>
                    &nbsp;(*)</td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label18" runat="server" Text="Note :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtGhiChu" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label20" runat="server" Text="Assigned Date :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtAssignedDate" runat="server" CssClass="textClaim"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                        Enabled="True" Format="yyyy-MM-dd" TargetControlID="txtAssignedDate">
                    </ajaxToolkit:CalendarExtender>
                   
                </td>
            </tr>
            <tr>
                <td class="leftedit">
                    <asp:Label ID="Label19" runat="server" Text="Type Policy :"></asp:Label>
                </td>
                <td class="rightmanager">
                    <asp:DropDownList ID="drTypePolicy" runat="server">
                        <asp:ListItem Value="PD">Property &amp; Casualty</asp:ListItem>
                        <asp:ListItem Value="EG">Engineering Insurance</asp:ListItem>
                        <asp:ListItem Value="CT">Construction Insurance</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;-
                    <asp:TextBox ID="txtTypePolicy" runat="server" CssClass="textClaim" Width="25%"></asp:TextBox>
                    <asp:Label ID="Label21" runat="server" Font-Italic="True" ForeColor="#999999" 
                        Text="mmdd"></asp:Label>
                    (*)<asp:Label ID="lblThongBaoThieu" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
           <%-- <tr>
                <td class="leftmanager">
                    Circumstances :</td>
                <td class="rightmanager" colspan="3">
                   
                    <br />
                    <CKEditor:CKEditorControl ID="ckDienBienTonThat" runat="server" 
                        BasePath="~/ckeditor" Height="150px" Width="100%"></CKEditor:CKEditorControl>
                </td>
            </tr>--%>
         <%--   <tr>
                <td class="leftmanager">
                    Reportd to the Local Authority (Police) ?</td>
                <td class="rightmanager">
                    <asp:CheckBox ID="ckYes" runat="server" Text="Yes" Width="50px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="ckNo" runat="server" Text="No" Width="50px" />
                </td>
                <td class="leftmanager">
                    Further notes :</td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtFurthernotes" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Extent of Loss :</td>
                <td colspan="3" class="rightmanager">
                   
                    <asp:TextBox ID="ckExtentofloss" runat="server" Height="100px" 
                        TextMode="MultiLine" Width="60%"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Intitial Reserve :</td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtintitialreserve" runat="server" CssClass="textClaim"></asp:TextBox>
                </td>
                <td class="leftmanager">
                    Appendix attached :</td>
                <td class="rightmanager">
                    <asp:TextBox ID="txtappendixattached" runat="server" Width="320px" Height="50px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Loss Mitigating Actions &amp; Recommendation :</td>
                <td colspan="3" class="rightmanager">
                   
                    <br />
                    <CKEditor:CKEditorControl ID="ckDePhongTonThatVaKhuyenCao" runat="server" 
                        BasePath="~/ckeditor" Height="150px" Width="100%"></CKEditor:CKEditorControl>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Loss Adjuster&#39;s Remark :</td>
                <td colspan="3" class="rightmanager">
                  
                    <br />
                    <CKEditor:CKEditorControl ID="ckYKienGDV" runat="server" BasePath="~/ckeditor" 
                        Height="150px" Width="100%"></CKEditor:CKEditorControl>
                </td>
            </tr>
            <tr>
                <td class="leftmanager">
                    Time completed site survey: </td>
                <td colspan="3" class="rightmanager">
                    <asp:TextBox ID="txtTimeComplete" runat="server" CssClass="textClaim"></asp:TextBox>
                     <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                            TargetControlID="txtTimeComplete" Enabled="True" Format="yyyy-MM-dd">
                        </ajaxToolkit:CalendarExtender>   
                </td>
            </tr>--%>
            <tr>
                <td class="leftedit">
                    &nbsp;</td>
                <td class="rightmanager">
                    &nbsp;<asp:Button ID="btnCreatnew" runat="server" CssClass="btn" 
                        onclick="btnCreatnew_Click" Text="Create New" />
                    <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </div>
    </div>
</asp:Content>
