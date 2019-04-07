<script src="jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var pid;
         alert(pid);
        $("#UserDetailsPanel").hide();
        $("#UserEditPanel").hide();
         $("#AddUserPanel").hide();
            $.ajax({
            type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "STMAWebService.asmx/LoadServices",
                data: "{}",
        dataType: "json",
                success: function (Result) {

            $.each(Result.d, function (key, value) {
                $("#<%=ddlservices.ClientID%>").append($("<option></option>").val(value.ServiceID).html(value.ServiceName));
            });
        },
                error: function (Result) {
            alert("Error");
        }
    });

    // after pressing show user

            $("#btnShow").click(function (event) {
                var paramMobile = $("#<%=txtMobile.ClientID %>").val();
                var params = '{Mobile: ' + JSON.stringify(paramMobile) + '}';
        $("#UserEditPanel").hide();
        $("#UserDetailsPanel").show();
       
                $.ajax({
            type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "STMAWebService.asmx/LoadUsers",
        data: params,
        dataType: "json",
                    success: function (Result) {
                        if (Result.d == null || Result.d == undefined) {
                            var tablerows = "<table>"//<tr><td>User ID</td><td>:</td><td> + <input id='txtUserID' type='text' value='"+ item.UserID +"' />" + "</td></tr>"
                                + "<tr><td>Patient ID</td><td>:</td><td><input id='txtUserID' type='text' readonly />" + "</td></tr>"
                                + "<tr><td>Patient Name</td><td>:</td><td><input id='txtUserName' type='text' />" + "</td></tr>"
                                + "<tr><td>Date Of Birth</td><td>:</td><td><input id='txtDOB' type='text' />" + "</td></tr>"
                                + "<tr><td>Gender</td><td>:</td><td><input id='txtGender' type='text' />" + "</td></tr>"
                                + "<tr><td>Address</td><td>:</td><td><input id='txtAddress' type='text' />" + "</td></tr>"
                                + "<tr><td>Mobile</td><td>:</td><td><input id='txtMobile' type='text' value='" + paramMobile + "' />" + "</td></tr>"
                                + "</table>";
    $('#UserAddForm').html(tablerows);
    $("#UserDetailsPanel").hide();
    $("#AddUserPanel").show();
}
                        else {
            $.each(Result.d, function (index, item) {
                pid = item.UserID;

                var tablerows = "<table><tr><td>User ID</td><td>:</td><td>" + item.UserID + "<input id='txtUserID' type='hidden' value='" + item.UserID + "'/>" + "</td></tr>"
                    + "<tr><td>Patient ID</td><td>:</td><td>" + item.UserName + "</td></tr>"
                    + "<tr><td>Date Of Birth</td><td>:</td><td>" + item.dob + "</td></tr>"
                    + "<tr><td>Age</td><td>:</td><td>" + item.age + "</td></tr>"
                    + "<tr><td>Gender</td><td>:</td><td>" + item.gender + "</td></tr>"
                    + "<tr><td>Address</td><td>:</td><td>" + item.address + "</td></tr>"
                    + "<tr><td>Mobile</td><td>:</td><td>" + item.mobile + "</td></tr></table>";
                $('#UserDetails').html(tablerows);

            });
        }
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
                var params = '{UserID: ' + JSON.stringify(pid) + '}';
        alert(params);
                $.ajax({
            type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "STMAWebService.asmx/LoadUsersWithID",
        data: params,
        dataType: "json",
                    success: function (Result) {
            $.each(Result.d, function (index, item) {
                var tablerows = "<table>"//<tr><td>User ID</td><td>:</td><td> + <input id='txtUserID' type='text' value='"+ item.UserID +"'/>" + "</td></tr>"
                    + "<tr><td>Patient ID</td><td>:</td><td><input id='txtUserID' type='text' readonly value='" + item.UserID + "'/>" + "</td></tr>"
                    + "<tr><td>Patient Name</td><td>:</td><td><input id='txtUserName' type='text' value='" + item.UserName + "'/>" + "</td></tr>"
                    + "<tr><td>Date Of Birth</td><td>:</td><td><input id='txtDOB' type='text' value='" + item.dob + "'/>" + "</td></tr>"
                    + "<tr><td>Gender</td><td>:</td><td><input id='txtGender' type='text' value='" + item.gender + "'/>" + "</td></tr>"
                    + "<tr><td>Address</td><td>:</td><td><input id='txtAddress' type='text' value='" + item.address + "'/>" + "</td></tr>"
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

//// After pressing Add New User button
            $("#btnAddNew").click(function () {
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
        var mobile = $("#txtMobile").val();
                var params = '{UserName: ' + JSON.stringify(pname) + ',dob: ' + JSON.stringify(dob)+ ',gender: ' + JSON.stringify(gender)+ ',address: ' + JSON.stringify(address)+ ',mobile: ' + JSON.stringify(mobile) + ',UserID: ' + JSON.stringify(UserID) + '}';
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
        var mobile = $("#txtMobile").val();
                var params = '{pID: ' + JSON.stringify(pid) + ',UserName: ' + JSON.stringify(pname) + ',dob: ' + JSON.stringify(dob)+ ',gender: ' + JSON.stringify(gender)+ ',address: ' + JSON.stringify(address)+ ',mobile: ' + JSON.stringify(mobile) + ',UserID: ' + JSON.stringify(UserID) + '}';
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
      
                var params = '{ServiceID: ' + JSON.stringify(sid) + ',PatientID: ' + JSON.stringify(pid) + ',UserID: ' + JSON.stringify(UserID) + '}';
        //string pID,string UserName,string dob,string gender,string address,string mobile, string UserID
       alert(params);
                $.ajax({
            type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "STMAWebService.asmx/GenerateServiceToken",
        data: params,
        dataType: "json",
                    success: function (Result) {
            $.each(Result.d, function (index, item) {
                var tablerows = "<table><tr><td>Service Name</td><td>:</td><td>" + item.ServiceName + "</td></tr>"
                    + "<tr><td>Service Token ID</td><td>:</td><td>" + item.ServiceTokenID + "</td></tr>"
                    + "<tr><td>Queue Number</td><td>:</td><td>" + item.QueueNo + "</td></tr>"
                    + "<tr><td>Bay Area</td><td>:</td><td>" + item.BayArea + "</td></tr>"
                    + "<tr><td>Rooms</td><td>:</td><td>" + item.Rooms + "</td></tr>"
                    + "<tr><td>Expected Waiting Time</td><td>:</td><td>" + item.ExpectedWaitingTime + "</td></tr>"
                    + "</table>";
                $('#ServiceTokenPanel').html(tablerows);
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
});

    </script>
