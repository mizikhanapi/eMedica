//js search in add HFC

function searchHFCcode(){
    var id = $('#hfc').val();
    $.ajax({
        type: 'post',
        url: 'search/searchHFC_cd.jsp',
        data: {'id': id},
        success: function (reply_data) {
            var array_data = String(reply_data).split("|");
            var hfcCode = array_data[0];
            console.log(hfcCode);

            $('#hfc1').val(hfcCode);
            // alert(reply_data);
            //var id = $('#hfc1').val();
            $.ajax({
                type: 'post',
                url: 'search/SearchDiscipline.jsp',
                data: {id: hfcCode},
                success: function (reply_data) {
                    $('#hfcDiscipline').html(reply_data);
                    console.log(reply_data);
                }
            });
        }
    });
}
 $(function () {
                 $("#hfc").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchHFC').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                    $('#matchHFC').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                    $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#hfc').val($(this).text()); // Update the field with the new element
                                    $('#matchHFC').text(''); // Clear the <div id="match"></div>
                                    searchHFCcode();
                                });
                            },
                            error: function () { // if error
                                $('#matchHFC').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchHFC').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in add HFC

//js search in Update HFC
 $(function () {
                 $("#PProblem10").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#mmatch10').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchHFC.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#mmatch10').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem10').val($(this).text()); // Update the field with the new element
                                    $('#mmatch10').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#mmatch10').text('Problem!');
                            }
                        });
                    } else {
                        $('#mmatch10').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in Update HFC
