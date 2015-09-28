<%@ Page Language="C#" MasterPageFile="~/Master/news.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsDetail" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="contentTitleBar" ContentPlaceHolderID="ContentPlaceHolderTitleBar" runat="server">
    
    <a href="/Pages/News.aspx"><span class="home">Home</span></a>

    <asp:Repeater ID="repeaterTag" runat="server">
        <ItemTemplate>
            <a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>">
            <span class="split"><%# Eval("NameType") %></span></a>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

                <div>

                    <asp:HiddenField ID="hiddenIDNews" runat="server" />
                    <h3 class="title "><asp:Label ID="lblTitle" runat="server">Types</asp:Label></h3>
                    <p style="text-align:right;"><b>Ngày tạo: <asp:Label ID="lblDate" Font-Size="12px"  runat="server" ></asp:Label></b></p>
                    <p><b><asp:Label ID="lblBrief"  Font-Bold="true" runat="server" /></b></p>
                    <p><asp:Label ID="lblContent" runat="server" ></asp:Label></p>

                </div>

                <div class="well well-sm" >
                    <h4 style="margin:0; padding:0">Ý kiến bạn đọc <asp:Label ID="lblNumberComment" runat="server">(0)</asp:Label> </h4>
                </div>
                            
                <div class="comment">
                    <asp:Repeater ID="rptComment" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <p><%# Eval("Comments") %></p>
                                <b><%# Eval("TenGDV") %></b> - 
                                <span style="font-size:12; color:#333"><%# Eval("TimeComment", "{0:HH:mm dd/MM/yyyy}")%></span><br />
                                            
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>

                <div class="clearfix"></div>

                <div style="text-align:right;background: #FBFBFB; padding:4px" > <!--start pager--->
                    <ul class="pagination" style="margin:0;">
                        <asp:Repeater ID="rptPagesComment" runat="server" 
                            OnItemCommand="rptPagesComment_ItemCommand" 
                            onitemdatabound="rptPagesComment_ItemDataBound" >
                            <HeaderTemplate>
                                <li><a>Trang:</a> </li>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><asp:LinkButton ID="btnPage" Style="" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server"><%# Container.DataItem %></asp:LinkButton></li>
                            </ItemTemplate>
                            <FooterTemplate>
                                <li><asp:LinkButton ID="btnPageNext" Style="" CommandName="Page" CommandArgument=""
                                    runat="server">Next
                                </asp:LinkButton></li>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                </div> <!--End pager--->
                            

                <div class="postcomment well">
                    <asp:TextBox ID="txtComment" TextMode="MultiLine" Required PlaceHoder="Bình luận của bạn" Style="margin-bottom:10px" CssClass="form-control" runat="server" />
                    <asp:Button ID="btnPost" Align="right" Text="Gửi" CssClass="btn btn-default"  runat="server" onclick="btnPost_Click" />
                </div>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
