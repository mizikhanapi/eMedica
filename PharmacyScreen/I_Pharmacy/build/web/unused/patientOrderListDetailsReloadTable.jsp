<%-- 
    Document   : patientOrderListDetailsReloadTable
    Created on : Feb 10, 2017, 2:58:31 PM
    Author     : Shammugam
--%>


<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");
    String orderProductCode = request.getParameter("orderProductCode");
    NumberFormat formatter = new DecimalFormat("#0.00");

    String orderList = "select ORDER_NO,DRUG_ITEM_CODE,DRUG_ITEM_DESC,DRUG_FREQUENCY,DRUG_ROUTE,DRUG_FORM,DRUG_STRENGTH,"
            + "DRUG_DOSAGE,ORDER_OUM,DURATION,ORDER_STATUS,QTY_ORDERED,QTY_SUPPLIED,SUPPLIED_OUM,QTY_DISPENSED,"
            + "DISPENSE_OUM,pis_order_detail.STATUS,DURATIONT,D_STOCK_QTY,D_SELL_PRICE,"
            + "CASE DURATIONT WHEN 'Day' THEN '1' WHEN 'Week' THEN '7' WHEN 'Month' THEN '31' WHEN 'Year' THEN '365' ELSE '0' END  AS DURATIONTCON"
            + " FROM pis_order_detail "
            + "JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE) "
            + "where ORDER_NO = '" + orderNo + "' and DRUG_ITEM_CODE != '" + orderProductCode + "' ";

    ArrayList<ArrayList<String>> dataOrderListReload;
    dataOrderListReload = conn.getData(orderList);

%>

<table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc;width: 100%" id="patientOrderDetailsListDispenseTable">
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
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderListReload.size(); i++) {

    %>
    <tr id="updateDispenseDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
<input id="dataPatientOrderDetailsListDispensehidden" type="hidden" value="<%=String.join("|", dataOrderListReload.get(i))%>">
<td ><%=dataOrderListReload.get(i).get(0)%></td>
<td ><%=dataOrderListReload.get(i).get(1)%></td>
<td ><%=dataOrderListReload.get(i).get(2)%></td>
<td ><%=dataOrderListReload.get(i).get(6)%></td>
<td ><%=dataOrderListReload.get(i).get(3)%></td>
<td ><%=dataOrderListReload.get(i).get(9)%></td>
<td ><%=dataOrderListReload.get(i).get(17)%></td>
<td ><%=dataOrderListReload.get(i).get(7)%></td>
<td ><%=dataOrderListReload.get(i).get(11)%></td>
<td ><%=dataOrderListReload.get(i).get(18)%></td>
<td ><%=dataOrderListReload.get(i).get(14)%></td>
<td ><%=dataOrderListReload.get(i).get(19)%></td>
<td ><%= formatter.format(Double.parseDouble(dataOrderListReload.get(i).get(11)) * Double.parseDouble(dataOrderListReload.get(i).get(19)))%></td>
<td ><%=dataOrderListReload.get(i).get(16)%></td>
</tr>
<%  }
%>
</tbody>
</table>