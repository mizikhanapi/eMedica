/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
  function searchDoctor(){

            
         var dateAppointment = $("#dateDoctorA").datepicker().val();
        dateAppointment = dateAppointment.split('/');
        dateAppointment = dateAppointment[2]+ "-"+dateAppointment[1]+"-"+ dateAppointment[0];
        
             var dataSearch = {
                date:dateAppointment,
                doctor:$('#selectDoctorA').val()
            };
        
            console.log(dateAppointment);
            //ada bug x boleh click href lain
            $.ajax({
                url:'adminDoctorAvailability.jsp',
                method:'post',
                data:dataSearch,
                timeout:1000,
                success:function(result){

                    $('#doctorAvailabilityTable').html(result);
                    //console.log(result);


                },
                error:function(e){
                    console.log(e);
                }
            });
    };
    $('#todaySearch').click(function(e){
                    e.preventDefault();
                    $('#doctorAvailabilityTable').load('adminAppointmentAjax.jsp #doctorAvailabilityTable');
                });
                
        $('#searchDoctor').click(function(e){
            e.preventDefault();
            searchDoctor();
            searchDoctor();
        });
});