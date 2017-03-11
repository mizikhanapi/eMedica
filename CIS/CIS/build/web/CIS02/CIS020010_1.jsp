<%-- 
    Document   : CIS020010_1
    Created on : Feb 13, 2017, 7:20:22 PM
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
    String hfc_cd = "04010101";
    
    Conn conn = new Conn();
    
   
    
String sqlRIS = "SELECT ris_order_master.order_no,ris_detail_order.procedure_cd, ris_detail_order.ris_procedure_name, ris_detail_order.modality_name, ris_detail_order.body_system_name, ris_detail_order.remarks,ris_detail_order.requestor_instruction FROM  ris_detail_order INNER JOIN ris_order_master ON ris_detail_order.order_no = ris_order_master.order_no WHERE ris_order_master.pmi_no ='"+pmiNo+"' AND ris_order_master.hfc_cd = '" +hfc_cd+"'";
ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);
//out.print(sqlRIS);
%>
<table class="table table-striped table-filter table-bordered" id="risTable">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Modality Name</th>
            <th>Body System Name</th>
            <th>Procedure Name</th>
            <th>Filler Comment</th>
            <th>Result</th>
        </tr>
    </thead>
    <tbody>
        <%
            for(int i=0; i<dataRIS.size();i++){
                %>
                <tr>
                    <td><%out.print(dataRIS.get(i).get(0));%></td>
                    <td><%out.print(dataRIS.get(i).get(3));%></td>
                    <td><%out.print(dataRIS.get(i).get(4));%></td>
                    <td><%out.print(dataRIS.get(i).get(2));%></td>
                    <td><%out.print(dataRIS.get(i).get(6));%></td>
                    <td><%out.print(dataRIS.get(i).get(5));%></td>
                </tr>
                <%
            }
            %>




    </tbody>
</table>
<%


    


    
%>
