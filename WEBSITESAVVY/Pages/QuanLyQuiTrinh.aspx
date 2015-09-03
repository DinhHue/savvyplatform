<%@ Page Title="Memos List - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="QuanLyQuiTrinh.aspx.cs" Inherits="WEBSITESAVVY.Pages.QuanLyQuiTrinh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
      <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<span runat="server" id="tabid" style="display:none">memos</span>

  <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">INTERNAL&nbsp; MEMOS</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
    <table align="center" width="80%">
       <%-- <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="26px" 
                    ForeColor="#003300" Text="QUI TRÌNH NỘI BỘ"></asp:Label>
            </td>
        </tr>--%>
        <tr>
            <td align="right">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Button ID="btnThem" runat="server" Text="Thêm mới" 
                    onclick="btnThem_Click" CssClass="btnThem" />
            </td>
        </tr>
        <tr>
            <td align="center">
                 <div>
        <asp:Repeater ID="rpTinTuc" runat="server">
            <HeaderTemplate>
                <table width="100%">
                   
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="font-size:16px">
                    <td style="text-align: left; padding-left: 40px; font-weight: bold;  font-family:Times New Roman; color: #003300;" >
                      <a style="color: Blue" href="../Pages/QuiTrinhOffice.aspx?idprocedure=<%# DataBinder.Eval (Container.DataItem, "ID_QuiTrinh") %>">
                           <%# DataBinder.Eval(Container.DataItem, "TieuDe").ToString()%></a>
                    </td>
                    </tr>
                    <tr >
                    <td style="text-align: left; padding-left: 40px;font-weight: normal; font-family:Times New Roman;">
                       <%# DataBinder.Eval (Container.DataItem, "TomTat").ToString()%>  
                       <a style="color: Blue" href="../Pages/QuiTrinhOffice.aspx?idprocedure=<%# DataBinder.Eval (Container.DataItem, "ID_QuiTrinh") %>">
                            ... xem chi tiết</a>
                    </td>
                    <%--<td style="text-align: left; padding-right:30px; width:100px; font-family:Times New Roman;">
                    <a style="color: Blue" href="../Pages/QuiTrinhOffice.aspx?idprocedure=<%# DataBinder.Eval (Container.DataItem, "ID_QuiTrinh") %>">
                            Xem Chi Tiết</a>
                    </td>--%>
                </tr>                          
             
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div style="overflow: hidden; text-align: center;">
            <asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand1"
                EnableTheming="True" ViewStateMode="Enabled">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPage" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                        runat="server" CssClass="phantrang"><%# Container.DataItem %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
</asp:Content>
