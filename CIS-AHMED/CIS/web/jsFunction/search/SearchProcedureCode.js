 $('#proType').change(function(){
        $.ajax({
        type:'post',
        url:'search/getProcedureCode.jsp',
        data: 'id='+ $('#proType').val(),                
        success: function(reply_data){
            console.log(reply_data);
            $('#procedure_cd').val(reply_data);
          }
        });
     });