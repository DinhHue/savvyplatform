<%@ Page Title="Memos - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="QuiTrinhOffice.aspx.cs" Inherits="WEBSITESAVVY.Pages.QuiTrinhOffice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<span runat="server" id="tabid" style="display:none">memos</span>
<%-- <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 ></h1>
        </div>
      </div>
    </div>
  </div>--%>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
<table align="center" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 12px; vertical-align: top; text-align: justify" 
                    width="85%">
    <tr>
        <td align="center">
           <asp:Label ID="lblTieuDe" runat="server" Font-Bold="True" Font-Size="20pt" 
                Font-Italic="False" Font-Names="Times New Roman" ForeColor="#003300"></asp:Label></td>
        <td align="center" rowspan="5" width="15%" 
            style="font-size: 16px; vertical-align: top;">
            <asp:Label ID="Label25" runat="server" Font-Bold="True" Text="Tag Name"></asp:Label>
            <br />
            <input onclick="SetAllStateCheckBoxList('<%=cklistGDV.ClientID %>',true)" 
                type="button" class="btnCheck" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input onclick="SetAllStateCheckBoxList('<%=cklistGDV.ClientID %>',false)" 
                type="button" class="btnUncheck" />
            <br />
            <asp:CheckBoxList ID="cklistGDV" runat="server" 
                onselectedindexchanged="cklistGDV_SelectedIndexChanged">
            </asp:CheckBoxList>
            <br />
            <asp:Button ID="btnSendtag" runat="server" onclick="btnSendtag_Click" 
                Text="Send" />
        </td>
    </tr>   
    <tr>
        <td align="right" style="padding-right: 50px">
            <asp:Label ID="Label2" runat="server" Font-Bold="False" Text="Ngày đăng :" 
                Font-Names="Times New Roman"></asp:Label>
            <asp:Label ID="lblNgayDang" runat="server" Font-Bold="False" 
                Font-Names="Times New Roman"></asp:Label>
        </td>
    </tr>   
    <tr>
        <td align="justify" style="font-size: 16px">
           
            <asp:Label ID="lblNoiDung" runat="server" Font-Bold="False" 
                Font-Names="Times New Roman"></asp:Label>
           
        </td>
    </tr>
    <tr>
        <td align="left" 
            
            style="border-width: thin; border-color: #000066; padding-right: 50px; padding-left: 50px; font-size: 12px; border-top-style: groove;">
            Xem&nbsp; memo khác.<br />
            <asp:Repeater ID="rpMemoOther" runat="server">
             <HeaderTemplate>
                <table width="100%">
                   
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="font-size:16px">
                    <td style="text-align: left; padding-left: 40px; font-weight: normal; font-family:Times New Roman;" >
                     <a style="color: Blue" href="../Pages/QuiTrinhOffice.aspx?idprocedure=<%# DataBinder.Eval (Container.DataItem, "ID_QuiTrinh") %>">
                            <%# DataBinder.Eval(Container.DataItem, "TieuDe").ToString()%></a> 
                    </td>
                 
                </tr>                          
             
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>
    </div>
    </div>
    </div>
</asp:Content>
