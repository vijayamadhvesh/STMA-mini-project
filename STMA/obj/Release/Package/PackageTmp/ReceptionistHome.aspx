<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceptionistHome.aspx.cs" Inherits="STMA.ReceptionistHome" EnableEventValidation="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/STMAStyles.css">
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#ClearAll').click(function() {
            location.reload();
        });
        function validateForm(pname,dob,gender,address,mobile)
        {
                if (pname.length < 1) {
                    alert("Please enter User Name"); return false;
                     }
                if (dob.length < 1) {
                    alert("Please enter Date of birth"); return false;
                }
                else {
                    var d = new Date(dob);
                    if (isNaN(d.valueOf())) {
                    alert("Please enter a valid Date of birth"); return false;
                    }
                   // alert(!isNaN(d.valueOf())); return false;
                }
                 if (gender.length != 1) {
                    alert("Please enter valid gender. M/F"); return false;
                }
                 if (address.length < 1) {
                    alert("Please enter address"); return false;
                }
                 if (mobile.length < 1) {
                    alert("Please enter a valid Mobile Number"); return false;
                     }
            return true;
        }

        $(document).ready(function () {
            var pid;
            $("#UserDetailsPanel").hide();
            $("#UserEditPanel").hide();
            $("#AddUserPanel").hide();
          //  $("#SearchTokenPanel").hide();
            $("#ServiceTokenPanel").hide();
             $("#btnGenToken").prop("disabled",true);
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

            // after pressing show user

            $("#btnShow").click(function (event) {
                var paramMobile = $("#<%=txtMobile.ClientID %>").val();
                if (paramMobile.length < 1) {
                    alert("Please enter Mobile Number"); return false;
                     }
                var params = '{ Mobile: ' + JSON.stringify(paramMobile) + '}';
              //  $("#SearchTokenPanel").hide();
                $("#ServiceTokenPanel").hide();
                $("#AddUserPanel").hide();
                $("#UserEditPanel").hide();
                $("#UserDetailsPanel").hide();
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/LoadUsers",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                       
                        $.each(Result.d, function (index, item) {
                            pid = item.UserID;
                            if (pid == 0)
                            {
                                var tablerows = "<table>"
                                    + "<tr><td>User Name</td><td>:</td><td><input id='txtUserNameNew' type='text'/>" + "</td></tr>"
                                    + "<tr><td>Date Of Birth</td><td>:</td><td><input id='txtDOBNew' type='text'/>" + "</td></tr>"
                                    + "<tr><td>Gender</td><td>:</td><td><input id='txtGenderNew' type='text'/>" + "</td></tr>"
                                    + "<tr><td>Address</td><td>:</td><td><input id='txtAddressNew' type='text'/>" + "</td></tr>"
                                    + "<tr><td>Mobile</td><td>:</td><td><input id='txtMobileNew' type='text' value='" + paramMobile + "'/>" + "</td></tr>"
                                    + "</table>";
                                $('#UserAddForm').html(tablerows);
                                $("#AddUserPanel").show();
                                  $("#btnGenToken").prop("disabled",true);
                            }
                            else
                            {

                                 var tablerows = "<table><tr><td>User ID</td><td>:</td><td>" + item.UserID + "<input id='txtUserID' type='hidden' value='"+ item.UserID +"'/>" + "</td></tr>"
                                + "<tr><td>User Name</td><td>:</td><td>" + item.UserName + "</td></tr>"
                                + "<tr><td>Date Of Birth</td><td>:</td><td>" + item.dob + "</td></tr>"
                                + "<tr><td>Age</td><td>:</td><td>" + item.age + "</td></tr>"
                                + "<tr><td>Gender</td><td>:</td><td>" + item.gender + "</td></tr>"
                                + "<tr><td>Address</td><td>:</td><td>" + item.address + "</td></tr>"
                                + "<tr><td>Mobile</td><td>:</td><td>" + item.mobile + "</td></tr></table>"; 
                                $('#UserDetails').html(tablerows);
                                $("#UserDetailsPanel").show();
                                  $("#btnGenToken").prop("disabled",false);
                            }
                           
                                
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
               //  $("#SearchTokenPanel").hide();
                $("#ServiceTokenPanel").hide();
                $("#AddUserPanel").hide();
                $("#UserEditPanel").hide();
                $("#UserDetailsPanel").hide();
                
              
                var params = '{ UserID: ' + JSON.stringify(pid) + '}';
               // alert(params);
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
                                + "<tr><td>Mobile</td><td>:</td><td><input id='txtMobileEdit' type='text' value='" + item.mobile + "'/>" + "</td></tr>"
                                + "</table>";
                            $('#UserEditForm').html(tablerows);
                             $("#UserEditPanel").show();
                        });
                        
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                return false;
                
            }); 

            //// After pressing Add New User button
            $("#btnAddNew").click(function () {
               // $("#UserDetailsPanel").show();
              //  $("#UserEditPanel").hide();
                var pid = $("#txtUserID").val();
               // alert(pid);
                var UserID = "1012";
                //var paramMobile = $("#<=txtMobile.ClientID %>").val();
                //alert(paramMobile);
                var pname = $("#txtUserNameNew").val();
                var dob = $("#txtDOBNew").val();
                var gender = $("#txtGenderNew").val();
                var address = $("#txtAddressNew").val();
                var mobile = $("#txtMobileNew").val();

               var rslt = validateForm(pname, dob, gender, address, mobile);
                if (!rslt) {
                    return false;
                }
            
                var params = '{ pName: ' + JSON.stringify(pname) + ',dob: ' + JSON.stringify(dob)+ ',gender: ' + JSON.stringify(gender)+ ',address: ' + JSON.stringify(address)+ ',mobile: ' + JSON.stringify(mobile) + ',UserID: ' + JSON.stringify(UserID) + '}';
                //AddPatient(string pName, string dob, string gender, string address, string mobile, string UserID)
              // alert(params);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/AddPatient",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                       // alert(Result.d);
                        $("#msgEdit").html = "<b> Patient details were sucessfully edited.' </b>";
                         $("#<%=txtMobile.ClientID %>").val(mobile);
                       $('#btnShow').trigger('click'); 
                       // alert("success");
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
               // event.preventDefault();
               // event.stopPropagation();
                return false;
                
            });

            //// After pressing save details button
            $("#btnSaveUserDetails").click(function () {
               // $("#UserDetailsPanel").show();
              //  $("#UserEditPanel").hide();
                var pid = $("#txtUserID").val();
               // alert(pid);
                var UserID = "1012";
                //var paramMobile = $("#<=txtMobile.ClientID %>").val();
                //alert(paramMobile);
                var pname = $("#txtUserName").val();
                var dob = $("#txtDOB").val();
                var gender = $("#txtGender").val();
                var address = $("#txtAddress").val();
                var mobile = $("#txtMobileEdit").val();

                var rslt = validateForm(pname, dob, gender, address, mobile);
                if (!rslt) {
                    return false;
                }
                var params = '{ pID: ' + JSON.stringify(pid) + ',UserName: ' + JSON.stringify(pname) + ',dob: ' + JSON.stringify(dob)+ ',gender: ' + JSON.stringify(gender)+ ',address: ' + JSON.stringify(address)+ ',mobile: ' + JSON.stringify(mobile) + ',UserID: ' + JSON.stringify(UserID) + '}';
                //string pID,string UserName,string dob,string gender,string address,string mobile, string UserID
              // alert(params);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/UpdatePatient",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                       // alert(Result.d);
                        $("#msgEdit").html = "<b> pid + ' details sucessfully edited.' </b>";
                       $("#<%=txtMobile.ClientID %>").val(mobile);
                       $('#btnShow').trigger('click'); 
                       // alert("success");
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
               // event.preventDefault();
               // event.stopPropagation();
                return false;
                
            });

            $("#btnGenToken").click(function () {
               // $("#UserDetailsPanel").show();
              //  $("#UserEditPanel").hide();
                var sid = $('#ddlservices').val();
                var pid = $("#txtUserID").val();
              // alert(pid + ' ' + sid);
                var UserID = "1012";
                //var paramMobile = $("#<=txtMobile.ClientID %>").val();
                //alert(paramMobile);
               
                var params = '{ ServiceID: ' + JSON.stringify(sid) + ',PatientID: ' + JSON.stringify(pid) + ',UserID: ' + JSON.stringify(UserID) + '}';
                //string pID,string UserName,string dob,string gender,string address,string mobile, string UserID
               //alert(params);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/GenerateServiceToken",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                        $.each(Result.d, function (index, item) {
                            if (item.ServiceTokenID != 0) {
                                var tablerows = "<table><tr><td>Service Name</td><td>:</td><td>" + item.ServiceName + "</td></tr>"
                                    + "<tr><td>Service Token ID</td><td>:</td><td>" + item.ServiceTokenID + "</td></tr>"
                                    + "<tr><td>Queue Number</td><td>:</td><td>" + item.QueueNo + "</td></tr>"
                                    + "<tr><td>Bay Area</td><td>:</td><td>" + item.BayArea + "</td></tr>"
                                    + "<tr><td>Rooms</td><td>:</td><td>" + item.Rooms + "</td></tr>"
                                    + "<tr><td>Expected Waiting Time</td><td>:</td><td>" + item.ExpectedWaitingTime + "</td></tr>"
                                    + "</table>";
                            }
                            else
                            {
                                var tablerows = "<table valign='Top'><tr><td valign='Top'><font color='red'>Token generation is temporarily stopped.Please try after some time.</font></td></tr>"
                                    + "</table>";
                            }
                            $('#ServiceTokenPanel').html(tablerows);
                             $("#ServiceTokenPanel").show();
                        });
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
               // event.preventDefault();
               // event.stopPropagation();
                return false;
                
            }); 

            // After clicking Search
              $("#btnSearch").click(function (event) {
                  var paramNo = $("#searchText").val();
                   if (paramNo.length < 1) {
                    alert("Please enter Token or Queue Number."); return false;
                  }
                   if (!$.isNumeric(paramNo)) {
                    alert("Please enter a valid Token or Queue Number."); return false;
                     }
                   var serviceid = $('#ddlservices').val();
                var params = '{ TokenOrQNo: ' + JSON.stringify(paramNo) + ',ServiceID: ' + JSON.stringify(serviceid) + '}';
                
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "STMAWebService.asmx/LoadServiceTokenWithID",
                    data: params,
                    dataType: "json",
                    success: function (Result) {
                       
                        $.each(Result.d, function (index, item) {
                            pid = item.ServiceTokenID;
                            if (pid == 0)
                            {
                                var tablerows = "<table valign='Top'>"
                                    + "<tr><td valign='Top'><font color='red'>No Service Token available</font></td></tr>"
                                    + "</table>";
                               $('#SearchTokenPanel').html(tablerows);
                               
                            }
                            else
                            {
                                var tablerows = "<table><tr><td>Service Name</td><td>:</td><td>" + item.ServiceName + "</td></tr>"
                                + "<tr><td>Service Token ID</td><td>:</td><td>" + item.ServiceTokenID + "</td></tr>"
                                + "<tr><td>Queue Number</td><td>:</td><td>" + item.QueueNo + "</td></tr>"
                                + "<tr><td>Bay Area</td><td>:</td><td>" + item.BayArea + "</td></tr>"
                                    + "<tr><td>Rooms</td><td>:</td><td>" + item.Rooms + "</td></tr>"
                                    + "<tr><td>Current Status</td><td>:</td><td>" + item.CurrentStatus + "</td></tr>"
                                + "<tr><td>Expected Waiting Time</td><td>:</td><td>" + item.ExpectedWaitingTime + "</td></tr>"
                                + "</table>";

                                tablerows = tablerows + "<table><tr>&nbsp;</td></tr>"
                                + "<tr><td>User Name</td><td>:</td><td>" + item.UserName + "</td></tr>"
                                + "<tr><td>Age</td><td>:</td><td>" + item.age + "</td></tr>"
                                + "<tr><td>Gender</td><td>:</td><td>" + item.gender + "</td></tr>"
                                + "<tr><td>Address</td><td>:</td><td>" + item.address + "</td></tr>"
                                + "</table>"; 
                                $('#SearchTokenPanel').html(tablerows);
                            }
                           
                                
                        });
                        
                    },
                    error: function (Result) {
                        alert("Error");
                    }
                });
                event.preventDefault();
                event.stopPropagation();
            }); 
        });
        
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 32%;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
     <table width="80%" border="0" align="center" style="background-color:#77a3f3">
                       
            <tr>
                
                <td><img alt="AAM LOGO" src="Images/aamLogo7.PNG" /></td>
                
                <td width="50%">
                    <table width="80%" border="0"  align="center">
                        <tr>
            <td align="left"><b>Service Token Management System</b><br /> </td>
            </tr>
        <tr>
            <td align="left"><b>Today: <%=DateTime.Now.ToString("dddd, dd MMMM yyyy") %></b><br /> </td>
            </tr>
            <tr>
            <td align="left" ><b><asp:Label ID="lblUserName" runat="server"></asp:Label></b><br />                        
            </td>

            </tr>
            <tr>
            <td align="left" >
                <button id='ClearAll' class="btnNormal" >Clear All</button>&nbsp;
                <asp:Button ID="btnSignout" runat="server" Text="Sign out" OnClick="btnSignout_Click" CssClass="btnNormal" /></td>
        </tr>
    </table>

                </td>
            </tr>
           
        </table>
    
   <div>
        <table width="80%" border="0" align="center">
            <tr>
            <td align="left" style="background-color:#b2b2b7" width="30%"><b>user information</b>
            </td>
            <td align="left" style="background-color:#b2b2b7" width="40%"><b>services</b>         
            </td>
            <td align="left" style="background-color:#b2b2b7" colspan="2"><b>search token</b></td>
        </tr>
            <tr>
             <td>        
            <asp:TextBox ID="txtMobile" runat="server" placeholder="User Mobile Number"></asp:TextBox>
            <button id="btnShow" class="btnSmall">Show User</button>
            </td><td>
            <asp:DropDownList ID="ddlservices" runat="server">
            </asp:DropDownList>
            <button id="btnGenToken" class="btnSmall">Generate Token</button>
            </td><td class="auto-style1">
            <input id="searchText" type="text" placeholder="Queue No/Token No" />
            <button id="btnSearch" class="btnSmall">Search</button>
        
            </td></tr>
            <tr>
                <%--<td align="right" width="5%">&nbsp;</td>--%>
                <td>
        <div id="UserDetailsPanel">
            <span id="msgEdit"></span>
            <div id="UserDetails" >

            </div>
            </br>
            <button id='btnEditUserDetails' class="btnSmall">Edit Details</button>
        </div>
        <div id="UserEditPanel">
            <div id="UserEditForm"></div>
            </br>
            <button id='btnSaveUserDetails' class="btnSmall">Save Details</button>
        </div>
        <div id="AddUserPanel">
            <div id="UserAddForm"></div>
            </br>
            <button id='btnAddNew' class="btnSmall">Add New Patient</button>
        </div>
        <div id="ServiceDetailsPanel">
        </div>
        </td><td class="auto-style1">
        <div id="ServiceTokenPanel">
        </div>
        </td><td>
        <div id="SearchTokenPanel">
        </div>
        </td></tr>

        </table>
      
   </div>
    </form>
</body>
</html>
