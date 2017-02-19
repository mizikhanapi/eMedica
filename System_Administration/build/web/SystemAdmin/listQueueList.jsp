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
    String hfc = request.getParameter("hfc");
    String disL = session.getAttribute("DISCIPLINE_CODE").toString();

    //String sql = "select l.queue_type,l.queue_name,l.user_id,l.start_date,l.end_date,l.hfc_cd,l.discipline_cd,l.sub_discipline_cd,l.status,u.user_name,l.hfc_cd,l.created_by,l.created_date,x.user_name from pms_queue_list l inner join adm_user u  on u.user_id = l.user_id inner join adm_user x on x.user_id = l.created_by where l.hfc_cd = '"+hfc+"';";
    //String sql = "select l.queue_type,l.queue_name,l.user_id,l.start_date,l.end_date,l.hfc_cd,l.discipline_cd,l.sub_discipline_cd,l.status,u.user_name,l.hfc_cd,l.created_by,l.created_date,x.user_name,d.hfc_name from pms_queue_list l inner join adm_user u  on u.user_id = l.user_id inner join adm_user x on x.user_id = l.created_by inner join adm_health_facility d on d.hfc_cd = l.hfc_cd where l.hfc_cd = '"+hfc+"';";
    String sql = "select l.queue_type,l.queue_name,l.user_id,l.start_date,l.end_date,l.hfc_cd,l.discipline_cd,l.sub_discipline_cd,l.status,u.user_name,l.created_by,l.created_date,x.user_name,h.hfc_name,d.discipline_name,s.subdiscipline_name"
+" from pms_queue_list l"
+" inner join adm_user x on x.user_id = l.created_by"
+" inner join adm_user u on u.user_id = l.user_id"       
+" inner join adm_health_facility h on h.hfc_cd = l.hfc_cd"
+" inner join adm_hfc_discipline a on a.discipline_cd = l.discipline_cd and a.subdiscipline_cd = l.sub_discipline_cd and a.hfc_cd = l.hfc_cd"
+" inner join adm_discipline d on d.discipline_cd = a.discipline_cd"
+" inner join pms_queue_type q on q.queue_type = l.queue_type and q.status='Active' and q.hfc_cd = l.hfc_cd and q.discipline_code = l.discipline_cd"
+" inner join pms_queue_name n on n.queue_type = l.queue_type and n.status='Active' and n.hfc_cd = l.hfc_cd and n.discipline_code = l.discipline_cd"
+" LEFT OUTER JOIN adm_subdiscipline s on s.subdiscipline_cd = a.subdiscipline_cd and s.discipline_cd = a.discipline_cd"
+" where l.hfc_cd = '"+hfc+"' and l.discipline_cd='"+disL+"';";
    ArrayList<ArrayList<String>> dataQL;
    dataQL = conn.getData(sql);
    //out.print(dataQL);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="QLtable">
    <thead>
    <th>Queue Name</th>
    <th>Staff Name</th>
    <th>Status</th>
    <th>Modify By</th>
    <th>Modify Date</th>
    <th>Health Facility</th>
    <th>Discipline</th>
    <th>Sub-Discipline</th>
    <th>Start Date</th>
    <th>End Date</th>
</thead>
<tbody>
    <%
    for (int i = 0; i < dataQL.size(); i++) {
    String sub="";
    if(dataQL.get(i).get(15)==null){
        sub = "-";
    }else{
        sub = dataQL.get(i).get(15);
    }
    %>
    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#list">
        <td id="Lname"><%=dataQL.get(i).get(1)%></td>
         <td hidden="true" id="Ltype"><%=dataQL.get(i).get(0)%></td>
         
        <td><%=dataQL.get(i).get(9)%></td>
        <td hidden="true" id="LuserID"><%=dataQL.get(i).get(2)%></td>
        
        <td id="Lstat"><%=dataQL.get(i).get(8)%></td>
        <td ><%=dataQL.get(i).get(12)%></td>
        <td ><%=dataQL.get(i).get(11)%></td>
        <td><%=dataQL.get(i).get(13)%></td>
        <td hidden="true" id="LhfcCd"><%=dataQL.get(i).get(5)%></td>
        <td id="Ldis"><%=dataQL.get(i).get(14)%></td>
        <td id="Lsub"><%=sub%></td>
        <td id="Lstart"><%=dataQL.get(i).get(3)%></td>
        <td id="Lend"><%=dataQL.get(i).get(4)%></td>
        
    </tr>
    <%
        }
    %>
</tbody>
</table>
