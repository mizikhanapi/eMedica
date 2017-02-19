<%--
    Document   : tableMiscellaneous
    Created on : Jan 11, 2017, 2:18:51 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table id="tableMisc" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Item Code</th>
        <th>Name</th>
        <th>Buying Price (RM)</th>
        <th>Selling Price (RM)</th>
    </thead>
    <tbody>
        <%
            DecimalFormat df = new DecimalFormat("0.00");
            String query2 = "SELECT * FROM far_miscellaneous_item";
            ArrayList<ArrayList<String>> data2 = Conn.getData(query2);
            if (!data2.isEmpty()){
                for (int i = 0; i< data2.size(); i++){
        %>
        <tr>
            <td><%=data2.get(i).get(1)%></td>
            <td><%=data2.get(i).get(2)%></td>
            <td><%=df.format(Double.parseDouble(data2.get(i).get(3)))%></td>
            <td><%=df.format(Double.parseDouble(data2.get(i).get(4)))%></td>
        </tr>
        <%}}%>
    </tbody>
</table>
<script>
    $("#tableMisc tbody tr").on('click', function(){
        $(this).addClass('selected').siblings().removeClass('selected');
        document.getElementById('itemCode').value = $(this).find('td:first').html();
        document.getElementById('itemName').value = $(this).find('td:nth-child(2)').html();
        document.getElementById('buyPrice').value = $(this).find('td:nth-child(3)').html();
        document.getElementById('sellPrice').value = $(this).find('td:nth-child(4)').html();

        $('#add').prop('disabled', true);
        $('#update').prop('disabled', false);
        $('#delete').prop('disabled', false);
    });
</script>
