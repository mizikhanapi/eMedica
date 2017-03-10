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
    String pmiKIN = request.getParameter("PMINO");
    String kinList = "select * from pms_nextofkin where pmi_no = '" + pmiKIN + "'";
    ArrayList<ArrayList<String>> dataKinList;
    dataKinList = conn.getData(kinList);


%><table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listKIN">
    <thead>
    <th>Name</th>
    <th>IC/ID No.</th>
    <th>Date Of Birth</th>
    <th>Relationship</th>
    <th>Occupation</th>                    
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>
    <%  for (int i = 0; i < dataKinList.size(); i++) {
    String occuName = "select * from lookup_detail where master_ref_code = '0050' and detail_ref_code = '"+dataKinList.get(i).get(9)+"'";
    ArrayList<ArrayList<String>> dataOcuuName;
    dataOcuuName = conn.getData(occuName);
    String occu="";
    if(dataOcuuName.size()== 0){
        occu = "-";
    }else{
        occu = dataOcuuName.get(0).get(2);
    }
    
    String relayName = "select * from lookup_detail where master_ref_code = '0007' and detail_ref_code = '"+dataKinList.get(i).get(2)+"'";
    ArrayList<ArrayList<String>> dataRelayName;
    dataRelayName = conn.getData(relayName);
    String relay="";
    if(dataRelayName.size()== 0){
        relay = "-";
    }else{
        relay = dataRelayName.get(0).get(2);
    }
    %>
    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
        <td id="pmiNumber"><%=dataKinList.get(i).get(3)%></td>
<input id="kinval" type="hidden" value="<%=StringUtils.join( dataKinList.get(i),"|")%>">
<td><%=dataKinList.get(i).get(4)%></td>
<td><%=dataKinList.get(i).get(8)%></td>
<td><%=relay%></td>
<td><%=occu %></td>
<td><button id="KINedit" name="KINedit" class="btn btn-default" data-toggle="modal" data-target="#KINModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
<td><button id="KINdel" name="KINdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>
</tbody>
</table>
