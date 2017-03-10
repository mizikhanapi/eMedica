$('#match19').on('click',function () {
        var id = $('#PProblem19').val();
        $.ajax({
        type:'post',
        url:'search/searchProcedureTypes.jsp',
        data: {'id': id},                
        success: function(reply_data){
          $('#pproType').html(reply_data);
          }
        });
     });

