$('#match18').on('click',function () {
        var id = $('#Problem18').val();
        $.ajax({
        type:'post',
        url:'search/searchProcedureTypes.jsp',
        data: {'id': id},                
        success: function(reply_data){
           $('#proType').html(reply_data);
          }
        });
     });

