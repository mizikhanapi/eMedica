/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(e){
            $('#stateMenu').on('click','.viewHoliday',function(e){
            e.preventDefault();
            var id = $(this).get(0).id;
            dataId = {
                id:id
            };
            $.ajax({
               url:'adminAppointmentViewAjax.jsp',
               method: 'post',
               data: dataId,
               timeout: 10000,
               success: function(result){                            
                   response = result.trim();
                  // console.log(response);
                   $('#viewHoliday').remove();
                   $('#viewAllHoliday').append(response);
               },
               error: function(err){
                   console.log("err");
               }
            });   
        });
})