//js Search in add drug
  $(function () {
                $("#problem11").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match12').html('<img src="bootstrap-3.3.6-dist/image/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match12').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#problem11').val($(this).text()); // Update the field with the new element
                                    $('#match12').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match12').text('Problem!');
                            }
                        });
                    } else {
                        $('#match12').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js Search in add drug

//js Search in update drug
 $(function () {
                $("#pproblem11").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match13').html('<img src="bootstrap-3.3.6-dist/image/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match13').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#pproblem11').val($(this).text()); // Update the field with the new element
                                    $('#match13').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match13').text('Problem!');
                            }
                        });
                    } else {
                        $('#match13').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

                $('#btnSearch1').click(function () {

                    var id = $('#pproblem11').val();
                    if (id === "") {
                        alert("Please Search Drug First!");
                    } else {
                        $.ajax({
                            type: "POST",
                            url: "Search3.jsp",
                            data: {id: id},
                            timeout: 3000,
                            success: function (data) {
                                console.log(data);
                                //alert(data);


                                var array_data = String(data).split("|");

                                var pro = array_data[0];
                                var qty = array_data[1];
                                var pack = array_data[2];

                                $('input[id=ppro]').val($.trim(pro));
                                $('input[id=qqty]').val($.trim(qty));
                                $('input[id=ppack]').val($.trim(pack));


                            },
                            error: function () {

                            }
                        });
                    }
                });
            });
//End js Search in update drug
