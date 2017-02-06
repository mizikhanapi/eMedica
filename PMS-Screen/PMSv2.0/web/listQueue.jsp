<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String now = sdf.format(new Date());
    String hfc = session.getAttribute("HFC").toString();
    String sql = "SELECT e.PMI_NO,e.NAME,EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE e.EPISODE_DATE LIKE '%" + now + "%' AND e.STATUS NOT LIKE 'Discharge' AND q.PMI_NO=e.PMI_NO";
    String newSql = "SELECT e.PMI_NO,e.name,e.EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE (e.STATUS NOT LIKE 'Discharge') AND ((e.EPISODE_DATE LIKE '%" + now + "%') AND  (q.PMI_NO=e.PMI_NO) AND e.HEALTH_FACILITY_CODE='" + hfc + "' AND e.EPISODE_DATE=q.episode_date)";
    String newnewSql = "select e.pmi_no,e.name,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e,pms_patient_queue q where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.PMI_NO = q.pmi_no and e.EPISODE_DATE = q.episode_date";
    ArrayList<ArrayList<String>> dataQueue;
    dataQueue = conn.getData(newnewSql);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listQueue">
                                <thead>
                                <th>PMI no. </th>
                                <th>Name </th>
                                <th>Episode Time </th>
                                <th>Queue Name </th>
                                <th>Queue no.</th>
                                <th>Doctor </th>
                                <th>Status</th>
                                <th>Action </th>

                                </thead>
                                <tbody>
                                    <%
                                    for (int i = 0; i < dataQueue.size(); i++) {%>
                                    <tr>
                                        <td id="pmiNumber"><%=dataQueue.get(i).get(0)%></td>
                                        <td><%=dataQueue.get(i).get(1)%></td>
                                        <td id="epiTime"><%=dataQueue.get(i).get(2)%></td>
                                        <td ><%=dataQueue.get(i).get(3)%></td>
                                        <td><%=dataQueue.get(i).get(4)%></td>
                                        <td><%=dataQueue.get(i).get(5)%></td>
                                        <td><%=dataQueue.get(i).get(6)%></td>
                                        <td><button class="btn btn-danger" id="delQueue" data-dismiss="modal" role="button">Delete</button></td>
                                    </tr>    
                                    <%    }
                                    %>

                                </tbody>
                            </table>
</table>
