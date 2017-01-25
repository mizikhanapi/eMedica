<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pmiKIN = request.getParameter("KINpmino");
    String kinList = "select * from pms_nextofkin where pmi_no = '" + pmiKIN + "'";
    ArrayList<ArrayList<String>> dataKinList;
    dataKinList = Conn.getData(kinList);


%><table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listEMP">
    <thead>
    <th>Name</th>
    <th>IC. No.</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

</tbody>
</table>
<%  for (int i = 0; i < dataKinList.size(); i++) {%>
<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
    <td id="pmiNumber"><%=dataKinList.get(i).get(3)%></td>
<input id="kinval" type="hidden" value="<%=String.join("|", dataKinList.get(i))%>">
<td><%=dataKinList.get(i).get(4)%></td>
<td><button id="KINedit" name="KINedit" class="btn btn-default"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
<td><button id="KINdel" name="KINdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>