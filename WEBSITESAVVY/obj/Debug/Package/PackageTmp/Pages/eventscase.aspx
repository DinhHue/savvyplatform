<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eventscase.aspx.cs" Inherits="WEBSITESAVVY.Pages.eventscase" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

* {
	margin:0;
	padding:0;
}
*{
	font-size:16px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView runat="server" AutoGenerateColumns="False" ShowHeader="False" 
            Font-Names="Times New Roman" Font-Size="16px" Width="80%" ID="gvtrackinglist" 
            OnRowDataBound="gvtrackinglist_RowDataBound" 
            onrowcreated="gvtrackinglist_RowCreated" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="text-align:center">
                            <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                            <asp:Label ID="lblngay" Visible="false" runat="server" 
                                        Text='<%#DataBinder.Eval(Container.DataItem, "Ngay") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <span><b><%#DataBinder.Eval(Container.DataItem, "Ngay")%></b></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <%--<asp:BoundField></asp:BoundField>
                <asp:BoundField></asp:BoundField>
                <asp:BoundField></asp:BoundField>--%>
                <asp:TemplateField></asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Repeater ID="repeaterChild" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td align="center">
                                        <%# Container.ItemIndex + 1 %>
                                    </td>
                                    <td align="left">
                                        <%# Eval("ActionDes")%>
                                    </td>
                                   
                                    <td align="center">
                                        <%#  Eval("TimeReal", "{0:h:MM:ss tt}")%>
                                    </td>
                                   
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                    <ItemStyle Font-Size="20px"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle Font-Size="18px" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
