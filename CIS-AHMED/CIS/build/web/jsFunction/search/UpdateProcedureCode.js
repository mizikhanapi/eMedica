 $('#pproType').change(function(){
        $.ajax({
        type:'post',
        url:'search/UpdateProcedureCode.jsp',
        data: 'id='+ $('#pproType').val(),                
        success: function(reply_data){
            console.log(reply_data);
            $('#pprocedure_cd').val(reply_data);
          }
        });
     });