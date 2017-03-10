<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String sqlFacilityType = "SELECT ward_class_code,ward_class_name,ward_class_status FROM wis_ward_class";
    ArrayList<ArrayList<String>> dataFacilityType = conn.getData(sqlFacilityType);
%><table id="facilityTypeTable"  class="table table-striped table-bordered" cellspacing="0" width="100">


    <thead>


    <th>Ward Class</th>
    <th>Ward Class ID</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>


    <%
        if (dataFacilityType.size() > 0) {
            for (int i = 0; i < dataFacilityType.size(); i++) {%>
                <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
                <tr>
                <td><%=dataFacilityType.get(i).get(0)%></td>
                <td><%=dataFacilityType.get(i).get(1)%></td>
                <td><%=dataFacilityType.get(i).get(2)%></td>
                <td><button id="FAMedit" name="FAMedit" class="btn btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
                <td><button id="FAMdel" name="FAMdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
                </tr>
    <%  } }

    %>
</tbody>



