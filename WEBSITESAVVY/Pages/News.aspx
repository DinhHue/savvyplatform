<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WEBSITESAVVY.Pages.News" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blogs Home</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main_news.css">

    <style type="text/css">
          .carousel-inner > .item > img,
          .carousel-inner > .item > a > img {
              width: 100%;
              margin: auto;
          }
    </style>

   
</head>
<body>
    <form id="form1" runat="server">
         
         <header id="header"><!--header-->
		
		    <div class="header-top"><!--header-middle-->
			    <div class="container">
				    <div class="row">
					    <div class="col-sm-4 paddingR_none">
						    <div class="logo pull-left">
							    <a href="../Pages/News.aspx"> SAVVY ADJUSTERS JSC</a>
						    </div>
						
					    </div>
					    <div class="col-sm-8 paddingL_none">
						    <div class="shop-menu pull-right">
							    <ul class="nav navbar-nav">
								    <li><a href="../Pages/Home.aspx">Claims</a></li>
								    <li><a href="../Pages/News.aspx">Blogs</a></li>
								    <li><a href="#">Post</a></li>
								    <li><a href="#">Liên Hệ </a></li>
							    </ul>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div><!--/header-middle-->
		
	    </header><!--/header-->


        	<section>

		        <div class="container">
            
                    <div class="row title-bar" >
                        <span class="home">Home</span>
                    </div>

			        <div class="row">
				
				        <div class="col-sm-9">
                            
                            <div class="row">
                                <div class="container-fluid row" style="margin-bottom:10px;" >
			
				                    <div class="col-sm-12 col-md-9">
					                    <div id="myCarousel" class="carousel slide " data-ride="carousel">
						                    <!-- Indicators -->
						                    <ol class="carousel-indicators">
							                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							                    <li data-target="#myCarousel" data-slide-to="1"></li>
							                    <li data-target="#myCarousel" data-slide-to="2"></li>
							                    <li data-target="#myCarousel" data-slide-to="3"></li>
						                    </ol>

						                    <!-- Wrapper for slides -->
						                    <div class="carousel-inner" role="listbox">

						                      <div class="item active">
							                    <img src="http://savvyadjusters.com.vn/sites/default/files/styles/home_slideshow/public/2.jpg" alt="Chania" width="460" height="345">
						                      </div>

						                      <div class="item">
							                    <img src="http://savvyadjusters.com.vn/sites/default/files/styles/home_slideshow/public/Can_Tho_City_-_Can_Tho_bridge.jpg" alt="Chania" width="460" height="345">
						                      </div>
						
						                      <div class="item">
							                    <img src="http://savvyadjusters.com.vn/sites/default/files/styles/home_slideshow/public/Flooding_Lake_Delton.JPG" alt="Flower" width="460" height="345">
						                      </div>

						                      <div class="item">
							                    <img src="http://savvyadjusters.com.vn/sites/default/files/styles/home_slideshow/public/ship%20insurance.jpg" alt="Flower" width="460" height="345">
						                      </div>
					  
						                    </div>

						                    <!-- Left and right controls -->
						                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						                      <span class="sr-only">Previous</span>
						                    </a>
						                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						                      <span class="sr-only">Next</span>
						                    </a>

					                    </div>

                                        <!--Start-->
                                        <div class="intro">
                                            <h4 >CÔNG TY CỔ PHẦN TƯ VẤN VÀ ĐIỀU CHỈNH SAVVY</h4>
                                        </div>
                                        <!-- end -->


				                    </div >
				
				                    <div class="col-sm-12 col-md-3">
					                    <div class="row" style="font-size:13px">
						                    
                                            <ul class="nav">
                                                <li style="background:#f5f5f5;" ><a style="color:#777; font-size:14px">Tin mới</a></li>
                                                <asp:Repeater ID="repeaterListNew" runat="server" >
                                                    <ItemTemplate>
                                                        <li class="item_type" ><a style="padding:4px 8px;" href="../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>"> <%# Eval("Title")%> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
					  
					                    </div>
					
				                    </div>
			                    </div>

                            </div>

					        <div class="row" style="margin-left:0" >
                        
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Tin Nóng</div>
                                        <div class="panel-body" style="padding: 0 0 20px 0">

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
                                                            <p style="clear:both"></p>

                                                        </div>
                                                    </div>
                                                </div> 
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
                                    </div>
                                </div>

                                <p style=" clear:both;"></p>

                            </div>
				        </div>
				
				        <div class="col-sm-3">
					
                    
                                <div class="panel-group">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Thể Loại</div>
                                            <div class="panel-body" style="padding:2px 0">

                                           
                                                    <ul class="nav" >
						                            <asp:Repeater ID="rptTypes"  runat="server">
                                                        <ItemTemplate>

                                                            <asp:HiddenField ID="id_type"  Value='<%# DataBinder.Eval(Container.DataItem, "ID_Type") %>' runat="server" />
                                                            <li id="item_type" class="item_type"><a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>"><%# Eval("NameType") %></a></li>

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
                                            <div class="nav" >
							
                                                <ul class="nav" >
						                        <asp:Repeater ID="repeaterMostViews" runat="server">
                                                    <ItemTemplate>

                                                        <li>
                                                            <a style="padding:4px;" href='../Pages/NewsDetail.aspx?id=<%# Eval("ID_News") %>'>
                                                                <img class="img-thumbnail" src="<%# Eval("LinkImages") %>" alt="<%# Eval("LinkImages") %>" align="left" hspace="3" border="0" vspace="3" width="60px">
                                                        
                                                                <%# Eval("Title") %> 
                                                                <div class="clearfix"></div>
                                                            </a>
                                                        </li>

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


        <footer id="footer">
		
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
