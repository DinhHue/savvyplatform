<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsManagerPopup.aspx.cs" Inherits="WEBSITESAVVY.Pages.NewsManagerPopup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../Content/multi-select/css/multi-select.css" media="screen" rel="stylesheet" type="text/css">

    <script src="../tinymce/tinymce.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../Content/multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
	<script src="../Content/multi-select/js/jquery.quicksearch.js" type="text/javascript"></script>

    <script type="text/javascript">

        tinymce.init({
            selector: "textarea#txtContents",
            plugins: [
                    "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime image imagetools media nonbreaking",
                    "table contextmenu directionality emoticons textcolor paste fullpage textcolor colorpicker textpattern example"
            ],

            toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
            toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
            toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",


            menubar: false,
            toolbar_items_size: 'small',

            image_advtab: true,


        });

        function AddType()
        {
            var type = $('#drNewsType').val();
            var text = $('#drNewsType option:selected').text();

            $('#div_type').html();
        }


        $(document).ready(function () {
            
            $('#listBoxType').multiSelect({
			    selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='press any key'>",
			    selectionHeader: "<div class='custom-header'>Selected Types</div>",

			    afterInit: function(ms){
			    var that = this,
				    $selectableSearch = that.$selectableUl.prev(),
				    $selectionSearch = that.$selectionUl.prev(),
				    selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
				    selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

				    that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
					    .on('keydown', function(e){
						    if (e.which === 40){
							    that.$selectableUl.focus();
							    return false;
						    }
					    });

				    that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
					    .on('keydown', function(e){
						    if (e.which == 40){
							    that.$selectionUl.focus();
							    return false;
						    }
					    });
			    },
			    afterSelect: function(){
				    this.qs1.cache();
				    this.qs2.cache();
			    },
			    afterDeselect: function(){
				    this.qs1.cache();
				    this.qs2.cache();
			    }
		    });

        });

    </script>

    <style type="text/css">
        input.search-input {
			box-sizing: border-box;
			width: 100%;
			margin-bottom: 5px;
			height: auto;
		}
		
		.custom-header {
            text-align: center;
            padding: 3px;
            background: #F0F0F0;
        }
        
        .ms-container
        {
            width:95%;
        }
        
        span.title
        {
            display:block;
            padding:10px 0 5px 0;
        }
        
        .input
        {
            max-width:none;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">    
    <div>

        <table width="100%">
            <tr>
                <td class="rightpop">
                    <asp:HiddenField ID="txtID_News" runat="server" />
                    <asp:Label ID="Label7" CssClass="title" runat="server" Text="Title :"></asp:Label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input" Width="95%" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="rightpop">
                    <asp:Label ID="Label3" CssClass="title" runat="server" Text="Link Image :"></asp:Label>
                    <asp:TextBox ID="txtLinkImage" runat="server" CssClass="input" Width="95%"  required ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="rightpop">
                    <asp:Label ID="Label1" CssClass="title" runat="server" Text="Brief :"></asp:Label>
                    <asp:TextBox ID="txtBrief" runat="server" CssClass="input" Width="95%"  required
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="rightpop">
                    <asp:Label ID="Label8" CssClass="title" runat="server"  Text="Type :"></asp:Label>
                    <asp:ListBox ID="listBoxType" SelectionMode="Multiple" runat="server" 
                        Height="130px" Width="95%"></asp:ListBox>

                </td>
            </tr>
            
            <tr>
                <td class="rightpop">
                    <asp:Label ID="Label4" CssClass="title" runat="server" Text="Contents :"></asp:Label>
                    <asp:TextBox ID="txtContents" ClientIDMode="Static" runat="server" CssClass="input" 
                        TextMode="MultiLine" Width="100%" Height="350px" ></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="rightpop">
                    &nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnCreate" runat="server" CssClass="btn" Text="OK" onclick="btnCreate_Click" />
						
					<asp:Button ID="btnUpdate" runat="server" CssClass="btn" Text="Update" 
                        onclick="btnUpdate_Click" />

                    <input class="btn" type="button" value="Cancel" onclick="parent.closeDialog();" />
                </td>
            </tr>
            <tr>
                <td align="center" ><asp:Label ID="lblStatus" runat="server" ></asp:Label></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
