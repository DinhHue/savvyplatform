<%@ Page Title="Manager News" Language="C#" EnableEventValidation="true" MasterPageFile="Site1.Master"
    AutoEventWireup="true" CodeBehind="NewsManager.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function editNews(obj) {
            var idNews = $(obj).attr("idNews");
            var param = "?Action=Edit";
            param += "&idNews=" + idNews;
            var contentPage = '<iframe src="../Pages/NewsManagerPopup.aspx' + param + '"></iframe>'
            $("#w_UpdateNews").html(contentPage);
            $('#w_UpdateNews').window('open');

            var parentWindow = $('#w_UpdateNews').parent(".panel");
            var title = $(parentWindow).children().children()[0];
            $(title).html("Update News");

            window.scrollTo(0, 0);
        }

        function addNew() {
            var contentPage = '<iframe src="../Pages/NewsManagerPopup.aspx"></iframe>'
            $("#w_UpdateNews").html(contentPage);
            $('#w_UpdateNews').window('open');

            var parentWindow = $('#w_UpdateNews').parent(".panel");
            var title = $(parentWindow).children().children()[0];
            $(title).html("Add News");

            window.scrollTo(0, 0);
        }

        function Refresh() {
            window.location.href = window.location.href;
        }

    </script>
    <style type="text/css">
        #ddlPageSize
        {
            font-size: 12px;
            padding: 2px !important;
        }
        
        .input, option
        {
            font-size: 12px;
        }
        
        .tag
        {
            border: 1px solid #a1a1a1;
            padding: 2px 5px;
            border-radius: 4px;
            font-size: 14px;
        }
        .pager a
        {
            padding: 1px 3px; margin: 1px; background-color: #4BA614;
            color: #FFF; border: solid 1px #666; font: 8pt tahoma;
        }
        .pager a.selected
        {
            background-color:#BEBEBE;
            color:#333;
            cursor:default;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            

            <div>
                <div style="min-height: 500px; border: 1px; margin: 5px;">
                    <table style="width: 100%; background: #CDCDCD">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Danh sách Bài viết"></asp:Label>
                            </td>
                            <td>
                                <input type="button" class="btn" value="Add New" onclick="addNew()" />
                                <input type="button" class="btn" value="Refresh" onclick="Refresh()" />
                            </td>

                            <td align="right">
                           
                                <asp:UpdateProgress id="updateProgress" runat="server">
                                    <ProgressTemplate>  
                                         <img src="/images/metro-icons/loading.gif" width="25px" style="float:left;" alt="Loading...">
                                    </ProgressTemplate>
                                </asp:UpdateProgress>

                                <asp:DropDownList ID="ddlTypes" AutoPostBack="true" CssClass="input" runat="server"
                                    OnSelectedIndexChanged="dllTypes_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="">All Type</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtSearch" CssClass="input" placeholder="Search" Font-Size="12px"
                                    runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="repeaterList" runat="server" OnItemDataBound="repeaterList_ItemDataBound">
                        <ItemTemplate>
                            <div class="item" style="clear: both; padding: 4px">
                                <a href="../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>"><img src="<%# Eval("LinkImages") %>" alt="<%# Eval("LinkImages") %>" style="float: left; height: 65px; width: 90px;
                                    margin: 5px" /></a>
                                <div>
                                    <div>
                                        <a href="../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>"><span><b>
                                            <%# Eval("Title") %></b></span></a> | <span>
                                                <%# Eval("DateCreated") %>
                                            </span>| <span><b>
                                                <%# Eval("Ten_GDVPost") %></b></span>
                                    </div>
                                    <div>
                                        <span>
                                            <%# Eval("Brief") %></span>
                                        <asp:HiddenField ID="hidden_ID_news" Value='<%#DataBinder.Eval(Container.DataItem, "ID_News") %>'
                                            runat="server" />
                                        <input idnews='<%# Eval("ID_News") %>' type="button" class="btn" style="margin: 2px;
                                            padding: 2px; cursor: pointer" value="Edit" onclick="editNews(this)" />
                                        <div>
                                            <asp:Repeater ID="repeaterType" runat="server">
                                                <ItemTemplate>
                                                    <span class="tag"><a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>">
                                                        <%# Eval("NameType") %></a></span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <hr style="clear: both;" />
                    <div style="overflow: hidden; background: #CDCDCD; padding: 0px 5px;">
                        <table width="100%">
                            <tr>
                                <td style="width: 70%; padding: 0px;">
                                    <div class="pager">
                                        <span>Current Page: </span>
                                        <asp:TextBox ID="txtCurrentPage" CssClass="input" Font-Size="12px" Width="50px" runat="server"
                                            OnTextChanged="txtCurrentPage_TextChanged" />
                                        <asp:Repeater ID="rptPages" runat="server" 
                                            OnItemCommand="rptPages_ItemCommand1" onitemdatabound="rptPages_ItemDataBound">
                                            <HeaderTemplate>
                                                Page:
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnPage" Style="" CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                                    runat="server"><%# Container.DataItem %>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                </td>
                                <td align="right" style="width: 30%; padding: 0px;">
                                    Page size:
                                    <asp:DropDownList ID="ddlPageSize" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="10">10</asp:ListItem>
                                        <asp:ListItem Value="20">20</asp:ListItem>
                                        <asp:ListItem Value="30">30</asp:ListItem>
                                        <asp:ListItem Value="50">50</asp:ListItem>
                                        <asp:ListItem Value="100">100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="w_UpdateNews" class="easyui-window" title="Update News" data-options="modal:true,closed:true,iconCls:'icon-add'"
        style="width: 700px; height: 490px; padding: 0px;">
    </div>
</asp:Content>
