<%-- 
    Document   : listQueueType
    Created on : Feb 8, 2017, 11:09:35 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String hfcL = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disL = session.getAttribute("DISCIPLINE_CODE").toString();

    String sql = "select t.queue_type,t.queue_type_name,t.status,t.created_by,t.created_date,t.hfc_cd,d.discipline_name,s.subdiscipline_name,h.hfc_name from pms_queue_type t inner join adm_health_facility h on h.hfc_cd = t.hfc_cd inner join adm_hfc_discipline a on a.discipline_cd = t.discipline_code and a.subdiscipline_cd = t.subdiscipline_code and a.hfc_cd = t.hfc_cd inner join adm_discipline d on d.discipline_cd = a.discipline_cd LEFT OUTER JOIN adm_subdiscipline s on s.subdiscipline_cd = a.subdiscipline_cd and s.discipline_cd = a.discipline_cd where t.hfc_cd = '"+hfcL+"' and t.discipline_code='"+disL+"';";
    ArrayList<ArrayList<String>> dataQT;
    dataQT = conn.getData(sql);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="QTtable">
        <thead>
        <th>Queue Type Code</th>
        <th>Description</th>
        <th>Status</th>
        <th>Modify by</th>
        <th>Modify date</th>
        <th>Health Facility</th>
        <th>Discipline</th>
        <th>Sub-discipline</th>
        </thead>
        <tbody>
            <%
                for(int i = 0;i< dataQT.size();i++){
            String sub="";
    if(dataQT.get(i).get(7)==null){
        sub = "-";
    }else{
        sub = dataQT.get(i).get(7);
    }
            %>
                 <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
                    <td id="cd"><%=dataQT.get(i).get(0)%></td>
                    <td id="desc"><%=dataQT.get(i).get(1) %></td>
                    <td id="stat"><%=dataQT.get(i).get(2) %></td>
                    <td id="by"><%=dataQT.get(i).get(3) %></td>
                    <td><%=dataQT.get(i).get(4) %></td>
                    <td><%=dataQT.get(i).get(8) %></td>
                    <td><%=dataQT.get(i).get(6) %></td>
                    <td><%=sub %></td>
                </tr>
                <%
                }
            %>
        </tbody>
    </table>
