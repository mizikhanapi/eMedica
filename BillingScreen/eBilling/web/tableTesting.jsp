<%-- 
    Document   : tableParameter
    Created on : Jan 9, 2017, 1:49:45 AM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table id="tablePara" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Code</th>
        <th>Name</th>
        <th>Value</th>
        <th>Enable</th>
    </thead>
    <tbody>
        <%
            DecimalFormat df = new DecimalFormat("0.00");
            String query2 = "SELECT * FROM far_billing_parameter";
            ArrayList<ArrayList<String>> data2 = Conn.getData(query2);
            if (!data2.isEmpty()){
                for (int i = 0; i< data2.size(); i++){
        %>
        <tr>
            <td><%=data2.get(i).get(0)%></td>
            <td><%=data2.get(i).get(1)%></td>
            <td><%=df.format(Double.parseDouble(data2.get(i).get(2)))%></td>
            <td><%=data2.get(i).get(5)%></td>
        </tr>
        <%}}%>
    </tbody>
</table>
    <script>
                $("#tablePara tbody tr").on('click', function(){
                    $(this).addClass('selected').siblings().removeClass('selected');    
                    document.getElementById('paraCode').value = $(this).find('td:first').html();
                    document.getElementById('paraName').value = $(this).find('td:nth-child(2)').html();
                    document.getElementById('value').value = $(this).find('td:nth-child(3)').html();
                    var status = $(this).find('td:nth-child(4)').html();

                    if (status === "yes"){
                        $('#enable').prop('value', 'Y');
                        $('a[data-toggle="enable"]').not('[data-title="Y"]').removeClass('active').addClass('notActive');
                        $('a[data-toggle="enable"][data-title="Y"]').removeClass('notActive').addClass('active');
                    } else if (status === "no") {
                        $('#enable').prop('value', 'N');
                        $('a[data-toggle="enable"]').not('[data-title="N"]').removeClass('active').addClass('notActive');
                        $('a[data-toggle="enable"][data-title="N"]').removeClass('notActive').addClass('active');
                    }
                    $('#add').prop('disabled', true);
                    $('#update').prop('disabled', false);
                    $('#delete').prop('disabled', false);
                });
    </script>