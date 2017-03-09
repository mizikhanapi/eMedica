//js search in add Allergy
 $(function () {
                 $("#Searchdoctor").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var id = $('#disciplin_cd').val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match101').html('<img src="bootstrap-3.3.6-dist/image/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input, 'input1': id}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "SearchAllergy.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match101').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Searchdoctor').val($(this).text()); // Update the field with the new element
                                    $('#match101').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match101').text('Problem!');
                            }
                        });
                    } else {
                        $('#match101').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in add Allergy

//js search in Update Allergy
 $(function () {
                 $("#PProblem5").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match23').html('<img src="bootstrap-3.3.6-dist/image/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "SearchAllergy.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match23').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem5').val($(this).text()); // Update the field with the new element
                                    $('#match23').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match23').text('Problem!');
                            }
                        });
                    } else {
                        $('#match23').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js search in Update Allergy