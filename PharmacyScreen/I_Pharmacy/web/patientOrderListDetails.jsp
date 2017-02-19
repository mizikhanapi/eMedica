<%-- 
    Document   : patientOrderListDetails
    Created on : Feb 8, 2017, 9:32:50 AM
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
            + "DISPENSE_OUM,pis_order_detail.STATUS,DURATIONT,D_STOCK_QTY,D_SELL_PRICE"
            + " FROM pis_order_detail "
            + "JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE) "
            + "where ORDER_NO = '" + orderNo + "' AND pis_order_detail.STATUS = '0' AND pis_order_detail.QTY_ORDERED != pis_order_detail.QTY_DISPENSED ";
    
    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);

%>

<table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100% " id="patientOrderDetailsListTable">
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
    <th>Stock Qty</th>
    <th>Dispense Qty</th>
    <th>Price/Pack</th>
    <th>Total Price</th>
    <th>Status</th>
    <th>Action</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

    %>
    <tr id="moveToOrderDispenseDetailsTButton-test" data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
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
<td ><%=dataOrderList.get(i).get(18)%></td>
<td ><%=dataOrderList.get(i).get(14)%></td>
<td ><%=dataOrderList.get(i).get(19)%></td>
<td ><%= formatter.format(Double.parseDouble(dataOrderList.get(i).get(11)) * Double.parseDouble(dataOrderList.get(i).get(19))) %></td>
<td ><%=dataOrderList.get(i).get(16)%></td>
<td ></td>
</tr>
<%  }
%>
</tbody>
</table>