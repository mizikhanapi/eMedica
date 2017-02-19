<%-- 
    Document   : patientOrderListDetailsNew
    Created on : Feb 15, 2017, 1:13:37 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");

    NumberFormat formatter = new DecimalFormat("#0.00");

    String orderList = "select ORDER_NO,DRUG_ITEM_CODE,DRUG_ITEM_DESC,DRUG_FREQUENCY,DRUG_ROUTE,DRUG_FORM,DRUG_STRENGTH,"
            + "DRUG_DOSAGE,ORDER_OUM,DURATION,ORDER_STATUS,QTY_ORDERED,QTY_SUPPLIED,SUPPLIED_OUM,QTY_DISPENSED,"
            + "DISPENSE_OUM,pis_order_detail.STATUS,DURATIONT,D_STOCK_QTY,D_SELL_PRICE,ORDER_STATUS,"
            + "CASE ORDER_STATUS WHEN '0' THEN 'New' WHEN '1' THEN 'Partial' WHEN '2' THEN 'Partial Complete' WHEN '3' THEN 'Full Complete' WHEN '4' THEN 'FULL' END  AS ORDER_STATUSCON"
            + " FROM pis_order_detail "
            + "JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE) "
            + "where ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS='0' OR ORDER_STATUS='1') ";

    String orderTotal = "select COUNT(ORDER_NO),SUM((D_SELL_PRICE * QTY_ORDERED)) from pis_order_detail "
            + "join pis_mdc2 on (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE) "
            + "where ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS='0' OR ORDER_STATUS='1') ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);

    ArrayList<ArrayList<String>> dataOrderTotal;
    dataOrderTotal = conn.getData(orderTotal);

%>

<table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100% " id="patientOrderDetailsListTable">
    <input id="dataPatientOrderDetailsListhiddenArray" type="hidden" value="<%= dataOrderList%>">
    <thead>
    <th>Order No</th>
    <th>Code</th>
    <th>Description</th>
    <th>Strength</th>
    <th>Frequency</th>
    <th>Duration</th>
    <th>Duration Type</th>
    <th>Dose</th>
    <th>Ordered Qty</th>
    <th>Supplied Qty</th>
    <th>Stock Qty</th>
    <th>Price/Pack</th>
    <th>Total Price</th>
    <th>Status</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

    %>
    <tr id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder">
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<td ><%=dataOrderList.get(i).get(0)%></td>
<td ><%=dataOrderList.get(i).get(1)%></td>
<td ><%=dataOrderList.get(i).get(2)%></td>
<td ><%=dataOrderList.get(i).get(6)%></td>
<td ><%=dataOrderList.get(i).get(3)%></td>
<td ><%=dataOrderList.get(i).get(9)%></td>
<td ><%=dataOrderList.get(i).get(17)%></td>
<td ><%=dataOrderList.get(i).get(7)%></td>
<td ><%=dataOrderList.get(i).get(11)%></td>
<td ><%=dataOrderList.get(i).get(12)%></td>
<td ><%=dataOrderList.get(i).get(18)%></td>
<td ><%=dataOrderList.get(i).get(19)%></td>
<td ><%= formatter.format(Double.parseDouble(dataOrderList.get(i).get(11)) * Double.parseDouble(dataOrderList.get(i).get(19)))%></td>
<td ><%=dataOrderList.get(i).get(21)%></td>
</tr>
<%  }
%>


    <%        for (int i = 0; i < dataOrderTotal.size(); i++) {

    %>
    <tr>

<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td ></td>
<td >TOTAL ORDER</td>
<td ><%=dataOrderTotal.get(i).get(0)%></td>
<td >TOTAL PRICE</td>
<td ><%= formatter.format(Double.parseDouble(dataOrderTotal.get(i).get(1))) %></td>
</tr>
<%  }
%>


</tbody>
</table>