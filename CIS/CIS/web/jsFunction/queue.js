/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function findPatient(pmiNo){
    $.ajax({
        url:'search/searchPatient.jsp',
        method:'POST',
        data:{
            pmiNo:pmiNo
        },
        timeout:10000,
        success: function(result){
            var DataArry = result.split("|");
            $('#pName').html(DataArry[1]);
            $('#pIC').html(DataArry[0].trim());
            $('#pBloodType').html(DataArry[3]);
            $('#pSex').html(DataArry[4]);
            $('#pIdType').html(DataArry[5]);
            $('#pAllergy').html(DataArry[8]);
            $('#pAge').html(DataArry[6]);
            $('#pRace').html(DataArry[7]);
            
            
            console.log(DataArry);
        }
    });
}


$(document).ready(function(){
    
    $('#listQueue').on('click','#consultBtn',function(e){
        e.preventDefault();
        var row = $(this).closest('tr');
        var  pmiNo = row.find('#pmiNumber').text();
       var patient =  findPatient(pmiNo);
        
        $('#queueModal').modal('toggle');
      
        
    });
});