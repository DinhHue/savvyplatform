<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Pages/Site1.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WEBSITESAVVY.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
         <%-- <h1 class="ambitios_uppercase">Login</h1>--%>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
      <div class="box-right-form" style="height: 500px">
  <div style="margin:0;padding:0;display:inline">
  </div>
    <input id="to" name="to" value="themeforest" type="hidden"/>
    <div class="error-container">
        <a>
        <img alt="" src="../images/login.jpg" width="90px" /></a></div>
<div class="input-group ill-input initialised" style="padding: 10px">
  <label for="user_username">Username</label>&nbsp;
                <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="textEntry" 
                    Width="250px" Height="25px"></asp:TextBox>
    <br />
</div>
<div class="input-group ill-input initialised" style="padding: 10px">
  <label for="user_password">Password</label>&nbsp;
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="passwordEntry" 
                    TextMode="Password" Width="250px" Height="25px"></asp:TextBox>
</div>

<div class="captcha-container">
  <div id="captcha" class="is-hidden-js">
    
  </div>
</div>

<div class="input-group">
  &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDangNhap" runat="server" onclick="btnDangNhap_Click" 
                    Text="Login" CssClass="btn" Height="30px" Width="200px" />
          <br />
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Pages/KhoiPhucMatKhau.aspx">Forgot Password</asp:HyperLink>
                    <br />
                    <asp:Label ID="lblThongBao" runat="server"></asp:Label>
</div>

</div>
      </div>
      </div>
      </div>
    <%--<table align="center" class="login">
        <tr>
            <td align="right" width="20%" >
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập :"></asp:Label>
            </td>
            <td class="rightmanager" width="70%">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" width="20%" >
                <asp:Label ID="Label2" runat="server" Text="Mật khẩu :" BorderColor="Black"></asp:Label>
            </td>
            <td class="rightmanager" width="70%">
                &nbsp;</td>
        </tr>
        <tr>
            <td width="20%">
                &nbsp;</td>
            <td class="rightmanager" width="70%">
&nbsp;<asp:Label ID="lblThongBao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Website thông tin</td>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="http://savvyadjusters.com.vn/">Savvyadjusters.com.vn</asp:HyperLink>
            </td>
        </tr>
    </table>--%>
  
    <%--<asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
        RenderOuterTable="false" onauthenticate="LoginUser_Authenticate">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                        ValidationGroup="LoginUserValidationGroup" />
                  
                </p>
            </div>
              
        </LayoutTemplate>
    </asp:Login>
    <asp:Label ID="lblThongbao" runat="server"></asp:Label>--%>
</asp:Content>
