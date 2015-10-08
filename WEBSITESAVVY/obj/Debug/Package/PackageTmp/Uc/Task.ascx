<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Task.ascx.cs" Inherits="WEBSITESAVVY.Uc.Task" %>
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
                    <HeaderStyle BackColor="#CC0000" Font-Names="Times New Roman" Font-Size="18px" 
                        ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
</span>

