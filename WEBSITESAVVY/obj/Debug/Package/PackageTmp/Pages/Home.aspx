<%@ Page Title="Home - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WEBSITESAVVY.Pages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function editClaim(obj) {
            var idClaim = $(obj).attr("idClaim");
//            alert(idClaim);
            var param = "?idClaim=" + idClaim;
            var contentPage = '<iframe src="../Pages/updatecoverhome.aspx' + param + '"></iframe>'
            $("#w_UpdateClaim").html(contentPage);
            $('#w_UpdateClaim').window('open');
            window.scrollTo(0, 0);
            //$("html, body").animate({ scrollTop: 0 }, 500);
        }
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
    <span runat="server" id="tabid" style="display:none">home</span>    <%-- header --%>
   
        <div style="padding-right: 40px" align="right">       
                         
                        <table align="center" width="100%">
                            <tr>
                                <td align="right" width="95%">
                         
                        <asp:TextBox ID="txtTuKhoa" runat="server" CssClass="input" onfocus="Focus(this)" onblur="Blur(this)">Enter your key</asp:TextBox>
                                </td>
                                <td class="righthome" width="5%">
                        <asp:Button ID="btnSearchKey" runat="server" Height="30px" 
                            onclick="btnSearchKey_Click" 
                CssClass="ambitios_submit_button" />
                                </td>
                            </tr>
            </table>
           </div>            
  <div class="ambitios_container_16">
       <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
            
         <fieldset style="width:90%">
            <legend>Claim Search</legend>
            
            <table align="center" width="100%">
                <tr >
                    <td class="left" >
                        <asp:Label ID="Label3" runat="server" Text="Quick Case:" 
                            ForeColor="#CC0000"></asp:Label>
                    &nbsp;:</td>
                    <td class="righthome" width="200px">                   
                        <asp:TextBox ID="txtThamChieu" runat="server" CssClass="input"></asp:TextBox>
                    </td>
                    <td class="righthome">                   
                        <asp:Button ID="btnTiemKiem" runat="server" Height="30px" 
                            onclick="btnTiemKiem_Click" CssClass="ambitios_submit_button" />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                     
                    </td>
                    <td class="righthome">                   
                        &nbsp;</td>
                </tr>
                <tr >
                    <td class="left">
                        <asp:Label ID="Label4" runat="server" Text="Select :"></asp:Label>
                    </td>
                    <td class="righthome" colspan="3">
                         <asp:DropDownList ID="drSort" runat="server" Width="60px">
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
                            Width="100px" onclick="btnView_Click" CssClass="btnThem" />
                        <asp:Button ID="btnPending" runat="server" Height="30px" Text="Pending" 
                            Width="100px" onclick="btnPending_Click" CssClass="btnThem" />
                        <asp:Button ID="btnAll" runat="server" Height="30px" Text="All" 
                            Width="100px" onclick="btnAll_Click" CssClass="btnThem" />
                        <asp:Button ID="btnClosed" runat="server" Height="30px" Text="Closed" 
                            Width="100px" onclick="btnClosed_Click" CssClass="btnThem" />
                    </td>
                </tr>
                <%-- tìm kiếm theo đơn vị BH, tăng rate, giảm rate --%><%--<tr >
                    <td class="left">
                        Đơn Vị Bảo Hiểm : :</td>
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
                </tr>--%>
                
                <tr >
                    <td class="left">
                        Status :</td>
                    <td class="righthome" colspan="2">
                        &nbsp;<asp:DropDownList ID="drStatus" runat="server" Width="200px" 
                            Height="30px" CssClass="input">
                        </asp:DropDownList>
                        <asp:Button ID="btnViewStatus" runat="server" Height="30px" 
                            Width="30px" CssClass="btnShow" onclick="btnViewStatus_Click" />
                        &nbsp;
                        </td>
                    <td class="righthome">
            <asp:Label ID="Label2" runat="server" Text="Follower :" Font-Bold="True"></asp:Label>
        &nbsp;
            <asp:DropDownList ID="drFollower" runat="server" Height="30px" CssClass="input">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFollower" runat="server" onclick="btnFollower_Click" 
                            CssClass="ambitios_submit_button" Height="30px" />
                        </td>
                </tr>                       
                </table>
        </fieldset>  
      <asp:GridView ID="grDSClaim" runat="server" Width="95%" 
            BackColor="White" BorderColor="#003300" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" HorizontalAlign="Center" AutoGenerateColumns="False" 
        EnableCaching="True" CacheDuration="3600" Font-Names="Times New Roman" CssClass="gridtable" 
                onpageindexchanging="grDSClaim_PageIndexChanging" 
                onselectedindexchanged="grDSClaim_SelectedIndexChanged" AllowPaging="True" 
                PageSize="80" DataKeyNames="TenClaim" Font-Size="8px" 
              onrowdatabound="grDSClaim_RowDataBound"> 
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
                <asp:BoundField DataField="Docs" HeaderText="Pending Issues" >
                <ControlStyle Width="150px" />
                <HeaderStyle Font-Bold="True" />
                <ItemStyle Width="15%" Font-Bold="False" />
                </asp:BoundField>
                <asp:BoundField DataField="nextA" HeaderText="Weekly Reviews &amp; Solutions" >
                <ControlStyle Width="30px" />
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle Width="18%" HorizontalAlign="Left" Font-Bold="False" />
                </asp:BoundField>
                  <asp:TemplateField HeaderText="Follower">
                 <HeaderStyle HorizontalAlign="Center" Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
                 <ItemTemplate> <%#Eval("Follower")%></ItemTemplate>
                 <EditItemTemplate>
                    <asp:DropDownList ID="drGDV1" runat="server" Width="150px">               
                    </asp:DropDownList>                               
                    </EditItemTemplate>       
                </asp:TemplateField>            
                <asp:BoundField DataField="Rate" HeaderText="Rate">
                <HeaderStyle Font-Bold="True" />
                <ItemStyle HorizontalAlign="Center" Width="1%" />
                </asp:BoundField>
                <asp:CommandField HeaderText="Detail" ShowSelectButton="True" 
                    ButtonType="Image" SelectImageUrl="~/images/detail_icon.png">
                <ItemStyle Width="1%" HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="Updated">
                <ItemTemplate>
                    <input type="button" class="btn" value="Click" idClaim="<%#DataBinder.Eval(Container.DataItem, "ID_Claim") %>" onclick="editClaim(this)" />         
                </ItemTemplate>
                    <ItemStyle Width="1%" />
                </asp:TemplateField>
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
        <asp:Label ID="lblThongBao" runat="server" Visible="False"></asp:Label>
      </div>
    </div>
  </div>
    <div id="w_UpdateClaim" class="easyui-window" title="Update Case Cover" data-options="modal:false,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;"></div>
</asp:Content>
