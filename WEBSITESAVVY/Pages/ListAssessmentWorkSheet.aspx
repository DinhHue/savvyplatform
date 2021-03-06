﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ListAssessmentWorkSheet.aspx.cs" Inherits="WEBSITESAVVY.Pages.ListAssessmentWorkSheet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ListAssessment</title>

    <script src="../js/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.tablednd.js"></script>
    <script type="text/javascript" src="../Scripts/json2.js"></script>

    <script type="text/javascript" src="../Scripts/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Content/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../Content/themes/icon.css"/>
 <script type="text/javascript">

        function updateRowIndex()
        {
            //var countData = $('#gvLoaiHangMucDetails' + ' .group_category').length;
            var str = "";
            $('#gvLoaiHangMucDetails' + ' .group_category').each(function () {
                //str += " " + $(this).attr("id_loaihangmuc")

                $(this).find('tr').each(function () {

                    var row_index = $(this).index();
                    var id_losslist = $(this).attr("id_lostlist");

                    str += id_losslist + ":" + row_index + ", ";

                });

            });

            str = str.substring(0, str.length - 2);
            var datajson = {
                str: str
            }

            datajson = JSON.stringify(datajson);

            $.ajax({
                type: 'POST',
                url: 'ListAssessmentWorkSheet.aspx/UpdateRowIndex',
                data: datajson,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                beforeSend: function () {
                    var win = $.messager.progress({
                        title: 'Please waiting',
                        msg: 'Loading data...'
                    });
                },
                success: function (r) {
                    $.messager.progress('close');

                    if (r.d == true) {
                        location.reload();
                    }
                    else {
                        $.messager.show({
                            title: 'Error',
                            msg: 'Update row false!',
                            showType: 'slide'
                        });
                    }
                }
            });

        }

        $(document).ready(function () {

            // Make a nice striped effect on the table
            //$("#gvLoaiHangMucDetails tr:even").addClass("alt");

            $("#gvLoaiHangMucDetails").tableDnD();


        });

    </script>

    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .header
    {      
         color:White;
         background:#060;
         text-align:center;      
         font-weight: bold;   
    }
        
    table .gridtable th {
	    border: 1px solid #CDCDCD ;
        padding: 5px;
    }
    table .gridtable td {
	    border: 1px solid #CDCDCD;
        padding: 5px;
    }
    
    .tDnD_whileDrag {
        background-color: #DCDCDC;
    }
    
    </style>

</head>

<body>
<form runat="server">
    <table >
        <tr>
            <td class="rowheader">
                PROPERTIES DAMAGE ASSESSMENT WORKSHEET</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnNewItem" runat="server" CssClass="btn" 
                    onclick="btnNewItem_Click" Text="New Item Detail" />
&nbsp;
                <asp:Button ID="btnNewType" runat="server" CssClass="btn" 
                    onclick="btnNewType_Click" Text="New Type" />
            </td>
        </tr>
        <%# Eval("SoLuong") %>
</table>

     <div id="exportToExcel" runat="server" style="width:99%;">
        <div style="text-align:center">
            <h3 style="margin:0px; padding:0px;">PROPERTY DAMAGE ASESSMENT WORKSHEET</h3>
            <h4 style="margin:0px; padding:0 0 20px 0;"><i>(PHIẾU KIỂM KÊ TÀI SẢN BỊ THIỆT HẠI)</i></h4>
         </div>

        <asp:GridView ID="gvLoaiHangMucDetails" runat="server" CssClass="gridtable"
             AutoGenerateColumns="False" ShowFooter="false" ShowHeader="False" 
            Width="99%" OnRowDataBound="gvgvLoaiHangMucDetails_OnRowDataBound" 
             onrowcreated="gvLoaiHangMucDetails_RowCreated" >
            <Columns>
                <asp:TemplateField >
                    <ItemTemplate >
                        <div style="text-align:center">
                            <asp:Label ID="lblSTT" runat="server" Text='' Font-Bold="true" ></asp:Label>
                            <asp:Label ID="lblLoaiHangMucID" Visible="false" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID_LoaiHangMuc") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-Width="35%" ItemStyle-Width="35%" >
                    <ItemTemplate >
                        <span><b><%#DataBinder.Eval(Container.DataItem, "TenLoaiHangMuc") %></b></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                <asp:BoundField HeaderStyle-Width="8%" ItemStyle-Width="8%" />
            
                <asp:TemplateField>
                    <ItemTemplate>
                    <tbody class="group_category" id_loaihangmuc="<%#DataBinder.Eval(Container.DataItem, "ID_LoaiHangMuc") %>" >
                        <asp:Repeater ID="repeaterChild" runat="server">
                            <ItemTemplate>
                                <tr id_lostlist="<%# Eval("ID_LossList") %>">
                                    <td align="center"><%# Container.ItemIndex + 1 %></td>
                                    <td align="left"><%# Eval("TenHangMuc") %></td>
                                    <td align="center"><%# Eval("SoLuong") %></td>
                                    <td align="center"><%# Eval("TenDonVi") %></td>
                                    <td align="left"><%# Eval("GhiChu") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    <tbody>                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


   <button class="btn" onclick="print();" >Export to PDF</button>
    <asp:Button ID="btnExcel" runat="server" CssClass="btn"
        onclick="btnExcel_Click" Text="Export To Excel" />
    <input type="button"  class="btn" onclick="updateRowIndex();" value="Save Change" />



</form>
</body>
</html>