<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docsrequestn.aspx.cs" Inherits="WEBSITESAVVY.Pages.docsrequestn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
          <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
  <style type="text/css">
    .header
    {    
              background-color:#006600;
             color:White;
             text-align:center;      
             font-weight: bold; 
             border: 1px solid #CDCDCD ;  
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
       
    </style>
    <%--  <script language="javascript" type="text/javascript">
          tinyMCE.init({
              forced_root_block: "",
              mode: "textareas",
              theme: "advanced",
              plugins: "safari,style,layer,table",
              theme_advanced_buttons1: "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,formatselect,fontselect,fontsizeselect|,bullist,numlist,|,undo,redo,|,forecolor,backcolor",
              theme_advanced_toolbar_location: "top",
              theme_advanced_toolbar_align: "left",
              theme_advanced_statusbar_location: "bottom",
              theme_advanced_resizing: false,
          });

   </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        <fieldset style="width:90%">
            <legend>Insert Items</legend>      
    <table width="90%">
        <tr>
            <td colspan="2" class="headerViewform">
                DOCUMENT REQUEST LIST</td>
        </tr>
        <tr>
            <td class="leftdr">
                <asp:Label ID="Label41" runat="server" Text="Type DR :"></asp:Label>
            </td>
            <td class="righttdr">
                <asp:DropDownList ID="drTypeDR" runat="server" Width="80%" 
                    onselectedindexchanged="drTypeDR_SelectedIndexChanged" AutoPostBack="True" 
                    CausesValidation="True" CssClass="input">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="leftdr">
                <asp:Label ID="Label43" runat="server" Text="Items DR :"></asp:Label>
            &nbsp;</td>
            <td class="righttdr">
                <asp:DropDownList ID="drItems" runat="server" Width="80%" CssClass="input" 
                    AutoPostBack="True" CausesValidation="True">
                </asp:DropDownList>
                &nbsp;
                </td>
        </tr>
        <tr>
            <td class="leftdr">
                <asp:Label ID="Label42" runat="server" Text="Description :"></asp:Label>
            </td>
            <td class="righttdr" width="80%">
                <asp:TextBox ID="txtItem" runat="server" CssClass="input" TextMode="MultiLine" 
                    Width="100%"></asp:TextBox>
&nbsp;
                </td>
        </tr>
        <tr>
            <td class="leftdr">
                &nbsp;</td>
            <td class="righttdr">
                <asp:Button ID="btnThem" runat="server" CssClass="btn" Text="Add" 
                    onclick="btnThem_Click" />
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" 
                    onclick="btnUpdate_Click" Text="Edit Docs Request" />
            &nbsp;<asp:Button ID="btnView" runat="server" CssClass="btn" 
                    onclick="btnView_Click" Text="View Docs Request" />
            </td>
        </tr>
        </table>
         </fieldset>
         <table width="100%">
        <tr>
            <td colspan="3">
                <asp:GridView ID="gvDRList" runat="server" AutoGenerateColumns="False" 
                            onrowcreated="gvDRList_RowCreated" 
                            ShowHeader="False" Width="100%" onrowdatabound="gvDRList_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText=" No.">
                                    <ItemTemplate>
                                        <div style="text-align:center">
                                            <asp:Label ID="lblSTT" runat="server" Font-Bold="true" Text=""></asp:Label>
                                            <asp:Label ID="lblmaLoaiDR" runat="server" 
                                                Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiDR") %>' Visible="false"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hạng mục / Items">
                                    <ItemTemplate>
                                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoai")%></b></span>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tình Trạng / Status">
                                    <ItemTemplate>
                                        <asp:Repeater ID="repeaterChild" runat="server">
                                            <ItemTemplate>                                              
                                                <tr>
                                                    <td align="center" width="5%"><%# Container.ItemIndex + 1 %></td>
                                                    <td align="left" width="65%"><%# Eval("NameItem")%> <%# "<" %> <%# Eval("TenDR")%> <%# ">" %></td>
                                                    <td align="center" width="30%"><%# "<" %> <%#  Eval("TinhTrang ") %> <%# Eval(" NgayNhan")%> <%# ">" %></td>
                                                </tr>                 
                                    </ItemTemplate>
                                      </asp:Repeater>
                                    </ItemTemplate>
                                    <ItemStyle Width="60%" />
                                </asp:TemplateField>
                                
                            </Columns>
                            <HeaderStyle BackColor="#006600" ForeColor="White" />
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="gvDRUpdate" runat="server" AutoGenerateColumns="False" 
                    Width="100%" DataKeyNames="ID_DR" 
                    onrowcancelingedit="gvDRUpdate_RowCancelingEdit" 
                    onrowediting="gvDRUpdate_RowEditing" onrowupdating="gvDRUpdate_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="ID_DR" HeaderText="ID">
                        <ItemStyle Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NameItem" HeaderText="NAME ITEMS">
                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenDR" HeaderText="ITEMS">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TinhTrang" HeaderText="STATUS">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="DATE">
                        <HeaderStyle HorizontalAlign="Center" Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate> <%#Eval("NgayNhan","{0:dd-MM-yyyy}")%></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNgay" runat="server" CssClass="textmananger"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" 
                                TargetControlID="txtNgay" DaysModeTitleFormat="yyyy-MM,dd" 
                                Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
                            </ajaxToolkit:CalendarExtender>                             
                        </EditItemTemplate>  
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" EditImageUrl="~/images/edit_icon.png" 
                            HeaderText="EDIT" ShowEditButton="True">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="2%" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" HorizontalAlign="Center" 
                        Font-Italic="False" Font-Strikeout="False" ForeColor="#003300" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
