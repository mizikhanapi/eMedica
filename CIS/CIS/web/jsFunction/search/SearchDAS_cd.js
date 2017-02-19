$('#match32').on('click',function () {
        var id = $('#Problem32').val();
        $.ajax({
        type:'post',
        url:'SearchDAS_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var dasCode = array_data[0];
            console.log(dasCode);
           
            $('#DAS_cd').val(dasCode);
  
          }
        });
     });

