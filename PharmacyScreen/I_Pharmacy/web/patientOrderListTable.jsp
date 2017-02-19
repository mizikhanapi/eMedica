<%-- 
    Document   : patientOrderListTable
    Created on : Feb 7, 2017, 12:19:40 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<h4 style="padding-top: 2%;padding-bottom: 1%;">Patient Information</h4>

<table  id="patientOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th>Order No.</th>
    <th>PMI No.</th>
    <th>Name</th>
    <th>Order Date</th>
    <th>Health Facility Code</th>
    <th>Doctor's Name</th>
</thead>
<tbody>

    <%
        String sql = "SELECT ORDER_NO,PMI_NO,HEALTH_FACILITY_CODE,EPISODE_CODE,ENCOUNTER_DATE,ORDER_DATE,ORDER_BY,"
                + "ORDER_FROM,ORDER_TO,HFC_FROM,HFC_TO,SPUB_NO,KEYIN_BY,TOTAL_ORDER,STATUS,PATIENT_NAME,NEW_IC_NO,BIRTH_DATE,"
                + "SEX_CODE,BLOOD_TYPE,ORDER_STATUS FROM pis_order_master JOIN pms_patient_biodata USING (PMI_NO) WHERE ORDER_STATUS = '0';";

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToOrderDetailsTButton">
<input id="dataPatientOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
<td><%= dataPatientOrderList.get(i).get(0)%></td>
<td><%= dataPatientOrderList.get(i).get(1)%></td>
<td><%= dataPatientOrderList.get(i).get(15)%></td>
<td><%= dataPatientOrderList.get(i).get(5)%></td>
<td><%= dataPatientOrderList.get(i).get(2)%></td>
<td><%= dataPatientOrderList.get(i).get(6)%></td>
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#patientOrderListTable').DataTable();
    });
</script>

