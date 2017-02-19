<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <title>Main Menu</title>
    </head>
    <body>

        <!-- navigation bar -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">iHIS </a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="MainMenu.jsp">Home</a></li>

                    <li class="pull-right"><a> Welcome </a></li>
                </ul>
            </div>
        </nav>

        <!-- navigation bar -->

        <div class="container">
            <h1 style="text-align: center">Report Main Menu</h1>

            </br> </br>

            <!-- <a style="margin-left:20.5em" href="ADT_MainMenu.jsp" class="button">ADT</a> -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Print MC</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Time Slip</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">ICD 10 Report</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal4">Full Report</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal5">Prescription Slip</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal6">Statistics of Diagnosis</button>
            <button type="button" class="btn btn-info btn-lg" onclick="location.href = 'pmhMain.jsp'">Patient Medical History</button>

            <!-- STARTING OF MODAL BASED ON BUTTON CLICK -->

            <!-- PRINT MC MODAL -->

            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:13.5em"class="modal-title">Print MC</h2>
                        </div>
                        <div class="modal-body">

                            <!-- content for modal -->

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ID Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="mcType" id="mcType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="PMI_NO" id="PMI_NO" >PMI NO.</option>
                                        <option value="OLD_IC_NO" id="OLD_IC_NO">OLD IC NO.</option>
                                        <option value="NEW_IC_NO" id="NEW_IC_NO">NEW IC NO.</option>
                                        <option value="ID_NO" id="ID_NO">MATRIC NO.</option>
                                        <option value="ID_NO" id="ID_NO">STAFF NO.</option>

                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC NO/ ID NO :</label>
                                <div class="col-md-8">
                                    <input id="mcInput" name="mcInput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                            <br>
                            <br>
                            <!-- content for modal -->

                            <!-- modal footer -->


                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printMC">Generate MC</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PRINT MC MODAL -->

            <!-- PRINT TIME SLIP MODAL -->
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:13.5em"class="modal-title">Print Time Slip</h2>
                        </div>
                        <div class="modal-body">

                            <!-- modal content -->

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ID Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="tsType" id="tsType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="PMI_NO" id="PMI_NO" >PMI NO.</option>
                                        <option value="OLD_IC_NO" id="OLD_IC_NO">OLD IC NO.</option>
                                        <option value="NEW_IC_NO" id="NEW_IC_NO">NEW IC NO.</option>
                                        <option value="ID_NO" id="ID_NO">MATRIC NO.</option>
                                        <option value="ID_NO" id="ID_NO">STAFF NO.</option>

                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC NO/ ID NO :</label>
                                <div class="col-md-8">
                                    <input id="tsInput" name="tsInput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                            <br>
                            <br>


                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printTimeSlip">Generate Time Slip</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PRINT TIME SLIP MODAL -->

            <!-- ICD 10 REPORT MODAL -->
            <div class="modal fade" id="myModal3" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:10.5em"class="modal-title">ICD 10 Report</h2>
                        </div>
                        <div class="modal-body">

                            <!-- drop down for id type -->

                            </br> </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Select Date:</label>
                                <div class="col-md-4">
                                    <input type="text" id="datepicker">                                                                     
                                </div>                                                            
                            </div>

                            </br></br>

                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printICD10">Generate Report</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ICD10 REPORT MODAL -->

            <!-- FULL REPORT MODAL -->
            <div class="modal fade" id="myModal4" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:13.5em"class="modal-title">Full Report</h2>
                        </div>
                        <div class="modal-body">

                            <!-- modal content -->

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput"> Type of symptom:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="frType" id="frType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="complaint"  >Complaint</option>
                                        <option value="diagnosis" >Diagnosis</option>
                                        <option value="allergy" >Allergy</option>
                                        <option value="medication" >Medication</option>
                                        <option value="past_medical_history" >Past Medical History</option>

                                    </select>
                                </div>
                            </div>

                            </br> </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Select Date:</label>
                                <div class="col-md-4">
                                    <input type="date" name="field1" id="field1" dateFormat="yyyy/mm/dd" />                                                                     
                                </div>                                                            
                            </div>

                            </br></br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">To:</label>
                                <div class="col-md-4">
                                    <input type="date" name="field2" id="field2 " dateFormat="yyyy/mm/dd" />                                                                                                                                   
                                </div>                                                            
                            </div>

                            </br> </br>

                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printfullreport">summary</button>
                                </div>

                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- FULL REPORT MODAL -->

            <!-- PRESCRIPTION MODAL -->
            <div class="modal fade" id="myModal5" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:13.5em"class="modal-title">Prescription Slip</h2>
                        </div>
                        <div class="modal-body">

                            <!-- content for modal -->

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ID Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="psType" id="printType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="PMI_NO" id="PMI_NO" >PMI NO.</option>
                                        <option value="OLD_IC_NO" id="OLD_IC_NO">OLD IC NO.</option>
                                        <option value="NEW_IC_NO" id="NEW_IC_NO">NEW IC NO.</option>
                                        <option value="ID_NO" id="ID_NO">MATRIC NO.</option>
                                        <option value="ID_NO" id="ID_NO">STAFF NO.</option>

                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC NO/ ID NO :</label>
                                <div class="col-md-8">
                                    <input id="printInput" name="pstInput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>
                            <br>
                            <br>
                            <!-- content for modal -->

                            <!-- modal footer -->


                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printps">Generate prescription</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PRESCRIPTION MODAL -->

            <!-- REPORT AND STATISCTIC OF DIAGNOSIS -->

            <div class="modal fade" id="myModal6" role="dialog">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 style="margin-left:10.5em"class="modal-title">Report and Statistic of Diagnosis</h2>
                        </div>
                        <div class="modal-body">

                            <!-- modal body -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Patient Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="patientType" id="printType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="student" id="student" >Student</option>
                                        <option value="staff" id="satff">Staff</option>


                                    </select>
                                </div>
                            </div>
                            </br>
                            </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Select Date:</label>
                                <div class="col-md-4">
                                    <input type="text" id="datepicker">                                                                     
                                </div>                                                            
                            </div>

                            </br>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">To:</label>
                                <div class="col-md-4">
                                    <input type="text" id="datepicker2">                                                                     
                                </div>                                                            
                            </div>

                            </br> </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Select discipline:</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="patientType" id="printType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="outpatient" id="outpatient" >Outpatient</option>
                                        <option value="inpatient" id="inpatient">Inpatient</option>


                                    </select>
                                </div>
                            </div>
                            </br> </br>

                        </div>
                        <div class="modal-footer">
                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printsd">Generate report</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <!-- REPORT AND STATISCTIC OF DIAGNOSIS -->


        </div>

    </body>
</html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

                $(function () {
                    $("#datepicker").datepicker();
                });

                $(function () {
                    $("#datepicker2").datepicker();
                });
</script>

</script>


<script>

    $(document).ready(function () {

        function reset() {
            document.getElementById("printType").value = "";
            document.getElementById("printInput").value = "";
            document.getElementById("frType").value = "";
            document.getElementById("icdday").value = "";
            document.getElementById("icdmonth").value = "";
            document.getElementById("icdyear").value = "";
            document.getElementById("tsInput").value = "";
            document.getElementById("tsType").value = "";
        }

        $('#PrintReset').on('click', function () {
            reset();
        });

        $('#printMC').on('click', function (e) {

            e.preventDefault();

            var mcType = $("#mcType").val();
            var mcInput = $("#mcInput").val();
            console.log(mcType);
            console.log(mcInput);

            window.open("mcReport.jsp?mcType=" + mcType + "&mcInput=" + mcInput);

        });

        $('#printTimeSlip').on('click', function (e) {

            e.preventDefault();

            var tsType = $("#tsType").val();
            var tsInput = $("#tsInput").val();
            console.log(tsType);
            console.log(tsInput);

            window.open("timeslip.jsp?tsType=" + tsType + "&tsInput=" + tsInput);

        });

        $('#printICD10').on('click', function (e) {

            e.preventDefault();

            var icdyear = $("#icdyear").val();
            var icdmonth = $("#icdmonth").val();
            var icdday = $("#icdday").val();
            console.log(icdyear);
            console.log(icdmonth);
            console.log(icdday);

            window.open("ICD10.jsp?icdyear=" + icdyear + "&icdmonth=" + icdmonth + "&icdday=" + icdday);

        });

        $('#prinfullreport').on('click', function (e) {

            e.preventDefault();

            var field1 = $("#field1").val();
            var field2 = $("#field2").val();
            var frType = $("#frType").val();
            console.log(field1);
            console.log(field2);
            console.log(frType);

            window.open("fullreportDiagnosis    .jsp?field1=" + field1 + "&field2=" + field2 + "&icdday=" + icdday  + "&frType=" + frType);

        });


    });
</script>

