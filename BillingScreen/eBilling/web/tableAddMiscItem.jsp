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
<table id="tableMisc" class="table table-filter" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Item Code</th>
        <th>Item Name</th>
        <th style="text-align: right;">Price (RM)</th>
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
            <td style="text-align: right;"><%=df.format(Double.parseDouble(data2.get(i).get(3)))%></td>
        </tr>
        <%}}%>
    </tbody>
</table>
<script type="text/javascript">
    $(document).ready(function(){
        $("#tableMisc tbody tr").click(function(){
            $('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        });
    });
</script>
