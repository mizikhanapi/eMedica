<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
    <div id="header" w3-include-html="libraries/header.jsp"></div>
    <!-- header -->
</head>

<body>
    <!-- menu top -->
    <div id="topMenus" w3-include-html="libraries/topMenus.html"></div>
    <!-- menu top -->
    <%
        String patCat = "select * from lookup_detail where master_ref_code = '0033'";
        String visType = "select * from lookup_detail where master_ref_code = '0022'";
        String eliCat = "select * from lookup_detail where master_ref_code = '0063'";
        String eliType = "select * from lookup_detail where master_ref_code = '0034'";
        String discip = "select * from lookup_detail where master_ref_code = '0072'";
        String prio = "select * from lookup_detail where master_ref_code = '0036'";
        String idTYpe = "select * from lookup_detail where master_ref_code = '0012'";
        String queue = "select * from pms_queue_name";

        ArrayList<ArrayList<String>> dataPatCat, dataVisType, dataEliCat, dataEliType, dataDiscip, dataPrio, dataIdType, dataQueue;

        dataPatCat = connect.getData(patCat);
        dataVisType = connect.getData(visType);
        dataEliCat = connect.getData(eliCat);
        dataEliType = connect.getData(eliType);
        dataDiscip = connect.getData(discip);
        dataPrio = connect.getData(prio);
        dataIdType = connect.getData(idTYpe);
        dataQueue = connect.getData(queue);

    %>


    <div class="container-fluid">
        <div class="row"> 
            <!-- menu side -->
            <div id="sideMenus" w3-include-html="libraries/sideMenus.html"></div>
            <!-- menu side --> 

            <!-- main -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Search Patient</h4>
                            <form class="" name="myForm" id="myForm">
                                <div class="radios" style="margin: 5px 0;">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="selectbasic">Ic/ID type:</label>
                                        <div class="col-md-4">
                                            <select id="idType" name="idType" class="form-control" required="">
                                                <option selected="" disabled="" value="-"> Please select ID type</option>
                                                <option value="pmino">PMI No</option>
                                                <option value="icnew">IC No (NEW)</option>
                                                <option value="icold">IC No (OLD)</option>
                                                <!--<option value="matricno">Matric No</option>
                                                <option value="staffno">Staff No</option>-->
                                                <%                                          for (int i = 0; i < dataIdType.size(); i++) {%>
                                                <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                                                <%  }
                                                %>
                                            </select>
                                        </div>
                                    </div> 
                                </div>
                                <div id="custom-search-input">
                                    <div class="input-group ">
                                        <input type="text" class="search-query form-control" id="idInput" name="idInput" placeholder="ID" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" id="searchPatient" type="button">
                                                <i class=" fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                                <div><span class="pull-right"> <a href="#" alt="Add Items" data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-id-card-o" style=" padding-right: 5px;" aria-hidden="true"></i> Read MyKAD Info</a> </span></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Registration</h4>

                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">

                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">
                                            <h4 class="text-center">Basic Info</h4>
                                            <form style=" margin: 0 auto;" class="form-horizontal" name="myForm2" id="myForm2">
                                                <!-- Text input-->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="textinput">PMI No.</label>
                                                    <div class="col-md-3">
                                                        <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">
                                                    </div>
                                                    <label class="col-md-2 control-label" for="textinput">Name</label>
                                                    <div class="col-md-4">
                                                        <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                                                    </div>
                                                </div>



                                                <!-- Text input-->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="textinput">New IC No.</label>
                                                    <div class="col-md-3">
                                                        <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                                                    </div>
                                                    <label class="col-md-2 control-label" for="textinput">Old IC No.</label>
                                                    <div class="col-md-4">
                                                        <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                                                    </div>
                                                </div>



                                                <!-- Select Basic -->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="selectbasic">ID Type</label>
                                                    <div class="col-md-3">
                                                        <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">

                                                    </div>
                                                    <label class="col-md-2 control-label" for="textinput">Identification No.</label>
                                                    <div class="col-md-4">
                                                        <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                                                    </div>
                                                </div>


                                                </br>		  
                                                <h4 class="text-center">Registration Info</h4>
                                                <!-- Text input-->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="textinput">Registration No.</label>
                                                    <div class="col-md-3">
                                                        <input id="rnNo" name="rnNo" type="text" placeholder="" class="form-control input-md">
                                                    </div>
                                                    <label class="col-md-2 control-label" for="selectbasic">Patient Category</label>
                                                    <div class="col-md-4">
                                                        <select id="patCat" name="patCat" class="form-control">
                                                            <option selected disabled>Select Patient Category</option>
                                                            <!--<option value="2">General OutPatient</option>
                                                            <option value="2">Inpatient</option>
                                                            <option value="2">Specialist OutPatient</option>-->
                                                            <%
                                for (int i = 0; i < dataPatCat.size(); i++) {%>
                                                            <option value="<%=dataPatCat.get(i).get(2)%>"><%=dataPatCat.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>


                                                <!-- Select Basic -->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="selectbasic">Visit Type *</label>
                                                    <div class="col-md-3">
                                                        <select id="visTy" name="visTy" class="form-control">
                                                            <option selected disabled>Select Visit Type</option>
                                                            <!--<option value="2">Appointment</option>
                                                            <option value="2">Referral</option>
                                                            <option value="2">Walk-in</option>-->
                                                            <%
                                for (int i = 0; i < dataVisType.size(); i++) {%>
                                                            <option value="<%=dataVisType.get(i).get(2)%>"><%=dataVisType.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <label class="col-md-2 control-label" for="selectbasic">Emergency Type</label>
                                                    <div class="col-md-4">
                                                        <select id="EmTy" name="EmTy" class="form-control">
                                                            <option  selected="" disabled="">Select Emergency Type</option>
                                                            <option value="-">-</option>       
                                                        </select>
                                                    </div>
                                                </div>



                                                <!-- Select Basic -->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="selectbasic">Eligibility Category</label>
                                                    <div class="col-md-3">
                                                        <select id="EliCat" name="EliCat" class="form-control">
                                                            <option value="1" selected="" disabled="">Select Eligibility Category</option>
                                                            <!--<option value="2">Government</option>
                                                            <option value="2">Private</option>
                                                            <option value="2">Public</option>
                                                            <option value="2">SOCSO</option>-->
                                                            <%
                                for (int i = 0; i < dataEliCat.size(); i++) {%>
                                                            <option value="<%=dataEliCat.get(i).get(2)%>"><%=dataEliCat.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <label class="col-md-2 control-label" for="selectbasic">Eligibility Type</label>
                                                    <div class="col-md-4">
                                                        <select id="EliTy" name="EliTy" class="form-control">
                                                            <option value="1" selected="" disabled="">Select Eligibility Type</option>
                                                            <!--<option value="2">Student</option>
                                                            <option value="2">Staff</option>-->
                                                            <%
                                for (int i = 0; i < dataEliType.size(); i++) {%>
                                                            <option value="<%=dataEliType.get(i).get(2)%>"><%=dataEliType.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- Select Basic -->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="selectbasic">Discipline *</label>
                                                    <div class="col-md-3">
                                                        <select id="Dis" name="Dis" class="form-control">
                                                            <option value="" selected="" disabled="">Select Discipline</option>
                                                            <!--<option value="2">Inpatient Discipline</option>
                                                            <option value="2">Outpatient Discipline</option>-->
                                                            <%
                                for (int i = 0; i < dataDiscip.size(); i++) {%>
                                                            <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- Multiple Radios -->
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="radios">Please select the following option *</label>
                                                    <div class="col-md-2">
                                                        <div class="radio">
                                                            <label for="radios-0">
                                                                <input type="radio" name="radios" id="radios-0" value="Consultant Room">
                                                                Consultant Room
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label for="radios-1">
                                                                <input type="radio" name="radios" id="radios-1" value="Queue">
                                                                Queue
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label for="radios-2">
                                                                <input type="radio" name="radios" id="radios-2" value="Doctor">
                                                                Doctor
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3" id="ckbx">
                                                        <div><select id="select-0" name="select-0" class="form-control">
                                                                <option value="-" selected="" disabled="">Please select consultation room</option>
                                                                <option value="Consultation Room 1">Consultation Room 1</option>
                                                                <option value="Consultation Room 2">Consultation Room 2</option>
                                                                <option value="Consultation Room 3">Consultation Room 3</option>
                                                                <option value="Consultation Room 4">Consultation Room 4</option>
                                                                <option value="Consultation Room 5">Consultation Room 5</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <select id="select-1" name="select-1" class="form-control">
                                                                <option selected="" disabled="">Please select Queue</option>
                                                                <!--                                <option value="1">Option one</option>
                                                                                                <option value="2">Option two</option>-->
                                                                <%
                                    for (int i = 0; i < dataQueue.size(); i++) {%>
                                                                <option value="<%=dataQueue.get(i).get(1)%>"><%="(" + dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1)%></option>
                                                                <%  }
                                                                %>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <select id="select-2" name="select-2" class="form-control">
                                                                <option value="-" disabled="" selected="">Please select Doctor</option>
                                                                <option value="Dr.Jeff">Dr.Jeff</option>
                                                                <option value="Dr.Angeline">Dr.Angeline</option>
                                                                <option value="Dr.Ranjit">Dr.Ranjit</option>
                                                                <option value="Dr.Chung">Dr.Chung</option>
                                                                <option value="Dr.Lee">Dr.Lee</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>    

                                                </br>		  
                                                <h4 class="text-center">Registration Details</h4>                 
                                                <!-- Select Basic -->
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label" for="selectbasic">Priority Group *</label>
                                                    <div class="col-md-4">
                                                        <select id="prioGru" name="prioGru" class="form-control">
                                                            <option value="1" selected="" disabled="">Select Priority Group</option>
                                                            <!--<option value="2">Normal</option>
                                                            <option value="2">Elderly</option>
                                                            <option value="2">Emergency</option>
                                                            <option value="2">Mother with Child</option>
                                                            <option value="2">Disabled</option>-->
                                                            <%
                                for (int i = 0; i < dataPrio.size(); i++) {%>
                                                            <option value="<%=dataPrio.get(i).get(2)%>"><%=dataPrio.get(i).get(2)%></option>
                                                            <%  }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="text-center">
                                                    <button class="btn btn-primary " type="button" id="registerQueue"> Register</button>
                                                    <button class="btn btn-default" type="button"> Appointment List</button>
                                                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > Clear</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu --> 

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main --> 

    </div>
</div>

<!-- Modal Detail -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Form Of Staff</h3>
            </div>
            <div class="modal-body"> 

                <!-- content goes here -->
                <form class="" >
                    <div class="row">
                        <div class="col-md-6">
                            <table class="table table-user-information">
                                <tbody>
                                    <tr>
                                        <td>User ID:</td>
                                        <td><input type="text" class="form-control" placeholder="User ID"></td>
                                    </tr>
                                    <tr>
                                        <td>Health Facility Code:</td>
                                        <td><select class="form-control">
                                                <option>Select Health Facility</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" class="form-control" placeholder="Password"></td>
                                    </tr>
                                    <tr>
                                        <td>Re-enter Password:</td>
                                        <td><input type="password" class="form-control" placeholder="Re-enter Password"></td>
                                    </tr>
                                    <tr>
                                        <td>Full Name:</td>
                                        <td><input type="text" class="form-control" placeholder="Full Name"></td>
                                    </tr>
                                    <tr>
                                        <td>Occupation:</td>
                                        <td><select class="form-control">
                                                <option>Occupation</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Birth Date:</td>
                                        <td><input type="date" class="form-control" placeholder="dd-mm-yyyy"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td><select class="form-control">
                                                <option>Select Gender</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>IC No:</td>
                                        <td><input type="text" class="form-control" placeholder="IC No."></td>
                                    </tr>
                                    <tr>
                                        <td>Home Phone No.:</td>
                                        <td><input type="text" class="form-control" placeholder="Home Phone No."></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table table-user-information">
                                <tbody>
                                    <tr>
                                        <td>Office Phone No.:</td>
                                        <td><input type="text" class="form-control" placeholder="Office Phone No."></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile Phone No.:</td>
                                        <td><input type="text" class="form-control" placeholder="Mobile Phone No."></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" class="form-control" placeholder="example@mail.com"></td>
                                    </tr>
                                    <tr>
                                        <td>Role:</td>
                                        <td><select class="form-control">
                                                <option>Select Role</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Discipline:</td>
                                        <td><select class="form-control">
                                                <option>Select Discipline</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Sub-Discipline:</td>
                                        <td><select class="form-control">
                                                <option>Select Sub-Discipline</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Start Date:</td>
                                        <td><input type="text" class="form-control" placeholder="DD-MM-YYYY"></td>
                                    </tr>
                                    <tr>
                                        <td>End Date:</td>
                                        <td><input type="text" class="form-control" placeholder="DD-MM-YYYY"></td>
                                    </tr>
                                    <tr>
                                        <td>Room No.:</td>
                                        <td><select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                            </select></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
                <!-- content goes here --> 
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button">Add</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" onclick="reset()">Update</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal --> 

<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="http://www.w3schools.com/lib/w3data.js"></script> 
<script>
                  w3IncludeHTML();
</script>
<script type="text/javascript">
    //include header and menus
//        $( "#header" ).load( "libraries/header.jsp" );
//        $( "#topMenus" ).load( "libraries/topMenus.html" );
//        $( "#sideMenus" ).load( "libraries/sideMenus.html" );

    //when document is ready,then run this script
    $(document).ready(function () {
        $('#select-0').hide();
        $('#select-1').hide();
        $('select[id=select-2]').hide();

        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;

        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }

        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }

        //years
        var year = (nowDate.getFullYear());

        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        var yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        var yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;

        //event when radio button is change
        $('input:radio[name="radios"]').change(
                function () {
                    if ($('#radios-0').is(':checked')) {
                        $('#select-0').show();
                        $('#select-1').hide();
                        $('select[id=select-2]').hide();
                    } else if ($('#radios-1').is(':checked')) {
                        $('#select-1').show();
                        $('#select-0').hide();
                        $('select[id=select-2]').hide();
                    } else if ($('#radios-2').is(':checked')) {
                        $('#select-2').show();
                        $('#select-0').hide();
                        $('select[id=select-1]').hide();
                    }
                });

        //seaching patient function   
        function searchPatient() {
            var opt = $('#idType option[disabled]:selected').val();
            if (opt === true) {
                alert('hai');
            }
            if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
                alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
            } else if (opt === "-") {
                alert('Please select ID Type first.');
            } else {
                var idType = $('#idType').find(":selected").val();
                var idInput = $('#idInput').val();
                //var view_data;
                console.log(idType);
                console.log(idInput);
                $.ajax({
                    type: "POST",
                    url: "resultPatient.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: {'idType': idType, 'idInput': idInput}, // Send input
                    timeout: 3000,
                    success: function (list) {
                        console.log(list);
                        var array_data = String(list).split("|");
                        if ($.trim(array_data) === "N/A1") {
                            alert("No Patient Found! \n\Data will retrieve from SMP");
                            $('#myForm2')[0].reset();
                            console.log($.trim(array_data));
                            location.href = "patient-master-index.jsp";
                        } else if ($.trim(array_data) === "N/A0") {
                            alert("No Patient Found!");
                            $('#myForm2')[0].reset();
                            console.log($.trim(array_data));
                            location.href = "patient-master-index.jsp";
                        } else {
                            var pmino = array_data[0],
                                    pname = array_data[2],
                                    pnic = array_data[4],
                                    poic = array_data[5],
                                    pit = array_data[6],
                                    pino = array_data[7];

                            $('input[id=pmino]').val($.trim(pmino));
                            $('input[id=pname]').val($.trim(pname));
                            $('input[id=pnic]').val($.trim(pnic));
                            $('input[id=poic]').val($.trim(poic));
                            $('input[id=pit]').val($.trim(pit));
                            $('input[id=pino]').val($.trim(pino));

                            $('#radios-1').prop('checked', true);
                            $('#select-1').show();


                            $('#patCat').val('General Outpatient');
                            $('#visTy').val('Walk-in');
                            $('#EmTy').val('-');
                            $('#EliCat').val('Government');

                            if ($('input[id=pit]').val() === "Matric No.") {
                                $('#EliTy').val('Student');
                            } else if ($('input[id=pit]').val() === "Staff No.") {
                                $('#EliTy').val('Staff');
                            }

                            $('#Dis').val('Outpatient Discipline');
                            $('#prioGru').val('Normal');
                            $('#select-1').val('Normal Queue');

                            console.log(array_data);
                        }
                    },
                    error: function () { // if error
                        alert('Problem!');
                    }
                });
            }

        }
        ;



        //event on click search button
        $('#searchPatient').click(function () {
            searchPatient();
        });

        $('#registerQueue').click(function () {
            if ($('#pmino').val() === "" || $('#pmino').val() === "") {
                alert('Please use a proper PMI no.');
            } else {
                var r = confirm("Are you sure want to REGISTER PATIENT?");

                var pmi, epiDate, name, newic, oldic, typeId, idNo, rnNo, patCatCode, visTyCode, emTy, eliCatCode, eliTyCode, disCode, subDiscode, consultRoom, comQueue, doctor, prioGruCode, polCase, commDis, natuDisasCode, docTy, guardInd, referNo, gruGuard, glExpDate, epiTime, stat, hfc, comTy;
                pmi = $('#pmino').val();
                epiDate = yyyyMMddHHmmss;
                name = $('input[id=pname]').val();
                newic = $('input[id=pnic]').val();
                oldic = $('input[id=poic]').val();
                typeId = $('input[id=pit]').val();
                idNo = $('input[id=pino]').val();

                if ($('#rnNo').val() === " " || $('#rnNo').val() === "") {
                    rnNo = "-";
                } else {
                    rnNo = $('#rnNo').val();
                }
                patCatCode = $('#patCat').val();
                visTyCode = $('#visTy').val();
                emTy = $('#EmTy').val();
                eliCatCode = $('#EliCat').val();
                eliTyCode = $('#EliTy').val();
                disCode = $('#Dis').val();
                subDiscode = "-";

                if ($('#radios-0').is(':checked')) {
                    consultRoom = $('#select-0').find(":selected").val();
                } else {
                    consultRoom = "-";
                }

                if ($('#radios-1').is(':checked')) {
                    comQueue = $('#select-1').find(":selected").val();
                    var x = $('#select-1').find(":selected").text();
                    var separators = ['\\\(', '\\\)'];
                    var tokens = x.split(new RegExp(separators.join('|'), 'g'));
                    console.log(tokens);
                    comTy = tokens[1];
                } else {
                    comQueue = "-";
                }

                if ($('#radios-2').is(':checked')) {
                    doctor = $('#select-2').find(":selected").val();
                } else {
                    doctor = "-";
                }

                prioGruCode = $('#prioGru').find(":selected").val();
                polCase = "-";
                commDis = "-";
                natuDisasCode = "-";
                docTy = "-";
                guardInd = "-";
                referNo = "-";
                gruGuard = "-";
                glExpDate = "-";
                epiTime = HHmmss;
                stat = "Waiting";
                hfc = "Klinik UTeM Induk";

                var datas = {'pmi': pmi,
                    'epiDate': epiDate,
                    'name': name,
                    'newic': newic,
                    'oldic': oldic,
                    'typeId': typeId,
                    'idNo': idNo,
                    'rnNo': rnNo,
                    'patCatCode': patCatCode,
                    'visTyCode': visTyCode,
                    'emTy': emTy,
                    'eliCatCode': eliCatCode,
                    'eliTyCode': eliTyCode,
                    'disCode': disCode,
                    'subDiscode': subDiscode,
                    'consultRoom': consultRoom,
                    'comQueue': comQueue,
                    'doctor': doctor,
                    'prioGruCode': prioGruCode,
                    'commDis': commDis,
                    'polCase': polCase,
                    'natuDisasCode': natuDisasCode,
                    'docTy': docTy,
                    'guardInd': guardInd,
                    'referNo': referNo,
                    'gruGuard': gruGuard,
                    'glExpDate': glExpDate,
                    'epiTime': epiTime,
                    'stat': stat,
                    'hfc': hfc,
                    'now': yyyyMMdd,
                    'comTy': comTy};
                console.log(datas);
                if (r === true) {
                    $.ajax({
                        type: "POST",
                        url: "registerqueue.jsp",
                        data: datas, // Send input
                        timeout: 3000,
                        success: function (list) {
                            console.log(list);
                            if ($.trim(list) === "Success") {
                                alert("Patient has been register successfully");
                            } else if ($.trim(list) === "already") {
                                alert("Patient is already registered");
                            }
                        }, error: function () {
                            alert("There is an error!");
                        }
                    });
                }
            }


        });

        //event when press ENTER after inserting the ID
        $("#idInput").on("keydown", function (e) {
            var code = e.keyCode;
            if (code === 13) {
                searchPatient();
                e.preventDefault();
            }
        });

        //event on click clear buton
        $('#btnclear').click(function () {
            //$('input[type=text], textarea').val('');
            //$('select').find('option').prop("selected", false);
            $('#myForm')[0].reset();
            $('#myForm2')[0].reset();
            $('#select-0').hide();
            $('#select-1').hide();
            $('select[id=select-2]').hide();
        });
    });


</script>
</body>
</html>