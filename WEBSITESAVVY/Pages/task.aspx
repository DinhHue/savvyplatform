<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task.aspx.cs" Inherits="WEBSITESAVVY.Pages.task" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<span>
    <p style="font-family: 'Times New Roman', Times, serif; font-size: 26px; font-weight: bold; color: #003300; vertical-align: top; text-align: center">
        TASK ASSIGNED</p>
                  <asp:GridView ID="gvDSDuocNhan" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="MaDaiLy" Font-Names="Times New Roman" Font-Size="16px" 
                        Width="100%" CssClass="WebGrid">
                    <Columns>
                        <%--<asp:BoundField DataField="MaDaiLy" HeaderText=".">
                        <ItemStyle ForeColor="White" HorizontalAlign="Center" Width="0%" />
                        </asp:BoundField>--%>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Claim" HeaderText="Case No.">
                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DienGiai" HeaderText="Descriptions">
                        <ItemStyle Width="35%" HorizontalAlign="left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ngay" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Date Assigned">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deadline" DataFormatString="{0:yyyy-MM-dd}" 
                            HeaderText="Deadline">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deliver" HeaderText="Deliver">
                        <ItemStyle HorizontalAlign="Center" Width="15%"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="Receiver" HeaderText="Receiver">
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Done" HeaderText="Done">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <%--<asp:CommandField ButtonType="Button" HeaderText="Edit" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>--%>
                    </Columns>
                    <HeaderStyle BackColor="#006666" Font-Names="Times New Roman" Font-Size="18px" 
                        ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
</span>

    </div>
    </form>
</body>
</html>
