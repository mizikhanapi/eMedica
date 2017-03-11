  $('#match23').on('click',function () {
        var id = $('#PProblem5').val();
        $.ajax({
        type:'post',
        url:'search/SearchALG_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var algCode = array_data[0];
            console.log(algCode);
           
            $('#uALG_cd').val(algCode);
            // alert(reply_data);
          }
        });
     });