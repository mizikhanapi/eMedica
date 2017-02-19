/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log("Javascript Loaded");


$("#addButton").click(
        function () {

            var atcCode = $('#atcCode').val();
            var atcDesc = $('#atcDesc').val();
            var category = $('#category').val();
            var status = $('input[name="status"]:checked').val();

            console.log(atcCode);
            console.log(atcDesc);
            console.log(category);
            console.log(status);

            $.ajax({
                url: "testInsert.jsp",
                type: "post",
                data: {
                    atcCode: atcCode,
                    atcDesc: atcDesc,
                    category: category,
                    status: status
                },
                timeout: 10000,
                success: function (data) {
                    $('#MTC').load('test.jsp #MTC');
                    console.log("Success");
                    $('#detail').modal('hide');

                },
                error: function (err) {
                    console.log("Not Success");
                }

            });


        });




    