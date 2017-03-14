<%--
    Document   : miscellaneous
    Created on : Dec 24, 2016, 6:17:34 PM
    Author     : Mike Ho
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file = "includes/header.html" %>
    <body>
        <div class="container-fluid">
            <div class="row">      
            <%@include file = "includes/sideMenu.html" %>
                <!-- main -->		

                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                    
                <%@include file = "includes/topMenu.html" %>
                    <div class="row">
                        <!--body-->
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <div style="margin-bottom: 250px">
                                    <h4><b>Miscellaneous Item</b></h4>
                                    <div class="form-group">
                                        <div id="reload">
                                            <div id="getID">
                                                <%
                                                    String query1 = "SELECT MAX(item_code) FROM far_miscellaneous_item";
                                                    ArrayList<ArrayList<String>> data1 = Conn.getData(query1);
                                                    String itemCode = data1.get(0).get(0);
                                                    itemCode = itemCode.replaceAll("[^0-9]", "");
                                                    itemCode = String.valueOf(Integer.parseInt(itemCode)+1);

                                                    String code = "RG";
                                                    for (int i = 0 ; itemCode.length() < 5 ; i++){
                                                        itemCode = "0" + itemCode;
                                                    }
                                                    code = code + itemCode;
                                                %>
                                                <label class="col-lg-2">Item Code</label>
                                                <div class="col-lg-10" style="margin-bottom: 10px">
                                                    <input type="text" class="form-control" name="itemCode" id="itemCode" value="<%=code%>" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <label class="col-lg-2">Item Name</label>
                                        <div class="col-lg-10" style="margin-bottom: 10px">
                                          <input type="text" class="form-control" name="itemName" id="itemName">
                                        </div>
                                        <label class="col-lg-2">Buying Price (RM)</label>
                                        <div class="col-lg-10" style="margin-bottom: 10px">
                                          <input type="text" class="form-control" name="buyPrice" id="buyPrice">
                                        </div>
                                        <label class="col-lg-2">Selling Price (RM)</label>
                                        <div class="col-lg-10" style="margin-bottom: 10px">
                                          <input type="text" class="form-control" name="sellPrice" id="sellPrice">
                                        </div>
                                        <label class="col-lg-2"></label>
                                        <div class="col-lg-10 pull-right" style="margin-bottom: 10px">
                                            <button id="add" class="btn btn-success">
                                                <i class=" fa fa-plus" style=" padding-right: 10px; padding-left: 10px;color: white;"></i>
                                                Add
                                            </button>
                                            <button id="update" class="btn btn-success" disabled="true">
                                                <i class="fa fa-pencil-square-o" style=" padding-right: 10px; padding-left: 10px;color: white;"></i>
                                                Update
                                            </button>
                                            <button id="delete" class="btn btn-danger" disabled="true">
                                                <i class="fa fa-times" style=" padding-right: 10px; padding-left: 10px;color: white;"></i>
                                                Delete
                                            </button>
                                        </div>
                                    </div>
                                </div>         
                            </div>
                                                
                            <div class = "thumbnail">
                                <form class="form-horizontal" name="myForm">
                                    <div id="custom-search-input">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                            <div class="col-md-4">
                                                <input id="search" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchItem()"/>
                                            </div>
                                        </div>
                                    </div>
                                </form>   
                                <div id="miscItem" ></div>           
                            </div>                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                                
        <%@include file = "includes/message.html" %>    
        
        <!--js--> 
        <script src="assets/js/dateformat.js" type="text/javascript"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function searchItem() {
                // Declare variables
                var input, filter, table, tr, td, i;
                input = document.getElementById("search");
                filter = input.value.toUpperCase();
                table = document.getElementById("miscItem");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            
            $(document).ready(function(){
                $('#miscItem').load("tableMiscellaneous.jsp");

                $('#buyPrice').keypress(function(event) {
                    if (((event.which != 46 || $(this).val().indexOf('.') != -1) 
                            && (event.which < 48 || event.which > 57) 
                            || ($(this).val().length > 8)) 
                            && event.which != 8 ) {
                        event.preventDefault();
                    }
                });
                
                $('#sellPrice').keypress(function(event) {
                    if (((event.which != 46 || $(this).val().indexOf('.') != -1) 
                            && (event.which < 48 || event.which > 57) 
                            || ($(this).val().length > 8)) 
                            && event.which != 8 ) {
                        event.preventDefault();
                    }
                });

                $('#add').click(function(){
                    var itemCode = document.getElementById('itemCode').value;
                    var itemName = document.getElementById('itemName').value;
                    var buyPrice = document.getElementById('buyPrice').value;
                    var sellPrice = document.getElementById('sellPrice').value;
                    
                        if (itemName === "" || buyPrice === "" || sellPrice === "") {
                            document.getElementById('messageHeader').innerHTML = "Warning!";
                            document.getElementById('messageContent').innerHTML = "Please fill in empty fields.";
                            $("#alertMessage").modal();
                        } else {
                            $.ajax({
                                url: "manageMiscellaneous.jsp",
                                type: "post",
                                data: {
                                    action: 'add',
                                    itemCode: itemCode,
                                    itemName: itemName,
                                    buyPrice: buyPrice,
                                    sellPrice: sellPrice
                                },
                                timeout: 10000,
                                success: function(data) {
                                    var d = data.split("|");
                                    if (d[1] == '1') {
                                        $('#miscItem').load("tableMiscellaneous.jsp");
                                        $('#reload').load(location.href + " #getID");
                                        $('#temName').val('');
                                        $('#buyPrice').val('');
                                        $('#sellPrice').val('');
                                        
                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = "Data added successfully.";
                                        $("#alertMessage").modal();
                                     } else {
                                        document.getElementById('messageHeader').innerHTML = "Failed!";
                                        document.getElementById('messageContent').innerHTML = "Failed to add data.";
                                        $("#alertMessage").modal();
                                     }
                                },
                                error: function(err) {
                                }
                            });
                        }
                    });
                $('#update').click(function(){
                    var itemCode = document.getElementById('itemCode').value;
                    var itemName = document.getElementById('itemName').value;
                    var buyPrice = document.getElementById('buyPrice').value;
                    var sellPrice = document.getElementById('sellPrice').value;
                    
                        if (itemName === "" || buyPrice === "" || sellPrice === "") {
                            document.getElementById('messageHeader').innerHTML = "Warning!";
                            document.getElementById('messageContent').innerHTML = "Please fill in empty fields.";
                            $("#alertMessage").modal();
                        } else {
                            $.ajax({
                                url: "manageMiscellaneous.jsp",
                                type: "post",
                                data: {
                                    action: 'update',
                                    itemCode: itemCode,
                                    itemName: itemName,
                                    buyPrice: buyPrice,
                                    sellPrice: sellPrice
                                },
                                timeout: 10000,
                                success: function(data) {
                                    var d = data.split("|");
                                    if (d[1] == '1') {
                                        $('#miscItem').load("tableMiscellaneous.jsp");
                                        $('#reload').load(location.href + " #getID");
                                        $('#itemName').val('');
                                        $('#buyPrice').val('');
                                        $('#sellPrice').val('');
                                        
                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = "Data updated successfully.";
                                        $("#alertMessage").modal();
                                     } else {
                                        document.getElementById('messageHeader').innerHTML = "Failed!";
                                        document.getElementById('messageContent').innerHTML = "Failed to update data.";
                                        $("#alertMessage").modal();
                                     }
                                },
                                error: function(err) {
                                }
                            });
                        }
                    });
                $('#delete').click(function(){
                    var itemCode = document.getElementById('itemCode').value;
                        $.ajax({
                            url: "manageMiscellaneous.jsp",
                            type: "post",
                            data: {
                                action: 'delete',
                                itemCode: itemCode
                            },
                            timeout: 10000,
                            success: function(data) {
                                var d = data.split("|");
                                if (d[1] == '1') {
                                    $('#miscItem').load("tableMiscellaneous.jsp");
                                    $('#reload').load(location.href + " #getID");
                                    $('#temName').val('');
                                    $('#buyPrice').val('');
                                    $('#sellPrice').val('');
                                    
                                    document.getElementById('messageHeader').innerHTML = "Success!";
                                    document.getElementById('messageContent').innerHTML = "Data deleted successfully.";
                                    $("#alertMessage").modal();
                                 } else {
                                    document.getElementById('messageHeader').innerHTML = "Failed!";
                                    document.getElementById('messageContent').innerHTML = d[2];
                                    $("#alertMessage").modal();
                                 }
                            },
                            error: function(err) {
                            }
                        });
                    });                    
                });
            </script>
    </body>
</html>
