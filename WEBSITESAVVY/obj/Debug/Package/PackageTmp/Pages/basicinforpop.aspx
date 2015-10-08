<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basicinforpop.aspx.cs" Inherits="WEBSITESAVVY.Pages.basicinforpop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div>
    
        <table width="100%">
            <tr>
                <td class="leftpop">
                    Insure</td>
                <td class="rightpop">
                    <asp:DropDownList ID="drNBH" runat="server" CssClass="input" 
                        onselectedindexchanged="drNBH_SelectedIndexChanged" Width="50%" 
                        AutoPostBack="True" CausesValidation="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtNBH" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Subdiary</td>
                <td class="rightpop">
                    <asp:DropDownList ID="drDonvi" runat="server" CssClass="input" Width="50%" 
                        AutoPostBack="True" CausesValidation="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtDonVi" runat="server" CssClass="input" Width="80%"></asp:TextBox>
                    <asp:Button ID="btnChangeInsurer" runat="server" CssClass="btn" 
                        onclick="btnChangeInsurer_Click" Text="Change" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn" 
                        onclick="btnCancel_Click" Text="Cancel" />
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Insured</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtTenKhachHang" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Adress</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Trade</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtKinhDoanh" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Contact person</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtNguoiDaiDien" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Phone &amp; Fax No.</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input" Width="30%"></asp:TextBox>
&nbsp;-
                    <asp:TextBox ID="txtFax" runat="server" CssClass="input" Width="30%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Email</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Policy no.</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtPolicyNo" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Effective</td>
                <td class="rightpop">
                    &nbsp;<asp:TextBox ID="txtPeriodfrom" runat="server" CssClass="input" 
                        Width="50%"></asp:TextBox>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="leftpop">
                    Premises</td>
                <td class="rightpop">
                    <asp:TextBox ID="txtPremises" runat="server" CssClass="input" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Date of loss</td>
                <td width="100%" class="rightpop">
                    <asp:TextBox ID="txtDateofloss" runat="server" CssClass="input" Width="30%"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtDateofloss_CalendarExtender" runat="server" 
            TargetControlID="txtDateofloss" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="leftpop">
                    Type of loss</td>
                <td width="100%" class="rightpop">
                    <asp:DropDownList ID="drloaihinhtonthat" runat="server" CssClass="input" Width="50%" 
                        AutoPostBack="True" CausesValidation="True">
                    </asp:DropDownList>
                    <asp:TextBox ID="txttenloaihinhtt" runat="server" CssClass="input" Width="50%"></asp:TextBox>
                                        <asp:Button ID="btnchangLHTT" runat="server" CssClass="btn" 
                        onclick="btnchangLHTT_Click" Text="Change" />
                    <asp:Button ID="btncanclelhtt" runat="server" CssClass="btn" 
                        onclick="btncanclelhtt_Click" Text="Cancel" />
                
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="rightpop">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                        onclick="btnUpdate_Click" Text="Update" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
