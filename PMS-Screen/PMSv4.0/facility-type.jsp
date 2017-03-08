

<%@page import="Config.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.getAttribute("hfc");
    session.getAttribute("discipline");
    session.getAttribute("subDicipline");
%>
<html>
    <body>
        <div class="row">
            <div class="col-md-12">
                <div class="thumbnail"  id="maintainFaciltyType">
                    <h4>Maintain Ward/Facility Type</h4>
                    <form class="form-horizontal" id="facilityTypeForm">

                        <!-- session -->
                        <input id="hfc" type="hidden" value="<%= session.getAttribute("hfc")%>">
                        <input id="discipline" type="hidden" value="<%= session.getAttribute("discipline")%>">
                        <input id="sub" type="hidden" value="<%= session.getAttribute("subDicipline")%>">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Ward Class.</label>
                            <div class="col-md-4">
                                <input id="WardClass" name="WardClass" type="text" placeholder="Select Ward Class" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Ward Class ID.</label>
                            <div class="col-md-4">
                                <input id="WardTypeID" name="WardTypeID" type="text" placeholder="Select Ward Class ID" class="form-control input-md">
                            </div>
                        </div>



                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Status</label>
                            <div class="col-md-4">
                                <select class="form-control" name="status" id="status">
                                    <option id="status1" value="1">Active</option>
                                    <option id="status2" value="0">Inactive</option>
                                </select>
                            </div> 
                        </div>
                        <div class="text-center">
                            <button id="type_add" name="type_add" class="btn btn-default"><i class="fa fa-plus fa-lg"></i>&nbsp; Add</button>

                            <button id="type_clear" name="type_clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12">		
                <div class="thumbnail">
                    <h4>List of Facility Type</h4>
                    <div id="tableFacility_Type" class="form-group">
                        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listFacilityType">
                            <th>Ward Class</th>
                            <th>Ward Class ID</th>
                            <th>Status</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </table>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--        <script src="bootstrap-3.3.6-dist/js/bootstrap.js" type="text/javascript"></script>-->
<!--        <script src="bootstrap-3.3.6-dist/js/jquery-2.1.4.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>-->

        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script>
            w3IncludeHTML();
        </script>
        <script>

            $(document).ready(function () {
                $('#type_add').on('click', function (e) {
                    e.preventDefault();
                    var WardClass = $('#WardClass').val();
                    var WardTypeID = $('#WardTypeID').val();
                    var status = $('#status').val();
                    var hfc = $('#hfc').val();
                    var discipline = $('#discipline').val();
                    var subDicipline = $('#subDicipline').val();

                    if (WardClass === "") {
                        alert("Complete The Fields");
                        return false;
                    }
                    if (WardTypeID === "") {
                        alert("Complete The Fields");
                        return false;
                    }
                    if (status !== "1" && status !== "0") {
                        alert("Complete The Fields");
                        return false;
                    } else {
                        var data = {
                            WardClass: WardClass,
                            WardTypeID: WardTypeID,
                            status: status
                        };
                        console.log(data);
                        $.ajax({
                            url: "facilityTypeInsert.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (data) {
                                console.log(data);
                                if (data.trim() === 'Success') {
                                    bootbox.alert("Facilty Type successfully added");
//                                    $('#facilityTypeForm')[0].reset();
//                                    $.ajax({
//                                        url: "facility-type-table.jsp",
//                                        type: "post",
//                                        timeout: 3000,
//                                        success: function (returnhtml) {
//                                            //console.log(returnhtml);
//                                            $('#tableFacility_Type').html(returnhtml);
//                                        }
//                                    });
                                } else {
                                    bootbox.alert("Fail to add the facilty type");
                                }

                            }, error: function (err) {
                                 console.log("Ajax Is Not Success " + err);

                            }

                        });
                    }


                });
                //function to clear the form when click clear button

                function reset() {
                    document.getElementById("WardClass").value = "";
                    document.getElementById("WardTypeID").value = "";
                    document.getElementById("status1").checked = false;
                    document.getElementById("status2").checked = false;

                }
                $('#type_clear').on('click', function (e) {
                    e.preventDefault();
                    reset();


                });



                //function to edit facility type from table
                $('#tableFacility_Type').on('click', '#listFacilityType #FacilityTypeedit', function (e) {
                    e.preventDefault();

                    //go to the top
                    $('html,body').animate({
                        scrollTop: $("#maintainFacilityType").offset().top
                    }, 500);

                    //get the row value
                    var row = $(this).closest("tr");
                    var rowData = row.find("#facilitytype").val();
                    var arrayData = rowData.split("|");
                    //assign into seprated val
                    var WardClass = arrayData[0], WardTypeID = arrayData[1], status = arrayData[2];
                    //set value in input on the top




                    $('#WardClass').val(WardClass);
                    $('#WardTypeID').val(WardTypeID);
                    $('#status').val(status);

                    console.log(arrayData);
                });

//delete function when click delete on next of kin
                $('#tableFacility_Type').on('click', '#listFacilityType #FacilityTypedelete', function (e) {
                    e.preventDefault();
                    var row2 = $(this).closest("tr");
                    var rowData2 = row2.find("#facilitytype").val();

                    console.log(rowData2);
                    bootbox.confirm({
                        message: "Are you sure want to delete facility type information?",
                        buttons: {
                            confirm: {
                                label: 'Yes',
                                className: 'btn-success'
                            },
                            cancel: {
                                label: 'No',
                                className: 'btn-danger'
                            }
                        },
                        callback: function (result) {

                            if (result === true) {
                                //get the row value
                                row2.remove();
                                var arrayData2 = rowData2.split("|");
                                //assign into seprated val
                                var pmino = arrayData2[0], seqno = arrayData2[1];
                                var datas = {pmino: pmino, seqno: seqno};
                                console.log(datas);
                                $.ajax({
                                    type: "post",
                                    url: "facilityTypeDelete.jsp",
                                    data: datas,
                                    timeout: 3000,
                                    success: function (data) {
                                        console.log("delete " + data);


                                    }, error: function () {

                                    }

                                });
                            }
                        }
                    });
                });
            });


        </script> 
        <br>



    </body>
</html>