$('#match17').on('click',function () {
        var id = $('#Problem3').val();
        $.ajax({
        type:'post',
        url:'search/SearchPMH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var fmhCode = array_data[0];
            console.log(fmhCode);
           
            $('#fmhCode').val(fmhCode);
  
          }
        });
     });

