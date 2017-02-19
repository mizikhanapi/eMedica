<%-- 
    Document   : maintainQueueList
    Created on : Feb 7, 2017, 7:34:01 PM
    Author     : shay
--%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h4>Maintain Queue List
    <span class="pull-right">
        <a alt="Add Items" id="Lplus" data-placement="top" data-toggle="modal" data-target="#list"><i class=" fa fa-plus" style=" padding-right: 5px;"></i></a>
    </span>
</h4>
<div id="QLdiv">
    <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; "id="QLtable">
    <thead>
    <th>Queue Name</th>
    <th>Staff Name</th>
    <th>Status</th>
    <th>Created By</th>
    <th>Created Date</th>
    <th>Health Facility</th>
    <th>Discipline</th>
    <th>Sub-Discipline</th>
    <th>Start Date</th>
    <th>End Date</th>    
</thead>
</table>
</div>

<script>
    $(document).ready(function(){
        var hfc = '<%=hfc %>';
       $.ajax({
           type: "post",
           url: "listQueueList.jsp",
           data : {hfc : hfc},
           timeout: 3000,
           success: function (returnHtml) {
               //console.log(returnHtml);
               $('#QLdiv').html(returnHtml);
                        
                    },error: function (jqXHR, textStatus, errorThrown) {
                        
                        console.log("ERROR: "+errorThrown);
                    }
       }); 
    });
    
        $('#QLdiv').on('click','#QLtable tr',function(){
        $('#QLStaff option:not(:selected)').prop('disabled', false);
        $('#QLName option:not(:selected)').prop('disabled', false);
        $('#Lform')[0].reset();
        var row = $(this).closest('tr');
        var rowname = row.find("#Ltype").text()+"|"+row.find("#Lname").text();
        var rowStaff = row.find("#LuserID").text();
        var rowStat = row.find("#Lstat").text();
        var rowStart = row.find("#Lstart").text();
        var rowEnd = row.find("#Lend").text();

          $('#QLName').val(rowname);
          $('#QLStaff').val(rowStaff);
          
          $('#QLStaff option:not(:selected)').prop('disabled', true);
          
          $('#startDate').val(rowStart);
          $('#endDate').val(rowEnd);
          $('#QLStatus').val(rowStat);
    });
    
    $('#Lplus').on('click',function(){
        $('#QLStaff option:not(:selected)').prop('disabled', false);
        $('#QLName option:not(:selected)').prop('disabled', false);
        $('#Lform')[0].reset();
    });
</script>

