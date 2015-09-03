<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homem.aspx.cs" Inherits="WEBSITESAVVY.mobile.Homem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <table align="center">
                <tr >
                    <td class="left">
                        <asp:Label ID="Label3" runat="server" Text="Mã Tham Chiếu"></asp:Label>
                    &nbsp;:</td>
                    <td class="righthome" colspan="2">
                        <asp:TextBox ID="txtThamChieu" runat="server" CssClass="textEntry"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnTiemKiem" runat="server" Height="30px" Text="Search" 
                            Width="100px" onclick="btnTiemKiem_Click" CssClass="btn" />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td class="left">
                        <asp:Label ID="Label4" runat="server" Text="Select :"></asp:Label>
                    </td>
                    <td class="righthome" colspan="2">
                        &nbsp;<asp:DropDownList ID="drSort" runat="server" Width="60px">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                        </asp:DropDownList>
&nbsp;&nbsp;
                        <asp:Button ID="btnView" runat="server" Height="30px" Text="View" 
                            Width="100px" onclick="btnView_Click" CssClass="btn" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnPending" runat="server" Height="30px" Text="Pending" 
                            Width="100px" onclick="btnPending_Click" CssClass="btn" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAll" runat="server" Height="30px" Text="All" 
                            Width="100px" onclick="btnAll_Click" CssClass="btn" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnClosed" runat="server" Height="30px" Text="Closed" 
                            Width="100px" onclick="btnClosed_Click" CssClass="btn" />
                    </td>
                </tr>
                <tr >
                    <td class="left">
                        Đơn Vị Bảo Hiểm :</td>
                    <td class="righthome" colspan="2">
                        <asp:DropDownList ID="drDonViBH" runat="server" Width="15%">
                        </asp:DropDownList>
&nbsp;&nbsp;
                        <asp:Button ID="btnXemDonViBH" runat="server" Height="30px" Text="View" 
                            Width="100px" CssClass="btn" onclick="btnXemDonViBH_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnDownrate" runat="server" Height="30px" Text="- Rate" 
                            Width="100px" CssClass="btn" onclick="btnDownrate_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnUprate" runat="server" Height="30px" Text="+ Rate" 
                            Width="100px" CssClass="btn" onclick="btnUprate_Click" />
                        &nbsp;</td>
                </tr>
                
                <tr >
                    <td class="left">
                        Status :</td>
                    <td class="righthome">
                        &nbsp;<asp:DropDownList ID="drStatus" runat="server" Width="25%">
                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnViewStatus" runat="server" Height="30px" Text="View" 
                            Width="100px" CssClass="btn" onclick="btnViewStatus_Click" />
                        &nbsp;
                        </td>
                    <td class="righthome">
            <asp:Label ID="Label2" runat="server" Text="Follower :" Font-Bold="True"></asp:Label>
        &nbsp;
            <asp:DropDownList ID="drFollower" runat="server">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFollower" runat="server" onclick="btnFollower_Click" 
                Text="Search" CssClass="btn" />
                        </td>
                </tr>
                <tr align="right">
                    <td align="center" colspan="3" class="headerViewform">
                        &nbsp;</td>
                </tr>
                <tr align="right">
                    <td align="center" colspan="3" class="headerViewform">
        <asp:Label ID="Label1" runat="server" 
            Text="DANH SÁCH CÁC CLAIM" Font-Bold="True" 
            Font-Size="Larger" Font-Names="Times New Roman" ForeColor="#006600"></asp:Label>
                    </td>
                </tr>
                <tr align="right">
                    <td align="center" colspan="3">
        <asp:GridView ID="grDSClaim" runat="server" Width="95%" 
            BackColor="White" BorderColor="#003300" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" 
        EnableCaching="True" CacheDuration="3600" Font-Names="Tahoma" CssClass="center" 
                onpageindexchanging="grDSClaim_PageIndexChanging" 
                onselectedindexchanged="grDSClaim_SelectedIndexChanged" AllowPaging="True" 
                PageSize="50" DataKeyNames="TenClaim" onrowcancelingedit="grDSClaim_RowCancelingEdit" 
                            onrowediting="grDSClaim_RowEditing" onrowupdating="grDSClaim_RowUpdating"> 
            <AlternatingRowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <Columns>
             <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="TenClaim" HeaderText="CASE NAME" >
                <ControlStyle Width="100px" />
                <ItemStyle Width="12%" />
                </asp:BoundField>
                <asp:BoundField DataField="Brief" HeaderText="BRIEF"></asp:BoundField>
                <asp:BoundField DataField="TenKhachHang" HeaderText="INSURED" >
                <ControlStyle Width="150px" />
                <ItemStyle Width="15%" />
                </asp:BoundField>
                <asp:BoundField DataField="AssignedDate" HeaderText="ASSIGED DATE" >
                <ControlStyle Width="30px" />
                <ItemStyle Width="8%" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TenGiaiDoan" HeaderText="STATUS">
                <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Docs" HeaderText="DOCS" >
                <ControlStyle Width="150px" />
                <ItemStyle Width="15%" />
                </asp:BoundField>
                <asp:BoundField DataField="Follower" HeaderText="Follower">
                <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Rate" HeaderText="Rate">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" />
                <asp:CommandField HeaderText="DETAIL" ShowSelectButton="True" 
                    ButtonType="Button">
                <ItemStyle Width="50px" HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle Font-Names="Tahoma" ForeColor="#003300" HorizontalAlign="Left" 
                VerticalAlign="Top" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#339933" BorderColor="#003300" Font-Bold="False" 
                ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle HorizontalAlign="Left" 
                VerticalAlign="Top" Font-Bold="False" Font-Names="Times New Roman" 
                Font-Size="14px" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        
                    </td>
                </tr>
            </table>
            
        
        <br />
        <div class="center" dir="ltr">
            <asp:Label ID="lblThongBao" runat="server" Visible="False"></asp:Label>
        <br />
        
        </div>
</asp:Content>
