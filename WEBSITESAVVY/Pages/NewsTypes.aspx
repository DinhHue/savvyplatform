<%@ Page Language="C#" MasterPageFile="../Master/news.Master" AutoEventWireup="true" CodeBehind="NewsTypes.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsTypes" %>


<asp:Content ID="contentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="contentTitleBar" ContentPlaceHolderID="ContentPlaceHolderTitleBar" runat="server">
    
    <a href="/Pages/News.aspx"><span class="home">Home</span></a>
    <asp:Label CssClass="split" ID="lblTitle" runat="server" />

</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                        
                <div class="list">
                    <asp:Repeater ID="repeaterList" runat="server" >
                        <ItemTemplate>
                            <div class="col-sm-12 col-md-6">   
                            <div class="item" style="padding: 4px; overflow:hidden; height:140px;">
                                    
                                <div style="margin:5px 0 5px 0">
                                    <p>
                                        <a href="../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>"><span ><b><%# Eval("Title") %></b></a></span>
                                                
                                    </p>
                                    <p>
                                        <a href="../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>">
                                            <img class="linkImage img-thumbnail" src="<%# Eval("LinkImages") %>" alt="<%# Eval("LinkImages") %>" />
                                        </a>

                                        <span>
                                            <%# Eval("Brief") %>
                                        </span>
                                        <b> <%# Eval("DateCreated", "{0:dd/M/yyyy}")%> </b>
                                    </p>
                                    <div class="clearfix"></div>

                                </div>
                            </div>
                        </div> 
                        </ItemTemplate>
                    </asp:Repeater>

                </div>

                <p style=" clear:both;"></p>

                <div style="text-align:right;" >
                    <ul class="pagination">
                        <asp:Repeater ID="rptPages" runat="server" 
                            OnItemCommand="rptPages_ItemCommand" onitemdatabound="rptPages_ItemDataBound">
                            <HeaderTemplate>
                                <li><a>Trang:</a> </li>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><asp:LinkButton ID="btnPage" Style="" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server"><%# Container.DataItem %>
                                </asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

            </div>                
        
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
