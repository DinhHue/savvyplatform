<%@ Page Title="" Language="C#" EnableEventValidation="true" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="NewsManager.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function editNews(obj) {
            var idNews = $(obj).attr("idNews");
            var param = "?Action=Edit" ;
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
            font-size:12px;
            padding:2px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>

        <div style="min-height:500px; border:1px; margin:5px;">
            
            <table style="width:100%; background:#CDCDCD">
                <tr>
                    <td> <asp:Label ID="Label1" runat="server" Text="Danh sách Bài viết"></asp:Label> </td>
                    <td> 
                        <input type="button" class="btn" value="Add New" onclick="addNew()" /> 
                        <input type="button" class="btn" value="Refresh" onclick="Refresh()" />
                    </td>
                    <td align="right"> <asp:TextBox ID="txtSearch"  CssClass="input" placeholder="Search" Font-Size="12px" runat="server"></asp:TextBox> 
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" 
                            onclick="btnSearch_Click" /></td>
                </tr>
            </table>     

            <asp:Repeater ID="repeaterList" runat="server" >
            <ItemTemplate>

                <div class="item" style="clear:both; padding:4px" >
                    <img src="<%# Eval("LinkImages") %>" style="float:left; height:50px; width:70px; margin:2px" />
                    <div>
                        <div>
                            <span><b><%# Eval("Title") %></b></span> 
                            | <span> <%# Eval("DateCreated") %> </span> 
                            | <span><b> <%# Eval("Ten_GDVPost") %></b></span> 
                         </div>
                        <div>
                            <span><%# Eval("Brief") %></span>
                            <input idNews="<%# Eval("ID_News") %>" type="button" class="btn" style="margin:2px; padding:2px; cursor:pointer" value="Edit" onclick="editNews(this)" />
                        </div>
                    </div>
                </div>

            </ItemTemplate>
            </asp:Repeater>

            <hr style="clear:both;" />

            <div style="overflow: hidden; background:#CDCDCD; padding:0px 5px;">

                <table width="100%">
                    <tr>
                        <td style="width:70%; padding:0px;">
                            <span>Current Page: </span> <asp:TextBox ID="txtCurrentPage" CssClass="input" 
                                Font-Size="12px" Width="50px"  runat="server" 
                                ontextchanged="txtCurrentPage_TextChanged" />
                            <asp:Repeater ID="rptPages" runat="server" onitemcommand="rptPages_ItemCommand1">
                                <HeaderTemplate>
                                    Page: 
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnPage"
                                        style="padding:1px 3px; margin:1px; background-color: #4BA614; color:#FFF; border:solid 1px #666; font:8pt tahoma;"
                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                        runat="server"><%# Container.DataItem %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                        <td align="right" style="width:30%; padding:0px;">
                            Page size: 
                            <asp:DropDownList ID="ddlPageSize" ClientIDMode="Static" runat="server" 
                                onselectedindexchanged="ddlPageSize_SelectedIndexChanged" AutoPostBack="true" >
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

    <div id="w_UpdateNews" class="easyui-window" title="Update News" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:700px;height:490px;padding:0px;"></div>
</asp:Content>
