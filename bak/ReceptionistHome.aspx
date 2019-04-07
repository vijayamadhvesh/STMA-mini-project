<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceptionistHome.aspx.cs" Inherits="STMA.ReceptionistHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var pid;
            $("#UserDetailsPanel").hide();
             $("#UserEditPanel").hide();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "STMAWebService.asmx/LoadServices",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    
                    $.each(Result.d, function (key, value) {
                        $("#ddlservices").append($("<option></option>").val(value.ServiceID).html(value.ServiceName));
                    });
                },
                error: function (Result) {
                    alert("Error");
                }
            });

            $("#btnShow").click(function (event) {
                var paramMobile = $("#<%=txtMobile.ClientID %>").val();
                var params = '{ Mobile: ' + JSON.stringify(paramMobile) + '}';
                $("#UserEditPanel").hide();
                $("#UserDetailsPanel").show();
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/LoadUsers",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                        
                        $.each(Result.d, function (index, item) {
                            pid = item.UserID;
                            var tablerows = "<table><tr><td>User ID</td><td>:</td><td>" + item.UserID + "</td></tr>"
                                + "<tr><td>Patient ID</td><td>:</td><td>" + item.UserName + "</td></tr>"
                                + "<tr><td>Date Of Birth</td><td>:</td><td>" + item.dob + "</td></tr>"
                                + "<tr><td>Age</td><td>:</td><td>" + item.age + "</td></tr>"
                                + "<tr><td>Gender</td><td>:</td><td>" + item.gender + "</td></tr>"
                                + "<tr><td>Address</td><td>:</td><td>" + item.address + "</td></tr>"
                                + "<tr><td>Mobile</td><td>:</td><td>" + item.mobile + "</td></tr></table>";
                            $('#UserDetails').html(tablerows);
                        });
                        
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                event.preventDefault();
                event.stopPropagation();
            }); 

            //// After pressing edit button
            $("#btnEditUserDetails").click(function () {
                $("#UserDetailsPanel").hide();
                $("#UserEditPanel").show();
                var params = '{ UserID: ' + JSON.stringify(pid) + '}';
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/LoadUsersWithID",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                        $.each(Result.d, function (index, item) {
                            var tablerows = "<table>"//<tr><td>User ID</td><td>:</td><td> + <input id='txtUserID' type='text' value='"+ item.UserID +"'/>" + "</td></tr>"
                                + "<tr><td>Patient ID</td><td>:</td><td><input id='txtUserID' type='text' readonly value='"+ item.UserID +"'/>" + "</td></tr>"
                                + "<tr><td>Patient Name</td><td>:</td><td><input id='txtUserName' type='text' value='"+ item.UserName +"'/>" + "</td></tr>"
                                + "<tr><td>Date Of Birth</td><td>:</td><td><input id='txtDOB' type='text' value='"+ item.dob  +"'/>" + "</td></tr>"
                                + "<tr><td>Gender</td><td>:</td><td><input id='txtGender' type='text' value='"+ item.gender +"'/>" + "</td></tr>"
                                + "<tr><td>Address</td><td>:</td><td><input id='txtAddress' type='text' value='"+ item.address +"'/>" + "</td></tr>"
                                + "<tr><td>Mobile</td><td>:</td><td><input id='txtMobile' type='text' value='" + item.mobile + "'/>" + "</td></tr>"
                                + "</table>";
                            $('#UserEditForm').html(tablerows);
                        });
                        
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                return false;
                
            }); 

            //// After pressing save details button
            /*$("#btnEditUserDetails").click(function () {
                $("#UserDetailsPanel").show();
                $("#UserEditPanel").hide();
                //alert(pid);
                //var paramMobile = $("#<=txtMobile.ClientID %>").val();
                var pname = $("#txtUserName").val();
                var dob = $("#txtDOB").val();
                var gender = $("#txtGender").val();
                var address = $("#txtAddress").val();
                var mobile = $("#txtMobile").val();
                var params = '{ UserID: ' + JSON.stringify(pid) + ',UserName: ' + JSON.stringify(pname) + ',dob: ' + JSON.stringify(dob)+ ',gender: ' + JSON.stringify(gender)+ ',address: ' + JSON.stringify(address)+ ',mobile: ' + JSON.stringify(mobile) + '}';
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/AddUpdateUser",
                    data: params,
                    dataType: "json",
                    success: function (Result) {

                        $("#msgEdit").html = "<b> pid + ' details sucessfully edited.' </b>";
                        
                        
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                return false;
                
            });*/
            
        });
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            <button id="btnShow" >Show Users</button>
            <asp:DropDownList ID="ddlservices" runat="server">
            </asp:DropDownList>
            <button id="btnGenToken" >Generate Token</button>
        </div>
        <div id="UserDetailsPanel">
            <span id="msgEdit"></span>
            <div id="UserDetails" >

            </div>
            </br>
            <button id='btnEditUserDetails' >Edit Details</button>
        </div>
        <div id="UserEditPanel">
            <div id="UserEditForm"></div></br><button id='btnSaveUserDetails' >Save Details</button>
        </div>
        <div id="ServiceDetailsPanel">
        </div>
    </form>
</body>
</html>
