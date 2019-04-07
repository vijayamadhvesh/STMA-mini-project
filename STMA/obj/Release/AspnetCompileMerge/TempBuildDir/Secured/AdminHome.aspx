<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="STMA.Secured.AdminHome" MasterPageFile="~/Secured/STMAUserMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <h1></h1>
    <table style="width: 80%;" border="0" align="center">
        <tr>
            <td colspan="5"><b>search services</b></td>
           
        </tr>
        <tr>
            <td><asp:TextBox ID="sDate" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;<asp:ImageButton ID="btnCalendar" runat="server"  ImageUrl="~/Calendar-icon.png" OnClick="btnCalendar_Click" />
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="03/25/2019 15:04:14" VisibleDate="2019-03-25">
                    <SelectedDayStyle BackColor="#0066CC" />
                </asp:Calendar>
            </td>
            <td>&nbsp;</td>
            <td valign="top">
                <asp:DropDownList ID="ddlServices" runat="server">
                </asp:DropDownList>
            </td>
            <td valign="top">
                <asp:DropDownList ID="ddlReportType" runat="server"  >
                    <asp:ListItem Text="Token Statistics" Value="1" />
                    <asp:ListItem Text="Anomalies" Value="2" />
                </asp:DropDownList>
            </td>
            <td valign="top">
                <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" CssClass="btnSmall" />
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="pnlTokens" runat="server">
    <table width="80%" border="0" align="center">  
    <tr > 
        <td width="35%" valign="top"><asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server">  
            <ItemTemplate>  
                <div>  
                    <table width="100%" cellpadding="0" cellspacing="0">  
                        <tr >  
                            <td colspan="2" style="background-color:#77a3f3">
                            <b><%#Eval("ServiceName")%></b>  
                            </td>
                            <td style="background-color:#77a3f3"><asp:Button ID="btn" CommandArgument='<%#Eval("ServiceID")%>' OnCommand="btn_Command" runat="server" Text="Show Details" CssClass="btnSmall" /></td>
                        </tr>  
                        <tr>  
                            <td>Total Generated Tokens:</td>  
                            <td><%#Eval("TotalTokens")%></td> 
                            
                        </tr>  
                        <tr>  
                            
                            <td>Processed Tokens:</td>  
                            <td><%#Eval("ProcessedTokens")%></td>  
                            
                        </tr>  
                        <tr> 
                           
                            <td>Cancelled Tokens</td>  
                            <td><%#Eval("CancelledTokens")%></td> 
                            
                        </tr>  
                          <tr> 
                            
                            <td>Waiting Tokens:</td>  
                            <td><%#Eval("TokensWaiting")%></td> 
                            
                        </tr>  
                    </table>  
                </div>  
            </ItemTemplate>  
        </asp:Repeater>
</td>
        <td width="100%" valign="top" align="left">
            <asp:Label ID="lblSTMsg" runat="server" ></asp:Label>
       <asp:GridView ID="gvToken" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
     <AlternatingRowStyle BackColor="#CCCCCC" />  
     <columns>  
         <asp:TemplateField HeaderText="Token Number" SortExpression="ServiceTokenID">  
             <ItemTemplate>  
                 <asp:Label ID="lblServiceTokenID" runat="server" Text='<%#Bind("ServiceTokenID") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Current Status" SortExpression="StatusText">  
             <ItemTemplate>  
                 <asp:Label ID="lblStatusText" runat="server" Text='<%#Bind("StatusText") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Room No" SortExpression="RoomNo">  
             <ItemTemplate>  
                 <asp:Label ID="lblRoomNo" runat="server" Text='<%#Bind("RoomNo") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Employee" SortExpression="EmpName">  
             <ItemTemplate>  
                 <asp:Label ID="lblEmpName" runat="server" Text='<%#Bind("EmpName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Patient" SortExpression="PatientName">  
             <ItemTemplate>  
                 <asp:Label ID="lblPatientName" runat="server" Text='<%#Bind("PatientName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
     </columns>  
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView>  
        </td>
        
    </tr></table>
        </asp:Panel>
    <asp:Panel ID="pnlAnomalies" runat="server">                         <%--for anomalies--%>

         <table width="80%" border="0" align="center">  
         <tr>
            <td ><b>service token anomalies</b></td>
            
        </tr>
   <tr > 
       
        <td width="100%" valign="top" align="left">
            <asp:Label ID="lblSTdelay" runat="server" ></asp:Label>
       <asp:GridView ID="gvSTdelay" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
     <AlternatingRowStyle BackColor="#CCCCCC" />  
     <columns>  
         <asp:TemplateField HeaderText="Token Number" SortExpression="ServiceTokenID">  
             <ItemTemplate>  
                 <asp:Label ID="lblServiceTokenID" runat="server" Text='<%#Bind("ServiceTokenID") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Service" SortExpression="ServiceName">  
             <ItemTemplate>  
                 <asp:Label ID="lblServiceName" runat="server" Text='<%#Bind("ServiceName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Room No" SortExpression="RoomNo">  
             <ItemTemplate>  
                 <asp:Label ID="lblRoomNo" runat="server" Text='<%#Bind("ServiceRoomID") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Employee" SortExpression="EmpName">  
             <ItemTemplate>  
                 <asp:Label ID="lblEmpName" runat="server" Text='<%#Bind("EmpName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Time spent" SortExpression="TimeSpentSec">  
             <ItemTemplate>  
                 <asp:Label ID="lblTimeSpentSec" runat="server" Text='<%#Bind("TimeSpentSec") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField> 
         <asp:TemplateField HeaderText="Average Serving Time" SortExpression="AvgServiceTimeSec">  
             <ItemTemplate>  
                 <asp:Label ID="lblAvgServiceTimeSec" runat="server" Text='<%#Bind("AvgServiceTimeSec") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Delay in Sec" SortExpression="Delay">  
             <ItemTemplate>  
                 <asp:Label ID="lblDelay" runat="server" Text='<%#Bind("Delay") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
     </columns>  
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView>  
        </td>
        
    </tr>
 <tr>
            <td ><b>service start time anomalies</b></td>
            
        </tr>
    <tr > 
       
        <td width="100%" valign="top" align="left">
            <asp:Label ID="lblSdelay" runat="server" ></asp:Label>
       <asp:GridView ID="gvSdelay" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
     <AlternatingRowStyle BackColor="#CCCCCC" />  
     <columns>  
          <asp:TemplateField HeaderText="Service" SortExpression="ServiceName">  
             <ItemTemplate>  
                 <asp:Label ID="lblServiceName" runat="server" Text='<%#Bind("ServiceName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
        
         <asp:TemplateField HeaderText="Room No" SortExpression="RoomNo">  
             <ItemTemplate>  
                 <asp:Label ID="lblRoomNo" runat="server" Text='<%#Bind("RoomNo") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Start Time" SortExpression="ActualStartTime">  
             <ItemTemplate>  
                 <asp:Label ID="lblActualStartTime" runat="server" Text='<%#Bind("ActualStartTime") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Delayed Start Time" SortExpression="DelayedStartTime">  
             <ItemTemplate>  
                 <asp:Label ID="lblDelayedStartTime" runat="server" Text='<%#Bind("DelayedStartTime") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Delay in Sec" SortExpression="Delay">  
             <ItemTemplate>  
                 <asp:Label ID="lblDelay" runat="server" Text='<%#Bind("Delay") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField> 
     </columns>  
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView>  
        </td>
        
    </tr>
             <tr>
            <td ><b>service close time anomalies</b></td>
            
        </tr>
<tr > 
       
        <td width="100%" valign="top" align="left">
            <asp:Label ID="lblSce" runat="server" ></asp:Label>
       <asp:GridView ID="gvSce" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
     <AlternatingRowStyle BackColor="#CCCCCC" />  
     <columns>  
        <asp:TemplateField HeaderText="Service" SortExpression="ServiceName">  
             <ItemTemplate>  
                 <asp:Label ID="lblServiceName" runat="server" Text='<%#Bind("ServiceName") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
        
         <asp:TemplateField HeaderText="Room No" SortExpression="RoomNo">  
             <ItemTemplate>  
                 <asp:Label ID="lblRoomNo" runat="server" Text='<%#Bind("RoomNo") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Close Time" SortExpression="ActualEndTime">  
             <ItemTemplate>  
                 <asp:Label ID="lblActualEndTime" runat="server" Text='<%#Bind("ActualEndTime") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Closed Early At" SortExpression="ClosedTime">  
             <ItemTemplate>  
                 <asp:Label ID="lblClosedTime" runat="server" Text='<%#Bind("ClosedTime") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Early in Sec" SortExpression="Early">  
             <ItemTemplate>  
                 <asp:Label ID="lblEarly" runat="server" Text='<%#Bind("Early") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
     </columns>  
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView>  
        </td>
        
    </tr>
          

    </table>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    </asp:Content>

