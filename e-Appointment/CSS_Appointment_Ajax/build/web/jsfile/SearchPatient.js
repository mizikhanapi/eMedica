/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
      $('#adminSearchPatient').click(function(e){
            e.preventDefault();
            var dataSearchPatient = {
                pmiNo:$('#pmiNoSearch').val(),
                icNo:$('#icNoSearch').val(),
                idNo:$('#idNoSearch').val()
            };

            $.ajax({
                url:'adminSearchAppointmentAjax.jsp',
                method:'post',
                data:dataSearchPatient,
                timeout:10000,
                success:function(result){
                    //console.log(result);
                    if(result===""){
                        alert("Error");
                    }else{
                        var result = result.trim();
                        var dataResultPatient = result.split("|");
                       //console.log(dataResultPatient);
                        $('#pmiNo').val(dataResultPatient[0]);
                        $('#patientName').val(dataResultPatient[1]);
                        $('#idNo').val(dataResultPatient[2]);
                        $('#ic').val(dataResultPatient[3]);

                    }
                },
                error:function(err){
                    console.log(err);
                }
            });
            console.log(dataSearchPatient);
        });
});