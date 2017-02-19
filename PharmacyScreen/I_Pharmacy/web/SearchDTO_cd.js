$('#match12').on('click',function () {
        var id = $('#problem11').val();
        $.ajax({
        type:'post',
        url:'SearchDTO_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var dtoCode = array_data[0];
            var dtoGnr = array_data[1];
            var dtoQty = array_data[2];
            var dtoPackage = array_data[3];
            console.log(dtoCode);
           
            $('#dtoCode').val(dtoCode);
            $('#pro').val(dtoGnr);
            $('#qty').val(dtoQty);
            $('#pack').val(dtoPackage);

          }
        });
     });

