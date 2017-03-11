$('#match25').on('click',function () {
        var id = $('#PProblem6').val();
        $.ajax({
        type:'post',
        url:'search/SearchIMU_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var uimuCode = array_data[0];
            console.log(uimuCode);
           
            $('#uIMU_cd').val(uimuCode);
              //alert(uimuCode);
          }
        });
     });
