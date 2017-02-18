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
            <%@include file = "includes/topMenu.html" %>
            <div class="row">
                <div class="col-lg-2">
                    <div id="cssmenu">
                        <ul>
                            <li><a href="index.jsp"><span>Billing</span></a></li>
                            <li><a href="bill.jsp"><span>Manage Bill</span></a></li>
                            <li class="active"><a href="miscellaneous.jsp"><span>Miscellaneous</span></a></li>
                            <li><a href="parameter.jsp"><span>Bill Parameter</span></a></li>
                            <li><a href="report.jsp"><span>Report</span></a></li>
                            <li><a href="closing.jsp"><span>Closing</span></a></li>
                        </ul>
                    </div>
                </div>
                <!--body-->
                <div class="col-lg-10">
                    <div class="thumbnail">
                        <div style="margin-bottom: 250px">
                            <h4>Miscellaneous Item</h4>
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
                                    <button id="add" class="btn btn-success">Add</button>
                                    <button id="update" class="btn btn-success" disabled="true">Update</button>
                                    <button id="delete" class="btn btn-danger" disabled="true">Delete</button>
                                </div>
                            </div>
                        </div>
                        <div id="custom-search-input">
                            <div class="input-group ">
                                <input id="search" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchItem()"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-success pull-right">Search</button>
                                </span>
                            </div>
                        </div>
                        <div id="miscItem" ></div>
                    </div>
                </div>
            </div>
        </div>

        <!--js-->
        <script src="assets/js/dateformat.js" type="text/javascript"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>

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
                
                $('#add').click(function(){
                    var itemCode = document.getElementById('itemCode').value;
                    var itemName = document.getElementById('itemName').value;
                    var buyPrice = document.getElementById('buyPrice').value;
                    var sellPrice = document.getElementById('sellPrice').value;
                    
                        if (itemName === "" || buyPrice === "" || sellPrice === "") {
                            alert("Please fill in empty fields."); 
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
                                     } else {
                                         alert(data);
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
                            alert("Please fill in empty fields."); 
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
                                        $('#temName').val('');
                                        $('#buyPrice').val('');
                                        $('#sellPrice').val('');
                                     } else {
                                         alert(data);
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
                                 } else {
                                     alert(data);
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
