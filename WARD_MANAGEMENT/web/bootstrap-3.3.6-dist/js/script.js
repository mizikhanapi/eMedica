// Add Record
function addRecord() {
    // get values
    var testCat = $("#testCat").val();
    var testCatName = $("#testCatName").val();
    var status = $("#status").val();
 
    // Add record
    $.post("ajax/tCategoryInsert.jsp", {
        testCat: testCat,
        testCatName: testCatName,
        status: email
    }, function (data, status) {
        // close the popup
        $("#add_new_record_modal").modal("hide");
 
        // read records again
        readRecords();
 
        // clear fields from the popup
        $("#first_name").val("");
        $("#last_name").val("");
        $("#email").val("");
    });
}
 
// READ records
function readRecords() {
    $.get("ajax/readRecords.jsp", {}, function (data, status) {
        $(".records_content").html(data);
    });
}
 
 
function DeleteUser() {
    var id = $(this).closest('tr').find('.product-id').text();
    var conf = confirm("Are you sure, do you really want to delete User?");
    if (conf == true) {
        $.post("ajax/deleteUser.php", {
                id: id
            },
            function (data, status) {
                // reload Users by using readRecords();
                readRecords();
            }
        );
    }
}
 
function GetUserDetails(id) {
    // Add User ID to the hidden field for furture usage
    $("#hidden_user_id").val(id);
    $.post("ajax/readUserDetails.php", {
            id: id
        },
        function (data, status) {
            // PARSE json data
            var user = JSON.parse(data);
            // Assing existing values to the modal popup fields
            $("#update_first_name").val(user.first_name);
            $("#update_last_name").val(user.last_name);
            $("#update_email").val(user.email);
        }
    );
    // Open modal popup
    $("#update_user_modal").modal("show");
}
 
function UpdateUserDetails() {
    // get values
    var cat_code = $("#update_cat_code").val();
    var cat_name = $("#update_cat_name").val();
    var cat_status = $("#update_cat_status").val();
 
    // get hidden field value
    var id = $("#hidden_user_id").val();
 
    // Update the details by requesting to the server using ajax
    $.post("ajax/updateUserDetails.php", {
            id: id,
            cat_code: cat_code,
            cat_name: cat_name,
            cat_status: cat_status
        },
        function (data, status) {
            // hide modal popup
            $("#update_user_modal").modal("hide");
            // reload Users by using readRecords();
            readRecords();
        }
    );
}
 
$(document).ready(function () {
    // READ recods on page load
    readRecords(); // calling function
});