
function searchApp() {
        var inputApp = $('#idInputApp').val();
        var typeApp = $('#idTypeApp').val();
        $.ajax({
            type: "POST",
            data: {idType: typeApp, idInput: inputApp},
            url: "searchID.jsp", // call the jsp file ajax/tuto-autocomplete.php
            timeout: 10000,
            success: function (list) {
                console.log(list);
                $('#modalSeacrhID').html(list);
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });
        $('#myFormApp')[0].reset();
    };

    $('#searchApp').on('click', function () {
        searchApp();
    });
    
    //event when press ENTER after inserting the ID
    $("#idInputApp").on("keydown", function (e) {
        var code = e.keyCode;

        if (code === 13) {
            e.preventDefault();
            searchApp();

        }
    });
    
    $('#clearApp').click( function(){
        $('#myFormApp')[0].reset();
    });