<%@ Page Title="Search - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WEBSITESAVVY.Pages.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/normal.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      
        function Focus(object) {
            object.value = "";
        }

        function Blur(object) {
            if (object.value == "")
                object.value = "Enter your key";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table class="tbgene">
            <tr>
                <td align="center" colspan="3">
                        <asp:Label ID="Label2" runat="server" CssClass="headbaocao" 
                            Text="TÌM KIẾM NÂNG CAO"></asp:Label>
                        </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                        <asp:TextBox ID="txtTuKhoa" runat="server" CssClass="input" onfocus="Focus(this)" onblur="Blur(this)"
                        Width="350px"></asp:TextBox>
                    &nbsp;&nbsp;                   
                        </td>
                <td class="righthome" width="35%">
                        <asp:Button ID="btnTiemKiem" runat="server" Height="30px" 
                            onclick="btnTiemKiem_Click" CssClass="ambitios_submit_button" />
                        </td>
            </tr>
            <tr>
                <td align="right" width="30%" 
                    style="border-bottom-style: groove; border-bottom-width: thin; border-bottom-color: #E8E8E8">
                    <asp:Label ID="Label1" runat="server" Text="Tìm theo :"></asp:Label>
                </td>
                <td colspan="2" 
                    style="border-bottom-style: groove; border-bottom-width: thin; border-bottom-color: #E8E8E8">
                    <asp:RadioButtonList ID="rdTimKiem" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="NDBH">Tên NĐBH</asp:ListItem>
                        <asp:ListItem Value="PolicyName">Quy tắt bảo hiểm</asp:ListItem>
                        <asp:ListItem Value="LHTT">Loại hình tổn thất</asp:ListItem>
                        <asp:ListItem Value="Brief">Tình huống tổn thất</asp:ListItem>
                        <asp:ListItem Value="DKBS">Điều khoản bổ sung</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <div align="center">
      <asp:GridView ID="grDSClaim" runat="server" Width="95%" 
            BackColor="White" BorderColor="#003300" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" 
        EnableCaching="True" CacheDuration="3600" Font-Names="Times New Roman" CssClass="gridtable" 
            DataKeyNames="TenClaim" Font-Size="8px" PageSize="100" 
            onselectedindexchanged="grDSClaim_SelectedIndexChanged"> 
            <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <Columns>
             <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                    <%#Container.DataItemIndex+1 %>
                    <asp:Label ID="lblID_Claim" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_Claim") %>'></asp:Label>
                    </ItemTemplate> 
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" 
                     VerticalAlign="Middle" />
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="TenClaim" HeaderText="Case Name" >
                <ControlStyle Width="100px" />
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle Width="12%" />
                </asp:BoundField>
                <asp:BoundField DataField="Brief" HeaderText="Brief">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                <ItemStyle Width="8%" />
                </asp:BoundField>
                <asp:BoundField DataField="TenKhachHang" HeaderText="Insured" >
                <ControlStyle Width="150px" />
                <HeaderStyle Font-Bold="True" />
                <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Status">
                 <HeaderStyle HorizontalAlign="Center" Width="10%" />
                <ItemStyle HorizontalAlign="Left" />
                 <ItemTemplate> <%#Eval("TenGiaiDoan")%></ItemTemplate>
                 <EditItemTemplate>
                    <asp:DropDownList ID="drStatus" runat="server" Width="150px" >               
                    </asp:DropDownList>                               
                    </EditItemTemplate>       
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Follower">
                 <HeaderStyle HorizontalAlign="Center" Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
                 <ItemTemplate> <%#Eval("Follower")%></ItemTemplate>
                 <EditItemTemplate>
                    <asp:DropDownList ID="drGDV1" runat="server" Width="150px">               
                    </asp:DropDownList>                               
                    </EditItemTemplate>       
                </asp:TemplateField>            
                <asp:CommandField HeaderText="Detail" ShowSelectButton="True" 
                    ButtonType="Image" SelectImageUrl="~/images/detail_icon.png">
                <ItemStyle Width="1%" HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle Font-Names="Tahoma" ForeColor="#003300" HorizontalAlign="Left" 
                VerticalAlign="Top" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006600" BorderColor="#003300" Font-Bold="True" 
                ForeColor="White" Font-Names="Times New Roman" Font-Size="18px" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle HorizontalAlign="Left" 
                VerticalAlign="Top" Font-Bold="False" Font-Names="Times New Roman" 
                Font-Size="14px" BorderColor="#003300" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </div>
</asp:Content>
