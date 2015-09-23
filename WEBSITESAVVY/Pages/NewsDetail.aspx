<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main_news.css">

    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server">
    </asp:ScriptManager>

        

        <header id="header"><!--header-->
		
		    <div class="header-top"><!--header-middle-->
			    <div class="container">
				    <div class="row">
					    <div class="col-sm-4">
						    <div class="logo pull-left">
							    <a href="../Pages/News.aspx">SAVVY ADJUSTERS JSC</a>
						    </div>
						
					    </div>
					    <div class="col-sm-8">
						    <div class="shop-menu pull-right">
							    <ul class="nav navbar-nav">
								    <li><a href="../Pages/Home.aspx">Quản Lý</a></li>
								    <li><a href="../Pages/News.aspx">Tin tức</a></li>
								    <li><a href="#">Thông tin chung</a></li>
								    <li><a href="#">Liên Hệ </a></li>
							    </ul>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div><!--/header-middle-->
	
		
	    </header><!--/header-->

	
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

	    <section>
		    <div class="container">
			    
                <div class="row title-bar" >
                    <span class="home">Home</span>

                    <asp:Repeater ID="repeaterTag" runat="server">
                        <ItemTemplate>
                            <a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>">
                            <span class="split"><%# Eval("NameType") %></span></a>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>

                <div class="row">
				
				    <div class="col-sm-9">

                            <div>

                                <asp:HiddenField ID="hiddenIDNews" runat="server" />
                                <h3 class="title "><asp:Label ID="lblTitle" runat="server">Types</asp:Label></h3>
                                <p style="text-align:right;">Ngày tạo: <asp:Label ID="lblDate" Font-Size="12px" Font-Bold="true" runat="server" ></asp:Label></p>
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

                            <div style="text-align:right;" > <!--start pager--->
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

				    </div>
				
				    <div class="col-sm-3">

                            <div class="panel-group">
                                  <div class="panel panel-default">
                                        <div class="panel-heading">Thể Loại</div>
                                        <div class="panel-body" style="padding:2px 0">

                                           
                                                <ul class="nav" >
						                        <asp:Repeater ID="rptTypes" runat="server">
                                                    <ItemTemplate>

                                                        <li class="item_type"><a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>"><%# Eval("NameType") %></a></li>

                                                    </ItemTemplate>
                                                </asp:Repeater>
							                    </ul>
					
                                        </div>
                                  </div>
                             </div>


                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Xem Nhiều Nhất</div>
                                    <div class="panel-body" style="padding:2px 0" >
                                            <div class="nav">   
                                            <ul class="nav" >
						                    <asp:Repeater ID="repeaterMostViews" runat="server">
                                                <ItemTemplate>

                                                    <li>
                                                        <a style="padding:4px;" href='../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>'>
                                                            <img class="img-thumbnail" src="<%# Eval("LinkImages") %>" alt="<%# Eval("LinkImages") %>" align="left" hspace="3" border="0" vspace="3" width="60px">
                                                        
                                                            <%# Eval("Title") %> 
                                                            <div class="clearfix"></div>
                                                        </a>
                                                </ItemTemplate>
                                            </asp:Repeater>
							                </ul>
					                        </div>
                                    </div>
                                </div>
                            </div>

					</div>

				</div>
				
				

		    </div>
	    </section>

        </ContentTemplate>
        </asp:UpdatePanel>
	
	    <footer id="footer"><!--Footer-->
		    <div class="footer-bottom" style="padding:10px;">
			    <div class="container">
				    <div class="row">
					<p class="pull-left">Copyright © 2015 Savvy Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="#">Savvy</a></span></p>
				    </div>
			    </div>
		    </div>
		
	    </footer>



    </form>
</body>
</html>
