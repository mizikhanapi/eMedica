$('#hfcDiscipline').change(function(){
        $.ajax({
        type:'post',
        url:'search/searchDiscipline_cd.jsp',
        data: 'id='+ $('#hfcDiscipline').val(),                
        success: function(reply_data){
            console.log(reply_data);
            $('#disciplin_cd').val(reply_data);
          }
        });
     });