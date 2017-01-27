/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function searchByDate (){
    var date = $('#searchAppointmentDate').val().split('/');
    date = date[2]+'-'+date[1]+'-'+date[0];
    var dataSearch = {
            searchAppointmentDate: date
        };
        console.log(dataSearch);
        $.ajax({
            url:'AppointmentViewDate.jsp',
            method:'post',
            data:dataSearch,
            timeout:10000,
            success:function(result){
                        //console.log(result);
                $('#viewAppointmentTable').html(result);
            }
        });
}

function searchByPatient() {
     var dataSearch = {
            searchAppointmentPatient: $('#searchAppointmentPatient').val()
        };
        //console.log(dataSearch);
        $.ajax({
            url:'AppointmentViewPatient.jsp',
            method:'post',
            data:dataSearch,
            timeout:10000,
            success:function(result){
                //console.log(result);
                $('#viewAppointmentTable').html(result);
            }
        });
}

function searchByDoctor(){
     var dataSearch = {
            searchAppointmentDoctor: $('#searchAppointmentDoctor').val()
        };
        //console.log(dataSearch);
        $.ajax({
            url:'AppointmentViewDoctor.jsp',
            method:'post',
            data:dataSearch,
            timeout:10000,
            success:function(result){
                //console.log(result);
                $('#viewAppointmentTable').html(result);
            }
        });
}

$(document).ready(function(){
    $('#searchPatientView').click(function(e){
        e.preventDefault();
        searchByPatient();
        searchByPatient();
       
       
    });
    
   $('#searchDateView').click(function(e){
        e.preventDefault();
        searchByDate();
        searchByDate();
    });
    

    
    $('#searchDoctorView').click(function(e){
        e.preventDefault();
        searchByDoctor();
        searchByDoctor();
       
    });
    
      $('#viewAllAppointment').click(function(e){
        e.preventDefault();
        $('#viewAppointmentTable').load('adminAppointmentAjax.jsp #viewAppointmentTable');
    });
    
    $('#viewDoctorAppointment').click(function(e){
        e.preventDefault();
        $('#viewAppointmentTable').load('medicalStaffDoctorAjax.jsp #viewAppointmentTable');
    });
    
});

