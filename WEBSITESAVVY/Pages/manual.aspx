<%@ Page Title="Manual - SA Platform" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="manual.aspx.cs" Inherits="WEBSITESAVVY.Pages.manual" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  
 <%--    <script language="javascript" type="text/javascript">
         function SetAllStateCheckBoxList(chkID, state) {
             var chk = document.getElementById(chkID);
             var items = chk.getElementsByTagName("input");
             for (var i = 0; i < items.length; i++) {
                 items[i].checked = state;
             }
         }  
</script> --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager2" runat="server"/>
    <div style="padding: 50px; width: 80%">
      <ajaxToolkit:Accordion ID="Accordion1" runat="server" SelectedIndex="0" 
                    AutoSize="None" FadeTransitions="true"  
    TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" 
                    SuppressHeaderPostbacks="true" 
                    HeaderCssClass="accordionHeader" 
                    HeaderSelectedCssClass="accordionHeaderSelected" Width="98%">
                <Panes>
                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server" CssClass="infoFormTableSubInfoFirst">
                <Header>INITIAL INFORMATION OF LOSS / DAMAGE [THÔNG TIN TỔN THẤT ĐẦU TIÊN]</Header>
                <Content >
                </Content>
                </ajaxToolkit:AccordionPane>
                 <ajaxToolkit:AccordionPane ID="AccordionPane13" runat="server">
                <Header>INSURED / NGƯỜI ĐƯỢC BẢO HIỂM</Header>
                <Content>
              
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                <Header>CIRCUMSTANCE / DIỄN BIẾN TỔN THẤT</Header>
                <Content>
                
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server">
                <Header>DETAIL LOSS EXTENT / CHI TIẾT PHẠM VI TỔN THẤT</Header>
                <Content>
              
                </Content>
                </ajaxToolkit:AccordionPane>
                  <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server">
                <Header>POLICY LIABILITY / PHẠM VI BẢO HIỂM</Header>
                <Content>
                  
                </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane ID="AccordionPane10" runat="server">
                <Header>LOSS HISTORY / LỊCH SỬ TỔN THẤT</Header>
                <Content>
                
                </Content>
                </ajaxToolkit:AccordionPane>

                </Panes>
                </ajaxToolkit:Accordion>

        <asp:Repeater ID="Repeater1" runat="server">
        </asp:Repeater>
</div>
</asp:Content>
