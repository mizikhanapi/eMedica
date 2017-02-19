//js search in add procedure
 $(function () {
                 $("#Problem18").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match18').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchProcedure.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match18').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#Problem18').val($(this).text()); // Update the field with the new element
                                    $('#match18').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match18').text('Problem!');
                            }
                        });
                    } else {
                        $('#match18').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

//                $('#btnSearch2').on('click',function () {
//
//                      var id = $('#Problem18').val();
//                    if (id === "") {
//                        alert("Please Search Procedure First!");
//                    } else {
//                        $.ajax({
//                            type: "POST",
//                            url: "searchProcedureTypes.jsp",
//                            data: {id: id},
//                            timeout: 3000,
//                            success: function (data) {
//                                console.log(data);
//                                //alert(data);
//                                 // var array_data = String(data).split("|");
//                                $('#proType').html(data);
//                               
////
//////                                var procedureType = array_data[0];
////                                var procedureCode = array_data[1];
////                                alert(procedureCode);
//////
//////                                $('input[id=proType]').val($.trim(procedureType));
////                                $('input[id=ProCode]').val($.trim(procedureCode));
//
//                            },
//                            error: function (e) {
//                                    alert("Error" + e);
//                            }
//                        });
//                    }
//                });
            });
//End js search in add procedure

//js search in Update procedure
 $(function () {
                 $("#PProblem19").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#match19').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchProcedure.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#match19').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#PProblem19').val($(this).text()); // Update the field with the new element
                                    $('#match19').text(''); // Clear the <div id="match"></div>
                                });
                            },
                            error: function () { // if error
                                $('#match19').text('Problem!');
                            }
                        });
                    } else {
                        $('#match19').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
//
//                $('#btnSearch3').on('click',function () {
//
//                      var id = $('#PProblem19').val();
//                    if (id === "") {
//                        alert("Please Search Procedure First!");
//                    } else {
//                        $.ajax({
//                            type: "POST",
//                            url: "SearchUpdateProcedure.jsp",
//                            data: {id: id},
//                            timeout: 3000,
//                            success: function (data) {
//                                console.log(data);
//                                //alert(data);
//                                $('#pproType').html(data);
////                                var array_data = String(data).split("|");
////                                
////                                
//////
//////                                var procedureType = array_data[0];
////                                var procedureCode = array_data[1];
////                             alert(procedureCode);
//////                                $('input[id=pproType]').val($.trim(procedureType));
////                               $('input[id=pproCode]').val($.trim(procedureCode));
//                            },
//                            error: function (e) {
//                                    alert("Error" + e);
//                            }
//                        });
//                    }
//                });
            });
//End js search in Update procedure