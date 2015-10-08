<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimDetail.aspx.cs" Inherits="WEBSITESAVVY.Pages.ClaimDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Claim Detail</title>
    <link rel="stylesheet" href="/Content/metropanel.css" type="text/css" />
    <link rel="stylesheet" href="../Styles/CssForm.css" type="text/css" />
    <style>
        .mp-menu {
            height:45px;
        }
    </style>
    <!-- jQuery Lib -->
    <script type="text/javascript" src="/Scripts/jquery-1.4.4.js"></script>
    <!-- jQuery Easing -->
    <script type="text/javascript" src="/Scripts/Metro/jquery.easing.min.13.js"></script>
    <!-- mousewheel plugin -->
    <script type="text/javascript" src="/Scripts/Metro/jquery.mousewheel.min.js"></script>
    <!-- jScrollPane script -->
    <script type="text/javascript" src="/Scripts/Metro/jquery.jscrollpane.min.js"></script>

    <script type="text/javascript" src="/Scripts/jquery.bpopup-0.7.0.min.js" ></script>

    <script laguage="javascript">
        //index vị trí của panel menu
        var index = 0;

        function resizeContent() {
            var clientWidth = $(window).width();
            var contentWidth = clientWidth - 300;

            if (index == -1) {
                $("#mp-contentholder").animate({ left: 0, width: clientWidth });
            }
            else {
                $("#mp-contentholder").animate({ width: contentWidth });
            }
        };


        $(document).ready(function () {
            // put all your jQuery goodness in here.
            $('.jspContainer').jScrollPane();

            $(".defaultBt").hide();

            resizeContent();

            $(window).resize(function () {
                // put all your jQuery goodness in here.
                //$('.jspContainer').jScrollPane();
                resizeContent();
            });

            //panelleft
            $(".mp-leftarrow").click(function () {

                index = index - 1;

                if (index == 0) {
                    $("#mp-contentholder").animate({ left: "300" }, "fast");

                    $("#metropanel, #mp-footerpanel").animate({ left: "0px" }, "easeOutBack");
                } else {
                    $("#mp-contentholder").animate({ left: "0" }, "fast");

                    $("#metropanel, #mp-footerpanel").animate({ left: "-330px" }, "easeOutBack", function () {
                        $("#mp-expand").animate({ left: 0 }, "slow", "easeOutBack");
                    });
                }

                $(".defaultBt").hide("slow");

                resizeContent();
            });

            //button right
            $(".mp-rightarrow").click(function () {
                index = index + 1;

                var clientWidth = $(window).width();
                var contentWidth = clientWidth - 300;
                if (contentWidth < 960) {
                    $("#metropanel, #mp-footerpanel").animate({ left: contentWidth }, "slow");
                    //content left = 0
                    $("#mp-contentholder").animate({ left: "0", width: contentWidth }, "slow");
                } else {
                    $("#metropanel, #mp-footerpanel").animate({ left: contentWidth }, "slow");
                    $("#mp-contentholder").animate({ left: "0", width: contentWidth }, "slow");
                }

                $(".defaultBt").show("slow");

                resizeContent();
            });

            //show menuleft
            $("#mp-expand, .defaultBt").click(function () {
                index = 0;

                $("#mp-expand").animate({ left: "-70px" }, function () {
                    $("#metropanel, #mp-footerpanel").animate({ left: "0px" });
                });
                //content
                $("#mp-contentholder").animate({ left: "300" }, function () {
                    $(".defaultBt").hide("slow");
                });

                resizeContent();
            });

            //hover menu item  
            $(".mp-menu").hover(
                 function () {
                     // this is the dom element hover
                     var index = $(".mp-menu").index(this);
                     $('.mp-menu').eq(index).addClass("transparent-black");
                 },
                 function () {
                     var index = $(".mp-menu").index(this);
                     $('.mp-menu').eq(index).removeClass("transparent-black");
                 }
            );

            //selected menu item  
            $(".mp-menu a").click(function () {
                $(".mp-menu a").removeClass("transparent-smoke");
                $(this).addClass("transparent-smoke");
            });

            //Đổi mật khẩu
            $('#LinkDoiMatKhau').bind('click', function (e) {
                // Triggering bPopup when click event is fired
				var link = $(this).attr("Link");
                $('#popupDoiMatKhau').bPopup({
                    content: 'iframe', //'iframe' or 'ajax'
                    contentContainer: '.content',
                    loadUrl: link //Uses jQuery.load()
                });

            });


            //menu click

            $( ".jspContainer li" ).each(function( index ) {
                //alert( index + ": " + $( this ).text() );

                $(this).click(function () {
                    //loadContent($(this).attr("Link"), $( this ).text() );
                    showDialog($(this).attr("Link"), $( this ).text() , 800, 480);
                });

            });

            $(window).bind('beforeunload', function () { });
        });

        function showDialog(url, title, width, height) {
            $("#titleDialog").html(title);
            $("#contentDialog").html("");
            $("#contentDialog").height(height);
            $("#contentDialog").width(width);

            $('#popupShowDialog').bPopup({
                content: 'iframe', //'iframe' or 'ajax'
                contentContainer: '#contentDialog',
                loadUrl: url //Uses jQuery.load()
            });
        }

        function popupThongBao(html) {
            $(".content").html(html);
            $('#popupThongBao').bPopup({
                contentContainer: '.content'
            });

        }

        function popupError(html) {
            $('#popupError').bPopup();
            var snd = new Audio("/Uploads/sound/error.wav"); // buffers automatically when created
            snd.play();
            $("#contentThongBao").html(html);
        }

        //load ajax content
        function loadContent(Link, title) {
            var widthClient = $(window).width();
            $("#mp-contentholder").animate({ left: -widthClient }, function () {
                $("#mp-contentholder").css({ left: widthClient });
                $("#LabelTieuDe").text(title);

                $.ajax({
                    url: Link,
                    beforeSend: function () {
                        $("#mp-loading").css("display", "block");
                    },
                    success: function (data) {
                        $("#ContentUser").html(data);
                        var pleft = 300;
                        if (index != 0) pleft = 0;

                        $("#mp-contentholder").animate({ left: pleft }, function () {
                            $("#mp-loading").css("display", "none");
                        });
                    }
                });
            });
        }

        //load ajax content back
        function backContent(Link, title) {
            var widthClient = $(window).width();
            $("#mp-contentholder").animate({ left: widthClient }, function () {
                $("#mp-contentholder").css({ left: -widthClient });
                $("#LabelTieuDe").text(title);

                $.ajax({
                    url: Link,
                    beforeSend: function () {
                        $("#mp-loading").css("display", "block");
                    },
                    success: function (data) {
                        $("#ContentUser").html(data);
                        var pleft = 300;
                        if (index != 0) pleft = 0;

                        $("#mp-contentholder").animate({ left: pleft }, function () {
                            $("#mp-loading").css("display", "none");
                        });
                    },
                });
            });
        }

    </script>
</head>
<body style="overflow-x: hidden;">
<form id="form1" runat="server">
      <!-- START METRO PANEL -->
    <div id="metropanel" style="display: block; left: 0px; height: 1536px; background-color: #060; background-position: initial initial; background-repeat: initial initial;">

        <div id="mp-headerpanel">
            <div id="mp-sitename">
                    <a href="/">
                        <img src="http://savvyadjusters.com/sites/default/themes/savy/logo.png" height="50" align="left"  style="float:left;padding-right: 5px;">
                        <h2 style="color:#FFF">SAVVY </h2>
                        <p id="slogan" style="text-shadow: 1px 1px 5px; padding:0">Wellcome to Savvy!</p>
                    </a>
            </div>

            <div class="breakline transparent-smoke"></div>

            <div class="clearspace"></div>
        </div>

        <!-- The Main Item List -->
        <ul id="mp-menus" style="height: 408px; overflow: hidden; padding: 0px; width: 300px; font-size:14px !important;" class="jspScrollable" tabindex="0">

            <div class="jspContainer" style="width: 300px; height: 408px;">

		        <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Cover">
                    <a  class="mp-loadcontent transparent-smoke">
                        <span>COVER INFOMATION </span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=A111">
                    <a  class="mp-loadcontent">
                        <span>A111_INTRODUCTION</span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?ref=ES">
                    <a  class="mp-loadcontent">
                        <span>A21_EXECUTIVE SUMMARY</span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=ESIR">
                    <a  class="mp-loadcontent">
                        <span>** Interim Report</span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=ESFR">
                    <a  class="mp-loadcontent">
                        <span> *** Final Report</span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Insured">
                    <a  class="mp-loadcontent">
                        <span>A12_INSURED </span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Circumstance">
                    <a  class="mp-loadcontent">
                        <span>A13_CIRCUMSTANCE </span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Handling">
                    <a  class="mp-loadcontent">
                        <span>A22_CLAIM HANDLING SUMMARY </span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=COL">
                    <a  class="mp-loadcontent">
                        <span>A31_CAUSE OF LOSS</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=COLIR">
                    <a  class="mp-loadcontent">
                        <span>* Preliminary Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=COLFR">
                    <a  class="mp-loadcontent">
                        <span>*** Final Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=PL">
                    <a  class="mp-loadcontent">
                        <span>A32_POLICY LAIBILITY</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu"Link="ClaimDetailContent.aspx?Ref=PLIR">
                    <a  class="mp-loadcontent">
                        <span>* Preliminary Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=PLFR">
                    <a  class="mp-loadcontent">
                        <span>*** Final Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=DLE">
                    <a  class="mp-loadcontent">
                        <span>A33_DETAIL LOSS EXTENT</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=DLEIR">
                    <a  class="mp-loadcontent">
                        <span>* Preliminary Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=DLEFR">
                    <a  class="mp-loadcontent">
                        <span>*** Final Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=CA">
                    <a  class="mp-loadcontent">
                        <span>U1_CLAIM &amp; ADJUSTMENT</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=CAIR">
                    <a  class="mp-loadcontent">
                        <span>** Interim Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=CAFR">
                    <a  class="mp-loadcontent">
                        <span>*** Final Report</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Salvage">
                    <a  class="mp-loadcontent">
                        <span>U2_SALVAGE</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=History">
                    <a  class="mp-loadcontent">
                        <span>A132_LOSS HISTORY</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=OtherI">
                    <a  class="mp-loadcontent">
                        <span>A112_OTHER INSURANCE</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Settlement">
                    <a  class="mp-loadcontent">
                        <span>U3_CLAIM SETTLEMENT</span>
                        <div class="clearspace"></div>
                    </a>
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Discussion">
                    <a  class="mp-loadcontent">
                        <span>CLAIM DISCUSSION</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>
                <li class="mp-menu" Link="ListAssessmentWorkSheet.aspx">
                    <a  class="mp-loadcontent">
                        <span> ASSESSMENT WORKSHEET</span>
                        <div class="clearspace"></div>
                    </a>
                   
                </li>
                <li class="mp-menu" Link="ClaimDetailContent.aspx?Ref=Task">
                    <a  class="mp-loadcontent">
                        <span> TASK ASSIGNED</span>
                        <div class="clearspace"></div>
                    </a>
                   
                </li>
                <li class="mp-menu" Link="docsresquest.aspx">
                    <a  class="mp-loadcontent">
                        <span>DOCS REQUEST</span>
                        <div class="clearspace"></div>
                    </a>
                    
                </li>


                
            </div>
        </ul>
        <!-- End Main Item List -->

        <div class="breakline transparent-smoke"></div>

        <!-- Recent Item -->
        <ul id="mp-recentitemholder"></ul>
        <!-- End Recent Item -->


        <!-- Footer Panel -->
        <div id="mp-footerpanel" style="background-color: #060; display: block; left: 0px; background-position: initial initial; background-repeat: initial initial;">
            <div id="mp-collapse" class="mp-leftarrow"></div>
            <div id="mp-togglemenus" class="mp-rightarrow" style="float: right;"></div>
        </div>
        <!-- End Footer Panel -->
        <div style="clear: both;"></div>

    </div>
    <!-- END METRO PANEL -->



    <!-- Expand Button -->
    <div id="mp-expand" style="left: -70px; background:#060; background-position: initial initial; background-repeat: initial initial;">
        <div id="mp-expand-bt"></div>
    </div>
    <!-- End Expand Button -->

    <!-- Expand Button Right-->
    <div id="mp-expand" class="defaultBt" style="background:#060; ; background-position: initial initial; background-repeat: initial initial; right: 0; bottom: 0;">
        <div id="mp-expand-bt"></div>
    </div>
    <!-- End Expand Button -->



    <!-- START CONTENT -->
    <div id="mp-contentholder" style="float: left; position: relative; display: block; left: 300px;">
        <div style="padding: 0 20px 20px 20px">
            <div style="margin-bottom:10px;">

            <p style="text-align:right;color: gray;">Xin chào : <span id="lblName" runat="server" class="hight" style="text-transform: uppercase;">Nguyễn Quốc Bảo </span>| <a id="LinkDoiMatKhau" Link="/Pages/ChangePassW.aspx" href="#">Thay đổi mật khẩu</a> | <a href="#">Thoát</a></p>
            
                <h2 id="LabelTieuDe" style="display:none ;color: rgb(0, 158, 207); text-shadow: 0px 0px 4px rgb(126, 126, 126); text-transform: uppercase; font-style:italic;font-family:'Times New Roman',Georgia,Serif;">
                    Administrator
                </h2>
            
                <div style="clear:both;"></div>
            </div>


            <div id="ContentUser">
                <table>
                    <tr>
                        <td colspan="2" style="font-family: 'Times New Roman', Times, serif; font-size: 24px;
                            font-weight: bold; color: #006600; vertical-align: top; text-align: center; height:75px;">
                            COLLECT INFORMATION &amp; ANALYZE CLAIM
                            <br />
                            <asp:Label ID="lblThamChieuHead" runat="server"></asp:Label>&nbsp;-&nbsp;<asp:Label
                                ID="lblinsured" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;
                            vertical-align: top; text-align: right; padding-right: 10px; width: 26%">
                            Status :
                        </td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; vertical-align: top;
                            text-align: left">
                            <asp:DropDownList ID="drStatus" runat="server" Width="300px" 
                                AppendDataBoundItems="true" CssClass="input">
                                <asp:ListItem>[Update Status Claim ...]</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnUpdateStatus" runat="server" Text="Update Status" CssClass="btn"
                                Width="150px" OnClick="btnUpdateStatus_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnExportExcel" runat="server" CssClass="btn" Text="Export to Excel"
                                Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;
                            vertical-align: top; text-align: right; padding-right: 10px; width: 26%">
                            <asp:Label ID="Label38" runat="server" Text="Brief :"></asp:Label>
                        </td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; vertical-align: top;
                            text-align: left">
                            <asp:TextBox ID="txtbrief" runat="server" ReadOnly="False" Width="288px" CssClass="input"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnUpdatebrief" runat="server" Text="Update Frief" CssClass="btn"
                                Width="150px" OnClick="btnUpdatebrief_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;
                            vertical-align: top; text-align: right; padding-right: 10px; width: 26%">
                            <asp:Label ID="Label40" runat="server" Text="Follower:"></asp:Label>
                        </td>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; vertical-align: top;
                            text-align: left">
                            <asp:DropDownList ID="drGDV" runat="server" Width="300px" 
                                AppendDataBoundItems="true" CssClass="input">
                                <asp:ListItem Value="0">[Choose follower ...]</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnfollower" runat="server" Text="Follower" CssClass="btn"
                                Width="150px" OnClick="btnfollower_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Times New Roman', Times, serif; font-size: 18px; font-weight: bold;
                            vertical-align: top; text-align: right; padding-right: 10px;">
                            <asp:Label ID="Label39" runat="server" Text="Rate :"></asp:Label>
                        </td>
                        <td style=" font-family: 'Times New Roman', Times, serif; font-size: 18px; vertical-align: top;
                            text-align: left;">
                            <asp:DropDownList ID="drRate" runat="server" AppendDataBoundItems="true" 
                                CssClass="input">
                                <asp:ListItem Value="0">[Update rate ...]</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                            </asp:DropDownList>

                            <asp:Button ID="btnRate" runat="server" Text="Update Rate" CssClass="btn" Width="150px"
                                OnClick="btnRate_Click" />
                        </td>
                    </tr>
                </table>
            </div>

            <div class="clearspace"></div>
        </div>
        <div class="clearspace"></div>
    </div>
    <!-- END CONTENT -->




    <!-- Loading Image -->
    <div id="mp-loading">
        <img src="/Images/metro-icons/loading.gif" width="30" alt="">
    </div>
    <!-- End Loading Image -->




    <!-- Content Station -->
    <div id="mp-contentStation">
        <!-- Create Default Content Package -->
        <div id="screenslider"></div>
    </div>
    <!-- End Content Station -->

    <!-- dialog -->
    <div id="popupShowDialog" class="popup" style="display: none;" >
        <span class="bClose"><span> X </span></span>
        <div id="titleDialog" class="headForm">Thông báo</div>
        <div id="contentDialog" class="content" style="height:220px;  overflow:hidden;" ></div>
        <div class="cleared"></div>
    </div>
    <!-- End dialog -->

    <!-- DoiMatKhau -->
    <div id="popupDoiMatKhau" class="popup" style="display: none; width: 450px" >
        <span class="bClose"><span> X </span></span>
        <div class="headForm">Đổi Mật Khẩu</div>
        <div class="content" style="height:220px;  overflow:hidden;" ></div>
        <div class="cleared"></div>
    </div>
    <!-- End DoiMatKhau -->



    <!-- popup Thông báo-->
    <div id="popupThongBao" class="popup" style="display: none; width: 450px" >
        <span class="bClose"><span> X </span></span>
        <div class="headForm">Thông báo</div>
        <div class="content" style="min-height:100px; color:blue; padding:10px 10px 25px 10px;" ></div>
        <div style="float:right; margin-top:-40px; margin-right:20px;"><button style="padding:5px 20px; width:120px;" onclick="$('.bClose').click();">OK</button></div>
    </div>
    <!-- End popup Thông báo -->

    <!-- popup Thông báo-->
    <div id="popupError" class="popup" style="display: none; width: 450px" >
        <span class="bClose"><span> X </span></span>
        <div class="headForm">Thông báo</div>
        <div class="contentError" style="min-height:100px; color:red; padding:10px 10px 25px 10px;" >
            <table>
                <tr>
                    <td><img src="~/Images/error_48.png" /></td><td id="contentThongBao"></td>
                </tr>
            </table>
        </div>
        <div style="float:right; margin-top:-40px; margin-right:20px;"><button style="padding:5px 20px; width:120px;" onclick="$('.bClose').click();">OK</button></div>
    </div>
    <!-- End popup Thông báo -->
</form>
</body>
</html>
