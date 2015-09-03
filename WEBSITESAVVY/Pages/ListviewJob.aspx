<%@ Page Title="Worked Daily" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListviewJob.aspx.cs" Inherits="WEBSITESAVVY.Pages.ListviewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
             <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">all work of claim case</h1>
        </div>
      </div>
    </div>
  </div>
   <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">      
      <div class="box-right-form">
    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
              Width="98%">
        <ajaxToolkit:TabPanel runat="server" HeaderText="TO DAY" ID="TabPanel1">
        <HeaderTemplate>
        WORKED DAILY MANAGEMENT OVERVIEW
        </HeaderTemplate>
        <ContentTemplate>
        <div align="center">
        <asp:SqlDataSource ID="employeesDataSource" Runat="server" 
          SelectCommand= "select cl.ID_Claim, cl.TenClaim,kh.TenKhachHang from Claim cl, KhachHang kh where cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh<>26  and cl.ID_GiaiDoanHoanThanh<>46 order by ID_Claim"
            ConnectionString="<%$ ConnectionStrings:SAVVYConnectionString %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="territoriesDataSource" Runat="server" 
SelectCommand="select cl.ID_Claim, CONVERT(VARCHAR(25), j.NgayThucHien, 20) as [NgayThucHien], j.NameJob from JobList j inner join Claim cl on cl.ID_Claim=j.ID_Claim"
            ConnectionString="<%$ ConnectionStrings:SAVVYConnectionString %>">
        </asp:SqlDataSource>
        
        <asp:GridView ID="employeesGridView" Runat="server" 
            DataSourceID="employeesDataSource"
            AutoGenerateColumns="False" BorderWidth="1px" 
            BackColor="White" GridLines="Horizontal"
            CellPadding="3" BorderStyle="None" BorderColor="#E7E7FF" 
            OnRowDataBound="employeesGridView_RowDataBound" DataKeyNames="ID_Claim" 
            Width="90%" Font-Names="Times New Roman">
            <FooterStyle ForeColor="#4A3C8C" 
             BackColor="#B5C7DE"></FooterStyle>
            <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" 
             BackColor="#E7E7FF"></PagerStyle>
            <HeaderStyle ForeColor="#F7F7F7" Font-Bold="True" 
             BackColor="#003300" Font-Size="18px"></HeaderStyle>
            <AlternatingRowStyle BackColor="#F7F7F7"></AlternatingRowStyle>
            <Columns>
              <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Reference" 
                 DataField="TenClaim" 
                 SortExpression="TenClaim">
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                </asp:BoundField>
                <asp:BoundField DataField="TenKhachHang" HeaderText="Name'Insured" 
                    SortExpression="TenKhachHang" >
                     <ItemStyle HorizontalAlign="Left" Width="30%" />
                </asp:BoundField>
                     <asp:TemplateField HeaderText="Work Date"><ItemTemplate>
                    <asp:BulletedList ID="bltNgayThucHien" 
                      Runat="server" DataTextField="NgayThucHien"
                        DataValueField="NgayThucHien">
                    </asp:BulletedList>
                </ItemTemplate>
                         <ItemStyle HorizontalAlign="Left" Width="20%" />
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description"><ItemTemplate>
                    <asp:BulletedList ID="bltTerritories" 
                      Runat="server" DataTextField="NameJob"
                        DataValueField="NameJob">
                    </asp:BulletedList>
                </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle ForeColor="#F7F7F7" Font-Bold="True" 
             BackColor="#738A9C"></SelectedRowStyle>
            <RowStyle ForeColor="#003300" BackColor="#E7E7FF" Font-Size="16px"></RowStyle>
        </asp:GridView>
    
    </div>
        </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                 <HeaderTemplate>
      ALL OF WORk FOR TODAY
        </HeaderTemplate>
        <ContentTemplate>
        <div align="center">
        <p><asp:Label ID="Label1" runat="server" Text="TASK OF LA MUST TO DO IN TODAY" 
                Font-Bold="True" Font-Size="16px" ForeColor="#003300"></asp:Label> - <asp:Label ID="lblNgay" runat="server" Text="" 
                Font-Bold="True" Font-Size="16px" ForeColor="#003300"></asp:Label></p>
            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
        <asp:GridView ID="grViewAllWorkToday" runat="server" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#003300" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Size="16px" 
                Width="90%" Font-Names="Times New Roman">
                <Columns>
                   <asp:TemplateField HeaderText="No.">
                <ItemTemplate> 
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate> 
                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                </asp:TemplateField>
                    <asp:BoundField DataField="ID_Claim" HeaderText="No. Case">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenKhachHang" HeaderText="Insured">
                    <ItemStyle Width="25%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenGDV" HeaderText="LA">
                    <ItemStyle Width="10%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameJob" HeaderText="Description" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#006600" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003300" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
    </div>
        </ContentTemplate>
    
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
 </div>
 </div>
 </div>
 </div>
</asp:Content>
