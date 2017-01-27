/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var role;

    //function for add appointment
    function terusInsert(data) {
        $.ajax({
            url: "patientInsertAppointmentAjax.jsp",
            type: "post",
            data: data,
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                alert("Your Appointment is success added");
                emptyField();
            }
        });
    }
    ;

    //function for check appointment
    $("#check").click(function (e) {
        e.preventDefault();
        
        var dateAppointment = $("#datepicker").datepicker().val();
        dateAppointment = dateAppointment.split('/');
        dateAppointment = dateAppointment[2]+ "-"+dateAppointment[1]+"-"+ dateAppointment[0];
        var _pmiNo = $("#pmiNo").val();
        var _role = $("#role").val();
        var _dataUserId = $("#idNo").val();
        var _patientName = $("#patientName").val();
        var _ic = $("#ic").val();
        ;
        var _discipline = $("#disciple").val();
        var _subdiscipline = $("#subdisciplineAppointment").val();
        var _HFCCode = $("#HFCCode").val();

        var _doctor = $("#doctorApp").val();
        var _dateAppointment = dateAppointment;
        var _timeAppointment = $("#timepicker").find(":selected").text();
        var _typeAppointment = $("#typeAppointment").find(":selected").text();

        var data = {
            pmiNo: _pmiNo,
            dataUserId: _dataUserId,
            patientName: _patientName,
            ic: _ic,
            discipline: _discipline,
            subdiscipline: _subdiscipline,
            doctor: _doctor,
            dateAppointment: _dateAppointment,
            timeAppointment: _timeAppointment,
            typeAppointment: _typeAppointment,
            HfcCode: _HFCCode
        };
        console.log(data);

        $.ajax({
            url: "patientCheckAppointmentAjax.jsp",
            type: "post",
            data: data,
            timeout: 10000,
            success: function (result) {

                result = result.trim();
                //console.log(result);
                if (result === "clinicOff") {
                    alert("The clinic is off. Please pick other date");
                } else if (result === "datePicked") {
                    alert("Date Picked");
                } else if (result === "slotPicked") {
                    alert("slotPicked");
                } else if (result === "appointmentInsert") {
                    alert("appointmentInsert");
                } else if (result === "appointmentAlreadyInsert") {
                    var confirmation = confirm("By clicking OK you are directly Save the info");
                    if (confirmation == true) {

                        terusInsert(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                        $("#viewAppointmentTable").load("adminAppointmentAjax.jsp #viewAppointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "appointmentInsertstatusActivestatusInactive") {
                    var confirmation = confirm("By clicking OK you are directly Save the info");
                    if (confirmation == true) {

                        terusInsert(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "appointmentInsertstatusCanceled") {
                    var confirmation = confirm("The chosen date has been canceled before. Click Ok if you want to proceed with make the appointment on that date");
                    if (confirmation == true) {

                        terusInsert(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("adminAppointmentAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("medicalStaffNurseAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("medicalStaffDoctorAjax.jsp #appointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "doctorOnLeave") {
                    alert("The doctor is on leave. Please choose other doctor");
                } else if (result == "doctorNotDuty") {
                    alert("The doctor is not in their duty. Please choose other doctor");
                } else if (result == "holiday") {
                    alert("The picked date is Holiday. Please view holiday in the View Holiday tab");
                }


            },
            error: function (err) {
                alert("error");
                //console.log(err);
            }
        });


    });


});