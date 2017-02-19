<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/loading.css">
<!--hfc code in register queue need to get from session -->


<%
    String hfc = session.getAttribute("HFC").toString();
    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String admit = "select * from lookup_detail where master_ref_code ='0023'";
    String bed = "select bed_id from wis_bed_id";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";
    String discip = "select * from adm_lookup_detail where master_reference_code = '0072'   ";
    String wname = "select ward_name from wis_ward_name";
    String wtype = "select ward_class_code from wis_ward_name";
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";

    ArrayList<ArrayList<String>> dataEliCat, dataAdmit, dataBed, dataEliType, dataIdType, dataDiscip, dataWardName, dataWardType;

    Conn conn = new Conn();

    dataEliCat = conn.getData(eliCat);
    dataAdmit = conn.getData(admit);
    dataBed = conn.getData(bed);
    dataEliType = conn.getData(eliType);
    dataDiscip = conn.getData(discip);
    dataWardName = conn.getData(wname);
    dataWardType = conn.getData(wtype);
    dataIdType = conn.getData(idTYpe);

    String dataSystemStatus = session.getAttribute("SYSTEMSTAT").toString();


%>
<div class="row" id="register">
    <div class="col-md-12">
        <div id="searchPatientModule"></div>
        <!--        <div class="thumbnail">
                    <h4>Search Patient
                        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
                    </h4>
                    <form class="form-horizontal" name="myForm" id="myForm">
                         Select Basic 
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <select id="idType" name="idType" class="form-control" required="">
                                    <option selected="" disabled="" value="-"> Please select ID type</option>
                                    <option value="pmino">PMI No</option>
                                    <option value="icnew">IC No (NEW)</option>
                                    <option value="icold">IC No (OLD)</option>
                                    <option value="matricno">Matric No</option>
                                    <option value="staffno">Staff No</option>
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

Text input
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
</div>-->

        <div class="thumbnail">
            <h4>In-Patient Information</h4>
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
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <input id="pid" name="pid" type="text" placeholder=""  readonly class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                            <div class="col-md-4">
                                <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
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
                            <label class="col-md-4 control-label" for="selectbasic">Please select the Queue</label>

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
<script src="assets/js/jquery.min.js"></script>

<script src="assets/js/bootbox.min.js"></script> 



<script>

    //load appointment modal into the registration page


//    $('#modalSaya').load('AppointmentModal.jsp');
//    $('#modalSaya2').load('QueueModal.jsp');
    $('#searchPatientModule').load('searchPatient.jsp');
    //set modal width to dynamic
    $('#modalSaya').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
            height: 'auto',
            'max-height': '100%'});
    });
    $('#modalSaya2').on('shown.bs.modal', function () {
        $(this).find('.modal-dialog').css({width: '70%',
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

            if ($('#EliTy').val() === null) {
                eliTyCode = "-";
            } else {
                eliTyCode = $('#EliTy').val();
            }

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
            stat = "0";
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


    //event on click clear buton
    $('#btnclear').click(function () {
        //$('input[type=text], textarea').val('');
        //$('select').find('option').prop("selected", false);
        $('#myForm2')[0].reset();
        $('#select-0').hide();
        $('#select-1').hide();
        $('select[id=select-2]').hide();
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
    $('#modalSaya2').on('click', '#queueModal #listQueue #delQueue', function (e) {
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