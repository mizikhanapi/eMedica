<%-- 
    Document   : tableAddDrugsItem
    Created on : Feb 13, 2017, 8:55:01 PM
    Author     : Mike Ho
--%>

<%@page import="dbConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table id="tableDrugsItem" class="table table-filter" style="background: #fff; border: 1px solid #ccc; border-top: none;">
    <thead>
        <th>Item Code</th>
        <th>Name</th>
        <th>Item Description</th>
        <th>Price (RM)</th>
    </thead>
    <tbody>
        <%
            DecimalFormat df = new DecimalFormat("0.00");
            String sql = "SELECT ud_mdc_code, d_trade_name, d_caution_code, d_sell_price "
                    + "FROM pis_mdc2";
            ArrayList<ArrayList<String>> data = Conn.getData(sql);
            if (!data.isEmpty()){
                for (int i = 0; i< data.size(); i++){
        %>
        <tr>
            <td><%=data.get(i).get(0)%></td>
            <td><%=data.get(i).get(1)%></td>
            <td><%=data.get(i).get(2)%></td>
            <td style="text-align: right;"><%=df.format(Double.parseDouble(data.get(i).get(3)))%></td>
        </tr>
        <%}}%>
    </tbody>
</table>
<script type="text/javascript">    
    $(document).ready(function(){
        $("#tableDrugsItem tbody tr").click(function(){
            $('tr.row_selected').removeClass('row_selected');
            $(this).addClass('row_selected');
        });
    });
</script>
