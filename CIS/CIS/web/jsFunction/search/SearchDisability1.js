//js search in add Disability
 $(function () {
                 $("#Problem32").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match32').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/SearchDisability.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match32').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Problem32').val($(this).text()); // Update the field with the new element
                                    $('#match32').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match32').text('Problem!');
                            }
                        });
                    } else {
                        $('#match32').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in add Disability

//js search in Update Disability
 $(function () {
                 $("#PProblem32").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#mmatch32').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "SearchDisability.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#mmatch32').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem32').val($(this).text()); // Update the field with the new element
                                    $('#mmatch32').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#mmatch32').text('Problem!');
                            }
                        });
                    } else {
                        $('#mmatch32').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in Update Disability