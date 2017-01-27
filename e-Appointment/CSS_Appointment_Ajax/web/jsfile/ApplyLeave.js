/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
        $('#applyLeave').click(function(e){
            e.preventDefault(e);
            
            var startDateLeave = changeDateFormat($('#startDateLeave').val());
            var endDateLeave  =changeDateFormat($('#endDateLeave').val());
            
            var dataLeave = {
               hfcName:$('#hfcNameL').val(),
               staffName:$('#staffNameL').val(),
               startDate:startDateLeave,
               endDate:endDateLeave,
               desc:$('#descLeave').val()
            };
            
            console.log(dataLeave);
            $.ajax({
                url:'addLeaveAdminAjax.jsp',
                method:'post',
                data:dataLeave,
                timeout:10000,
                success:function(result){
                    if(result.trim()==='success'){
                        alert('Successfully apply for the leave, your leave apply in process');
                        $('#leaveTable').load('adminAppointmentAjax.jsp #leaveTable');
                    }
                    else if(result.trim()==='process'){
                        alert('Leave request is disallow due to previous request still in processing');
                    }
                    else {
                        alert('ajax Error');
                    }
                },
                error:function(e){
                    console.log(e);
                }
            });
        });
});