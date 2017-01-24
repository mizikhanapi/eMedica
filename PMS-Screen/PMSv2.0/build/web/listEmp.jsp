<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pmiEMP = request.getParameter("EMPpmino");
    String empList = "select * from pms_employment where pmi_no = '" + pmiEMP + "'";
    ArrayList<ArrayList<String>> dataEmpList;
    dataEmpList = Conn.getData(empList);


%><table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listEMP">
    <thead>
    <th>Employer Name</th>
    <th>Occupation</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

</tbody>
</table>
<%  for (int i = 0; i < dataEmpList.size(); i++) {%>
<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
    <td id="pmiNumber"><%=dataEmpList.get(i).get(3)%></td>
    <input id="empval" type="hidden" value="<%=String.join("|", dataEmpList.get(i))%>">
    <td><%=dataEmpList.get(i).get(4)%></td>
    <td><button id="EMPedit" name="EMPedit" class="btn btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
    <td><button id="EMPdel" name="EMPdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>