<%-- 
    Document   : CIS020012_1
    Created on : Feb 15, 2017, 10:00:30 AM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    String hfc_cd = "Klinik UTeM Induk";
    
    Conn conn = new Conn();
    
    
   
    
String sqlRIS = "SELECT cis_pos_master.ORDER_NO,cis_pos_detail.PROCEDURE_NAME,cis_pos_detail.COMMENTS,cis_pos_detail.COMMENTS_DOCTOR,cis_pos_master.ORDER_DATE,cis_pos_master.ARRIVAL_DATE FROM cis_pos_detail INNER JOIN cis_pos_master ON cis_pos_master.ORDER_NO = cis_pos_detail.ORDER_NO WHERE cis_pos_master.PMI_NO = '"+pmiNo+"' AND cis_pos_master.LOCATION_CODE = '"+hfc_cd+"'";
ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);
//out.print(sqlRIS);
%>
<table class="table table-striped table-filter table-bordered" id="opTable">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Procedure Name</th>
            <th>Comments</th>
            <th>Comments Doctor</th>
            <th>Order Date</th>
            <th>Arrival Date</th>
            

   
        </tr>
    </thead>
    <tbody>
        <%
            for(int i=0; i<dataRIS.size();i++){
                %>
                <tr>
                    <td><%out.print(dataRIS.get(i).get(0));%></td>
                    <td><%out.print(dataRIS.get(i).get(1));%></td>
                    <td><%out.print(dataRIS.get(i).get(2));%></td>
                    <td><%out.print(dataRIS.get(i).get(3));%></td>
                    <td><%out.print(dataRIS.get(i).get(4));%></td>
                    <td><%out.print(dataRIS.get(i).get(5));%></td>
                  

                </tr>
                <%
            }
            %>

    </tbody>
</table>
<%


    


    
%>
