<%@ Page Title="TimeSheet - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="TimeSheet.aspx.cs" Inherits="WEBSITESAVVY.TimeSheet" %>
<%@ Register src="../Uc/UcQuanLyCongTacTimeSheet.ascx" tagname="UcQuanLyCongTacTimeSheet" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/CssForm.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/Scripts/jquery.tablednd.js"></script>
    <script type="text/javascript" src="/Scripts/json2.js"></script>

    <script type="text/javascript">
        function editTS(obj) {
            var idClaim = $(obj).attr("idTS");
            //            alert(idClaim);
            var param = "?idTS=" + idClaim;
            var contentPage = '<iframe src="../Pages/updatetimesheetpop.aspx' + param + '"></iframe>'
            $("#w_UpdateTS").html(contentPage);
            $('#w_UpdateTS').window('open');
            window.scrollTo(0, 0);
            //$("html, body").animate({ scrollTop: 0 }, 500);
        }
        function updateRowIndex() {
            var str = "";

            $(".gridtable").find('tr').each(function () {

                var row_index = $(this).index();
                var id_timesheet = $(this).attr("id_timesheet");
                var id_thamchieu = $(this).attr("id_thamchieu");
                //var id_gdv = $(this).attr("id_gdv");

                row_index = 1000000 + row_index;
                var strRowindex = id_thamchieu + "_" + row_index;

                if (id_timesheet) {
                    str += id_timesheet + ":" + strRowindex + ", ";
                }

            });


            str = str.substring(0, str.length - 2);
            var datajson = {
                str: str
            }

            datajson = JSON.stringify(datajson);

            $.ajax({
                type: 'POST',
                url: 'TimeSheet.aspx/UpdateRowIndex',
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
                        //window.location.href = window.location.href;
                        window.location.href = "TimeSheet.aspx?maclaim=" + $('.txtClaim').val() + "&idgdv=" + $('.ddlGDV').val();
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

            $(".grid_header").addClass("nodrop nodrag");
            $(".grid_footer").addClass("nodrop nodrag");

            $(".gridtable").tableDnD();
        });
    </script>


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


    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<span runat="server" id="tabid" style="display:none">timesheet</span>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 <div class="ambitios_rows_sub">
    <div class="ambitios_container_16">
      <div class="ambitios_wrapper">
        <div class="titleobject ambitios_alpha">
          <h1 class="ambitios_uppercase">TIMESHEET Manage</h1>
        </div>
      </div>
    </div>
  </div>
    <%-- content main --%>
<div class="ambitios_container_16">
    <div class="ambitios_content">   
      <div class="ambitios_wrapper" align="center">
          <table style="vertical-align: top; text-align: center" width="100%">
              <tr>
                  <td>
                            <asp:Label ID="Label3" runat="server" Text="Date :" Font-Bold="True"></asp:Label>
                            &nbsp;<asp:TextBox ID="txtDate" runat="server" CssClass="input"></asp:TextBox>
                             <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
            TargetControlID="txtDate" DaysModeTitleFormat="yyyy-MM,dd" 
            Format="yyyy-MM-dd" TodaysDateFormat="yyyy-MM,dd">
        </ajaxToolkit:CalendarExtender>                     
                      <asp:Label ID="Label2" runat="server" Text="Claim No. :" Font-Bold="True"></asp:Label>
                      &nbsp;<asp:TextBox ID="txtMaClaim" runat="server" CssClass="input txtClaim" ></asp:TextBox>
                      &nbsp;<asp:DropDownList ID="drGDV" runat="server" AppendDataBoundItems="True" Width="200px"
                          CssClass="input ddlGDV" AutoPostBack="True">
                          <asp:ListItem Value="0">Chọn GĐV</asp:ListItem>
                      </asp:DropDownList>
                      <asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Search" Width="73px"
                          CssClass="btn" />
                      <asp:Button ID="btnXem" runat="server" OnClick="btnXem_Click" Text="Show All" Width="94px"
                          CssClass="btn" />
                          <asp:Button ID="btnSummaryTS" runat="server" 
                          Text="TS Summary" Width="95px"
                          CssClass="btn" onclick="btnSummaryTS_Click" />                         
                         

                        <div style="float:right; padding-right: 50px;">             
                      <a class="easyui-splitbutton" href="#" class="easyui-linkbutton" data-options="menu:'#mn', plain:false"><span>
                            <span style="color:#003300">More</span></span></a>
                        </div>
                      <div id="mn" class="menu-content"  
                          style="padding: 2px; width:250px; text-align: left;">
                      <ul>
                     <li><asp:HyperLink ID="HyperLink4" runat="server" class="easyui-linkbutton" CssClass="input" NavigateUrl="~/Pages/AdjustTimesheet.aspx" data-options="plain:true" >Adjust Time-Spent</asp:HyperLink></li>
                  <li> <asp:HyperLink ID="HyperLink5" runat="server" class="easyui-linkbutton" onclick="$('#w_NewTimeSheet').window('open')"  CssClass="input"  href="javascript:void(0)" data-options="plain:true">New TimeSheet</asp:HyperLink></li>
                   
                    <li> <asp:HyperLink ID="HyperLink6" runat="server" class="easyui-linkbutton" CssClass="input" NavigateUrl="~/Pages/NewTimeSheetOtherLA.aspx" data-options="plain:true">New TimeSheet for Other LA</asp:HyperLink></li>
                   
                      </ul>
                      </div>
                
                  </td>
              </tr>
           <%--   <tr>
                  <td style="padding-right: 50px; text-align: right">
                  <div style="float:right">
                    <asp:Button ID="btnAdjustTime" runat="server" CssClass="btn" Text="Adjust Time-Spent"
                          PostBackUrl="~/Pages/AdjustTimesheet.aspx" />
                      <asp:Button ID="btnXuatExcel" runat="server" CssClass="btn" OnClick="btnXuatExcel_Click"
                          Text="Export to Excel" />
                           <asp:Button ID="btnHienThem" runat="server" Text="New TimeSheet" Width="145px" CssClass="btn"
                          PostBackUrl="~/Pages/NewTimeSheet.aspx" />
                      <a class="easyui-splitbutton" href="#" class="easyui-linkbutton" data-options="menu:'#mn', plain:false"><span><span style="color:#444">Tác vụ khác</span></span></a>
                        </div>
                      <div id="mn" class="menu-content"  style="width:150px;">
                      <asp:HyperLink ID="HyperLink3" runat="server"  CssClass="input" NavigateUrl="~/Pages/AdjustTimesheet.aspx">Adjust Time-Spent</asp:HyperLink>                   
                      <asp:HyperLink ID="HyperLink1" runat="server" onclick="$('#w_NewTimeSheet').window('open')"  CssClass="input"  href="javascript:void(0)" data-options="plain:true">New TimeSheet</asp:HyperLink>
                      <asp:HyperLink ID="HyperLink2" runat="server" CssClass="input" NavigateUrl="~/Pages/NewTimeSheetOtherLA.aspx">New TimeSheet for Other LA</asp:HyperLink>
                      </div>
                
                  </td>
              </tr>--%>
              <tr>
                  <td align="center">
                      <asp:GridView ID="gvDSTimeSheet"  runat="server"  AutoGenerateColumns="False" DataKeyNames="ID_TimeSheet"
                          PageSize="20" Font-Names="Times New Roman" Font-Size="16px"
                          CssClass="gridtable" ShowFooter="True" Width="90%" 
                          onrowdatabound="gvDSTimeSheet_RowDataBound" 
                          onrowdeleting="gvDSTimeSheet_RowDeleting" >
                          <Columns>
            
                              <asp:TemplateField HeaderText="STT">
                                  <ItemTemplate>
                                      <%#Container.DataItemIndex+1 %>
                                      <asp:Label ID="IdLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID_TimeSheet") %>' Visible="false"></asp:Label> 
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                               
                              <asp:BoundField DataField="ThamChieu" HeaderText="Claim No">
                                  <ItemStyle HorizontalAlign="Center" Width="5%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="Ngay1" HeaderText="Date Update">
                                  <ItemStyle Width="10%" />
                              </asp:BoundField>
                               
                              <asp:BoundField DataField="Ngay" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}">
                                  <ItemStyle Width="10%" HorizontalAlign="Center" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="CongTac" HeaderText="Type TS">
                                  <ItemStyle Width="30%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="DienGiaiChiTiet" HeaderText="Description">
                                  <ItemStyle Width="25%" />
                              </asp:BoundField>
                           
                              <asp:BoundField DataField="ThoiLuongPhatSinh" HeaderText="Time Spent">
                                  <ItemStyle HorizontalAlign="Center" Width="5%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="TimeIssue" HeaderText="Time Issue">
                                  <ItemStyle Width="5%" HorizontalAlign="Center" />
                              </asp:BoundField>
                           
                              <asp:BoundField DataField="TenGDV" HeaderText="Adjusters">
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                              
                              <asp:BoundField DataField="ExtraFee" HeaderText="ExtraFee">
                              <ItemStyle HorizontalAlign="Left" Width="5%" />
                              </asp:BoundField>
                              
                              <asp:TemplateField HeaderText="Updated">
                            <ItemTemplate>
                                <input type="button" class="btn" value="Click" idTS="<%#DataBinder.Eval(Container.DataItem, "ID_TimeSheet") %>" onclick="editTS(this)" />         
                            </ItemTemplate>
                            </asp:TemplateField>
                              <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/delete_icon.jpg" 
                                  HeaderText="Delete" ShowDeleteButton="True" >
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:CommandField>
                          </Columns>
                          
                          <FooterStyle BackColor="#006600" ForeColor="White" CssClass="grid_footer" />
                          <HeaderStyle BackColor="#006600" Font-Names="Times New Roman" ForeColor="White" CssClass="grid_header" />
                          
                          <RowStyle Font-Names="Times New Roman" />
                      </asp:GridView>
                  </td>
              </tr>
          </table>
&nbsp;</div>
</div>
</div>
    <div align="center">
        <asp:Label ID="lblThongBaoDS" runat="server" Visible="False"></asp:Label>
    </div>
     <div style="padding:5px; position: fixed; bottom: 0px; left: 0px; background:#F5F5F5; width:100%; border-top:1px solid #DDD" align="center">
                

                <asp:Button ID="btnXuatExcel" runat="server" CssClass="btn" OnClick="btnXuatExcel_Click"
                          Text="Export to Excel" />
                           <input type="button"  class="btn" onclick="updateRowIndex();" value="Save Change" />
                                
    </div>
     <div id="w_NewTimeSheet" class="easyui-window" title="New TimeSheet" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;">
        <iframe src="../Pages/newtimesheetpop.aspx" ></iframe>
    </div>
    <div id="w_UpdateTS" class="easyui-window" title="Update TimeSheet" data-options="modal:false,closed:true,iconCls:'icon-add'" style="width:650px;height:490px;padding:0px;"></div>
</asp:Content>
