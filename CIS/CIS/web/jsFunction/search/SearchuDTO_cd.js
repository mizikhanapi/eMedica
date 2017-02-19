$('#match13').on('click',function () {
        var id = $('#pproblem11').val();
        $.ajax({
        type:'post',
        url:'search/SearchDTO_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var dtoCode = array_data[0];
            var dtoGnr = array_data[1];
            var dtoQty = array_data[2];
            var dtoPackage = array_data[3];
            console.log(dtoCode);
           
            $('#udtoCode').val(dtoCode);
            $('#ppro').val(dtoGnr);
            $('#qqty').val(dtoQty);
            $('#ppack').val(dtoPackage);

          }
        });
     });

