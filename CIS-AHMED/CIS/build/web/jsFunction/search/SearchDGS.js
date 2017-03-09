//js search in add complaint pop up      
            $(function () {
                $("#searchDiag").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchDiag').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/resultDGS.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchDiag').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#searchDiag').val($(this).text()); // Update the field with the new element
                                    $('#matchDiag').text(''); // Clear the <div id="match"></div>
                                    var action="insert";
                                    searchCode(action);
                                });
                            },
                            error: function () { // if error
                                $('#matchDiag').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchDiag').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in add complaint pop up 

//js search in update complaint pop up
    $(function () {
                $("#update_searchDiag").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#update_matchDiag').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/resultDGS.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#update_matchDiag').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#update_searchDiag').val($(this).text()); // Update the field with the new element
                                    $('#update_matchDiag').text(''); // Clear the <div id="match"></div>
                                    var action="update";
                                    searchCode(action);
                                });
                            },
                            error: function () { // if error
                                $('#match1').text('Problem!');
                            }
                        });
                    } else {
                        $('#match1').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in update complaint pop up

function searchCode(action){
    
    var id = [];
    if (action==="insert"){
        id=["searchDiag","dgsCode"];
    } else if (action==="update"){
         id=["update_searchDiag","update_dgsCode"];
    }

        $.ajax({
            url:'search/SearchDGS_cd.jsp',
            method:'POST',
            timeout:10000,
            data:{
                id:$('#'+id[0]).val()
            },
            success:function(result){
                console.log(result);
                $('#'+id[1]).val(result.trim());
            },error:function(err){
                alert('error');
            }
        });

}


