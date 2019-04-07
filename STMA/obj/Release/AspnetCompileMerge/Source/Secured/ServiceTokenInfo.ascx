<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServiceTokenInfo.ascx.cs" Inherits="STMA.Secured.ServiceTokenInfo" EnableViewState="false" %>
 


<style type="text/css">
    .auto-style2 {
        width: 383px;
    }
    .auto-style4 {
        width: 322px;
    }
    .auto-style8 {
        height: 91px;
        width: 360px;
    }
    .auto-style9 {
        height: 91px;
        width: 383px;
    }
    .auto-style10 {
        width: 215px;
    }
    .auto-style11 {
        height: 91px;
        width: 215px;
    }
    .auto-style12 {
        height: 61px;
        width: 360px;
    }
    .auto-style13 {
        width: 383px;
        height: 61px;
    }
    .auto-style14 {
        width: 215px;
        height: 61px;
    }
    .auto-style15 {
        width: 360px;
    }
</style>
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
    </tr>
</table>

  
    