<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link rel="stylesheet" href="assets/datepicker/jquery-ui.css">-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">

        <script src="assets/js/jquery.min.js"></script>

        <link href="assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <!-- Custom styles for this template -->
        <link href="assets/css/dashboard.css" rel="stylesheet">
        <link href="assets/css/Line-tabs.css" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>   

        <!-- header -->
    <div  id="headerindex"></div>
    <!-- header -->
</head>

<body>

    <!-- menu top -->
    <div  id="topmenuindex"></div>
    <!-- menu top -->
    <div class="container-fluid">
        <div class="row">       
            <!-- menu side -->		
            <div id="sidemenus"></div>
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">

                <div class="row" id="transfer">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h4>Patient Transfer</h4>
                            <hr/>
                            <form class="form-horizontal" name="myForm2" id="myForm2">
                                <div class="row">
                                    <div class="col-md-6">


                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                                            <div class="col-md-4">
                                                <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
                                        </div>



                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">IC NO</label>
                                            <div class="col-md-4">
                                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Gender</label>
                                            <div class="col-md-4">
                                                <input id="gender" name="gender" type="text" placeholder=""  readonly class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Age</label>
                                            <div class="col-md-4">
                                                <input id="age" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Ward Class</label>
                                            <div class="col-md-4">
                                                <input id="age" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Bed no</label>
                                            <div class="col-md-4">
                                                <input id="age" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-md-6">

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Name</label>
                                            <div class="col-md-4">
                                                <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                                            <div class="col-md-4">
                                                <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>



                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Admission Date</label>
                                            <div class="col-md-4">
                                                <input id="AdmissionType" name="AdmissionType" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Treating Consultant</label>
                                            <div class="col-md-4">
                                                <input id="Consultant" name="Consultant" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Ward Name</label>
                                            <div class="col-md-4">
                                                <input id="WardName" name="WardName" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Rate</label>
                                            <div class="col-md-4">
                                                <input id="Rate" name="Rate" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <h4>Transfer Ward</h4>
                                <hr/>

                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                                            <div class="col-md-4">
                                                <select id="Dis" name="Dis" class="form-control">
                                                    <option value="" selected="" disabled="">List of Discipline</option>
                                                    <%--
                                                    <option value="2">Inpatient Discipline</option>
                                                    <option value="2">Outpatient Discipline</option>
                                                    <%
                                                        for (int i = 0; i < dataDis p.size();
                                                        i++
                                                       
                                                            ) {%>
                                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                                    <%  }
                                                    %>
                                                    --%>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                                            <div class="col-md-4">
                                                <select id="Dis" name="Dis" class="form-control">
                                                    <option value="" selected="" disabled="">List of ward name</option>
                                                    <%--
                                                    <option value="2">Inpatient Discipline</option>
                                                    <option value="2">Outpatient Discipline</option>
                                                    <%
                                                        for (int i = 0; i < dataDis p.size();
                                                        i++
                                                       
                                                            ) {%>
                                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                                    <%  }
                                                    %>
                                                    --%>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                                            <div class="col-md-4">
                                                <input id="Deposit" name="textinput" type="text" placeholder="" class="form-control input-md">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                                            <div class="col-md-4">
                                                <select id="WardType" name="Dis" class="form-control">
                                                    <option value="" selected="" disabled="">List of ward type</option>
                                                    <%--
                                                    <option value="2">Inpatient Discipline</option>
                                                    <option value="2">Outpatient Discipline</option>
                                                    <%
                                                        for (int i = 0; i < dataDis p.size();
                                                        i++
                                                       
                                                            ) {%>
                                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                                    <%  }
                                                    %>
                                                    --%>
                                                </select>
                                            </div>
                                        </div>   


                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                                            <div class="col-md-4">
                                                <select id="BedID" name="Dis" class="form-control">
                                                    <option value="" selected="" disabled="">Locate selected bed here..</option>
                                                    <%--
                                                    <option value="2">Inpatient Discipline</option>
                                                    <option value="2">Outpatient Discipline</option>
                                                    <%
                                                        for (int i = 0; i < dataDis p.size();
                                                        i++
                                                       
                                                            ) {%>
                                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                                    <%  }
                                                    %>
                                                    --%>
                                                </select>
                                            </div>
                                            <button class="btn btn-default" type="button"> List Bed</button>
                                        </div>


                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Ward Name</label>
                                            <div class="col-md-4">
                                                <input id="WardName" name="WardName" type="text" readonly placeholder="" class="form-control input-md">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                        </div>


                        <div class="text-center">
                            <button class="btn btn-primary " type="button" id="transfer"> Transfer</button>

                            <button class="btn btn-default " type="button" id="btncancel" name="btncancel" > Cancel</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <!-- main -->		

    </div>









</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>

<script>w3IncludeHTML();</script>                               
<script>
    // w3IncludeHTML();

    //include header and menus
    $("#headerindex").load("libraries/header.html");
    $("#topmenuindex").load("libraries/topMenus.html");
    $("#sidemenus").load("libraries/sideMenus.jsp");


    //when document is ready,then run this script
    $("#register").ready(function () {
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
                //console.log(idType);
                //console.log(idInput);
                $.ajax({
                    type: "POST",
                    url: "resultPatient.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: {'idType': idType, 'idInput': idInput}, // Send input
                    timeout: 3000,
                    success: function (list) {
                        //console.log(list);
                        var array_data = String(list).split("|");
                        //patientDOM.push(array_data);
                        if ($.trim(array_data) === "N/A1") {
                            alert("No Patient Found! \n\Data will retrieve from SMP");
                            $('#myForm1')[0].reset();
                            //console.log($.trim(array_data));
                            //location.href = "patient-master-index.jsp";
                            $("ul").tabs("option", "active", 1);
                        } else if ($.trim(array_data) === "N/A0") {
                            alert("No Patient Found!");
                            $('#myForm1')[0].reset();
                            //console.log($.trim(array_data));
//                            $("#t1").removeClass("active");  // this deactivates the home tab
//                            $("#t2").addClass("active");
                            $("ul[id=ulTabs]").tabs("option", "active", 1);
                        } else {
                            var pmino = array_data[0],
                                    pminotemp = array_data[1],
                                    pname = array_data[2],
                                    ptitle = array_data[3],
                                    pnic = array_data[4],
                                    poic = array_data[5],
                                    pit = array_data[6],
                                    pino = array_data[7],
                                    pelicat = array_data[8],
                                    pelity = array_data[9],
                                    pbday = array_data[10],
                                    psex = array_data[11],
                                    pmarital = array_data[12],
                                    prace = array_data[13],
                                    pnational = array_data[14],
                                    preligional = array_data[15],
                                    pbloodty = array_data[16],
                                    prhesus = array_data[17],
                                    pallergy = array_data[18],
                                    pchronic = array_data[19],
                                    porgandonor = array_data[20],
                                    phomeadd = array_data[21],
                                    phomedistrict = array_data[22],
                                    phometowncd = array_data[23],
                                    ppostcode = array_data[24],
                                    pstate = array_data[25],
                                    pcountry = array_data[26],
                                    phomephone = array_data[27],
                                    ppostaladd = array_data[28],
                                    ppostaldistrict = array_data[29],
                                    ppostaltown = array_data[30],
                                    ppostalpostcode = array_data[31],
                                    ppostalstate = array_data[32],
                                    ppostalcountry = array_data[33],
                                    pmobilephone = array_data[34],
                                    pemail = array_data[35];

                            var splitBday = String(pbday).split("/");
                            var daysplitted = splitBday[0];
                            var monthsplitted = splitBday[1];
                            var yearsplitted = splitBday[2];
                            //console.log(splitBday);
                            //console.log(daysplitted);
                            //console.log(monthsplitted);
                            //console.log(yearsplitted);

                            var newbday = yearsplitted + "-" + monthsplitted + "-" + daysplitted;
                            //console.log(newbday);

                            $('input[id=pmino]').val($.trim(pmino));
                            $('input[id=pname]').val($.trim(pname));
                            $('input[id=pnic]').val($.trim(pnic));
                            $('input[id=poic]').val($.trim(poic));
                            $('input[id=pit]').val($.trim(pit));
                            $('input[id=pino]').val($.trim(pino));

                            // set value in PMI page
                            $('input[id=PMIpmino]').val($.trim(pmino));
                            $('#PMIpminotemp').val($.trim(pminotemp));
                            $('#PMIpname').val($.trim(pname));
                            $('#PMInic').val($.trim(pnic));
                            $('#PMIoic').val($.trim(poic));
                            $('#PMIino').val($.trim(pino));
                            $('#PMIbday').val($.trim(newbday));
                            $('#PMIhadd').val($.trim(phomeadd));
                            $('#PMIpadd').val($.trim(ppostaladd));
                            $('#PMIhphone').val($.trim(phomephone));
                            $('#PMIhandphone').val($.trim(pmobilephone));
                            $("#PMIidty").val($.trim(pit));
                            $("#PMItitle").val($.trim(ptitle));
                            $("#PMIelicat").val($.trim(pelicat));
                            $("#PMIelity").val($.trim(pelity));
                            $("#PMIsex").val($.trim(psex));
                            $("#PMImarital").val($.trim(pmarital));
                            $("#PMIrace").val($.trim(prace));
                            $("#PMInational").val($.trim(pnational));
                            $("#PMIreligion").val($.trim(preligional));
                            $("#PMIblood").val($.trim(pbloodty));
                            $("#PMIrhesus").val($.trim(prhesus));
                            $("#PMIallergy").val($.trim(pallergy));
                            $("#PMIchronic").val($.trim(pchronic));
                            $("#PMIorgan").val($.trim(porgandonor));
                            $("#PMIhadd").val($.trim(phomeadd));
                            $("#PMIhdis").val($.trim(phomedistrict));
                            $("#PMIhtown").val($.trim(phometowncd));
                            $("#PMIhstate").val($.trim(pstate));
                            $("#PMIhpostcode").val($.trim(ppostcode));
                            $("#PMIhcountry").val($.trim(pcountry));
                            $("#PMIpadd").val($.trim(ppostaladd));
                            $("#PMIpdis").val($.trim(ppostaldistrict));
                            $("#PMIptown").val($.trim(ppostaltown));
                            $("#PMIppostcode").val($.trim(ppostalpostcode));
                            $("#PMIpstate").val($.trim(ppostalstate));
                            $("#PMIpcountry").val($.trim(ppostalcountry));

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

                            //console.log(array_data);
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

        //register patient
        $('#registerQueue').click(function () {
            if ($('#pmino').val() === " " || $('#pmino').val() === "") {
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
            $('#myForm2')[0].reset();
            $('#select-0').hide();
            $('#select-1').hide();
            $('select[id=select-2]').hide();
        });
        //event on click clear buton
        $('#clearSearch').click(function () {
            $('#myForm')[0].reset();
            console.log(patientDOM);


        });
    });


</script>                      