$('#match2').on('click',function () {
        var id = $('#Problem1').val();
        $.ajax({
        type:'post',
        url:'search/SearchPMH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var pmhCode = array_data[0];
            console.log(pmhCode);
           
            $('#pmhCode').val(pmhCode);
  
          }
        });
     });

