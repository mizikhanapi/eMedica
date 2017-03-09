//js Search in add drug

function DTOupdateSearchCode(){
        var id = $('#update_searchDTO').val();
        $.ajax({
        type:'post',
        url:'search/SearchDTO_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var dtoCode = array_data[0];
            var dtoGnr = array_data[1];
            var dtoQty = array_data[2];
            var dtoPackage = array_data[3];
            console.log(dtoCode);
           
            $('#update_dtoCode').val(dtoCode);
            $('#update_pro').val(dtoGnr);
            $('#update_qty').val(dtoQty);
            $('#ppack').val(dtoPackage);

          }
        });
}

function DTOSearchCode(){
     var id = $('#searchDTO').val();
        $.ajax({
        type:'post',
        url:'search/SearchDTO_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var dtoCode = array_data[0];
            var dtoGnr = array_data[1];
            var dtoQty = array_data[2];
            var dtoPackage = array_data[3];
            console.log(dtoCode);
            
            if(dtoGnr===""){
                dtoGnr="No product name";
            }
           
            $('#dtoCode').val(dtoCode.trim());
            $('#drugNameDTO').val(dtoGnr.trim());
            $('#drugQtyDTO').val(dtoQty.trim());
            $('#pack').val(dtoPackage);

          }
        });
}

  $(function () {
                $("#searchDTO").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchDTO').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchDTO').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#searchDTO').val($(this).text()); // Update the field with the new element
                                    $('#matchDTO').text(''); // Clear the <div id="match"></div>
                                    DTOSearchCode();
                                });
                            },
                            error: function () { // if error
                                $('#matchDTO').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchDTO').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });
            });
//End js Search in add drug

//js Search in update drug
 $(function () {
                $("#update_searchDTO").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#update_matchDTO').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#update_matchDTO').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#matchList li').on('click', function () { // When click on an element in the list
                                    $('#update_searchDTO').val($(this).text()); // Update the field with the new element
                                    $('#update_matchDTO').text(''); // Clear the <div id="match"></div>
                                    DTOupdateSearchCode();
                                });
                            },
                            error: function () { // if error
                                $('#update_matchDTO').text('Problem!');
                            }
                        });
                    } else {
                        $('#update_matchDTO').text(''); // If less than 2 characters, clear the <div id="match"></div>
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
