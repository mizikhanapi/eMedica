$('#match4').on('click',function () {
        var id = $('#Problem4').val();
        $.ajax({
        type:'post',
        url:'search/SearchSOH_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var sohCode = array_data[0];
            console.log(sohCode);
           
            $('#sohCode').val(sohCode);
  
          }
        });
     });

