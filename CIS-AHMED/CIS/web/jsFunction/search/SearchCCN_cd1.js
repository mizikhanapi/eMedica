$('#match50').on('click',function () {
        var id = $('#problem').val();
        $.ajax({
        type:'post',
        url:'search/SearchCCN_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var ccncode = array_data[0];
            console.log(ccncode);
           
            $('#ccnCode').val(ccncode);

          }
        });
     });
     
   