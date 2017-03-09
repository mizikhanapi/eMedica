/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    var fullPatientData = "";
     var PDIInfo = "";
   
    $('#listQueue').on('click','#consultBtn',function(e){
        e.preventDefault();
        var row = $(this).closest('tr');
       pmiNo = row.find('#pmiNumber').text();
       episodeDate = row.find('#epiDate').text();
       status = row.find('#status').text();
       
        var patient =  findPatient(pmiNo);
        var getPDIInfo = getPDI(pmiNo);
        console.log(PDIInfo);
        
        if(status === 'On Hold'){
            getEHRPatient(pmiNo,episodeDate);
        }

        $('#queueModal').modal('toggle');
      
        
    });
});

function findPatient(pmiNo){
    $.ajax({
        url:'search/searchPatient.jsp',
        method:'POST',
        data:{
            pmiNo:pmiNo
        },
        timeout:10000,
        success: function(result){
            //console.log(result);
            var DataArry = result.split("|");
            $('#pName').html(DataArry[1]);
            $('#pIC').html(DataArry[0].trim());
            $('#pBloodType').html(DataArry[3]);
            $('#pSex').html(DataArry[4]);
            $('#pIdType').html(DataArry[5]);
            $('#pAllergy').html(DataArry[8]);
            $('#pAge').html(DataArry[6]);
            $('#pRace').html(DataArry[7]);
            fullPatientData = DataArry[9];


        }
    });
}

    
    function getPDI(pmiNo){
        $.ajax({
            url: 'search/getPDI.jsp',
            method: 'POST',
            data: {
                pmiNo: pmiNo
            },
            timeout: 10000,
            success: function (result) {
                PDIInfo = result.trim();
            },
            error:function(err){
                alert(err);
            }
        });
    }





function getEHRPatient(pmiNo,episodeDate){
    
}


