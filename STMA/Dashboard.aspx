<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="STMA.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

   <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>

    <script>
    $(document).ready(
            function() {
                setInterval(function() {
                    //var randomnumber = Math.floor(Math.random() * 100);
                    //$('#show').text(
                    //        'I am getting refreshed every 3 seconds..! Random Number ==> '
                    //                + randomnumber);
                   
                    var bid = <%=Request.QueryString["bayid"].ToString()%>; //GetParameterValues('bayid');
                    //alert(bid);
                    var params = '{ bayid: ' + JSON.stringify(bid) + '}';
                    $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/LoadDashboard",
                    data: params,
                    dataType: "json",
                      success: function (Result) {
                            var tablerows = "<table width='100%' height='600'><tr><td><h1>Service Name</h1></td><td><h1>Room No</h1></td><td><h1>Queue No</h1></td></tr>";
                            $.each(Result.d, function (index, item) {

                             tablerows = tablerows + "<tr><td><h1>" + item.ServiceName + "</h1></td><td><h1>" + item.RoomNo + "</h1></td><td><h1><font color='red'>" + item.QueueNo + "</font></h1></td></tr>";
                                                        
                               
                            });
                          tablerows = tablerows + "</table>"; 
                          //alert(tablerows);
                         $('#dashboard').html(tablerows);
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });


                }, 1000);
            });
</script>
</head>
<body>
    <form id="form1" runat="server">
        
      <%--  <div id="show" align="center"></div>--%>
        <div id="dashboard" style="background-color:lightblue">
        </div>
    </form>
</body>
</html>
