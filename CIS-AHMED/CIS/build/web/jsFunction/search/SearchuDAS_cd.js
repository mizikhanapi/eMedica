$('#mmatch32').on('click',function () {
        var id = $('#PProblem32').val();
        $.ajax({
        type:'post',
        url:'search/SearchDAS_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var udasCode = array_data[0];
            console.log(udasCode);
           
            $('#uDAS_cd').val(udasCode);
  
          }
        });
     });

