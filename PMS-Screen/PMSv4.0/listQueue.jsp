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
    
    //amik kt session
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String doctor = "";
//    String sql = "SELECT e.PMI_NO,e.NAME,EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE e.EPISODE_DATE LIKE '%" + now + "%' AND e.STATUS NOT LIKE 'Discharge' AND q.PMI_NO=e.PMI_NO";
//    String newSql = "SELECT e.PMI_NO,e.name,e.EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE (e.STATUS NOT LIKE 'Discharge') AND ((e.EPISODE_DATE LIKE '%" + now + "%') AND  (q.PMI_NO=e.PMI_NO) AND e.HEALTH_FACILITY_CODE='" + hfc + "' AND e.EPISODE_DATE=q.episode_date)";
//    String newnewSql = "select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e,pms_patient_queue q where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.PMI_NO = q.pmi_no and e.EPISODE_DATE = q.episode_date";
    //String newnewnewsql ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "'";
    //String thesqlCIS ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.doctor = '"+ doctor +"'";
    String sql = "select q.pmi_no,e.name,q.episode_date,e.episode_time,q.queue_name,q.queue_no,e.doctor,l.description,e.consultation_room from pms_patient_queue q , pms_episode e,adm_lookup_detail l where l.`Master_Reference_code` ='0069' and l.`Detail_Reference_code` = q.status and e.pmi_no = q.pmi_no and e.episode_date = q.episode_date and e.`HEALTH_FACILITY_CODE` = q.hfc_cd and q.episode_date like '%"+now+"%' and q.status !='1' and q.hfc_cd='"+hfc+"'";
    ArrayList<ArrayList<String>> dataQueue;
    dataQueue = conn.getData(sql);
    //out.print(dataQueue);
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; " id="listQueue">
                                <thead>
                                <th>PMI no. </th>
                                <th>Name </th>
                                <th>Episode Date/Time </th>
<!--                                <th>Episode Time </th>-->
                                <th>Queue Name </th>
                                <th>Queue no.</th>
                                <th>Doctor </th>
                                <th>Consultation Room </th>
                                <th>Status</th>
                                <th>Action </th>

                                </thead>
                                <tbody>
                                    <%
                                    for (int i = 0; i < dataQueue.size(); i++) {%>
                                    <tr>
                                        <td id="pmiNumber"><%=dataQueue.get(i).get(0)%></td>
                                        <td><%=dataQueue.get(i).get(1)%></td>
                                         <td id="epiDate"><%=dataQueue.get(i).get(2)%></td>
                                         <td id="epiTime" hidden="hidden"><%=dataQueue.get(i).get(3)%></td>
                                        <td ><%=dataQueue.get(i).get(4)%></td>
                                        <td><%=dataQueue.get(i).get(5)%></td>
                                        <td><%=dataQueue.get(i).get(6)%></td>
                                        <td><%=dataQueue.get(i).get(8)%></td>
                                        <td><%=dataQueue.get(i).get(7)%></td>
                                        <td><button class="btn btn-danger" id="delQueue" data-dismiss="modal" role="button">Delete</button></td>
                                    </tr>    
                                    <%    }
                                    %>

                                </tbody>
                            </table>
</table>
