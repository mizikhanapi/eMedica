  $('#match1').on('click',function () {
        var id = $('#uproblem').val();
        $.ajax({
        type:'post',
        url:'search/SearchCCN_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var uccncode = array_data[0];
            console.log(uccncode);
           
            $('#uccnCode').val(uccncode);

          }
        });
     });

