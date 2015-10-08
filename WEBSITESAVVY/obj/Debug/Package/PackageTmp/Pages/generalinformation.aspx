<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="generalinformation.aspx.cs" Inherits="WEBSITESAVVY.Pages.generalinformation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/normal.css" rel="stylesheet" type="text/css" />
 
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="tbgene">
            <tr>
                <td colspan="4" class="headrow">
                    GENERAL INFORMATION</td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label1" runat="server" Text=" Status" CssClass="lblable"></asp:Label>  
                    </td>
                <td class="style2">
                    <asp:Label ID="lblStatus" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label2" runat="server" Text="  Our ref"></asp:Label>  </td>
                <td class="style2">
                    <asp:Label ID="lblThamChieu" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                    <br />
                    <asp:Label ID="lblBrief" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label3" runat="server" Text="Insurer"></asp:Label> </td>
                <td class="colleftcont">
                    <asp:Label ID="lblInsurer" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label4" runat="server" Text="Policy No."></asp:Label>    </td>
                <td class="colricont">
                    <asp:Label ID="lblPolicyNo" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label5" runat="server" Text="Subsidiary"></asp:Label>  </td>
                <td class="colleftcont">
                    <asp:Label ID="lblSubsidiary" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label6" runat="server" Text="Effective"></asp:Label>     </td>
                <td class="colricont">
                    <asp:Label ID="lblEffective" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    &nbsp;</td>
                <td class="colleftcont">
                    &nbsp;</td>
                <td class="colrilbale">
                    <asp:Label ID="Label7" runat="server" Text="Type of policy"></asp:Label>  </td>
                <td class="colricont">
                    <asp:Label ID="lblTypeofPolicy" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label8" runat="server" Text="The insured"></asp:Label>   </td>
                <td class="colleftcont">
                    <asp:Label ID="lblInsured" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label9" runat="server" Text="Address"></asp:Label>     </td>
                <td class="colricont">
                    <asp:Label ID="lblAdress" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label10" runat="server" Text="Contact person"></asp:Label>  </td>
                <td class="colleftcont">
                    <asp:Label ID="lblNguoiDaiDien" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label11" runat="server" Text="Phone no."></asp:Label> </td>
                <td class="colricont">
                    <asp:Label ID="lblDienThoai" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label12" runat="server" Text="Loss premises"></asp:Label>   </td>
                <td class="colleftcont">
                    <asp:Label ID="lblDiadiemTonThat" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label13" runat="server" Text=" Date of loss"></asp:Label> </td>
                <td class="colricont">
                    <asp:Label ID="lblDateofloss" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label14" runat="server" Text="Type of loss"></asp:Label> </td>
                <td class="colleftcont">
                    <asp:Label ID="lblTypeofloss" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label15" runat="server" Text=" Date of instruction"></asp:Label>  </td>
                <td class="colricont">
                    <asp:Label ID="lblDateofinstruction" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="headrow">
                    FINANCIALS</td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label16" runat="server" Text="Sum insured"></asp:Label>  </td>
                <td class="colleftcont">
                    <asp:Label ID="lblSuminsured" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label17" runat="server" Text="Loss Estimate"></asp:Label></td>
                <td class="colricont">
                    <asp:Label ID="lbllossestimate" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label18" runat="server" Text="Deductible"></asp:Label></td>
                <td class="colleftcont">
                    <asp:Label ID="lblDeductible" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label19" runat="server" Text="Reserve"></asp:Label>  </td>
                <td class="colricont">
                    <asp:Label ID="lblReserve" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    <asp:Label ID="Label20" runat="server" Text="Claimed sum"></asp:Label>     </td>
                <td class="colleftcont">
                    <asp:Label ID="lblClaimsum" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
                <td class="colrilbale">
                    <asp:Label ID="Label21" runat="server" Text="Payment on accounts"></asp:Label> </td>
                <td class="colricont">
                    <asp:Label ID="lblpayment" runat="server" CssClass="field_input" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colleftlable">
                    &nbsp;</td>
                <td class="colleftcont">
                    &nbsp;</td>
                <td class="colrilbale">
                    <asp:Label ID="Label22" runat="server" Text="Settlement"></asp:Label></td>
                <td class="colricont">
                    <asp:Label ID="lblsettlement" runat="server" CssClass="field_input" 
                        Width="100%"></asp:Label>
                </td>
            </tr>
             </table>

             <table class="tbgene">
            <tr>
                <td colspan="4" class="headrow">
                    REPORTING</td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label23" runat="server" Text="SR01 - Site survey record"></asp:Label> </td>
            
                <td class="rightcol">
                    <asp:Label ID="lblSR01date" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label24" runat="server" Text="ILA - Initial Loss Advice"></asp:Label>   </td>
               
                <td class="rightcol">
                    <asp:Label ID="lblILAdate" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label25" runat="server" Text="PR - Preliminary Report"></asp:Label>    </td>
              
                <td class="rightcol">
                    <asp:Label ID="lblPRDate" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label26" runat="server" Text=" IR - Interim Report"></asp:Label>  </td>
               
                <td class="rightcol">
                    <asp:Label ID="lblIRdate" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label27" runat="server" Text="FR - Final report"></asp:Label> </td>
              
                <td class="rightcol">
                    <asp:Label ID="lblFRdate" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="leftcol">
                    <asp:Label ID="Label28" runat="server" Text="FFR - First Final Report"></asp:Label>     </td>
              
                <td class="rightcol">
                    <asp:Label ID="lblFFRdate" runat="server" CssClass="field_input" Width="50%"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
