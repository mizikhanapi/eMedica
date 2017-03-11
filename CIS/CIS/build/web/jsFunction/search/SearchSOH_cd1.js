$('#match5').on('click',function () {
        var id = $('#PProblem4').val();
        $.ajax({
        type:'post',
        url:'search/SearchSOH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var usohCode = array_data[0];
            console.log(usohCode);
           
            $('#usohCode').val(usohCode);
  
          }
        });
     });

