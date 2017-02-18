<%--
    Document   : parameter
    Created on : Dec 24, 2016, 6:18:20 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
                            <li><a href="manage.jsp"><span>Manage Bill</span></a></li>
                            <li><a href="miscellaneous.jsp"><span>Miscellaneous</span></a></li>
                            <li class="active"><a href="parameter.jsp"><span>Bill Parameter</span></a></li>
                            <li><a href="report.jsp"><span>Report</span></a></li>
                            <li><a href="closing.jsp"><span>Closing</span></a></li>
                        </ul>
                    </div>
                </div>

                <!--body-->
                <div class="col-lg-10">
                    <div class="thumbnail">
                        <div style="margin-bottom: 250px">
                            <h4>Bill Parameter</h4>
                            <div class="form-group">
                                <div id="reload">
                                    <div id="getID">
                                        <%
                                            String query1 ="SELECT MAX(param_code) FROM far_billing_parameter";
                                            ArrayList<ArrayList<String>> data = Conn.getData(query1);
                                            String itemCode = data.get(0).get(0);
                                            itemCode = itemCode.replaceAll("[^0-9]", "");
                                            itemCode = String.valueOf(Integer.parseInt(itemCode)+1);

                                            String code = "BP";
                                            for (int i = 0 ; itemCode.length() < 3 ; i++){
                                                itemCode = "0" + itemCode;
                                            }
                                            code = code + itemCode;
                                        %>
                                        <label class="col-lg-2">Item Code</label>
                                        <div class="col-lg-10" style="margin-bottom: 10px">
                                            <input type="text" class="form-control" name="paraCode" id="paraCode" value="<%=code%>" readonly="true">
                                        </div>
                                    </div>
                                </div>
                                <label class="col-lg-2">Item Name</label>
                                <div class="col-lg-10" style="margin-bottom: 10px">
                                  <input type="text" class="form-control" name="paraName" id="paraName">
                                </div>
                                <label class="col-lg-2">Value</label>
                                <div class="col-lg-10" style="margin-bottom: 10px">
                                  <input type="text" class="form-control" name="value" id="value">
                                </div>
                                <label class="col-lg-2">Enabled</label>
                                <div class="col-sm-7 col-md-7" style="margin-bottom: 10px">
                                        <div class="input-group">
                                                <div id="rbEnable" class="btn-group">
                                                        <a class="btn btn-primary btn-sm active" data-toggle="enable" data-title="Y">YES</a>
                                                        <a class="btn btn-primary btn-sm" data-toggle="enable" data-title="N">NO</a>
                                                </div>
                                                <input type="hidden" name="happy" id="enable">
                                        </div>
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
                        <div id="billPara"></div>
                    </div>
                </div>
            </div>
        </div>

        <!--js-->
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>

        <script type="text/javascript">
            function searchItem() {
                // Declare variables
                var input, filter, table, tr, td, i;
                input = document.getElementById("search");
                filter = input.value.toUpperCase();
                table = document.getElementById("billPara");
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
                $('#billPara').load("tableParameter.jsp");

                $('#rbEnable a').on('click', function(){
                    var sel = $(this).data('title');
                    var tog = $(this).data('toggle');
                    $('#'+tog).prop('value', sel);

                    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
                    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
                });
                $('#add').click(function(){
                    var paraCode = document.getElementById('paraCode').value;
                    var paraName = document.getElementById('paraName').value;
                    var value = document.getElementById('value').value;
                    var enable = $('#rbEnable a.active').html();
                    enable = String(enable).toLowerCase();

                        if (paraName === "" || value === "") {
                            alert("Please fill in empty fields.");
                        } else {
                            $.ajax({
                                url: "manageParameter.jsp",
                                type: "post",
                                data: {
                                    action: 'add',
                                    paraCode: paraCode,
                                    paraName: paraName,
                                    value: value,
                                    enable: enable
                                },
                                timeout: 10000,
                                success: function(data) {
                                    var d = data.split("|");
                                    if (d[1] == '1') {
                                        $('#billPara').load("tableParameter.jsp");
                                        $('#reload').load(location.href + " #getID");
                                        $('#paraName').val('');
                                        $('#value').val('');
                                        $('#enable').prop('value', 'Y');
                                        $('a[data-toggle="enable"]').not('[data-title="Y"]').removeClass('active').addClass('notActive');
                                        $('a[data-toggle="enable"][data-title="Y"]').removeClass('notActive').addClass('active');
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
                    var paraCode = document.getElementById('paraCode').value;
                    var paraName = document.getElementById('paraName').value;
                    var value = document.getElementById('value').value;
                    var enable = $('#rbEnable a.active').html();
                    enable = String(enable).toLowerCase();

                        if (paraName === "" || value === "") {
                            alert("Please fill in empty fields.");
                        } else {
                            $.ajax({
                                url: "manageParameter.jsp",
                                type: "post",
                                data: {
                                    action: 'update',
                                    paraCode: paraCode,
                                    paraName: paraName,
                                    value: value,
                                    enable: enable
                                },
                                timeout: 10000,
                                success: function(data) {
                                    var d = data.split("|");
                                    if (d[1] == '1') {
                                        $('#billPara').load("tableParameter.jsp");
                                        $('#reload').load(location.href + " #getID");
                                        $('#paraName').val('');
                                        $('#value').val('');
                                        $('#enable').prop('value', 'Y');
                                        $('a[data-toggle="enable"]').not('[data-title="Y"]').removeClass('active').addClass('notActive');
                                        $('a[data-toggle="enable"][data-title="Y"]').removeClass('notActive').addClass('active');
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
                    var paraCode = document.getElementById('paraCode').value;
                        $.ajax({
                            url: "manageParameter.jsp",
                            type: "post",
                            data: {
                                action: 'delete',
                                paraCode: paraCode
                            },
                            timeout: 10000,
                            success: function(data) {
                                var d = data.split("|");
                                if (d[1] == '1') {
                                    $('#billPara').load("tableParameter.jsp");
                                 } else {
                                     alert(d[1]);
                                 }
                                $('#reload').load(location.href + " #getID");
                                $('#paraName').val('');
                                $('#value').val('');
                                $('#enable').prop('value', 'Y');
                                $('a[data-toggle="enable"]').not('[data-title="Y"]').removeClass('active').addClass('notActive');
                                $('a[data-toggle="enable"][data-title="Y"]').removeClass('notActive').addClass('active');
                            },
                            error: function(err) {
                            }
                        });
                    });
                });
        </script>
    </body>
</html>
