<%-- 
    Document   : searchID
    Created on : 07-Mar-2017, 17:47:59
    Author     : ahmed
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>

<%
    Conn conn = new Conn();
//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();

    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    String sql = "";

    if (idType.equals("pmino")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '" + idInput + "'";

    } else if (idType.equals("icnew")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.new_ic_no = '" + idInput + "'";

    } else if (idType.equals("icold")) {
        sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.old_ic_no = '" + idInput + "'";

    } 

    ArrayList<ArrayList<String>> searchID;
    searchID = conn.getData(sql);
    //out.println(searchID);
    
    
%>
   <center><h4>PREVIOUS VISIT</h4></center>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="searchPatient1">
    <thead>
    <th>Episode Date</th>
    <th>Health Care</th>
    <th>Discipline</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < searchID.size(); i++) {
            if(searchID.size() > 0){
           
            
    %>
    <tr>
        <td><%=searchID.get(i).get(1)%>
        <input type="hidden" id="pmi" value="<%=searchID.get(i).get(0)%>">
        <input type="hidden" id="episode" value="<%=searchID.get(i).get(1)%>">
        <input type="hidden" id="disipline" value="<%=searchID.get(i).get(3)%>">
        </td>
        <td><%=searchID.get(i).get(2)%></td>
        <td><%=searchID.get(i).get(3)%></td>
        <td><button id="ViewDetail" name="ViewDetail" class="btn btn-default" type="button" role="button"><i class="fa fa-eye" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
    </tr>
    
    <% }}
    %>
</tbody>
</table>



