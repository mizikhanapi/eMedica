//js search in add complaint pop up      
            $(function () {
                $("#problem").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match50').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/result.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match50').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#problem').val($(this).text()); // Update the field with the new element
                                    $('#match50').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match50').text('Problem!');
                            }
                        });
                    } else {
                        $('#match50').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in add complaint pop up 

//js search in update complaint pop up
    $(function () {
                $("#uproblem").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match1').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/result.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match1').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#uproblem').val($(this).text()); // Update the field with the new element
                                    $('#match1').text(''); // Clear the <div id="match"></div>
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