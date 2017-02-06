<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/loading.css">
<!--hfc code in register queue need to get from session -->
<%
    String patCat = "select * from adm_lookup_detail where master_reference_code = '0033'   ";
    String visType = "select * from adm_lookup_detail where master_reference_code = '0022'   ";
    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";
    String discip = "select * from adm_lookup_detail where master_reference_code = '0072'   ";
    String prio = "select * from adm_lookup_detail where master_reference_code = '0036'   ";
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";
    String Commonqueue = "select * from pms_queue_name where queue_type='CM'";
    String Consultationqueue = "select * from pms_queue_name where queue_type='FY'";
    String Doctorqueue = "select * from pms_queue_name where queue_type='PN'";

    ArrayList<ArrayList<String>> dataQueue2, dataQueue3, dataPatCat, dataVisType, dataEliCat, dataEliType, dataDiscip, dataPrio, dataIdType, dataQueue;

    Conn conn = new Conn();

    dataPatCat = conn.getData(patCat);
    dataVisType = conn.getData(visType);
    dataEliCat = conn.getData(eliCat);
    dataEliType = conn.getData(eliType);
    dataDiscip = conn.getData(discip);
    dataPrio = conn.getData(prio);
    dataIdType = conn.getData(idTYpe);
    dataQueue = conn.getData(Commonqueue);
    dataQueue2 = conn.getData(Consultationqueue);
    dataQueue3 = conn.getData(Doctorqueue);

    // status 0 = public
    // status 1 = universiti
    // status bole dapat kat session
    String dataSystemStatus = session.getAttribute("SYSTEMSTAT").toString();

//    out.println(conn.getIpCall()+ " ");
//    out.println(session.getAttribute("HFC"));

%>
<div class="row" id="register">
    <div class="col-md-12">
        <div class="thumbnail">
            <h4>Search Patient
                <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
            </h4>
            <form class="form-horizontal" name="myForm" id="myForm">
                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                    <div class="col-md-4">
                        <select id="idType" name="idType" class="form-control" required="">
                            <option selected="" disabled="" value="-"> Please select ID type</option>
                            <option value="pmino">PMI No</option>
                            <option value="icnew">IC No (NEW)</option>
                            <option value="icold">IC No (OLD)</option>
                            <!--<option value="matricno">Matric No</option>
                            <option value="staffno">Staff No</option>-->
                            <%                                if (dataSystemStatus.equals("0")) {

                                } else if (dataSystemStatus.equals("1")) {
                                    for (int i = 0; i < dataIdType.size(); i++) {%>
                            <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
                            <%  }
                                }

                            %>
                        </select>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                    <div class="col-md-4">
                        <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                    <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </form>
        </div>

        <div class="thumbnail">
            <h4>Basic Info</h4>
            <hr/>
            <form class="form-horizontal" name="myForm2" id="myForm2">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-8">
                                <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-8">
                                <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                            <div class="col-md-8">
                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-8">
                                <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                </div>


                <h4>Registration Info</h4>
                <hr/>

                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Registration No.</label>
                            <div class="col-md-6">
                                <input id="rnNo" name="rnNo" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Patient Category</label>
                            <div class="col-md-6">
                                <select id="patCat" name="patCat" class="form-control">
                                    <option selected disabled>Select Patient Category</option>
                                    <!--<option value="2">General OutPatient</option>
                                    <option value="2">Inpatient</option>
                                    <option value="2">Specialist OutPatient</option>-->
                                    <%                                        for (int i = 0; i < dataPatCat.size(); i++) {%>
                                    <option value="<%=dataPatCat.get(i).get(1)%>"><%=dataPatCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Visit Type *</label>
                            <div class="col-md-6">
                                <select id="visTy" name="visTy" class="form-control">
                                    <option selected disabled>Select Visit Type</option>
                                    <!--<option value="2">Appointment</option>
                                    <option value="2">Referral</option>
                                    <option value="2">Walk-in</option>-->
                                    <%
                                        for (int i = 0; i < dataVisType.size(); i++) {%>
                                    <option value="<%=dataVisType.get(i).get(1)%>"><%=dataVisType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Emergency Type</label>
                            <div class="col-md-6">
                                <select id="EmTy" name="EmTy" class="form-control">
                                    <option  selected="" disabled="">Select Emergency Type</option>
                                    <option value="-">-</option>       
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Please select the following action</label>

                            <label class="col-md-4 control-label" for="selectbasic"></label>
                            <div class="col-md-8">
                                <label for="radios-0">
                                    <input type="radio" name="radios" id="radios-0" value="Consultant Room">
                                    Consultant Room
                                    <select id="select-0" name="select-0" class="form-control">
                                        <option value="-" selected="" disabled="">Please select consultation room</option>
                                        <%
                                            for (int i = 0; i < dataQueue2.size(); i++) {%>
                                        <option value="<%=dataQueue2.get(i).get(1)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
                                        <%  }
                                        %>
                                    </select>

                                </label>
                                <label for="radios-1">
                                    <input type="radio" name="radios" id="radios-1" value="Queue">
                                    Common Queue
                                    <select id="select-1" name="select-1" class="form-control">
                                        <option selected="" disabled="">Please select Queue</option>
                                        <%
                                            for (int i = 0; i < dataQueue.size(); i++) {%>
                                        <option value="<%=dataQueue.get(i).get(1)%>"><%="(" + dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </label>
                                <label for="radios-2">
                                    <input type="radio" name="radios" id="radios-2" value="Doctor">
                                    Doctor
                                    <select id="select-2" name="select-2" class="form-control">
                                        <option value="-" disabled="" selected="">Please select Doctor</option>
                                        <%
                                            for (int i = 0; i < dataQueue3.size(); i++) {%>
                                        <option value="<%=dataQueue3.get(i).get(1)%>"><%="(" + dataQueue3.get(i).get(0) + ") " + dataQueue3.get(i).get(1)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </label>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Category</label>
                            <div class="col-md-6">
                                <select id="EliCat" name="EliCat" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Category</option>
                                    <!--<option value="2">Government</option>
                                    <option value="2">Private</option>
                                    <option value="2">Public</option>
                                    <option value="2">SOCSO</option>-->
                                    <%
                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(1)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-6">
                                <select id="EliTy" name="EliTy" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Type</option>
                                    <!--<option value="2">Student</option>
                                    <option value="2">Staff</option>-->
                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(1)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                            <div class="col-md-6">
                                <select id="Dis" name="Dis" class="form-control">
                                    <option value="" selected="" disabled="">Select Discipline</option>
                                    <!--<option value="2">Inpatient Discipline</option>
                                    <option value="2">Outpatient Discipline</option>-->
                                    <%
                                        for (int i = 0; i < dataDiscip.size(); i++) {%>
                                    <option value="<%=dataDiscip.get(i).get(1)%>"><%=dataDiscip.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>

                <h4>Registration Details</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Priority Group *</label>
                            <div class="col-md-6">
                                <select id="prioGru" name="prioGru" class="form-control">
                                    <option value="1" selected="" disabled="">Select Priority Group</option>
                                    <%
                                        for (int i = 0; i < dataPrio.size(); i++) {%>
                                    <option value="<%=dataPrio.get(i).get(1)%>"><%=dataPrio.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                                <input id="sessionHfc" name="sessionHfc" type="hidden"  class="form-control input-md" value="<%= session.getAttribute("HFC")%>">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="registerQueue"><i class="fa fa-floppy-o fa-lg"></i> Register</button>
                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                    <!--                    <div id="dialog" title="Basic dialog">
                                            <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
                                        </div>-->
                </div>
                <br/>
                <div class="text-center">
                    <button class="btn btn-default" type="button" data-toggle="modal" data-target="#appointmentModal" id="appointment"> Appointment List</button>
                    <button class="btn btn-default" type="button" data-toggle="modal" data-target="#queueModal" id="queue">List Of Queue</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div  id="modalSaya"><!-- Place at bottom of page --></div>
<div class="modalLoad"><!-- Place at bottom of page --></div>
<div id="modalSaya2"><!-- Place at bottom of page --></div>
<script>w3IncludeHTML();</script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script> -->
<script src="assets/js/bootbox.min.js"></script> 

<script>

    //load appointment modal into the registration page
    $('#modalSaya').load('AppointmentModal.jsp');
    $('#modalSaya2').load('QueueModal.jsp');
    //set modal width to dynamic
    $('#modalSaya').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: 'auto',
            height: 'auto',
            'max-height': '100%'});
    });
    $('#modalSaya2').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: 'auto',
            height: 'auto',
            'max-height': '100%'});
    });

    $('#appointment').on('click', function () {
        $.ajax({
            type: "POST",
            data: {idType: "", idInput: ""},
            url: "listApp.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                $('#modalBodyAppointment').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
    });
    
    $('#queue').on('click', function () {
        $.ajax({
            type: "POST",
            data: {idType: "", idInput: ""},
            url: "listQueue.jsp", // call the php file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                $('#modalBodyQueue').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
    });
    //validate max length of input
    $('#idType').on('change', function () {
        var id = $('#idType').val();
        if (id === "pmino") {
            $('#idInput').attr('maxlength', '13');
        } else if (id === "icnew") {
            $('#idInput').attr('maxlength', '12');
        } else if (id === "icold") {
            $('#idInput').attr('maxlength', '8');
        } else if (id === "004") {
            $('#idInput').attr('maxlength', '10');
        } else if (id === "005") {
            $('#idInput').attr('maxlength', '10');
        }
    });


    //when document is ready,then run this script
    $('#select-0').hide();
    $('#select-1').hide();
    $('select[id=select-2]').hide();
    var $body = $('body');
    var yyyyMMddHHmmss;
    var HHmmss;
    var yyyyMMdd;
    var ddMMyyyy;

    var tahun, bulan, hari, ICbday;
    //function get birth date

    function getBday(x) {


        if (x.length === 12) {
            tahun = x.substr(0, 2);
            bulan = x.substr(2, 2);
            hari = x.substr(4, 2);

            if (tahun >= 00 && tahun < 50)
            {

//                    ICbday = "20" + tahun + "-" + bulan + "-" + hari;
                ICbday = hari + "-" + bulan + "-" + "20" + tahun;
            } else
            {
//                    ICbday = "19" + tahun + "-" + bulan + "-" + hari;
                ICbday = hari + "-" + bulan + "-" + "19" + tahun;
            }
        }

    }

    //function to get date 
    function getDateNow() {
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
        yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
        ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
    }

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
        $('#myForm2')[0].reset();
        $('#formPMI')[0].reset();
        $('#kinform')[0].reset();
        $('#empform')[0].reset();
        $('#famForm')[0].reset();
        $('#formMed')[0].reset();
        $("table tbody").remove();
        if (opt === true) {
            //alert('hai');
        }
        if ($('#idInput').val() === "" || $('#idInput').val() === " ") {
            bootbox.alert('Please key in PMI no. or IC no. or IDENTIFICATION no. to continue seaching process');
        } else if (opt === "-") {
            bootbox.alert('Please select ID Type first.');
        } else {
            $body.addClass("loading");
            var idType = $('#idType').find(":selected").val();
            var idInput = $('#idInput').val();
            $.ajax({
                async: true,
                type: "POST",
                url: "resultPatient.jsp", // call the php file ajax/tuto-autocomplete.php
                data: {'idType': idType, 'idInput': idInput}, // Send input
                timeout: 10000,
                success: function (list) {
                    $body.removeClass("loading");
                    console.log(list);
                    var array_data = String(list).split("|");
                    if ($.trim(array_data) === "N/A1") {

                        bootbox.confirm({
                            message: "This is new patient,Please press continue button to key-in patient information...",
                            buttons: {
                                confirm: {
                                    label: 'Continue',
                                    className: 'btn-success'
                                },
                                cancel: {
                                    label: 'Cancel',
                                    className: 'btn-danger'
                                }
                            },
                            callback: function (result) {
                                //if true go to PMI page
                                if (result === true) {
                                    $body.addClass("loading");
                                    $.ajax({
                                        async: true,
                                        type: "POST",
                                        url: "pmiGen.jsp",
                                        data: {'idInput': idInput}, // Send input
                                        timeout: 10000,
                                        success: function (list) {
                                            x = idInput;
                                            getBday(x);
                                            getDateNow();
                                            //pmi
                                            $('input[id=PMIpmino]').val($.trim(list));
                                            $('#PMInic').val($.trim(idInput));
                                            $('#PMIbday').val($.trim(ICbday));
                                            //console.log(ICbday);
                                            //registration
                                            $('input[id=pmino]').val($.trim(list));
                                            $('input[id=pnic]').val($.trim(idInput));
                                            //employment
                                            $('input[id=EMPpmino]').val($.trim(list));
                                            $('#EMPcredate').val(ddMMyyyy);
                                            // set value in next of kin page
                                            $('input[id=KINpmino]').val($.trim(list));
                                            // set value in family page
                                            $('input[id=FAMpmi]').val($.trim(list));
                                            // set value in MEDICAL page
                                            $('input[id=MEDpmino]').val($.trim(list));
                                            console.log(ddMMyyyy);
                                            $body.removeClass("loading");
                                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                        }
                                    });
                                }
                            }
                        });

                    } else if ($.trim(array_data[0]) === "SMP") {
                        console.log("SMP DATA");
                        var newic = array_data[1],
                                idnumber = array_data[2],
                                persontype = array_data[3],
                                name = array_data[4],
                                gender = array_data[5],
                                race = array_data[6],
                                nationality = array_data[7],
                                address1 = array_data[8],
                                address2 = array_data[9],
                                postcode = array_data[10],
                                country = array_data[11],
                                phone = array_data[12];
                        bootbox.confirm({
                            message: "Patient biodata is not existed, Data will retieved from the SMP/SMSM",
                            buttons: {
                                confirm: {
                                    label: 'Continue',
                                    className: 'btn-success'
                                },
                                cancel: {
                                    label: 'Cancel',
                                    className: 'btn-danger'
                                }
                            },
                            callback: function (result) {
                                //if true go to PMI page
                                if (result === true) {
                                    if (persontype === "1") {
                                        $("#PMIidty").val($.trim("004"));
                                        $('input[id=pit]').val("Matric No.");
                                    } else if (persontype === "0") {
                                        $("#PMIidty").val($.trim("005"));
                                        $('input[id=pit]').val("Staff No.");
                                    }

                                    //registration page
                                    $('#pname').val($.trim(name));
                                    $('input[id=poic]').val("-");

                                    $('input[id=pino]').val($.trim(idnumber));
                                    //PMI page
                                    $('#PMIpname').val($.trim(name));
                                    $('#PMInic').prop('readonly', true);
                                    $('#PMIoic').val($.trim(poic));
                                    $('#PMIino').val($.trim(idnumber));
                                    $('#PMIhadd').val($.trim(address1));
                                    $('#PMIpadd').val($.trim(address2));
                                    $('#PMIhandphone').val($.trim(phone));


//                        $("#PMIsex").val($.trim(gender));
//                        $("#PMIrace").val($.trim(race));
//                        $("#PMInational").val($.trim(nationality));
                                    //$("#PMIhpostcode").val($.trim(postcode));
                                    //$("#PMIhcountry").val($.trim(country));
                                    $body.addClass("loading");
                                    $.ajax({
                                        async: true,
                                        type: "POST",
                                        url: "pmiGen.jsp",
                                        data: {'idInput': newic}, // Send input
                                        timeout: 10000,
                                        success: function (list) {
                                            x = newic;
                                            getBday(x);
                                            getDateNow();
                                            //pmi
                                            $('input[id=PMIpmino]').val($.trim(list));
                                            $('#PMInic').val($.trim(newic));
                                            $('#PMIbday').val($.trim(ICbday));
                                            console.log(ICbday);
                                            //registration
                                            $('input[id=pmino]').val($.trim(list));
                                            $('input[id=pnic]').val($.trim(newic));
                                            //employment
                                            $('input[id=EMPpmino]').val($.trim(list));
                                            $('#EMPcredate').val(ddMMyyyy);
                                            // set value in next of kin page
                                            $('input[id=KINpmino]').val($.trim(list));
                                            // set value in family page
                                            $('input[id=FAMpmi]').val($.trim(list));
                                            // set value in MEDICAL page
                                            $('input[id=MEDpmino]').val($.trim(list));
                                            console.log(ddMMyyyy);
                                            $body.removeClass("loading");
                                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                        }
                                    });
                                }
                            }
                        });

                    } else if ($.trim(array_data) === "N/A0") {
                        //var r = confirm("No Patient Found!");

                        bootbox.confirm({
                            message: "This is new patient,Please press continue button to key-in patient information...",
                            buttons: {
                                confirm: {
                                    label: 'Continue',
                                    className: 'btn-success'
                                },
                                cancel: {
                                    label: 'Cancel',
                                    className: 'btn-danger'
                                }
                            },
                            callback: function (result) {
                                //if true go to PMI page
                                if (result === true) {
                                    $body.addClass("loading");
                                    $.ajax({
                                        async: true,
                                        type: "POST",
                                        url: "pmiGen.jsp",
                                        data: {'idInput': idInput}, // Send input
                                        timeout: 10000,
                                        success: function (list) {
                                            x = idInput;
                                            getBday(x);
                                            getDateNow();
                                            //pmi
                                            $('input[id=PMIpmino]').val($.trim(list));
                                            $('#PMInic').val($.trim(idInput));
                                            $('#PMIbday').val($.trim(ICbday));
                                            //console.log(ICbday);
                                            //registration
                                            $('input[id=pmino]').val($.trim(list));
                                            $('input[id=pnic]').val($.trim(idInput));
                                            //employment
                                            $('input[id=EMPpmino]').val($.trim(list));
                                            $('#EMPcredate').val(ddMMyyyy);
                                            // set value in next of kin page
                                            $('input[id=KINpmino]').val($.trim(list));
                                            // set value in family page
                                            $('input[id=FAMpmi]').val($.trim(list));
                                            // set value in MEDICAL page
                                            $('input[id=MEDpmino]').val($.trim(list));

                                            console.log(ddMMyyyy);
                                            $body.removeClass("loading");
                                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                        }
                                    });
                                }
                            }
                        });
                    } else {
                        getDateNow();
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
                        var idtype;
                        //console.log(splitBday);
                        //console.log(daysplitted);
                        //console.log(monthsplitted);
                        //console.log(yearsplitted);
                        if (pit === "004") {
                            idtype = "Matric No.";
                        } else if (pit === "005") {
                            idtype = "Staff No.";
                        }

                        //var newbday = yearsplitted + "-" + monthsplitted + "-" + daysplitted;
                        var newbday = daysplitted + "-" + monthsplitted + "-" + yearsplitted;

                        //console.log(newbday);

                        $('input[id=pmino]').val($.trim(pmino));
                        $('input[id=pname]').val($.trim(pname));
                        $('input[id=pnic]').val($.trim(pnic));
                        $('input[id=poic]').val($.trim(poic));
                        $('input[id=pit]').val($.trim(idtype));
                        $('input[id=pino]').val($.trim(pino));
                        // set value in PMI page
                        $('input[id=PMIpmino]').val($.trim(pmino));
                        $('input[id=PMIpmino]').prop('readonly', true);
                        $('#PMIpminotemp').val($.trim(pminotemp));
                        $('#PMIpname').val($.trim(pname));
                        $('#PMInic').val($.trim(pnic));
                        $('#PMInic').prop('readonly', true);
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
                        // set value in employment page
                        $('input[id=EMPpmino]').val($.trim(pmino));
                        $('#EMPcredate').val(ddMMyyyy);
                        var data = {'PMINO': $.trim(pmino)};
                        $.ajax({
                            async: true,
                            url: "listEmp.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnhtml) {
                                //console.log(returnhtml);
                                $('#tableListEmp').html(returnhtml);
                            }
                        });

                        // set value in next of kin page
                        $('input[id=KINpmino]').val($.trim(pmino));
                        $.ajax({
                            async: true,
                            url: "listKin.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnData) {
//                                console.log(returnData);
//                                console.log(data);
                                $('#tableListKin').html(returnData);
                            }, error: function (jqXHR, textStatus, errorThrown) {
                                console.log('error: ' + errorThrown);
                            }
                        });



                        // set value in family page
                        $('input[id=FAMpmi]').val($.trim(pmino));
                        $.ajax({
                            async: true,
                            url: "listFamily.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnData) {
//                                console.log(returnData);
//                                console.log(data);
                                $('#tableListFamily').html(returnData);
                            }, error: function (jqXHR, textStatus, errorThrown) {
                                console.log('error: ' + errorThrown);
                            }
                        });

                        // set value in MEDICAL page
                        $('input[id=MEDpmino]').val($.trim(pmino));
                        $.ajax({
                            async: true,
                            url: "listMedical.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnData) {
//                                console.log(returnData);
//                                console.log(data);
                                $('#tableListMed').html(returnData);
                            }, error: function (jqXHR, textStatus, errorThrown) {
                                console.log('error: ' + errorThrown);
                            }
                        });
                        $('#radios-1').prop('checked', true);
                        $('#select-1').show();
                        $('#patCat').val('001');
                        $('#visTy').val('001');
                        $('#EmTy').val('-');
                        $('#EliCat').val('003');
                        if ($('input[id=pit]').val() === "004") {
                            $('#EliTy').val('003');
                        } else if ($('input[id=pit]').val() === "005") {
                            $('#EliTy').val('005');
                        }

                        $('#Dis').val('001');
                        $('#prioGru').val('003');
                        $('#select-1').val('Normal Queue');
                        //console.log(array_data);
                    }
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
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
        getDateNow();
        setInterval(getDateNow, 1000);
        if ($('#pmino').val() === " " || $('#pmino').val() === "") {
            bootbox.alert('Please use a proper PMI no.');

        } else {
            //var r = confirm("Are you sure want to REGISTER PATIENT?");


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
                comTy = "FY";
            } else {
                consultRoom = "-";
            }

            if ($('#radios-1').is(':checked')) {
                comQueue = $('#select-1').find(":selected").val();
                comTy = "CM";
            } else {
                comQueue = "-";
            }

            if ($('#radios-2').is(':checked')) {
                doctor = $('#select-2').find(":selected").val();
                comTy = "PN";
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
            //hfc amik kat session
            hfc = $('#sessionHfc').val();
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
            //console.log(datas);
            bootbox.confirm({
                message: "Are you sure want to REGISTER PATIENT?",
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
                    //if true go to PMI page
                    if (result === true) {
                        $body.addClass("loading");
                        $.ajax({
                            type: "POST",
                            url: "registerqueue.jsp",
                            data: datas, // Send input
                            timeout: 3000,
                            success: function (list) {
                                console.log(list);
                                $body.removeClass("loading");
                                if ($.trim(list) === "Success") {

                                    bootbox.alert("Patient has been register successfully");
                                } else if ($.trim(list) === "already") {
                                    bootbox.alert("Patient is already registered");
                                }
                            }, error: function () {
                                bootbox.alert("There is an error!");
                            }
                        });
                    }
                }
            });

        }


    });
    //event when press ENTER after inserting the ID
    $("#idInput").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchPatient();

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
        $('#myForm2')[0].reset();
        $('#formPMI')[0].reset();
        $('#kinform')[0].reset();
        $('#empform')[0].reset();
        $('#famForm')[0].reset();
        $('#formMed')[0].reset();
        $("table tbody").remove();


    });

    //appointment edit button
    $('#modalSaya').on('click', '#appointmentModal #listAppointment #APPedit', function () {
        console.log("u're clicking the edit button in appointment table");
        var row = $(this).closest("tr");
        var rowData = row.find("#appval").val();

        var array_data = String(rowData).split("|");
        var pit = array_data[7];
        var idtype;
        if (pit === "004") {
            idtype = "Matric No.";
        } else if (pit === "005") {
            idtype = "Staff No.";
        }
        console.log(array_data);
        $('input[id=pmino]').val($.trim(array_data[0]));
        $('input[id=pname]').val($.trim(array_data[4]));
        $('input[id=pnic]').val($.trim(array_data[5]));
        $('input[id=poic]').val($.trim(array_data[6]));
        $('input[id=pit]').val($.trim(idtype));
        $('input[id=pino]').val($.trim(array_data[8]));

        $('#radios-1').prop('checked', true);
        $('#select-1').show();
        $('#patCat').val('001');
        $('#visTy').val('002');
        $('#EmTy').val('-');
        $('#EliCat').val('003');
        if ($('input[id=pit]').val() === "004") {
            $('#EliTy').val('003');
        } else if ($('input[id=pit]').val() === "005") {
            $('#EliTy').val('005');
        }

        $('#Dis').val('001');
        $('#prioGru').val('003');
        $('#select-1').val('Normal Queue');
    });
    
    //queue delete button
    $('#modalSaya2').on('click','#queueModal #listQueue #delQueue', function(e){
        var item = $(this).closest("tr").find("#pmiNumber").text();
            var epiTime = $(this).closest("tr").find("#epiTime").text();
            var datas = {'pmino': item, 'today': epiTime};
            console.log("button delete queue");
            $.ajax({
                type: "POST",
                url: "deletePMSQueue.jsp",
                data: datas, // Send input
                timeout: 3000,
                success: function (list) {
                    console.log(list);
                    if ($.trim(list) === "success") {
                        bootbox.alert("Succeed deleting patient in queue.");
                    } else if ($.trim(list) === "fail") {
                        bootbox.alert("Failed deleting patient in queue.");
                    }
                }, error: function () {
                    bootbox.alert("There is an error!");
                }
            });
            //alert(item+" "+yyyyMMdd);
            $(this).closest('tr').remove();
       
    });




</script>                      