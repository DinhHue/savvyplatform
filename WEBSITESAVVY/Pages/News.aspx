<%@ Page Title="Blogs - News" Language="C#" MasterPageFile="~/Master/news.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="WEBSITESAVVY.Pages.News" %>



<asp:Content ID="contentHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
          .carousel-inner > .item > img,
          .carousel-inner > .item > a > img {
              width: 100%;
              margin: auto;
          }
    </style>
</asp:Content>


<asp:Content ID="contentTitleBar" ContentPlaceHolderID="ContentPlaceHolderTitleBar" runat="server">
    
    <a href="/Pages/News.aspx"><span class="home">Home</span></a>

</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
                                
        <div class="row">
            <div class="container-fluid row" style="margin-bottom:10px;" >
			
				<div class="col-sm-12 col-md-9">
					<div id="Div1" class="carousel slide " data-ride="carousel">
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
                            <li style="background-color: #179406; color: #FFFFFF; font-weight: bold;" class="panel-heading" ><%--<a style="color:#FFFFFF; font-size:14px">Tin mới</a>--%>Tin mới</li>
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
                    <div class="panel-heading" style="background-color: #179406; font-weight:bold; color:#FFFFFF">Tin Nóng</div>
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


</asp:Content>
