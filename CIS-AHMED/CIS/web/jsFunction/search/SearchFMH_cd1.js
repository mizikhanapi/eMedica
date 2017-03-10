$('#match16').on('click',function () {
        var id = $('#PProblem3').val();
        $.ajax({
        type:'post',
        url:'search/SearchPMH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var ufmhCode = array_data[0];
            console.log(ufmhCode);
           
            $('#ufmhCode').val(ufmhCode);
  
          }
        });
     });

