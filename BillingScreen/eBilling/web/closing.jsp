<%-- 
    Document   : closing
    Created on : Dec 24, 2016, 6:17:59 PM
    Author     : Mike Ho
--%>

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
                            <div id="message"></div>
                            <div id="reportDetails" class="thumbnail">
                                <div style="margin-bottom: 250px">
                                    <h4>Year End Processing</h4>

                                    <div class="col-lg-10" style="margin-bottom: 20px">
                                        <div id="backup" class="progress">
                                            <div id="backupPB" class="progress-bar">
                                                <div id="percentBackup"></div>
                                            </div>
                                        </div>
                                        <button id="btnBackup" type="submit" class="btn btn-info" >Backup Customer Data</button><br>
                                    </div>

                                    <div class="col-lg-10" style="margin-bottom: 20px">
                                        <div id="process" class="progress">
                                            <div id="processPB" class="progress-bar">
                                                <div id="percentProcess"></div>
                                            </div>
                                        </div>
                                        <button id="btnProcess" type="submit" class="btn btn-info" disabled="true">Start Year End Processing</button><br>
                                    </div>

                                    <div class="col-lg-10" style="margin-bottom: 20px">
                                        <div id="restore" class="progress">
                                            <div id="restorePB" class="progress-bar">
                                                <div id="percentRestore"></div>
                                            </div>
                                        </div>
                                        <button id="btnRestore" type="submit" class="btn btn-info" disabled="true">Restore Customer Data</button><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
        <%@include file = "includes/message.html" %>    
        <!--js--> 
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#btnBackup').click(function(){
                    var date = new Date();
                    var month = date.getMonth() + 1;
                    if (month.length !== 2){          
                        month = "0" + month;;
                    }
                    $(this).prop('disabled', true);
                    
                    $.ajax({
                        url: "yearEndProcess.jsp",
                        type: "post",
                        data: {
                            action: 'backup'
                        },
                        timeout: 10000,
                        success: function(data) {
                            var d = data.split("|");
                            if (d[1] == '1') {
                                var elem = document.getElementById('backupPB'); 
                                var width = 0;
                                var id = setInterval(frame, 100);
                                var status = d[3];
                                
                                function frame() {
                                    if (width >= status) {
                                        clearInterval(id);
                                        
                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = d[2];
                                        $("#alertMessage").modal();
                                        
                                        if(month == "11" || month == "12" || month == "01"){
                                            $('#btnProcess').prop('disabled', false);
                                        }
                                    } else {
                                        width++; 
                                        elem.style.width = width + '%'; 
                                        document.getElementById('percentBackup').innerHTML = width * 1 + '%';
                                    }
                                }
                             } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                             }
                        },
                        error: function(err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Failed to backup customer data.\nPlease try again.";
                            $("#alertMessage").modal();
                        }
                    });
                });
                
                $('#btnProcess').click(function(){
                    $(this).prop('disabled', true);
                    
                    $.ajax({
                        url: "yearEndProcess.jsp",
                        type: "post",
                        data: {
                            action: 'progress',
                            year: new Date().getFullYear()
                        },
                        timeout: 10000,
                        success: function(data) {
                            var d = data.split("|");
                            if (d[1] == '1') {
                                var elem = document.getElementById('progressPB'); 
                                var width = 0;
                                var id = setInterval(frame, 100);
                                var status = d[3];
                                
                                function frame() {
                                    if (width >= status) {
                                        clearInterval(id);
                                        
                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = d[2];
                                        $("#alertMessage").modal();
                                        
                                    } else {
                                        width++; 
                                        elem.style.width = width + '%'; 
                                        document.getElementById('percentProgress').innerHTML = width * 1 + '%';
                                    }
                                }
                             } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                                $('#btnRestore').prop('disabled', false);
                             }
                        },
                        error: function(err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Processing failed.";
                            $("#alertMessage").modal();
                        }
                    });
                });      
                
                $('#btnRestore').click(function(){
                    $.ajax({
                        url: "yearEndProcess.jsp",
                        type: "post",
                        data: {
                            action: 'restore'
                        },
                        timeout: 10000,
                        success: function(data) {
                            var d = data.split("|");
                            if (d[1] == '1') {
                                var elem = document.getElementById('restorePB'); 
                                var width = 0;
                                var id = setInterval(frame, 100);
                                var status = d[3];
                                
                                function frame() {
                                    if (width >= status) {
                                        clearInterval(id);
                                        
                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = d[2];
                                        $("#alertMessage").modal();
                                        
                                        $('#btnProcess').prop('disabled', false);
                                    } else {
                                        width++; 
                                        elem.style.width = width + '%'; 
                                        document.getElementById('percentRestore').innerHTML = width * 1 + '%';
                                    }
                                }
                             } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                             }
                        },
                        error: function(err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Restore failed.\nPlease try again.";
                            $("#alertMessage").modal();
                        }
                    });
                });
            });
        </script>
    </body>
</html>