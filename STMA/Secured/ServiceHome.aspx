<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="STMAUserMaster.Master" CodeBehind="ServiceHome.aspx.cs" Inherits="STMA.Secured.ServiceHome" %>
<%--<%@ Register TagPrefix="stma" TagName="TokenAggUC" Src="ServiceTokenInfo.ascx" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--   <stma:TokenAggUC id="TokenAggInfo" runat="server"/>--%>
   
<table style="width: 80%;" border="0" align="center">
    <tr>
        <td style="background-color:#b2b2b7" colspan="2"><b><%=ServiceName%></b></td>
        <td style="background-color:#b2b2b7" width="40%">
            <asp:Button ID="btnNext" runat="server" Text="Next Token" OnClick="btnNext_Click" CssClass="btnNormal" />
            &nbsp;<asp:Button ID="btnClose" runat="server" Text="Close Token" OnClick="btnClose_Click" CssClass="btnNormal" />
            &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel Token" OnClick="btnCancel_Click" CssClass="btnNormal" />
        </td>
                
    </tr>
    <tr>
        <td colspan="3" align="center">
             <iframe src='ServiceAggDisplay.aspx'  width='100%' height='300px' scrolling='No' name='if1' frameborder="0"></iframe>
        </td>
    </tr>
    <%--<tr>
        <td align="center" class="auto-style15"><b>Total Tokens Generated</b></td>
        <td align="center" class="auto-style2"><b>Total Waiting Tokens</b></td>
        <td align="center" class="auto-style10"><b>Current Running Token QNo</b></td>
    </tr>
    <tr>
        <td align="center" class="auto-style12"><b><font size="15"><%=TotalTokens%></font></b></td>
        
        <td align="center" class="auto-style13"><b><font size="15"><%=WaitingTokens%></font></b></td>
        <td align="center" class="auto-style14"><b><font size="15" color="brown"><%=CurrentRunningTokenQNo%></font></b></td>
    </tr>
    <tr>
        <td align="center" class="auto-style15"><b>Rooms</b></td>
        <td align="center" class="auto-style2"><b>Expected Queue Waiting Time</b></td>
        <td align="center" class="auto-style10"><b>Token No</b></td>
    </tr>
    <tr>
        <td align="center" class="auto-style8"><b><font size="15"><%=Rooms%></font></b></td>
        <td align="center" class="auto-style9"><b><font size="15" color="brown"><%=WaitingTime%></font></b></td>
        <td align="center" class="auto-style11"><b><font size="6"><%=CurrentRunningToken%></font></b></td>
    </tr>
     <tr>
         <td align="center" class="auto-style8">&nbsp;</td>
        <td align="center" class="auto-style9">&nbsp;</td>
         <td align="left" >
            <table style="background-color:#77a3f3" width="100%">
                <tr><td><b>user Information</b></td></tr>
                <tr><td><b>name: <font color="brown"><%=UserName%></font></b></td></tr>
                <tr><td><b>age:  <font color="brown"><%=Age%></font></b></td></tr>
                <tr><td><b>gender:  <font color="brown"><%=Gender%></font></b></td></tr>
                <tr><td><b>address: <font color="brown"><%=Address%></font></b></td></tr>
            </table>
        </td>
    </tr>
     <tr>
        <td align="center" class="auto-style8"></td>
        <td align="center" class="auto-style9"></td>
        <td align="center" class="auto-style11"></td>
    </tr>--%>
</table>
   
</asp:Content>
