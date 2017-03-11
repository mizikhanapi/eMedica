$('#match6').on('click',function () {
        var id = $('#Problem6').val();
        $.ajax({
        type:'post',
        url:'search/SearchIMU_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var imuCode = array_data[0];
            console.log(imuCode);
           
            $('#IMU_cd').val(imuCode);
              //alert(imuCode);
          }
        });
     });
