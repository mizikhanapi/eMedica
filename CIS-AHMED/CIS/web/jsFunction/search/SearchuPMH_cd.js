$('#match3').on('click',function () {
        var id = $('#PProblem2').val();
        $.ajax({
        type:'post',
        url:'search/SearchPMH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var upmhCode = array_data[0];
            console.log(upmhCode);
           
            $('#upmhCode').val(upmhCode);
  
          }
        });
     });

