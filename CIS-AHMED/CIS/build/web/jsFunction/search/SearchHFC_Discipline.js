$('#hfc1').on('paste',function () {
        var id = $('#hfc1').val();
        $.ajax({
        type:'post',
        url:'search/SearchDiscipline.jsp',
        data: {'id': id},                
        success: function(reply_data){
          $('#hfcDiscipline').html(reply_data);
          console.log(reply_data);
          }
        });
     });