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

    <style type="text/css">
        header, footer
        {
            background:whiteSmoke;
        }
        
        .logo
        {
            margin-top:10px;
            font-size:20px;
        }
        
        .list .item:first-child .linkImage{
            height:120px;
            width:170px;
        } 
        
        .linkImage
        {
            float: left; height: 70px; width: 100px; margin:5px;
        }
        
        .comment .item
        {
            padding:5px;
            border-bottom: 1px solid #F7F7F0;
        }
        .comment .item:nth-child(odd) {
            background: #f8f8f8;
        }

        .comment .item:nth-child(even) {
            background: none;
        } 
        
        .postcomment
        {
            padding:5px; margin-top:10px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <header id="header"><!--header-->
		
		    <div class="header-top"><!--header-middle-->
			    <div class="container">
				    <div class="row">
					    <div class="col-sm-4">
						    <div class="logo pull-left">
							    <a href="#">SAVVY ADJUSTERS JSC</a>
						    </div>
						
					    </div>
					    <div class="col-sm-8">
						    <div class="shop-menu pull-right">
							    <ul class="nav navbar-nav">
								    <li><a href="#"><i class="fa fa-user"></i> Account</a></li>
								    <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
								    <li><a href="#"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								    <li><a href="#"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								    <li><a href="#"><i class="fa fa-lock"></i> Login</a></li>
							    </ul>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div><!--/header-middle-->
	
		
	    </header><!--/header-->

	
	    <section>
		    <div class="container">
			    <div class="row">
				
				    <div class="col-sm-9">
					    <div class="row">
                            <asp:HiddenField ID="hiddenIDNews" runat="server" />
                            <h2 class="title text-center"><asp:Label ID="lblTitle" runat="server">Types</asp:Label></h2>
                            <span>Ngày: </span><asp:Label ID="lblDate" Font-Size="12px" Font-Bold="true" runat="server" ></asp:Label><br />
                            <p><b><asp:Label ID="lblBrief"  Font-Bold="true" runat="server" /></b></p>
                            <p><asp:Label ID="lblContent" runat="server" ></asp:Label></p>

                            <h2>Ý kiến bạn đọc</h2>
                            <div class="comment">
                                <asp:Repeater ID="rptComment" runat="server">
                                    <ItemTemplate>
                                        <div class="item">
                                            <p><%# Eval("Comments") %></p>
                                            <b><%# Eval("TenGDV") %></b> | 
                                            <span><%# Eval("TimeComment", "{0:dd/MM/yyyy HH:mm:ss}")%></span><br />
                                            
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>

                            <div class="postcomment">
                                <asp:TextBox ID="txtComment" TextMode="MultiLine" required PlaceHoder="Bình luận của bạn" CssClass="form-control" runat="server">
                                </asp:TextBox>
                                <asp:Button ID="btnPost" Text="Gửi" CssClass="btn btn-default"  runat="server" onclick="btnPost_Click" />
                            </div>

                        </div>
				    </div>
				
				    <div class="col-sm-3">
					    <div >
						    <h2>Thể Loại</h2>
						    <div class="nav" ><!--category-productsr-->
							
                                <ul class="nav" >
						        <asp:Repeater ID="rptTypes" runat="server">
                                    <ItemTemplate>

                                        <li><a href="../Pages/NewsTypes.aspx?id=<%# Eval("ID_Type") %>"><%# Eval("NameType") %></a></li>

                                    </ItemTemplate>
                                </asp:Repeater>
							    </ul>

						    </div><!--/category-products-->
					

					    </div>
				    </div>
				
				
			    </div>
		    </div>
	    </section>
	
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
    </div>
    </form>
</body>
</html>
