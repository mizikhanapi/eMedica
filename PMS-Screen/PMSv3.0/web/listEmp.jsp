<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String pmiEMP = request.getParameter("PMINO");
    String empList = "select * from pms_employment where pmi_no = '" + pmiEMP + "'";
    ArrayList<ArrayList<String>> dataEmpList;
    dataEmpList = conn.getData(empList);


%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listEMP">
    <thead>
    <th>Employer Name</th>
    <th>Occupation</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>
    <%  for (int i = 0; i < dataEmpList.size(); i++) {
    String occuName = "select * from lookup_detail where master_ref_code = '0050' and detail_ref_code = '"+dataEmpList.get(i).get(4)+"'";
    ArrayList<ArrayList<String>> dataOcuuName;
    dataOcuuName = conn.getData(occuName);
    String occu="";
    if(dataOcuuName.size()== 0){
        occu = "-";
    }else{
        occu = dataOcuuName.get(0).get(2);
    }
    %>
<tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
    <td id="pmiNumber"><%=dataEmpList.get(i).get(3)%></td>
    <input id="empval" type="hidden" value="<%=StringUtils.join(dataEmpList.get(i),"|")%>">
    <td><%=occu%></td>
    <td><button id="EMPedit" name="EMPedit" class="btn btn-default" data-toggle="modal" data-target="#EMPModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
    <td><button id="EMPdel" name="EMPdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>
</tbody>
</table>
