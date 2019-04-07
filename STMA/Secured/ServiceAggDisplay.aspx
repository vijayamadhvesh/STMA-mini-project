<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceAggDisplay.aspx.cs" Inherits="STMA.Secured.ServiceAggDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="../Content/STMAStyles.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%">
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
        </div>
    </form>
</body>
</html>
