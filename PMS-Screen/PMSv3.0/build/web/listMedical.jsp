<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String pmiMED = request.getParameter("PMINO");
    String medList = "SELECT * FROM PMS_MEDICAL_INSURANCE where pmi_no = '" + pmiMED + "'";
    ArrayList<ArrayList<String>> dataMedList;
    dataMedList = conn.getData(medList);


%><table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listMED">
    <thead>
    <th>Insurance Company</th>
                <th>Policy No.</th>
                <th>Update</th>
                <th>Delete</th>
</thead>
<tbody>
    <%  for (int i = 0; i < dataMedList.size(); i++) {
    
    String insName = "select * from lookup_detail where master_ref_code = '0083' and detail_ref_code = '"+dataMedList.get(i).get(1)+"'";
    ArrayList<ArrayList<String>> dataInsName;
    dataInsName = conn.getData(insName);
    String ins="";
    if(dataInsName.size()== 0){
        ins = "-";
    }else{
        ins = dataInsName.get(0).get(2);
    }%>
    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
        <td id="pmiNumber"><%=ins%></td>
<input id="medval" type="hidden" value="<%=StringUtils.join( dataMedList.get(i),"|")%>">
<td><%=dataMedList.get(i).get(2)%></td>
<td><button id="MEDedit" name="MEDedit" class="btn btn-default" data-toggle="modal" data-target="#MEDModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
<td><button id="MEDdel" name="MEDdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>
</tbody>
</table>
