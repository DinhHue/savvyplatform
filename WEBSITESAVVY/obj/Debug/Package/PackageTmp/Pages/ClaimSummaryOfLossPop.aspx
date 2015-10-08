<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimSummaryOfLossPop.aspx.cs"
    Inherits="WEBSITESAVVY.Pages.ClaimSummaryOfLossPop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Summary of loss</title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .gridview
        {
            width: 100%;
            border: 1px solid #CDCDCD;
            border-collapse: collapse;
        }
    
        .gridview  td 
        {
            border: 1px solid #CDCDCD;
            padding: 7px 5px 2px 5px;
            height: 25px;
            /*color: #004033;*/
            vertical-align:top;
        }
    </style>
</head>
<body style="padding:0; margin:0">
    <form id="form1" runat="server">
    <div style="padding:5px; margin-bottom:50px;">

        <asp:Panel ID="panelGrid" Visible="true"  runat="server" >
            <asp:GridView ID="grDanhMucThietHaiILA" runat="server" CssClass="gridview" AutoGenerateColumns="False"
                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowediting="grDanhMucThietHaiILA_RowEditing" 
                onrowdeleting="grDanhMucThietHaiILA_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="30%">
                        <HeaderTemplate>
                            <span>NHÓM HẠNG MỤC TỔN THẤT<br />
                                <i>(LOSS / DAMAGED ITEMS)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span><%#DataBinder.Eval(Container.DataItem, "TenHangMuc") %></span>
                            <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("ID") %>' />
                        </ItemTemplate>
                        <HeaderStyle Width="30%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="35%">
                        <HeaderTemplate>
                            <span>Thiệt hại hoàn toàn<br />
                                <i>(Totally Destroyed)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span>
                                <%#DataBinder.Eval(Container.DataItem, "ThietHaiHoanToan") %></span>
                        </ItemTemplate>
                        <HeaderStyle Width="35%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="35%">
                        <HeaderTemplate>
                            <span>Thiệt hại một phần<br />
                                <i>(Partial Damaged)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span>
                                <%#DataBinder.Eval(Container.DataItem, "TrangThai") %></span>
                        </ItemTemplate>
                        <HeaderStyle Width="35%" />
                    </asp:TemplateField>
					<asp:CommandField ButtonType="Image" HeaderText="" ShowEditButton="True" 
						EditImageUrl="../images/edit_icon.png" />
                    <asp:CommandField ButtonType="Image" HeaderText="" ShowDeleteButton="True" 
						DeleteImageUrl="../images/delete_icon.jpg" />
                </Columns>
                <HeaderStyle BackColor="#F1F1F1" ForeColor="#333333" Font-Bold="True" />
                <RowStyle BackColor="#F2F2F2" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>


            <asp:GridView ID="grDanhMucThietHaiSR01" runat="server" CssClass="gridview" AutoGenerateColumns="False"
                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowediting="grDanhMucThietHaiSR01_RowEditing" 
                onrowdeleting="grDanhMucThietHaiSR01_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="25%">
                        <HeaderTemplate>
                            <span>HẠNG MỤC TÀI SẢN<br />
                                <i>(PROPERTY'S ITEMS)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span><%#DataBinder.Eval(Container.DataItem, "TenHangMuc") %></span>
                            <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("ID") %>' />
                        </ItemTemplate>
                        <HeaderStyle Width="25%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="45%">
                        <HeaderTemplate>
                            <span>Tình trạng thiệt hại/Phương án khắc phục<br />
                                <i>(Brief description of damage/ Avilable measurements)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span>
                                <%#DataBinder.Eval(Container.DataItem, "TinhTrangChung")%></span>
                        </ItemTemplate>
                        <HeaderStyle Width="45%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="5%">
                        <HeaderTemplate>
                            <span>Thiệt hại hoàn toàn<br />
                                <i>(Destroyed)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span style="text-align:center;display:block"><input type="checkbox"
                            <%#(Eval("TinhTrang").ToString().ToUpper() == "YES" ? "Checked" : "")%>  /></span>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="25%">
                        <HeaderTemplate>
                            <span>Ý kiến của GDV<br />
                                <i>(Remark)</i></span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span>
                                <%#DataBinder.Eval(Container.DataItem, "YKienGDV") %></span>
                        </ItemTemplate>
                        <HeaderStyle Width="25%" />
                    </asp:TemplateField>
					<asp:CommandField ButtonType="Image" HeaderText="" ShowEditButton="True" 
						EditImageUrl="~/images/edit_icon.png" />
                    <asp:CommandField ButtonType="Image" HeaderText="" ShowDeleteButton="True" 
						DeleteImageUrl="../images/delete_icon.jpg" />
                </Columns>
                <HeaderStyle BackColor="#F1F1F1" ForeColor="#333333" Font-Bold="True" />
                <RowStyle BackColor="#F2F2F2" />
            </asp:GridView>

           <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD; text-align:center">
                 <asp:Button ID="btnCreateNew" runat="server" CssClass="btn" 
                    onclick="btnCreatnew_Click" Text="Create New" />
            </div>

        </asp:Panel>

        <asp:Panel runat="server" Height="100%" ID="panelAddEdit" Visible="false" >
            <table width="100%" style="text-align: center;">
                <tr>
                    <td colspan="2" align="left" style="color: #FF0000; font-style: italic">
                        (*) : Bắt buộc phải chọn hoặc nhập thông tin <asp:HiddenField ID="hiddenDanhMucID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label2" runat="server" Text="Damaged :"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:DropDownList ID="drDamaged" runat="server" AppendDataBoundItems="True" Width="300px"
                            CssClass="input">
                            <asp:ListItem Value="0" Text="[Choose Damaged ...]" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label4" runat="server" Text="Tình Trạng"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:CheckBox ID="checkTinhTrang" runat="server" />
                        &nbsp;<asp:Label ID="Label6" runat="server" Font-Italic="True" ForeColor="#339933" 
                            Text="(Check nếu tình trạng thiệt hại hoàn toàn)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label9" runat="server" 
                            Text="Mô Tả tình trạng chung &lt;br/&gt;(Brief description of damage)"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:TextBox ID="txtMoTaChung" runat="server" CssClass="input" Rows="5" 
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label10" runat="server" Font-Italic="True" Font-Size="12px" 
                            ForeColor="#339933" Text="(Mô tả tình trạng thiệt hại theo hạng mục)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label1" runat="server" 
                            Text="Thiệt hại hoàn toàn&lt;br/&gt;(Totally Destroyed)"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:TextBox ID="txtTotally" runat="server" CssClass="input" Rows="5" 
                            TextMode="MultiLine" Width="300px"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label7" runat="server" Font-Italic="True" Font-Size="12px" 
                            ForeColor="#339933" Text="(Mô tả tình trạng thiệt hại hoàn toàn)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label3" runat="server" Text="Thiệt hại một phần<br/>(Partial Destroyed)"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:TextBox ID="txtPartial" TextMode="MultiLine" Rows="5" 
                            runat="server" CssClass="input" Width="300px" ></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="12px" 
                            ForeColor="#339933" Text="(Mô tả tình trạng thiệt hại một phần)"></asp:Label>
                    </td>
                </tr>
				<tr>
                    <td class="leftmanager">
                        <asp:Label ID="Label5" runat="server" Text="Ý kiến giám định viên"></asp:Label>
                    </td>
                    <td align="left" width="70%">
                        <asp:TextBox ID="txtYKienGDV" TextMode="MultiLine" Rows="5" 
                            runat="server" CssClass="input" Width="300px" ></asp:TextBox>
                    </td>
                </tr>
				
				
                <tr>
                    <td class="leftmanager">   </td>
                    <td class="rightmanager">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
            </table>


            <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD; text-align:center">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn" 
                        Text="Add" onclick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                        Text="Update" onclick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn" 
                        Text="Cancel" onclick="btnCancel_Click" />
            </div>

            
        </asp:Panel>

    </div>

    </form>
</body>
</html>
